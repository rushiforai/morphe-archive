#!/usr/bin/env bash
# Patches the original app with the patch bundle of a release and attaches the patched APK to it.
#
#   build_apk.sh <release tag>          e.g. build_apk.sh v2.1.0
#
# Inputs:
#   - the release's patch bundle (asset patches-<version>.mpp, uploaded by semantic-release);
#   - the original app: assets "app-<app version>.apk" of the release "app-source" of this repository
#     (the highest app version is patched; upload a new one there when the app updates);
#   - secret MORPHE_KEYSTORE_BASE64: Morphe Manager's keystore (BKS, base64), so the APK installs over
#     an app patched by Morphe Manager. Alias / passwords: Manager's defaults unless MORPHE_KEY_ALIAS,
#     MORPHE_KEYSTORE_PASSWORD, MORPHE_KEY_PASSWORD are set.
# Needs GH_TOKEN (contents: write) and Java 21.
set -euo pipefail

TAG="${1:?usage: build_apk.sh <release tag>}"
REPO="${GITHUB_REPOSITORY:?}"
SOURCE_RELEASE="app-source"
MORPHE_VERSION="${MORPHE_DESKTOP_VERSION:-2.1.1}"

if [ -z "${MORPHE_KEYSTORE_BASE64:-}" ]; then
  echo "::error::Secret MORPHE_KEYSTORE_BASE64 is not set: no patched APK for $TAG."
  exit 1
fi

WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
printf '%s' "$MORPHE_KEYSTORE_BASE64" | base64 -d > "$WORK/morphe.keystore"

echo "Patch bundle of $TAG"
gh release download "$TAG" --repo "$REPO" --pattern 'patches-*.mpp' --dir "$WORK/mpp"
MPP="$(find "$WORK/mpp" -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' | head -n 1)"
[ -n "$MPP" ] || { echo "::error::No patches-*.mpp in release $TAG."; exit 1; }

APK_NAME="$(gh release view "$SOURCE_RELEASE" --repo "$REPO" --json assets -q '.assets[].name' \
  | grep -E '^app-[0-9][0-9.]*\.apk$' | sort -V | tail -n 1 || true)"
[ -n "$APK_NAME" ] || { echo "::error::No app-<version>.apk in release $SOURCE_RELEASE."; exit 1; }
APP_VERSION="${APK_NAME#app-}"
APP_VERSION="${APP_VERSION%.apk}"
echo "Original app: $APK_NAME"
gh release download "$SOURCE_RELEASE" --repo "$REPO" --pattern "$APK_NAME" --dir "$WORK"

echo "Morphe Desktop $MORPHE_VERSION"
curl -fsSL -o "$WORK/morphe.jar" \
  "https://github.com/MorpheApp/morphe-desktop/releases/download/v${MORPHE_VERSION}/morphe-desktop-${MORPHE_VERSION}-all.jar"

OUT="itruyenchu-${APP_VERSION}-patched-${TAG}.apk"
(
  cd "$WORK"
  java -jar morphe.jar patch -p "$MPP" \
    --keystore morphe.keystore \
    --keystore-entry-alias "${MORPHE_KEY_ALIAS:-Morphe}" \
    "--keystore-password=${MORPHE_KEYSTORE_PASSWORD:-}" \
    "--keystore-entry-password=${MORPHE_KEY_PASSWORD:-Morphe}" \
    -o "$OUT" "$APK_NAME"
)
[ -s "$WORK/$OUT" ] || { echo "::error::Morphe did not write $OUT."; exit 1; }

gh release upload "$TAG" "$WORK/$OUT" --repo "$REPO" --clobber
echo "Attached $OUT to $TAG"
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  echo "Patched APK: \`$OUT\` (app $APP_VERSION) attached to $TAG" >> "$GITHUB_STEP_SUMMARY"
fi
