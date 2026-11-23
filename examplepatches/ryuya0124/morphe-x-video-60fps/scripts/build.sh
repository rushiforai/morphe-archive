#!/usr/bin/env bash
set -euo pipefail

if [[ $# != 2 ]]; then
  printf 'Usage: %s MORPHE_DESKTOP_ALL_JAR ANDROID_BUILD_TOOLS_DIRECTORY\n' "$0" >&2
  exit 2
fi

root=$(cd "$(dirname "$0")/.." && pwd)
desktop=$1
build_tools=$2
version=$(cat "$root/VERSION")
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

# Both JVM class files and DEX are needed by Morphe's desktop and Android loaders.
kotlinc -jvm-target 11 -Xlambdas=class -classpath "$desktop" \
  "$root/src/main/kotlin/dev/ryuya/xvideo60/VideoUploadFrameRatePatch.kt" \
  -d "$work/patch.jar"
"$build_tools/d8" --release --min-api 26 --classpath "$desktop" \
  --output "$work" "$work/patch.jar"

cat > "$work/manifest.mf" <<MANIFEST
Manifest-Version: 1.0
Name: X Video Upload 60 FPS
Description: Keep up to 60 FPS in the legacy X video encoder
Version: $version
Source: https://github.com/ryuya0124/morphe-x-video-60fps
Author: ryuya
License: GPL-3.0-only
Patcher-Version: 2.3.0

MANIFEST

mkdir -p "$root/dist"
out="$root/dist/x-video-upload-60fps-$version.mpp"
unzip -q "$work/patch.jar" -d "$work/jvm"
jar --create --file "$work/bundle.mpp" --manifest "$work/manifest.mf" \
  --date=2000-01-01T00:00:00Z -C "$work" classes.dex -C "$work/jvm" dev
mv -f "$work/bundle.mpp" "$out"
printf '%s\n' "$out"
