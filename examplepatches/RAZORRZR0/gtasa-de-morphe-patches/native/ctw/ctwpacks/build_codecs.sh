#!/bin/sh
# Builds the radio converter's codecs (arm64-v8a, static, PIC) into codecs/: FFmpeg's ATRAC3plus decoder (libavcodec,
# libavutil; LGPL 2.1+) and the LAME MP3 encoder (LGPL 2). Called by ../build.sh when codecs/ is missing.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
NDK="${ANDROID_NDK_HOME:-$HOME/Library/Android/sdk/ndk/27.3.13750724}"
TC="$(echo "$NDK"/toolchains/llvm/prebuilt/*/bin)"
OUT="$HERE/codecs"
SRC="$HERE/codecs-src"
FFMPEG=ffmpeg-7.1.1
LAME=lame-3.100
mkdir -p "$SRC" "$OUT"
cd "$SRC"
[ -d $FFMPEG ] || curl -fsSL https://ffmpeg.org/releases/$FFMPEG.tar.xz | tar xJ
[ -d $LAME ] || curl -fsSL https://downloads.sourceforge.net/project/lame/lame/3.100/$LAME.tar.gz | tar xz
CC="$TC/aarch64-linux-android23-clang"

(cd $FFMPEG && ./configure --prefix="$OUT" --target-os=android --arch=aarch64 --enable-cross-compile \
    --cc="$CC" --nm="$TC/llvm-nm" --ar="$TC/llvm-ar" --ranlib="$TC/llvm-ranlib" --strip="$TC/llvm-strip" \
    --enable-static --disable-shared --enable-pic --disable-everything --disable-programs --disable-doc \
    --disable-avformat --disable-avdevice --disable-avfilter --disable-swscale --disable-swresample \
    --disable-network --disable-autodetect --enable-decoder=atrac3p && make -j8 && make install)

(cd $LAME && ./configure --prefix="$OUT" --host=aarch64-linux-android CC="$CC" AR="$TC/llvm-ar" \
    RANLIB="$TC/llvm-ranlib" --enable-static --disable-shared --disable-frontend --with-pic \
    && make -j8 && make install)
