#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
require_file "$MORPHE"
[[ -x "$KOTLINC" ]] || fail 'Run scripts/setup-tools.sh first (or set KOTLINC).'
"$KOTLINC" "$ROOT/src/main/kotlin" -cp "$MORPHE" -d "$BUILD_DIR/gemini-patches.jar"
printf 'Built %s\n' "$BUILD_DIR/gemini-patches.jar"
