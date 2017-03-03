#!/bin/bash
# 该文件是前后端通用的编译使用的脚本

export PATH=/usr/local/n/versions/node/6.2.1/bin:$PATH

if [ ! -n "$1" ] ;then
  echo "参数错误"
  echo "usage: build.client.sh <cdn_root>"
else
  echo hostname: `hostname`
  echo node version: `node -v`
  echo npm version: `npm -v`
  # npm-cache install --cacheDirectory /home/q/prj/npm/fe/dzs_touch --clearInvalidCache true npm --registry http://registry.npm.corp.qunar.com --disturl=https://npm.taobao.org/dist --sass-binary-site=http://npm.taobao.org/mirrors/node-sass --production

  # Jenkins 会自动为前端工程安装好依赖包，后端工程需要手动装
  if [ ! -d "node_modules" ]; then
    npm install --registry http://registry.npm.corp.qunar.com --disturl=https://npm.taobao.org/dist --sass-binary-site=http://npm.taobao.org/mirrors/node-sass --production
  fi

  npm run build
fi
