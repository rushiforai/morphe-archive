#!/usr/bin/env bash
#
# decompile.sh — decompile base APK with jadx and apktool.
#
# Usage: scripts/decompile.sh <app_id> [path/to/base.apk]
#
# Outputs:
#   analysis/<app>/jadx_out/
#   analysis/<app>/apktool_out/

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage "$(basename "$0")" "[base_apk_path]
  Decompiles the base APK with jadx and apktool."
  exit 0
fi

[[ $# -ge 1 ]] || { usage "$(basename "$0")"; exit 1; }

load_app_config "$1"
require_cmd jadx
require_cmd apktool

APK="${2:-}"
if [[ -z "$APK" ]]; then
  APK="$(find_base_apk "$APP_EXTRACT_DIR" "$APP_PACKAGE")" || true
fi
[[ -n "$APK" && -f "$APK" ]] || die "base APK not found (run extract_apk.sh first or pass path)"

JADX_OUT="$APP_ANALYSIS_DIR/jadx_out"
APKTOOL_OUT="$APP_ANALYSIS_DIR/apktool_out"

CONFIG_FILE="$CONFIG_DIR/${APP_ID}.yaml"
read -r JADX_HEAP JADX_THREADS JADX_NO_RES < <(
  python3 - "$CONFIG_FILE" <<'PY'
import sys
from pathlib import Path

path = Path(sys.argv[1])
heap = ""
threads = ""
no_res = "false"
if not path.is_file():
    print(f"{heap}\t{threads}\t{no_res}")
    raise SystemExit

in_decompile = False
for raw in path.read_text().splitlines():
    line = raw.split("#", 1)[0].rstrip()
    if not line.strip():
        continue
    stripped = line.strip()
    if stripped == "decompile:":
        in_decompile = True
        continue
    if in_decompile:
        if not line.startswith(" ") and not line.startswith("\t"):
            in_decompile = False
            continue
        inner = stripped
        if inner.startswith("jadx_max_heap:"):
            heap = inner.split(":", 1)[1].strip().strip("'\"")
        elif inner.startswith("jadx_threads:"):
            threads = inner.split(":", 1)[1].strip().strip("'\"")
        elif inner.startswith("jadx_no_res:"):
            val = inner.split(":", 1)[1].strip().strip("'\"").lower()
            no_res = "true" if val in ("true", "yes", "1") else "false"

print(f"{heap}\t{threads}\t{no_res}")
PY
)

JADX_ARGS=()
[[ -n "$JADX_HEAP" ]] && JADX_ARGS+=(-J "-Xmx${JADX_HEAP}")
[[ -n "$JADX_THREADS" ]] && JADX_ARGS+=(--jobs "$JADX_THREADS")
[[ "$JADX_NO_RES" == "true" ]] && JADX_ARGS+=(--no-res)

log "Decompiling with jadx: $APK"
if [[ ${#JADX_ARGS[@]} -gt 0 ]]; then
  log "jadx options: ${JADX_ARGS[*]}"
fi
rm -rf "$JADX_OUT"
jadx "${JADX_ARGS[@]}" -d "$JADX_OUT" "$APK" >/dev/null

log "Decompiling with apktool: $APK"
rm -rf "$APKTOOL_OUT"
apktool d -f -o "$APKTOOL_OUT" "$APK" >/dev/null

log "jadx sources: $JADX_OUT/sources"
log "apktool smali: $APKTOOL_OUT/smali"
log "Done"
