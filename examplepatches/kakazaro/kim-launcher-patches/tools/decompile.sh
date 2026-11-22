#!/usr/bin/env bash
# Decompile a Kim Launcher APK into decompiled/ (git-ignored). See docs/decompiled-code.md.
# Usage: tools/decompile.sh refer-apk/kim-launcher-<version>.apk
# Tools: TOOLS (default C:/Workspace/tools) holds apktool.jar and jadx/;
#        BLUTTER (default C:/Workspace/refs/blutter) is a built worawit/blutter checkout.
set -euo pipefail
apk=${1:?usage: tools/decompile.sh <apk>}
TOOLS=${TOOLS:-/c/Workspace/tools}
BLUTTER=${BLUTTER:-/c/Workspace/refs/blutter}
out=decompiled
tmp=.work/decompile
rm -rf "$out" "$tmp"
mkdir -p "$out" "$tmp"

java -jar "$TOOLS/apktool.jar" d -f -o "$tmp/apktool" "$apk"
mv "$tmp/apktool/smali" "$out/smali"
mkdir -p "$out/resources"
mv "$tmp/apktool/AndroidManifest.xml" "$tmp/apktool/res" "$tmp/apktool/assets" "$out/resources/"

# JADX can spend a long time on byd/e (a 4.6 MB class); the output is complete when it exits.
JAVA_OPTS=-Xmx6g "$TOOLS/jadx/bin/jadx" --no-res --show-bad-code -j 8 -d "$tmp/jadx" "$apk" || true
mv "$tmp/jadx/sources" "$out/java"

python -I -c "import re,sys; d=open(sys.argv[1],'rb').read(); open(sys.argv[2],'w',encoding='utf-8').write('\n'.join(m.decode() for m in re.findall(rb'[\x20-\x7e]{6,}',d)))" \
  "$tmp/apktool/lib/arm64-v8a/libapp.so" "$out/dart-strings.txt"

# Dart AOT: needs Visual Studio Build Tools and tools/blutter-release-snapshot.patch applied to blutter.
if [ -f "$BLUTTER/blutter.py" ]; then
  mkdir -p "$tmp/lib" && cp "$tmp/apktool/lib/arm64-v8a/"lib{app,flutter}.so "$tmp/lib/"
  vcvars="C:\\Program Files (x86)\\Microsoft Visual Studio\\2022\\BuildTools\\VC\\Auxiliary\\Build\\vcvars64.bat"
  cmd //c "call \"$vcvars\" >nul && python \"$(cygpath -w "$BLUTTER")\\blutter.py\" \"$(cygpath -w "$tmp/lib")\" \"$(cygpath -w "$out/dart")\""
fi
bash tools/trim-decompiled.sh "$out"
echo "Done: $out/"
