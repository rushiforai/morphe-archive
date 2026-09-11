#!/usr/bin/env bash
# Build & run PatchAllKeys on all 5 dex files of MT Manager.
set -euo pipefail
cd "$(dirname "$0")/../.."
ROOT=$(pwd)

CACHE="$HOME/.gradle/caches/modules-2/files-2.1"
CP=""
for d in com.github.MorpheApp.smali com.github.iBotPeaches.smali; do
  for jar in $(find "$CACHE/$d" -name "*.jar" ! -name "*sources*" 2>/dev/null); do
    CP="$CP:$jar"
  done
done
CP="$CP:$(find "$CACHE/com.google.guava/guava" -name "guava-*.jar" ! -name "*sources*" | head -1)"
CP="$CP:$(find "$CACHE/com.google.guava/failureaccess" -name "*.jar" 2>/dev/null | head -1)"
CP="$CP:$(find "$CACHE/com.beust/jcommander" -name "*.jar" ! -name "*sources*" | head -1)"
CP="$CP:$(find "$CACHE/org.antlr/antlr-runtime" -name "*.jar" | head -1)"

WORK=/tmp/opencode/mtdex
echo "== Compile PatchAllKeys =="
javac -cp "${CP#:}" -d "$WORK" scripts/dex-tools/PatchAllKeys.java

echo "== Patch all dex files =="
mkdir -p "$WORK/patched"
for DEX in classes.dex classes2.dex classes3.dex classes4.dex classes5.dex; do
  echo "--- $DEX ---"
  java -cp "${CP#:}:$WORK" PatchAllKeys "$WORK/$DEX" "$WORK/patched/$DEX"
done
