#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
require_file "$BUILD_DIR/gemini-patches.jar"
classpath="$MORPHE:$BUILD_DIR/gemini-patches.jar"
"$KOTLINC" "$ROOT/scripts/kotlin/VerifyVersionProfiles.kt" -cp "$classpath" -d "$BUILD_DIR/verify-profiles.jar"
"$JAVA" -cp "$BUILD_DIR/verify-profiles.jar:$classpath" VerifyVersionProfilesKt "$ROOT" "$@"

python3 - "$ROOT" <<'PY'
from pathlib import Path
import json, sys
for path in (Path(sys.argv[1]) / 'docs/versions').glob('*/*.json'):
    json.loads(path.read_text())
PY
