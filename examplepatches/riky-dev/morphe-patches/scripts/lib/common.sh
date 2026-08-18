#!/usr/bin/env bash
# Shared helpers for morphe-patches scripts.

set -euo pipefail

SCRIPT_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$(dirname "$SCRIPT_LIB_DIR")"
ROOT_DIR="$(dirname "$SCRIPTS_DIR")"
CONFIG_DIR="$ROOT_DIR/config/apps"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"

log() { echo "==> $*"; }
warn() { echo "WARNING: $*" >&2; }
die() { echo "ERROR: $*" >&2; exit 1; }

usage() {
  local script="$1"
  shift
  echo "Usage: $script <app_id> [options]"
  echo ""
  echo "App configs live in config/apps/<app_id>.yaml"
  echo ""
  echo "Available apps:"
  for f in "$CONFIG_DIR"/*.yaml; do
    [[ -f "$f" ]] || continue
    local base
    base="$(basename "$f" .yaml)"
    [[ "$base" == _template ]] && continue
    echo "  - $base"
  done
  echo ""
  echo "$*"
}

require_cmd() {
  local cmd="$1"
  command -v "$cmd" >/dev/null 2>&1 || die "required command not found: $cmd"
}

# Convert com.example.app -> com/example/app
package_to_path() {
  echo "$1" | tr '.' '/'
}

# Find the newest downloaded bundle (xapk/apkm/apk) in an analysis dir.
find_latest_bundle() {
  local dir="$1"
  local f
  f="$(find "$dir" -maxdepth 1 \( -name '*.xapk' -o -name '*.apkm' -o -name '*.apk' \) -printf '%T@ %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-)"
  [[ -n "$f" ]] || return 1
  echo "$f"
}

# Find base APK inside extract dir (largest .apk, or exact package match).
find_base_apk() {
  local extract_dir="$1"
  local pkg="$2"
  local named="$extract_dir/${pkg}.apk"
  if [[ -f "$named" ]]; then
    echo "$named"
    return 0
  fi
  find "$extract_dir" -name '*.apk' -printf '%s %p\n' 2>/dev/null | sort -rn | head -1 | cut -d' ' -f2-
}
