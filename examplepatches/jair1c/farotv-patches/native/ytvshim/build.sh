#!/usr/bin/env bash
# Builds libytvshim.so (armeabi-v7a, API 24) into the patches' bundled resources.
set -euo pipefail
cd "$(dirname "$0")"
NDK="${ANDROID_NDK:-/c/Users/Admin/AppData/Local/Android/Sdk/ndk/27.2.12479018}"
TC="$NDK/toolchains/llvm/prebuilt/windows-x86_64/bin"
OUT=../../patches/src/main/resources/youtubetv/native/armeabi-v7a
mkdir -p "$OUT"
"$TC/clang.exe" --target=armv7a-linux-androideabi24 -O2 -fPIC -shared -fvisibility=hidden \
  -Wl,--no-as-needed -landroid -Wl,--as-needed -Wl,-soname,libytvshim.so \
  -o "$OUT/libytvshim.so" ytvshim.c
"$TC/llvm-strip.exe" --strip-unneeded "$OUT/libytvshim.so"
echo "OK: $OUT/libytvshim.so"
