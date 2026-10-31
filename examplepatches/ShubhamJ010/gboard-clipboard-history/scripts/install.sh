#!/usr/bin/env bash
# ==============================================================================
# Install a patched APK on a connected device.
#
#   ./scripts/install.sh output/Gboard-com.sj010.gboard.apk
#   ./scripts/install.sh output/Gboard-PixelBoard-akshaykadam.apk --device 192.168.1.80:43159
#
# If the app is installed with a different signing certificate, Android refuses
# the update (INSTALL_FAILED_UPDATE_INCOMPATIBLE). Pass --uninstall to remove
# the old package first (this wipes its app data, including clipboard history).
# ==============================================================================

set -euo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

APK=""
DEVICE=""
UNINSTALL=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        --device) DEVICE="${2:-}"; shift 2 ;;
        --uninstall) UNINSTALL=true; shift ;;
        -h|--help) sed -n '2,12p' "$0"; exit 0 ;;
        *) [[ -z "$APK" ]] && APK="$1" || die "unexpected argument: $1"; shift ;;
    esac
done

[[ -n "$APK" ]] || die "usage: $0 <apk> [--device serial] [--uninstall]"
[[ -f "$APK" ]] || die "apk not found: $APK"

ADB=(adb)
[[ -n "$DEVICE" ]] && ADB=(adb -s "$DEVICE")

PKG=$("${AAPT2:-$(find_aapt2 || true)}" dump badging "$APK" 2>/dev/null | head -1 | sed -E "s/^package: name='([^']+)'.*/\1/" || true)
[[ -n "$PKG" ]] || die "cannot read package name from $APK (aapt2 not found)"

log "apk    : $APK"
log "package: $PKG"

if $UNINSTALL; then
    log "uninstalling $PKG"
    "${ADB[@]}" uninstall "$PKG" || warn "uninstall failed (maybe not installed)"
fi

log "installing"
# No -g here. Granting every runtime permission at install time is broader than
# the app needs and hides the permission set the user actually agreed to.
"${ADB[@]}" install -r "$APK"
log "installed $PKG"
"${ADB[@]}" shell pm list packages | grep -F "$PKG" || true
