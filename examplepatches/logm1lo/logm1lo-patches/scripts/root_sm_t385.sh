#!/usr/bin/env bash
#
# root_sm_t385.sh — automatic Magisk root for Samsung SM-T385 (gta2slte), Android 9
#
# Stages: verify device -> tooling -> fetch stock firmware (Bifrost) -> extract
# boot.img -> patch via Magisk (uiautomator, manual fallback) -> flash via
# Heimdall (Odin fallback for Snapdragon) -> verify root.
#
# Usage:
#   ./root_sm_t385.sh                 run the full flow
#   ./root_sm_t385.sh --verify        read-only device verification, then exit
#   ./root_sm_t385.sh --tooling       download Magisk APK (+ optional udev rule)
#   ./root_sm_t385.sh --firmware      fetch stock firmware + extract boot.img
#   ./root_sm_t385.sh --patch         patch boot.img via Magisk app
#   ./root_sm_t385.sh --flash         flash patched boot (Heimdall/Odin)
#   ./root_sm_t385.sh --post          wait for boot + verify root
#   ./root_sm_t385.sh --restore       reflash the saved stock boot.img
#   SM_SERIAL=xxxx ./root_sm_t385.sh  target a specific adb serial
#   SM_CSC=XXV ./root_sm_t385.sh      override firmware CSC (default XXV)
#
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="${SM_WORK:-$ROOT_DIR/root-work}"
FW_DIR="$WORK_DIR/fw"
EXTRACT_DIR="$WORK_DIR/extract"
VENV_DIR="$WORK_DIR/venv"
MAGISK_APK="$WORK_DIR/Magisk.apk"
STOCK_BOOT="$WORK_DIR/boot.img.stock"
PATCHED_BOOT="$WORK_DIR/magisk_patched.img"

MODEL="${SM_MODEL:-SM-T385}"
CSC="${SM_CSC:-XXV}"
SERIAL="${SM_SERIAL:-}"
SAMLOADER="$WORK_DIR/samloader-rs/samloader"

C_GREEN=$'\e[32m'; C_YELLOW=$'\e[33m'; C_RED=$'\e[31m'; C_CYAN=$'\e[36m'; C_RESET=$'\e[0m'
say()  { printf '%s\n' "$*"; }
info() { printf '%s[*]%s %s\n' "$C_CYAN" "$C_RESET" "$*"; }
ok()   { printf '%s[+]%s %s\n' "$C_GREEN" "$C_RESET" "$*"; }
warn() { printf '%s[!]%s %s\n' "$C_YELLOW" "$C_RESET" "$*"; }
die()  { printf '%s[x]%s %s\n' "$C_RED" "$C_RESET" "$*" >&2; exit 1; }

adb() { command adb ${SERIAL:+-s "$SERIAL"} "$@"; }
need() { command -v "$1" >/dev/null 2>&1; }

ensure_dir() { mkdir -p "$WORK_DIR" "$FW_DIR" "$EXTRACT_DIR"; }

stage_verify() {
  info "Stage 0/5 — verifying device"
  local devices model rel board vb fl csc bl
  devices="$(command adb devices | awk 'NR>1 && $2=="device" {print $1}')"
  if [[ -z "$devices" ]]; then
    die "No device in 'device' state over adb. Plug it in, allow USB debugging, retry."
  fi
  if [[ -z "$SERIAL" ]]; then
    SERIAL="$(printf '%s\n' "$devices" | head -n1)"
    if [[ "$(printf '%s\n' "$devices" | wc -l)" -gt 1 ]]; then
      warn "Multiple devices; using $SERIAL. Set SM_SERIAL to choose another."
    fi
  fi
  model="$(adb shell getprop ro.product.model)"
  rel="$(adb shell getprop ro.build.version.release)"
  board="$(adb shell getprop ro.product.board)"
  vb="$(adb shell getprop ro.boot.verifiedbootstate)"
  fl="$(adb shell getprop ro.boot.flash.locked)"
  csc="$(adb shell getprop ro.csc.sales_code)"
  bl="$(adb shell getprop ro.bootloader)"
  say ""
  say "  model        : $model"
  say "  android      : $rel"
  say "  board/SoC    : $board"
  say "  bootloader   : $bl"
  say "  boot state   : $vb (flash.locked=$fl)"
  say "  CSC          : $csc"
  say ""
  [[ "$model" == "$MODEL" ]]  || die "Expected $MODEL, got '$model'"
  [[ "$rel" == "9" ]]         || die "Expected Android 9, got '$rel'"
  [[ "$vb" == "orange" || "$fl" == "0" ]] || die "Bootloader not unlocked (verifiedbootstate='$vb', flash.locked='$fl')"
  if [[ "$board" == *exynos* ]]; then
    SOC="exynos"
    warn "Exynos variant: plain Magisk can bootloop (Defex). If so, see Defex-removed kernel route."
  else
    SOC="snapdragon"
    info "Snapdragon variant: Heimdall may refuse to talk to Download Mode; Odin fallback built in."
  fi
  ok "Device verified"
}

stage_tooling() {
  info "Stage 1/5 — preparing tooling"
  if [[ ! -x "$SAMLOADER" ]]; then
    info "Downloading samloader-rs (Samsung FUS downloader + flasher)"
    local ver
    ver="$(curl -fsSL https://api.github.com/repos/topjohnwu/samloader-rs/releases/latest | jq -r .tag_name)"
    [[ -n "$ver" && "$ver" != "null" ]] || die "Could not resolve samloader-rs version"
    curl -fSL "https://github.com/topjohnwu/samloader-rs/releases/download/$ver/samloader-v$ver-linux-x86_64.tar.xz" -o "$WORK_DIR/samloader-rs.tar.xz"
    mkdir -p "$WORK_DIR/samloader-rs"
    tar -xf "$WORK_DIR/samloader-rs.tar.xz" -C "$WORK_DIR/samloader-rs"
  fi
  "$SAMLOADER" --version >/dev/null 2>&1 || die "samloader-rs binary broken at $SAMLOADER"
  ok "samloader-rs ready"
  if [[ ! -f "$MAGISK_APK" || ! -s "$MAGISK_APK" ]]; then
    info "Downloading latest Magisk APK"
    local api url
    api="$(curl -fsSL https://api.github.com/repos/topjohnwu/Magisk/releases/latest)"
    url="$(printf '%s' "$api" | jq -r '.assets[] | select(.name|test("^Magisk-.*\\.apk$")) | .browser_download_url' | head -n1)"
    [[ -n "$url" ]] || die "Could not resolve Magisk APK download URL"
    curl -fSL "$url" -o "$MAGISK_APK"
  fi
  [[ -s "$MAGISK_APK" ]] || die "Magisk APK missing/empty"
  ok "Magisk APK ready: $(basename "$MAGISK_APK")"
}

stage_firmware() {
  info "Stage 2/5 — fetching stock firmware (samloader-rs) + extracting boot.img"
  if [[ ! -f "$STOCK_BOOT" ]]; then
    local fwver zip
    fwver="$("$SAMLOADER" check-update -m "$MODEL" -r "$CSC" 2>/dev/null | tail -1)"
    [[ -n "$fwver" ]] || die "check-update returned nothing for $MODEL/$CSC"
    info "Latest firmware for $MODEL/$CSC: $fwver"
    info "Downloading (~2GB) — this can take a while"
    "$SAMLOADER" download -m "$MODEL" -r "$CSC" -v "$fwver" -d "$FW_DIR"
  fi
  local zip ap
  zip="$(find "$FW_DIR" -maxdepth 1 -name '*.zip' | head -n1)"
  [[ -n "$zip" ]] || die "No firmware zip found in $FW_DIR"
  info "Firmware archive: $(basename "$zip")"
  rm -rf "$EXTRACT_DIR"; mkdir -p "$EXTRACT_DIR"
  7z e -o"$EXTRACT_DIR" "$zip" 'AP_*.tar.md5' >/dev/null
  ap="$(find "$EXTRACT_DIR" -maxdepth 1 -name 'AP_*.tar.md5' | head -n1)"
  [[ -n "$ap" ]] || die "AP_*.tar.md5 not found inside firmware archive"
  info "AP image: $(basename "$ap")"
  tar -xf "$ap" -C "$EXTRACT_DIR"
  local img
  img="$(find "$EXTRACT_DIR" -maxdepth 1 -name 'boot.img*' | head -n1)"
  [[ -n "$img" ]] || die "boot.img not found inside AP"
  if [[ "$img" == *.lz4 ]]; then
    lz4 -d -f "$img" "$EXTRACT_DIR/boot.img" >/dev/null
    img="$EXTRACT_DIR/boot.img"
  fi
  [[ "$(xxd -p -l 8 "$img" 2>/dev/null)" == "414e44524f494421" ]] || die "Extracted file is not a valid Android boot image"
  cp -f "$img" "$STOCK_BOOT"
  ok "Stock boot.img saved to $STOCK_BOOT"
}

stage_patch() {
  info "Stage 3/5 — patching boot.img via Magisk"
  adb install -r "$MAGISK_APK" >/dev/null
  adb shell mkdir -p /sdcard/Download
  adb push "$STOCK_BOOT" /sdcard/Download/boot.img >/dev/null
  local rc
  if python3 "$ROOT_DIR/magisk_autotap.py" --serial "$SERIAL" --file boot.img; then
    ok "Magisk patch automated"
  else
    rc=$?
    if [[ $rc -eq 2 ]]; then
      warn "Auto-tap gave up. Patch manually in the Magisk app:"
      say "  1. Open Magisk -> Install -> Select and Patch a File"
      say "  2. Choose /sdcard/Download/boot.img"
      warn "Waiting for magisk_patched-*.img to appear..."
    else
      die "Magisk patch step failed unexpectedly"
    fi
  fi
  local patched deadline
  deadline=$((SECONDS + 300))
  patched=""
  while (( SECONDS < deadline )); do
    patched="$(adb shell ls /sdcard/Download/ | grep '^magisk_patched' || true)"
    [[ -n "$patched" ]] && break
    sleep 5
  done
  [[ -n "$patched" ]] || die "Patched image never appeared in /sdcard/Download/"
  patched="$(printf '%s\n' "$patched" | head -n1 | tr -d '\r')"
  adb pull "/sdcard/Download/$patched" "$PATCHED_BOOT" >/dev/null
  ok "Patched image: $patched -> $PATCHED_BOOT"
}

flash_via_samloader() {
  local img="$1"
  "$SAMLOADER" flash -p BOOT "$img"
}

stage_flash() {
  info "Stage 4/5 — flashing patched boot image"
  local img="${1:-$PATCHED_BOOT}"
  [[ -f "$img" ]] || die "Image to flash not found: $img"
  info "Rebooting to Download Mode"
  adb reboot download || true
  info "Waiting for device in Download Mode (samloader detect)..."
  local deadline=$((SECONDS + 120)) detected=""
  while (( SECONDS < deadline )); do
    if "$SAMLOADER" detect >/dev/null 2>&1; then detected=1; break; fi
    sleep 3
  done
  if [[ -z "$detected" ]]; then
    warn "samloader-rs could not detect the Download Mode device."
    say "  Confirm the tablet screen shows Download Mode. If it's a USB permission issue:"
    say "    sudo $SAMLOADER fix-usb"
    say "    # then replug and re-run: $0 --flash"
    die "Flash aborted (no device detected in Download Mode)"
  fi
  ok "Device detected in Download Mode"
  info "Flashing $img -> BOOT"
  if flash_via_samloader "$img"; then
    ok "Flash OK — device auto-reboots to system"
  else
    warn "samloader-rs flash failed. Odin fallback:"
    say "  On Windows / Wine / VM with Odin 3.13+: load $img in the AP slot,"
    say "  UNCHECK Auto Reboot, Start; then reboot with Vol-Down + Power."
    read -r -p "Press Enter after Odin finishes and the tablet is rebooting to system... " _
  fi
}

stage_post_flash() {
  info "Stage 5/5 — waiting for boot + verifying root"
  command adb wait-for-device
  local deadline=$((SECONDS + 300))
  while (( SECONDS < deadline )); do
    if [[ "$(adb shell getprop sys.boot_completed 2>/dev/null | tr -d '\r')" == "1" ]]; then break; fi
    sleep 5
  done
  sleep 10
  local id_out
  id_out="$(adb shell su -c id 2>/dev/null | tr -d '\r' || true)"
  if [[ "$id_out" == *"uid=0"* ]]; then
    ok "ROOT CONFIRMED: $id_out"
  else
    warn "Root not detected yet (got: '$id_out'). Magisk may need one manual open/complete."
  fi
  say ""
  say "  Stock boot  (recovery): $STOCK_BOOT"
  say "  Patched boot          : $PATCHED_BOOT"
  say "  Restore stock         : $0 --restore"
  say ""
}

stage_restore() {
  info "Restoring stock boot image"
  [[ -f "$STOCK_BOOT" ]] || die "No stock boot backup at $STOCK_BOOT"
  stage_flash "$STOCK_BOOT"
  ok "Stock boot restored"
}

main() {
  ensure_dir
  case "${1:-}" in
    --restore) stage_restore; return ;;
    --verify)  stage_verify; return ;;
    --tooling) stage_tooling; return ;;
    --firmware) stage_firmware; return ;;
    --patch)   stage_patch; return ;;
    --flash)   stage_flash; return ;;
    --post)    stage_post_flash; return ;;
  esac
  stage_verify
  stage_tooling
  stage_firmware
  stage_patch
  stage_flash
  stage_post_flash
}

main "$@"
