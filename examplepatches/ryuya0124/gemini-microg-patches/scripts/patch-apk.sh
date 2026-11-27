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
jq -e '(.stepResults // []) as $new |
  (if ($new | length) > 0 then $new else (.patchingSteps // []) end) as $steps |
  .success != false and ((.failedPatches // []) | length) == 0 and
  ($steps | length) > 0 and all($steps[]; .success == true)' "$staging/result.json" >/dev/null ||
  fail 'Patching failed; inspect the result JSON. Previous APK output was not replaced.'
require_file "$staging/output.apk"
cp "$staging/output.apk" "$output"
