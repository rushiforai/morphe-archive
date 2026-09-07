#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
[[ $# -eq 3 ]] || fail "Usage: $0 APK search SUBSTRING | APK dump 'Lclass;->method(Args)Return'"
require_file "$1"
require_file "$MORPHE"
"$KOTLINC" "$ROOT/scripts/kotlin/InspectHooks.kt" -cp "$MORPHE" -d "$BUILD_DIR/inspect-hooks.jar"
"$JAVA" -cp "$BUILD_DIR/inspect-hooks.jar:$MORPHE" InspectHooksKt "$@"
