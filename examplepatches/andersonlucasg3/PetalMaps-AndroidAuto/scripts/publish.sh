#!/usr/bin/env bash
# =============================================================================
# publish.sh — end-to-end release pipeline for the patches bundle.
#
# Usage:
#   scripts/publish.sh [patch|minor|major|X.Y.Z] ["release notes"]
#
# Steps: version bump -> build (jar first, DEX last) -> local verification
#        (classes.dex + CLI can read patches) -> patches-bundle.json -> commit
#        & push -> GitHub release -> post-publish verification (simulates what
#        Morphe Manager downloads). Fails loudly if any check does not pass.
# =============================================================================
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

export JAVA_HOME="${JAVA_HOME:-C:\Program Files\Android\Android Studio\jbr}"
export GITHUB_ACTOR="${GITHUB_ACTOR:-dummy}"
export GITHUB_TOKEN="${GITHUB_TOKEN:-dummy}"

REPO="andersonlucasg3/PetalMaps-AndroidAuto"
MORPHE_CLI="$PROJECT_DIR/tools/morphe-cli/morphe-desktop-1.12.0-all.jar"
BUMP="${1:-patch}"
NOTES="${2:-}"

fail() { echo ""; echo "❌ PUBLISH FAILED: $1" >&2; exit 1; }

# ── Step 1/7: Version bump ──────────────────────────────────────────────────
CURRENT="$(grep -E '^version' gradle.properties | cut -d= -f2 | tr -d ' ')"
[ -n "$CURRENT" ] || fail "could not read version from gradle.properties"

case "$BUMP" in
    patch|minor|major)
        IFS='.' read -r MAJ MIN PAT <<< "$CURRENT"
        case "$BUMP" in
            major) NEW="$((MAJ+1)).0.0" ;;
            minor) NEW="$MAJ.$((MIN+1)).0" ;;
            patch) NEW="$MAJ.$MIN.$((PAT+1))" ;;
        esac
        ;;
    *) NEW="$BUMP" ;;
esac

echo "=== Step 1/7: Version bump: $CURRENT -> $NEW ==="
sed -i "s/^version = .*/version = $NEW/" gradle.properties

MPP="$PROJECT_DIR/patches/build/libs/patches-${NEW}.mpp"
TAG="v$NEW"

# ── Step 2/7: Build — ORDER MATTERS ─────────────────────────────────────────
# generatePatchesList depends on 'build', which re-creates the plain JVM jar.
# buildAndroid must run LAST so classes.dex is added after the jar is final.
# PatchListGenerator picks the FIRST .mpp found in build/libs/, so stale
# bundles from previous versions must be removed first.
# A clean build is required: incremental buildAndroid may skip dexing when
# only the version changed, silently producing a bundle without classes.dex.
echo "=== Step 2/7: Build patches (clean, generatePatchesList, then buildAndroid) ==="
rm -f patches/build/libs/*.mpp
./gradlew :patches:clean --no-daemon
./gradlew :patches:generatePatchesList --no-daemon
./gradlew :patches:buildAndroid --no-daemon

[ -f "$MPP" ] || fail "bundle not found: $MPP"

# ── Step 3/7: Local bundle verification ─────────────────────────────────────
echo "=== Step 3/7: Verify bundle ==="
unzip -l "$MPP" | grep -q "classes.dex" \
    || fail "$MPP is missing classes.dex (Manager would reject it). Never publish the output of the plain 'build' task."
"$JAVA_HOME/bin/java.exe" -jar "$MORPHE_CLI" list-patches --patches "$MPP" 2>/dev/null | grep -q "Android Auto" \
    || fail "morphe-cli cannot read patches from $MPP"
echo "Bundle OK: classes.dex present, patches readable."

# ── Step 4/7: patches-bundle.json ───────────────────────────────────────────
echo "=== Step 4/7: Update patches-bundle.json ==="
NOW="$(date -u +"%Y-%m-%dT%H:%M:%S")"
DESCRIPTION="${NOTES:-Release $TAG}"
cat > patches-bundle.json <<EOF
{
    "version": "$NEW",
    "created_at": "$NOW",
    "description": "$DESCRIPTION\n\n- **Android Auto**: injects PetalCarAppService and projects the built-in HiCar automotive UI (AutoPetalMapsActivity) onto the head-unit surface via VirtualDisplay, with synthetic pan/zoom/recenter gestures.\n- **Anti-Repack Bypass**: neutralises the native SecurityDetect.irpj() integrity check that kills the process on re-signed APKs.\n- **Manufacturer Check Bypass**: removes the Huawei/Honor-only device gate.\n- **Change package name**: install alongside the original app (default: morphe.huawei.petal.maps).",
    "download_url": "https://github.com/$REPO/releases/download/$TAG/patches-$NEW.mpp",
    "signature_download_url": ""
}
EOF

# ── Step 5/7: Commit & push ─────────────────────────────────────────────────
echo "=== Step 5/7: Commit & push ==="
git add -A
git diff --cached --quiet && echo "Nothing to commit." || git commit -m "Release $TAG"
git push

# ── Step 6/7: GitHub release ────────────────────────────────────────────────
# NOTE: GITHUB_TOKEN=dummy is only for the Gradle build; unset it for gh,
# otherwise gh uses the dummy token instead of the keyring credentials.
echo "=== Step 6/7: Create GitHub release $TAG ==="
env -u GITHUB_TOKEN gh release delete "$TAG" --repo "$REPO" --yes 2>/dev/null && echo "Replaced existing $TAG." || true
env -u GITHUB_TOKEN gh release create "$TAG" "$MPP" --repo "$REPO" --title "$TAG" --notes "${NOTES:-Release $TAG}"

# ── Step 7/7: Post-publish verification (simulate Morphe Manager) ───────────
echo "=== Step 7/7: Verify published source (as the Manager sees it) ==="
# raw.githubusercontent.com caches aggressively (~5 min); retry before failing.
PUBLISHED_VERSION=""
for i in $(seq 1 20); do
    sleep 15
    PUBLISHED_VERSION="$(curl -sL "https://raw.githubusercontent.com/$REPO/main/patches-bundle.json" | grep -o '"version": *"[^"]*"' | cut -d'"' -f4)"
    [ "$PUBLISHED_VERSION" = "$NEW" ] && break
done
[ "$PUBLISHED_VERSION" = "$NEW" ] || fail "published patches-bundle.json reports version '$PUBLISHED_VERSION', expected '$NEW'"

TMP_MPP="$(mktemp --suffix=.mpp)"
curl -sL -o "$TMP_MPP" "https://github.com/$REPO/releases/download/$TAG/patches-$NEW.mpp"
unzip -l "$TMP_MPP" | grep -q "classes.dex" || fail "PUBLISHED asset is missing classes.dex"
rm -f "$TMP_MPP"

echo ""
echo "=============================================="
echo "✅ Published $TAG — bundle verified end-to-end"
echo "   https://github.com/$REPO/releases/tag/$TAG"
echo "=============================================="
