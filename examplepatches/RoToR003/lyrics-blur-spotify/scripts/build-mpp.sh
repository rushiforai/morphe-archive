#!/usr/bin/env bash
# Build this patch as a .mpp bundle, ready to add to Morphe Manager.
#
# What it does (same as .github/workflows/build-mpp.yml):
#   1. clones southstar21dev/southstar21-patches (the upstream bundle this patch targets)
#   2. copies this repo's three patch files into it (upstream directory layout)
#   3. adds AppTarget("9.2.4.2644") as a verified Spotify target (scripts/add-app-target.py)
#   4. builds with the upstream Gradle wrapper
#   5. copies the produced bundle into ./out/
#
# Requirements on the machine:
#   - JDK 21 (the upstream CI uses Temurin 21)
#   - Android SDK (only for compiling the extension module; set ANDROID_HOME / ANDROID_SDK_ROOT)
#   - a GitHub token with read:packages (Morphe registry), passed as GITHUB_TOKEN / GITHUB_ACTOR
#
# Usage:
#   GITHUB_ACTOR=<you> GITHUB_TOKEN=<github-classic-token-with-read:packages> ./scripts/build-mpp.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UPSTREAM_URL="${UPSTREAM_URL:-https://github.com/southstar21dev/southstar21-patches}"
UPSTREAM_REF="${UPSTREAM_REF:-main}"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "==> Cloning $UPSTREAM_URL ($UPSTREAM_REF)"
git clone --depth 1 --branch "$UPSTREAM_REF" "$UPSTREAM_URL" "$WORK/southstar21-patches"

cd "$WORK/southstar21-patches"

echo "==> Copying patch files"
mkdir -p extensions/spotify/src/main/java/app/southstar21/extension/spotify/lyricsblur
cp "$REPO_ROOT/extensions/spotify/src/main/java/app/southstar21/extension/spotify/lyricsblur/LyricsBlurPatch.java" \
   extensions/spotify/src/main/java/app/southstar21/extension/spotify/lyricsblur/LyricsBlurPatch.java
mkdir -p patches/src/main/kotlin/app/southstar21/patches/spotify/layout/lyricsblur
cp "$REPO_ROOT/patches/src/main/kotlin/app/southstar21/patches/spotify/layout/lyricsblur/"*.kt \
   patches/src/main/kotlin/app/southstar21/patches/spotify/layout/lyricsblur/

echo "==> Adding Spotify 9.2.4.2644 as a verified target"
python3 "$REPO_ROOT/scripts/add-app-target.py" \
   patches/src/main/kotlin/app/southstar21/patches/spotify/shared/Constants.kt

echo "==> Building .mpp (this needs the GitHub token and downloads Gradle + deps)"
./gradlew :patches:buildAndroid generatePatchesList --no-daemon

mkdir -p "$REPO_ROOT/out"
find patches/build/libs -name '*.mpp' -not -name '*-sources.mpp' -not -name '*-javadoc.mpp' \
  -exec cp {} "$REPO_ROOT/out/" \;

echo "==> Done. Bundle(s):"
ls -l "$REPO_ROOT/out/"
echo "Add the .mpp to Morphe Manager (see docs/verification.md, M2)."
