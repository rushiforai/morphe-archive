#!/usr/bin/env bash
# One-command build + patch for the Facebook "Marketplace only" Morphe patch.
#   ./build.sh /path/to/com.facebook.katana_582.0.0.50.54-....apk
# Needs: Java 21+, git, internet. Output: <apk name>-patched.apk next to this script's work dir.
# Build command and output path taken from morphe-patches' own CI. Not yet run end-to-end - see README.
set -euo pipefail

EXPORT_ONLY=0
if [ "${1:-}" = "--export-mpp" ]; then EXPORT_ONLY=1; APK=""; else
APK="${1:-}"
[ -n "$APK" ] && [ -f "$APK" ] || { echo "Usage: $0 /path/to/facebook.apk | $0 --export-mpp"; exit 1; }
APK="$(cd "$(dirname "$APK")" && pwd)/$(basename "$APK")"
fi

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK="$HERE/work"; mkdir -p "$WORK"

command -v java >/dev/null || { echo "Java 21+ not found"; exit 1; }
JV=$(java -version 2>&1 | head -1 | sed -E 's/.*"([0-9]+).*/\1/')
[ "${JV:-0}" -ge 21 ] || { echo "Java 21+ required (found $JV)"; exit 1; }

# The Morphe Gradle plugin lives on GitHub Packages, which needs a token even for public reads.
# Create a classic token with only "read:packages": https://github.com/settings/tokens
: "${GITHUB_ACTOR:?Set GITHUB_ACTOR to your GitHub username}"
: "${GITHUB_TOKEN:?Set GITHUB_TOKEN to a token with read:packages}"

P="$HERE"   # standalone Gradle project

echo "==> Building patch bundle"
( cd "$P" && ./gradlew :patches:buildAndroid --no-daemon )

BUNDLE=$(ls -t "$P"/patches/build/libs/patches-*.mpp 2>/dev/null | head -1)
[ -n "$BUNDLE" ] || { echo "Build finished but no patches-*.mpp in patches/build/libs"; exit 1; }
echo "    bundle: $BUNDLE"
mkdir -p "$(dirname "$0")/dist" && cp "$BUNDLE" "$(dirname "$0")/dist/marketplace-patches.mpp"
echo "    exported: dist/marketplace-patches.mpp"
[ "$EXPORT_ONLY" = 1 ] && { echo "Done. Import the .mpp into Morphe Manager / Desktop."; exit 0; }

echo "==> Getting Morphe Desktop (CLI)"
DESK="$WORK/morphe-desktop.jar"
if [ ! -f "$DESK" ]; then
  URL=$(curl -fsSL https://api.github.com/repos/MorpheApp/morphe-desktop/releases/latest \
        | grep -Eo 'https://[^"]*morphe-desktop-[^"]*-all\.jar' | head -1)
  [ -n "$URL" ] || { echo "Could not find desktop jar; download it manually to $DESK"; exit 1; }
  curl -fsSL "$URL" -o "$DESK"
fi

echo "==> Patching (run on a COPY; original is untouched)"
cp "$APK" "$WORK/facebook.apk"
ARGS=(-jar "$DESK" patch -p "$BUNDLE" --exclusive -e "Marketplace only")
# Rename to io.focalpoint.prism / "Marketplace" (pulls in Morphe's "Clone app" patch as a dependency).
[ -z "${KEEP_ORIGINAL_PACKAGE:-}" ] && ARGS+=(-e "Marketplace rename")   # KEEP_ORIGINAL_PACKAGE=1 keeps com.facebook.katana / "Facebook"
[ -n "${KEEP_TAB_BAR:-}" ]   && ARGS+=("-OhideTabBar=false")      # leave the bottom tab bar visible
[ -n "${KEEP_NAVIGATION:-}" ] && ARGS+=("-OlockNavigation=false")  # don't lock swiping / left menu
[ -n "${KEEP_IN_APP_BROWSER:-}" ] && ARGS+=("-OexternalLinks=false") # keep Facebook's in-app WebView browser
[ -n "${KEEP_REELS:-}" ] && ARGS+=("-OblockReels=false")           # don't block Reels / fullscreen video
[ -n "${KEEP_HOME_BACK:-}" ] && ARGS+=("-OmarketplaceIsHome=false") # back goes to Facebook Home (stock)
java "${ARGS[@]}" "$WORK/facebook.apk"

# Morphe writes <work>/facebook/facebook-<version>-patches-<bundle>.apk; copy the newest to a stable name.
OUT=$(ls -t "$WORK"/facebook/*.apk 2>/dev/null | head -1)
[ -n "$OUT" ] || { echo "Patching finished but no output APK under $WORK/facebook"; exit 1; }
cp "$OUT" "$WORK/facebook-patched.apk"

echo
echo "Done. Patched APK: $WORK/facebook-patched.apk"
echo "Install on a test device first (adb install -r ...). Keep your original APK."
