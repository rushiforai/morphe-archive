#!/usr/bin/env bash
# Builds libmain.so (wrapper) and libpgo_hook.so for arm64-v8a with the Android NDK and
# copies them into the patch resources, replacing the committed prebuilt binaries.
#
# Usage: ANDROID_NDK_HOME=/path/to/ndk bash native/build.sh
set -euo pipefail
cd "$(dirname "$0")"

NDK="${ANDROID_NDK_HOME:-${ANDROID_NDK_ROOT:-}}"
if [ -z "$NDK" ] && [ -n "${ANDROID_HOME:-}" ]; then
  NDK="$(ls -d "$ANDROID_HOME"/ndk/* 2>/dev/null | sort -V | tail -n1 || true)"
fi
if [ -z "$NDK" ] || [ ! -d "$NDK" ]; then
  echo "Android NDK not found. Set ANDROID_NDK_HOME." >&2
  exit 1
fi
echo "Using NDK: $NDK"

cmake -S . -B build \
  -DCMAKE_TOOLCHAIN_FILE="$NDK/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-24 \
  -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel

OUT="../patches/src/main/resources/pgo/arm64-v8a"
mkdir -p "$OUT"
cp build/libmain.so build/libpgo_hook.so "$OUT/"

READELF="$(ls "$NDK"/toolchains/llvm/prebuilt/*/bin/llvm-readelf | head -n1)"
for f in libmain.so libpgo_hook.so; do
  echo "== $f"
  "$READELF" -d "$OUT/$f" | grep -E "NEEDED|SONAME" || true
done
