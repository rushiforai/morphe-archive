#!/usr/bin/env bash
#
# analyze.sh — optional starter report of common ad/premium/billing patterns.
#
# Usage: scripts/analyze.sh <app_id>
#
# This is a HINT tool, not a patch plan. Dig deeper with rg and by reading sources.
# Requires decompile.sh to have run first (jadx_out/sources).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib/common.sh
source "$SCRIPT_DIR/lib/common.sh"
# shellcheck source=lib/config.sh
source "$SCRIPT_DIR/lib/config.sh"

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage "$(basename "$0")" "Writes optional analysis hints to analysis/<app>/report.txt"
  exit 0
fi

[[ $# -ge 1 ]] || { usage "$(basename "$0")"; exit 1; }

load_app_config "$1"
require_cmd rg

SRC="$APP_ANALYSIS_DIR/jadx_out/sources"
APP_SRC="$SRC/$APP_PACKAGE_PATH"

[[ -d "$APP_SRC" ]] || die "app sources not found at $APP_SRC (run decompile.sh first?)"

: > "$APP_REPORT"

section() {
  echo "" >> "$APP_REPORT"
  echo "═══════════════════════════════════════════════════════════" >> "$APP_REPORT"
  echo "## $1" >> "$APP_REPORT"
  echo "═══════════════════════════════════════════════════════════" >> "$APP_REPORT"
}

{
  echo "App: $APP_DISPLAY_NAME ($APP_PACKAGE)"
  echo "Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
  echo "NOTE: This report is a starting point only. Trace call chains,"
  echo "read classes, and compare smali before deciding what to patch."
} >> "$APP_REPORT"

section "App code referencing Google Ads"
rg -l --glob '*.java' 'com\.google\.android\.gms\.ads' "$APP_SRC" 2>/dev/null | sed "s|$SRC/||" >> "$APP_REPORT" || true

section "loadAd / AdRequest / AdView / Interstitial / Rewarded sites"
rg -n --glob '*.java' 'new AdRequest|\.loadAd\(|InterstitialAd|RewardedAd|AdView\b|onAdLoaded|AdListener' "$APP_SRC" 2>/dev/null | sed "s|$SRC/||" >> "$APP_REPORT" || true

section "Premium / ad-free / subscription flags"
rg -in --glob '*.java' 'isPremium|removeAds|adFree|ad_free|AD_FREE|premium|noAds|showAds' "$APP_SRC" 2>/dev/null | sed "s|$SRC/||" >> "$APP_REPORT" || true

section "Billing purchase callbacks"
rg -ln --glob '*.java' 'Purchase|billing' "$APP_SRC" 2>/dev/null | sed "s|$SRC/||" >> "$APP_REPORT" || true

section "Third-party ad/analytics SDK packages (file counts)"
for p in com/google/android/gms com/beintoo com/outbrain com/iab com/iubenda; do
  cnt=$(find "$SRC/$p" -name '*.java' 2>/dev/null | wc -l)
  echo "$p -> $cnt files" >> "$APP_REPORT"
done

echo "" >> "$APP_REPORT"
log "Report written to $APP_REPORT ($(wc -l < "$APP_REPORT") lines)"
