#!/usr/bin/env bash
# Builds libmorphe_headsup.so for each ABI and copies it, together with the ShadowHook
# libraries it needs, into the patch resources. Rerun after changing bridge.c and commit
# the updated .so files.
#
# Needs the Android NDK: set ANDROID_NDK_HOME, or have it under $ANDROID_HOME/ndk/<version>.
set -euo pipefail

SHADOWHOOK_VERSION=2.0.1
SHADOWHOOK_SHA256=2cad01ff4d59542958775e19f281981a7e84b39670b5fae75905b8511e10c7cd
ABIS=(arm64-v8a armeabi-v7a)

here="$(cd "$(dirname "$0")" && pwd)"
build="$here/build"
resources="$here/../../patches/src/main/resources/headsup/native"

android_home="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Android/Sdk}}"
ndk="${ANDROID_NDK_HOME:-$(ls -d "$android_home"/ndk/* 2>/dev/null | sort -V | tail -1)}"
[[ -d "$ndk" ]] || { echo "Android NDK not found; set ANDROID_NDK_HOME" >&2; exit 1; }

cmake_bin="$(command -v cmake || ls -d "$android_home"/cmake/*/bin/cmake 2>/dev/null | sort -V | tail -1)"
ninja_bin="$(command -v ninja || ls -d "$android_home"/cmake/*/bin/ninja 2>/dev/null | sort -V | tail -1)"
strip_bin="$ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/llvm-strip"

# ShadowHook (https://github.com/bytedance/android-inline-hook), MIT licensed.
aar="$build/shadowhook-$SHADOWHOOK_VERSION.aar"
shadowhook="$build/shadowhook-$SHADOWHOOK_VERSION"
if [[ ! -d "$shadowhook" ]]; then
    mkdir -p "$build"
    curl -sSfL -o "$aar" \
        "https://repo1.maven.org/maven2/com/bytedance/android/shadowhook/$SHADOWHOOK_VERSION/shadowhook-$SHADOWHOOK_VERSION.aar"
    echo "$SHADOWHOOK_SHA256  $aar" | sha256sum -c --quiet
    unzip -q -o "$aar" -d "$shadowhook"
fi

for abi in "${ABIS[@]}"; do
    out="$build/$abi"
    "$cmake_bin" -S "$here" -B "$out" -G Ninja \
        -DCMAKE_MAKE_PROGRAM="$ninja_bin" \
        -DCMAKE_TOOLCHAIN_FILE="$ndk/build/cmake/android.toolchain.cmake" \
        -DANDROID_ABI="$abi" -DANDROID_PLATFORM=android-26 -DCMAKE_BUILD_TYPE=Release \
        -DSHADOWHOOK_DIR="$shadowhook" >/dev/null
    "$cmake_bin" --build "$out"
    "$strip_bin" --strip-unneeded "$out/libmorphe_headsup.so"

    mkdir -p "$resources/$abi"
    cp "$out/libmorphe_headsup.so" \
        "$shadowhook/jni/$abi/libshadowhook.so" \
        "$shadowhook/jni/$abi/libshadowhook_nothing.so" \
        "$resources/$abi/"
done

echo "Copied native libraries to $resources"
