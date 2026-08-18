#!/usr/bin/env bash
#
# fetch_apk.sh — download the latest APK/XAPK/APKM for an app.
#
# Usage: scripts/fetch_apk.sh <app_id>
#
# Writes bundle to analysis/<app>/ and metadata.txt.
# Source: apkpure.net CDN (d.apkpure.net).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || $# -lt 1 ]]; then
  usage "$(basename "$0")" "Downloads the latest bundle from apkpure.net."
  exit 0
fi

load_app_config "$1"
require_cmd curl
require_cmd grep

[[ -n "${APP_APKPURE_SLUG:-}" ]] || die "apkpure_slug missing in config for $APP_ID"

mkdir -p "$APP_ANALYSIS_DIR"

log "Fetching latest bundle info for $APP_PACKAGE ($APP_DISPLAY_NAME)"
DL_PAGE="https://apkpure.net/${APP_APKPURE_SLUG}/${APP_PACKAGE}/download"
curl -fsSL -A "$UA" "$DL_PAGE" -o /tmp/fetch_dlpage.html

VERSION_CODE=$(grep -oP 'versionCode=[0-9]+' /tmp/fetch_dlpage.html | head -1 | grep -oP '[0-9]+' || true)
VERSION_LABEL=$(grep -oP 'version-name" content="[^"]*"' /tmp/fetch_dlpage.html | head -1 | sed 's/.*content="//;s/"//' || true)
[[ -n "$VERSION_CODE" ]] || die "could not determine versionCode from download page"

log "versionCode=$VERSION_CODE versionLabel=${VERSION_LABEL:-unknown}"

BUNDLE_TYPE="${APP_APK_FILE_TYPE:-XAPK}"
DOWNLOAD_URL="https://d.apkpure.net/b/${BUNDLE_TYPE}/${APP_PACKAGE}?version=latest"
EXT="$(echo "$BUNDLE_TYPE" | tr '[:upper:]' '[:lower:]')"
OUT="$APP_ANALYSIS_DIR/${APP_PACKAGE}_${VERSION_LABEL:-latest}_vc${VERSION_CODE}.${EXT}"

log "Downloading $DOWNLOAD_URL"
curl -fL -A "$UA" -e "https://apkpure.net/" "$DOWNLOAD_URL" -o "$OUT"

log "Recording metadata"
cat > "$APP_METADATA" <<EOF
app_id: $APP_ID
package: $APP_PACKAGE
display_name: ${APP_DISPLAY_NAME:-}
source: apkpure.net (d.apkpure.net CDN)
version: ${VERSION_LABEL:-latest}
versionCode: $VERSION_CODE
bundle: $(basename "$OUT")
bundle_type: $BUNDLE_TYPE
size: $(stat -c%s "$OUT") bytes
fetched: $(date -u +%Y-%m-%dT%H:%M:%SZ)
EOF

log "Done: $OUT"
