#!/bin/sh
# Build the GTA: Chinatown Wars AML mods (arm64-v8a) into the patches' resources (patches/src/main/resources/ctw/).
# Env overrides: NDK_BUILD (path to ndk-build) or ANDROID_NDK_HOME.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="$HERE/../../patches/src/main/resources/ctw"
NDK_BUILD="${NDK_BUILD:-${ANDROID_NDK_HOME:-$HOME/Library/Android/sdk/ndk/27.3.13750724}/ndk-build}"
[ -x "$NDK_BUILD" ] || { echo "ndk-build not found at $NDK_BUILD (set NDK_BUILD or ANDROID_NDK_HOME)" >&2; exit 1; }
mkdir -p "$OUT"
[ -f "$HERE/ctwpacks/codecs/lib/libmp3lame.a" ] || "$HERE/ctwpacks/build_codecs.sh"
for mod in ctwpacks ctwmenu; do
    echo "== $mod"
    (cd "$HERE/$mod" && "$NDK_BUILD" NDK_PROJECT_PATH=. APP_BUILD_SCRIPT=Android.mk \
        APP_PLATFORM=android-23 APP_ABI=arm64-v8a APP_STL=c++_static -j8)
    cp "$HERE/$mod/libs/arm64-v8a/lib$mod.so" "$OUT/"
done
