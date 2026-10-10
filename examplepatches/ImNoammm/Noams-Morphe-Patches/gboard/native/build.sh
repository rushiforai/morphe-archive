#!/data/data/com.termux/files/usr/bin/bash
# Builds libnogoogle_jni.so (whisper.cpp + slimt), libnogoogle_llm.so (llama.cpp) and the bundled
# libc++_shared.so for arm64 Android apps.
set -euo pipefail
. ~/gb/env.sh
ROOT=$(cd "$(dirname "$0")" && pwd)
DEPS=~/gb/native-deps
VULKAN=${VULKAN:-OFF}
if [ ! -f $DEPS/lib/libpcre2-8.a ]; then
    cmake -S ~/gb/pcre2 -B ~/gb/pcre2/build-static -G Ninja -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -DPCRE2_BUILD_PCRE2GREP=OFF \
        -DPCRE2_BUILD_TESTS=OFF -DPCRE2_SUPPORT_JIT=OFF -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
        -DCMAKE_INSTALL_PREFIX=$DEPS >/dev/null
    cmake --build ~/gb/pcre2/build-static >/dev/null && cmake --install ~/gb/pcre2/build-static >/dev/null
fi
# Local fixes to third-party sources (idempotent; see patches/*.patch).
for p in "$ROOT"/patches/whisper-*.patch; do
    git -C ~/gb/whisper.cpp apply --reverse --check "$p" 2>/dev/null || git -C ~/gb/whisper.cpp apply "$p"
done
# slimt: with ruy built too (float), gemmology still does the int8 matrix products.
for p in "$ROOT"/patches/slimt-*.patch; do
    git -C ~/gb/slimt apply --reverse --check "$p" 2>/dev/null || git -C ~/gb/slimt apply "$p"
done
cmake -S "$ROOT" -B "$ROOT/build" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DNOGOOGLE_VULKAN=$VULKAN >/dev/null
ninja -C "$ROOT/build" -j${JOBS:-5} nogoogle_jni
# llama.cpp (translation) in its own library, with its own private ggml.
cmake -S "$ROOT/llm" -B "$ROOT/llm/build" -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 >/dev/null
ninja -C "$ROOT/llm/build" -j${JOBS:-5} nogoogle_llm
OUT=$ROOT/out/arm64-v8a
mkdir -p "$OUT"
llvm-strip --strip-unneeded -o "$OUT/libnogoogle_jni.so" "$ROOT/build/libnogoogle_jni.so"
llvm-strip --strip-unneeded -o "$OUT/libnogoogle_llm.so" "$ROOT/llm/build/libnogoogle_llm.so"
cp /data/data/com.termux/files/usr/lib/libc++_shared.so "$OUT/"
for lib in libnogoogle_jni.so libnogoogle_llm.so; do
    patchelf --remove-rpath "$OUT/$lib"
    readelf -d "$OUT/$lib" | grep -E 'NEEDED|RUNPATH|RPATH'
done
ls -la "$OUT"
