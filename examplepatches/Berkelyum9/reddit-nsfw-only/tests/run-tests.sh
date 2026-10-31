#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/tests/out"
rm -rf "$OUT"
mkdir -p "$OUT"
javac -Xlint:unchecked -Werror -d "$OUT" \
  $(find "$ROOT/tests/src" -name '*.java' -print) \
  $(find "$ROOT/extensions/nsfwonly/src/main/java" -name '*.java' -print)
java -cp "$OUT" io.github.redditnsfwonly.extension.NsfwCellScannerSelfTest
java -cp "$OUT" io.github.redditnsfwonly.extension.BlockNsfwContentPatchTest
