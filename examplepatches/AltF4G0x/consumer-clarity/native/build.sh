#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 /path/to/android-ndk" >&2
    exit 2
fi

ndk="$1"
project_root="$(cd "$(dirname "$0")/.." && pwd)"
toolchain="$ndk/toolchains/llvm/prebuilt/linux-x86_64"
clang="$toolchain/bin/aarch64-linux-android26-clang"
output="$project_root/patches/src/main/resources/lib/arm64-v8a/libconsumerclarity.so"

if [[ ! -x "$clang" ]]; then
    echo "Android NDK clang not found: $clang" >&2
    exit 1
fi

mkdir -p "$(dirname "$output")"
"$clang" \
    -shared -fPIC -O2 -fno-stack-protector -fvisibility=hidden \
    -Wl,--gc-sections -Wl,-z,relro -Wl,-z,now \
    "$project_root/native/consumerclarity.c" \
    "$project_root/native/trampolines.S" \
    -ldl -llog \
    -o "$output"

"$toolchain/bin/llvm-strip" "$output"
