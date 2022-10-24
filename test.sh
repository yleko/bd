#!/bin/sh

# args
AUUID="754ca062-a341-4378-8b8c-ceb76d755c6c"
#CADDYIndexPage="https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
CADDYIndexPage="https://github.com/AYJCSGM/mikutap/archive/master.zip"
ParameterSSENCYPT="chacha20-ietf-poly1305"
PORT=80


cat conf/Caddy | sed -e "1c :$PORT" -e "s/\$AUUID/$AUUID/g" -e "s/\$MYUUID-HASH/$(caddy hash-password --plaintext $AUUID)/g" >conf/Caddyfile
cat conf/xray.json | sed -e "s/\$AUUID/$AUUID/g" -e "s/\$ParameterSSENCYPT/$ParameterSSENCYPT/g" >conf/config.json

