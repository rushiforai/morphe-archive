#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT="$ROOT/build/chrome150-menu-hook-test"
rm -rf "$OUT"
mkdir -p "$OUT"
javac -d "$OUT" "$ROOT/tools/Chrome150MenuHookSelfTest.java"
cd "$ROOT"
java -cp "$OUT" Chrome150MenuHookSelfTest
