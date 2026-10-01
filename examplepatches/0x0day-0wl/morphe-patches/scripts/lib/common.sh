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

# Morphe Desktop (recent) needs Java 21+. Prefer tools/jdk-21 if present.
ensure_java21() {
  local portable="$ROOT_DIR/tools/jdk-21"
  if [[ -x "$portable/bin/java" ]]; then
    export JAVA_HOME="$portable"
    export PATH="$JAVA_HOME/bin:$PATH"
    return 0
  fi
  local ver
  ver="$(java -version 2>&1 | head -1 || true)"
  if echo "$ver" | rg -q '"2(1|2|3|4|5)\.'; then
    return 0
  fi
  die "Java 21+ required for Morphe Desktop (found: ${ver:-none}). Run scripts/setup_tools.sh to fetch a portable JDK into tools/jdk-21."
}

# Prefer Android SDK platform-tools adb when present (mdns / newer wireless debug).
prefer_sdk_adb() {
  local sdk_adb="${ANDROID_HOME:-$HOME/Android/Sdk}/platform-tools/adb"
  if [[ -x "$sdk_adb" ]]; then
    export PATH="$(dirname "$sdk_adb"):$PATH"
  fi
}

# Pick an authorized adb serial. Prefers ANDROID_SERIAL, then tcpip/wifi, then USB.
pick_adb_serial() {
  prefer_sdk_adb
  require_cmd adb
  local devices count serial
  devices="$(adb devices | awk 'NR>1 && $2=="device" {print $1}')"
  count="$(echo "$devices" | grep -c . || true)"
  [[ "$count" -ge 1 ]] || die "no authorized adb device (USB or wireless debugging)"

  if [[ -n "${ANDROID_SERIAL:-}" ]]; then
    echo "$devices" | grep -qx "$ANDROID_SERIAL" || die "ANDROID_SERIAL=$ANDROID_SERIAL not in adb devices"
    echo "$ANDROID_SERIAL"
    return 0
  fi
  if [[ "$count" -eq 1 ]]; then
    echo "$devices" | head -1
    return 0
  fi
  serial="$(echo "$devices" | rg -m1 ':' || true)"
  [[ -n "$serial" ]] || serial="$(echo "$devices" | head -1)"
  warn "multiple devices — using: $serial (set ANDROID_SERIAL to override)"
  echo "$serial"
}

# Keep screen awake for device tests (no root). Saves prior settings in globals.
# stay_on_while_plugged_in: 1=AC 2=USB 4=wireless → 7=all
DEVICE_STAY_ON_PREV=""
DEVICE_SCREEN_OFF_PREV=""

device_keep_awake() {
  local -n _adb=$1
  DEVICE_STAY_ON_PREV="$("${_adb[@]}" shell settings get global stay_on_while_plugged_in 2>/dev/null | tr -d '\r' || true)"
  DEVICE_SCREEN_OFF_PREV="$("${_adb[@]}" shell settings get system screen_off_timeout 2>/dev/null | tr -d '\r' || true)"
  log "Keeping screen awake (was stay_on=${DEVICE_STAY_ON_PREV:-?}, timeout=${DEVICE_SCREEN_OFF_PREV:-?})"
  "${_adb[@]}" shell settings put global stay_on_while_plugged_in 7 >/dev/null
  # 30 minutes; also covers unplugged wireless-debug sessions
  "${_adb[@]}" shell settings put system screen_off_timeout 1800000 >/dev/null
  "${_adb[@]}" shell svc power stayon true >/dev/null 2>&1 || true
  "${_adb[@]}" shell input keyevent KEYCODE_WAKEUP >/dev/null 2>&1 || true
  "${_adb[@]}" shell wm dismiss-keyguard >/dev/null 2>&1 || true
  "${_adb[@]}" shell cmd statusbar collapse >/dev/null 2>&1 || true
}

device_restore_awake() {
  local -n _adb=$1
  if [[ -n "${DEVICE_STAY_ON_PREV}" && "${DEVICE_STAY_ON_PREV}" != "null" ]]; then
    "${_adb[@]}" shell settings put global stay_on_while_plugged_in "$DEVICE_STAY_ON_PREV" >/dev/null 2>&1 || true
  fi
  if [[ -n "${DEVICE_SCREEN_OFF_PREV}" && "${DEVICE_SCREEN_OFF_PREV}" != "null" ]]; then
    "${_adb[@]}" shell settings put system screen_off_timeout "$DEVICE_SCREEN_OFF_PREV" >/dev/null 2>&1 || true
  fi
  "${_adb[@]}" shell svc power stayon false >/dev/null 2>&1 || true
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
