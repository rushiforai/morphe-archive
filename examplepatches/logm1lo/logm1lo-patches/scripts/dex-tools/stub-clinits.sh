#!/usr/bin/env bash
# Build & run the dexlib2-based dex patcher (reusable for any app).
#
# Usage:
#   scripts/dex-tools/stub-clinits.sh <input.dex> <output.dex>
#
# Stubs all native <clinit>()V methods (removes ACC_NATIVE, adds return-void).
# This is a REUSABLE technique for apps that crash because a re-signed APK
# cannot register native class initializers (PairIP/protector-style apps).
set -euo pipefail
cd "$(dirname "$0")"

SRC="${1:?input dex required}"
OUT="${2:?output dex required}"

CACHE="$HOME/.gradle/caches/modules-2/files-2.1"
# Build classpath from the smali/dexlib2 jars available in gradle cache
CP=""
for d in com.github.iBotPeaches.smali com.github.MorpheApp.smali; do
  for jar in $(find "$CACHE/$d" -name "*.jar" ! -name "*sources*" 2>/dev/null); do
    CP="$CP:$jar"
  done
done
CP="$CP:$(find "$CACHE/com.google.guava/guava" -name "guava-*.jar" ! -name "*sources*" | head -1)"
CP="$CP:$(find "$CACHE/com.google.guava/failureaccess" -name "*.jar" 2>/dev/null | head -1)"
CP="$CP:$(find "$CACHE/com.beust/jcommander" -name "*.jar" ! -name "*sources*" | head -1)"
CP="$CP:$(find "$CACHE/org.antlr/antlr-runtime" -name "*.jar" | head -1)"

# Compile if needed
javac -cp "${CP#:}" StubClinits.java 2>/dev/null || true
# Run
java -cp "${CP#:}:." StubClinits "$SRC" "$OUT"
echo "Wrote $OUT"
