#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT="$ROOT/build/parser-test"
rm -rf "$OUT"
mkdir -p "$OUT"
javac -d "$OUT" \
  "$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/operagx/GxModUrlResolver.java" \
  "$ROOT/tools/ParserSelfTest.java"
java -cp "$OUT" ParserSelfTest
