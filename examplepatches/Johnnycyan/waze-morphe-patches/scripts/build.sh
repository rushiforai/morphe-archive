#!/usr/bin/env bash
# Builds the bundle into out/: patches.mpp and patches-list.json.
# Usage: scripts/build.sh <version>
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
VERSION="${1:?usage: build.sh <version>}"

cd "$ROOT"
chmod +x gradlew
# buildAndroid adds classes.dex, which Morphe Manager on Android loads patches from; a plain
# build bundles JVM classes only, which Manager lists as no patches.
./gradlew :patches:buildAndroid generatePatchesList -Pversion="$VERSION" --no-daemon

mpp="patches/build/libs/patches-$VERSION.mpp"
unzip -l "$mpp" | tr -d '\r' | grep -q ' classes\.dex$' || { echo "$mpp has no classes.dex" >&2; exit 1; }
mkdir -p out
cp "$mpp" out/patches.mpp
# generatePatchesList writes the list to the repository root, over the published copy on main;
# keep the committed one.
cp patches-list.json out/patches-list.json
git checkout -q -- patches-list.json 2>/dev/null || true
