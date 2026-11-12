#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/lib/common.sh"
[[ $# -ge 3 ]] || fail "Usage: $0 INPUT_APK OUTPUT_APK RESULT_JSON [Morphe patch arguments]"
input="$1"; output="$2"; result="$3"; shift 3
require_file "$input"
require_file "$MORPHE"
staging="$(mktemp -d "$BUILD_DIR/patch.XXXXXX")"
trap 'rm -rf "$staging"' EXIT
"$JAVA" -Xmx6g -jar "$MORPHE" patch "$input" "$@" --unsigned -o "$staging/output.apk" -r "$staging/result.json"
require_file "$staging/result.json"
cp "$staging/result.json" "$result"
python3 - "$staging/result.json" "$staging/output.apk" <<'PY'
import json, pathlib, sys
d = json.loads(pathlib.Path(sys.argv[1]).read_text())
steps = d.get('patchingSteps', [])
if d.get('success') is False or d.get('failedPatches') or not steps or not all(s.get('success') is True for s in steps):
    raise SystemExit('Patching failed; inspect the result JSON. Previous APK output was not replaced.')
if not pathlib.Path(sys.argv[2]).is_file():
    raise SystemExit('Patcher did not create a fresh APK')
PY
cp "$staging/output.apk" "$output"
