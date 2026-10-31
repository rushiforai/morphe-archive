#!/usr/bin/env bash
#
# Oxbow release: one GitHub release carries everything the three update paths read:
#   - oxbow.apk / oxbow-clone.apk   (the in-app updater and Obtainium)
#   - patches-<version>.mpp         (Morphe Manager, via patches-bundle.json on main)
#
#   ./release.sh <instagram.apkm> [--draft]
#
# Needs ~/.config/oxbow/release.env (keystore password, path, alias) and `gh` logged in.
# The tag is the Instagram version, e.g. v452-0-0-48-64 (the updater compares it with the
# installed versionName). The patch bundle has its own semver in gradle.properties, bumped
# here on every release so Morphe Manager sees an update.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APK="${1:?usage: ./release.sh <instagram.apkm> [--draft]}"
DRAFT="${2:-}"
REPO="aic0d3r/oxbow"
# shellcheck disable=SC1091
source "$HOME/.config/oxbow/release.env"
# build.sh finds the SDK for itself, but the gradlew call below needs it too.
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export GITHUB_TOKEN="${GITHUB_TOKEN:-$(gh auth token)}" GITHUB_ACTOR="${GITHUB_ACTOR:-aic0d3r}"

# Bump the bundle's patch number when the current one is already published.
CURRENT="$(sed -n 's/^version = //p' "$DIR/gradle.properties")"
PUBLISHED="$(jq -r '.version // ""' "$DIR/patches-bundle.json" 2>/dev/null || true)"
if [ "$CURRENT" = "$PUBLISHED" ]; then
    CURRENT="${CURRENT%.*}.$(( ${CURRENT##*.} + 1 ))"
    sed -i "s/^version = .*/version = $CURRENT/" "$DIR/gradle.properties"
fi

"$DIR/build.sh" "$APK"
"$DIR/build.sh" "$APK" --clone
# Morphe Manager loads patches as dex on the phone: buildAndroid adds classes.dex to the bundle.
"$DIR/gradlew" -p "$DIR" -q :patches:buildAndroid :patches:generatePatchesList
MPP="$DIR/patches/build/libs/patches-$CURRENT.mpp"

AAPT2="$(ls -t "${ANDROID_HOME:-$HOME/Android/Sdk}"/build-tools/*/aapt2 | head -1)"
VERSION="$("$AAPT2" dump badging "$DIR/oxbow.apk" | sed -n "s/.*versionName='\([^']*\)'.*/\1/p")"
TAG="v${VERSION//./-}"
SUMS="$(cd "$DIR" && sha256sum oxbow.apk oxbow-clone.apk && cd "$(dirname "$MPP")" && sha256sum "$(basename "$MPP")")"

# The newest CHANGELOG section (first "## " heading) leads the notes: it is what the in-app
# "What's new" card shows after an update, which stops reading at the "---" rule below.
CHANGES="$(awk '/^## /{if (seen) exit; seen=1; next} seen' "$DIR/CHANGELOG.md" | sed 's/^### /#### /')"
[ -n "${CHANGES//[[:space:]]/}" ] || { echo "CHANGELOG.md has no entries in its top section" >&2; exit 1; }

NOTES="$(cat <<EOF
${CHANGES}

---

Oxbow for Instagram ${VERSION} (patch bundle ${CURRENT}). Earlier patch bundles for this
version, and what they changed: [CHANGELOG.md](https://github.com/${REPO}/blob/main/CHANGELOG.md).

- **oxbow.apk** replaces Instagram (uninstall Instagram first).
- **oxbow-clone.apk** installs next to Instagram.
- **patches-${CURRENT}.mpp**: patch Instagram yourself in [Morphe Manager](https://morphe.software): add the source \`github.com/${REPO}\`.

Obtainium: add \`https://github.com/${REPO}\` and set the APK filter to \`oxbow\\.apk\$\` or \`oxbow-clone\\.apk\$\`.

\`\`\`txt
${SUMS}
\`\`\`
EOF
)"

if gh release view "$TAG" -R "$REPO" >/dev/null 2>&1; then
    gh release upload "$TAG" "$DIR/oxbow.apk" "$DIR/oxbow-clone.apk" "$MPP" -R "$REPO" --clobber
    gh release edit "$TAG" -R "$REPO" --title "Oxbow $VERSION · patch bundle $CURRENT" --notes "$NOTES"
else
    gh release create "$TAG" "$DIR/oxbow.apk" "$DIR/oxbow-clone.apk" "$MPP" \
        -R "$REPO" --title "Oxbow $VERSION · patch bundle $CURRENT" --notes "$NOTES" ${DRAFT:+--draft}
fi

if [ -n "$DRAFT" ]; then
    echo "Draft $TAG ready. Publish it, then re-run without --draft to point Morphe Manager at it."
    exit 0
fi

# Morphe Manager reads this file from main to find (and auto-update) the bundle.
jq -n --arg v "$CURRENT" --arg url "https://github.com/$REPO/releases/download/$TAG/patches-$CURRENT.mpp" \
    --arg notes "$NOTES" --arg at "$(date -u +%Y-%m-%dT%H:%M:%S)" \
    '{created_at: $at, description: $notes, download_url: $url, signature_download_url: "", version: $v}' \
    > "$DIR/patches-bundle.json"
git -C "$DIR" add gradle.properties patches-bundle.json patches-list.json
git -C "$DIR" commit -q -m "Release patch bundle $CURRENT for Instagram $VERSION"
git -C "$DIR" push -q origin HEAD
echo "Released $TAG (patch bundle $CURRENT)"
