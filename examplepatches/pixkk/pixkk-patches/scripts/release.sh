#!/bin/bash
# Build the bundle, write patches-bundle.json and publish a GitHub release with the .mpp.
# Usage: release.sh "release notes"   (the version comes from gradle.properties)
set -eu
export JAVA_HOME="/c/Users/User/.jdks/openjdk-21.0.2"
export PATH="$JAVA_HOME/bin:$PATH"
export GITHUB_ACTOR=pixkk
export GITHUB_TOKEN="$(gh auth token)"
cd /d/Projects/pixkk-patches

NOTES="${1:-Pixkk Patches}"
VERSION="$(sed -n 's/^version *= *//p' gradle.properties)"
REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"

./gradlew --no-daemon -q :patches:buildAndroid
MPP="patches/build/libs/patches-$VERSION.mpp"
[ -f "$MPP" ] || { echo "no $MPP"; exit 1; }

cat > patches-bundle.json <<EOF
{
  "created_at": "$(date -u +%Y-%m-%dT%H:%M:%S)",
  "description": "$NOTES",
  "download_url": "https://github.com/$REPO/releases/download/v$VERSION/patches-$VERSION.mpp",
  "signature_download_url": "",
  "version": "$VERSION"
}
EOF

git add patches-bundle.json gradle.properties
git commit -m "release v$VERSION"
git push
gh release create "v$VERSION" "$MPP" --title "v$VERSION" --notes "$NOTES"
