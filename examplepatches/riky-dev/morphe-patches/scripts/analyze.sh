#!/usr/bin/env bash
#
# analyze.sh — recursive scan of jadx/smali output for ad + premium hooks.
# Produces analysis/report.txt with candidate hooks ranked by relevance.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
ANALYSIS_DIR="$ROOT_DIR/analysis"
SRC="$ANALYSIS_DIR/jadx_out/sources"

OUT="$ANALYSIS_DIR/report.txt"
: > "$OUT"

section() {
  echo "" >> "$OUT"
  echo "═══════════════════════════════════════════════════════════" >> "$OUT"
  echo "## $1" >> "$OUT"
  echo "═══════════════════════════════════════════════════════════" >> "$OUT"
}

# 1. Ad SDK entry points in app-owned code (not SDK internals)
section "App ad-wrapper classes (com.Meteosolutions.* referencing Google Ads)"
rg -l --glob '*.java' 'com\.google\.android\.gms\.ads' "$SRC/com/Meteosolutions" | sed "s|$SRC/||" >> "$OUT"

# 2. Ad SDK method usage sites
section "loadAd / AdRequest / AdView / Interstitial / Rewarded sites in app code"
rg -n --glob '*.java' 'new AdRequest|\.loadAd\(|InterstitialAd|RewardedAd|AdView\b|onAdLoaded|AdListener' "$SRC/com/Meteosolutions" | sed "s|$SRC/||" >> "$OUT"

# 3. Premium / no-ads flag
section "Premium / ad-free / subscription flags"
rg -in --glob '*.java' 'isPremium|removeAds|adFree|ad_free|AD_FREE|premium|noAds|showAds' "$SRC/com/Meteosolutions" | sed "s|$SRC/||" >> "$OUT"

# 4. Billing
section "Billing purchase callbacks"
rg -ln --glob '*.java' 'Purchase|billing' "$SRC/com/Meteosolutions" | sed "s|$SRC/||" >> "$OUT"

# 5. Third-party ad SDKs present
section "Third-party ad/analytics SDK packages"
for p in com/google/android/gms com/beintoo com/outbrain com/iab com/iubenda; do
  cnt=$(find "$SRC/$p" -name '*.java' 2>/dev/null | wc -l)
  echo "$p -> $cnt files" >> "$OUT"
done

echo "" >> "$OUT"
echo "report written to $OUT ($(wc -l < "$OUT") lines)"