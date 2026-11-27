#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
require_file "$BUILD_DIR/gemini-patches.jar"
classpath="$MORPHE:$BUILD_DIR/gemini-patches.jar"
"$KOTLINC" "$ROOT/scripts/kotlin/VerifyVersionProfiles.kt" -cp "$classpath" -d "$BUILD_DIR/verify-profiles.jar"
"$JAVA" -cp "$BUILD_DIR/verify-profiles.jar:$classpath" VerifyVersionProfilesKt "$ROOT" "$@"

for profile in "$ROOT"/docs/versions/*/*.json; do jq -e 'type == "object"' "$profile" >/dev/null; done
