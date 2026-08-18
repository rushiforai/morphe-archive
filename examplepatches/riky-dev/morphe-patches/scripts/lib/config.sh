#!/usr/bin/env bash
# Load app config from config/apps/<app_id>.yaml into exported variables.

set -euo pipefail

# shellcheck source=common.sh
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

_parse_config() {
  local app_id="$1"
  local key="${2:-}"
  python3 - "$CONFIG_DIR/${app_id}.yaml" "$key" <<'PY'
import json
import re
import sys
from pathlib import Path

path = Path(sys.argv[1])
want = sys.argv[2]

if not path.is_file():
    sys.exit(2)

data: dict = {}
current_list_key = None
current_list: list | None = None
current_item: dict | None = None
in_verify = False

for raw in path.read_text().splitlines():
    line = raw.split('#', 1)[0].rstrip()
    if not line.strip():
        continue

    stripped = line.strip()

    if stripped.startswith('- ') and current_list is not None:
        current_item = {}
        current_list.append(current_item)
        rest = stripped[2:].strip()
        if ':' in rest:
            k, v = rest.split(':', 1)
            current_item[k.strip()] = v.strip().strip("'\"")
        continue

    if current_item is not None and re.match(r'^\s{4,}\w+:', line):
        k, v = stripped.split(':', 1)
        current_item[k.strip()] = v.strip().strip("'\"")
        continue

    if ':' not in stripped:
        continue

    key, val = stripped.split(':', 1)
    key = key.strip()
    val = val.strip().strip("'\"")

    if key == 'verify':
        in_verify = True
        data.setdefault('verify', {})
        current_list = None
        current_item = None
        continue

    if in_verify and key == 'assertions' and val == '':
        current_list_key = 'assertions'
        current_list = data['verify'].setdefault('assertions', [])
        current_item = None
        continue

    if in_verify and key == 'apk':
        data['verify']['apk'] = val
        current_list = None
        current_item = None
        continue

    if val == '':
        continue

    data[key] = val
    current_list = None
    current_item = None
    in_verify = False

def get(d, dotted):
    cur: object = d
    for part in dotted.split('.'):
        if isinstance(cur, dict) and part in cur:
            cur = cur[part]
        else:
            return None
    return cur

if want == '__json__':
    print(json.dumps(data))
    sys.exit(0)

if not want:
    sys.exit(0)

val = get(data, want)
if val is None:
    sys.exit(1)
if isinstance(val, (dict, list)):
    print(json.dumps(val))
else:
    print(val)
PY
}

load_app_config() {
  local app_id="$1"
  local config_file="$CONFIG_DIR/${app_id}.yaml"

  [[ -n "$app_id" ]] || die "app id required"
  [[ -f "$config_file" ]] || die "unknown app: $app_id (expected $config_file)"

  APP_ID="$app_id"
  APP_PACKAGE="$(_parse_config "$app_id" package)"
  APP_DISPLAY_NAME="$(_parse_config "$app_id" display_name || true)"
  APP_APK_FILE_TYPE="$(_parse_config "$app_id" apk_file_type || true)"
  APP_APKPURE_SLUG="$(_parse_config "$app_id" apkpure_slug || true)"
  analysis_rel="$(_parse_config "$app_id" analysis_dir)"
  APP_ANALYSIS_DIR="$ROOT_DIR/$analysis_rel"

  [[ -n "$APP_PACKAGE" ]] || die "package missing in $config_file"
  [[ -n "$analysis_rel" ]] || die "analysis_dir missing in $config_file"

  APP_PACKAGE_PATH="$(package_to_path "$APP_PACKAGE")"
  APP_JADX_SRC="$APP_ANALYSIS_DIR/jadx_out/sources/$APP_PACKAGE_PATH"
  APP_EXTRACT_DIR="$APP_ANALYSIS_DIR/extract"
  APP_METADATA="$APP_ANALYSIS_DIR/metadata.txt"
  APP_REPORT="$APP_ANALYSIS_DIR/report.txt"

  export APP_ID APP_PACKAGE APP_DISPLAY_NAME APP_APK_FILE_TYPE
  export APP_APKPURE_SLUG APP_ANALYSIS_DIR APP_PACKAGE_PATH
  export APP_JADX_SRC APP_EXTRACT_DIR APP_METADATA APP_REPORT
}

config_verify_apk() {
  local app_id="$1"
  _parse_config "$app_id" verify.apk 2>/dev/null || true
}

config_verify_assertions() {
  local app_id="$1"
  _parse_config "$app_id" verify.assertions 2>/dev/null || echo '[]'
}
