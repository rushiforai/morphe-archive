#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
source "$ROOT/scripts/lib/files.sh"
[[ $# -eq 1 ]] || fail "Usage: $0 APK"
require_file "$1"
dexkit="$ROOT/tools/dexkit-src/dexkit/build"
[[ -d "$dexkit/library" ]] || fail 'Run scripts/setup-dexkit.sh first.'
native="$(find "$dexkit/library" -maxdepth 1 -type f \( -name 'libdexkit.dylib' -o -name 'libdexkit.so' \) -print -quit)"
[[ -n "$native" ]] || fail 'Run scripts/setup-dexkit.sh first (macOS/Linux).'
commit="$(git -C "$ROOT/tools/dexkit-src" rev-parse HEAD)"
[[ "$commit" == c9cd12a14b75409bebd2f73e4dfc5ff575df3eb8 ]] || fail 'DexKit revision mismatch'
classpath="$dexkit/libs/dexkit.jar:$dexkit/libs/flatbuffers-java-23.5.26.jar:$MORPHE"
rules="$ROOT/config/hook-discovery.tsv"
source_file="$ROOT/analysis/dexkit/DexkitDiscover.kt"
apk_hash="$(sha256_file "$1")"
rules_hash="$(sha256_file "$rules")"
key="$(
  printf '%s\n%s\n%s\n%s\n%s\n%s\n%s' report-v1 "$apk_hash" "$rules_hash" \
    "$(sha256_file "$source_file")" "$(sha256_file "$native")" \
    "$(sha256_file "$dexkit/libs/dexkit.jar")" "$commit" | shasum -a 256 | cut -d ' ' -f 1
)"
cache="$BUILD_DIR/discovery/$key.json"
if [[ -f "$cache" ]]; then
  printf 'Cached discovery: %s\n' "$cache"
  exit 0
fi
mkdir -p "$BUILD_DIR/discovery"
"$KOTLINC" "$source_file" -cp "$classpath" -d "$BUILD_DIR/dexkit-discover.jar"
staging="$(mktemp "$BUILD_DIR/discovery/report.XXXXXX")"
trap 'rm -f -- "$staging" "$staging.json"' EXIT
"$JAVA" --enable-native-access=ALL-UNNAMED -cp "$BUILD_DIR/dexkit-discover.jar:$classpath" DexkitDiscoverKt "$1" "$rules" "$staging" "$native"
jq --arg apk "$apk_hash" --arg rules "$rules_hash" --arg commit "$commit" \
  '. + {apkSha256:$apk, rulesSha256:$rules, dexkitCommit:$commit}' "$staging" > "$staging.json"
mv -- "$staging.json" "$cache"
printf 'Discovery report: %s\n' "$cache"
