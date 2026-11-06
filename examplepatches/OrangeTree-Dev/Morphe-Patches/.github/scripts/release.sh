#!/usr/bin/env bash
# Builds and publishes a release with a date-based version:
#   stable (main): N.yy.mm.dd.hhmm        e.g. 1.26.11.05.1432
#   beta   (dev):  N.yy.mm.dd.hhmm-beta   e.g. 1.26.11.05.1432-beta
# N is releaseMajor in gradle.properties: raise it by one when the patches move to a
# new YouTube Music app version. Time is UTC. Morphe Manager reads patches-bundle.json from main (stable) or dev (beta).
set -euo pipefail

BRANCH="${GITHUB_REF_NAME}"
REPO="${GITHUB_REPOSITORY}"

case "$BRANCH" in
  main) SUFFIX=""; PRERELEASE="false" ;;
  dev)  SUFFIX="-beta"; PRERELEASE="true" ;;
  *)    echo "Not a release branch: $BRANCH"; echo "published=false" >> "$GITHUB_OUTPUT"; exit 0 ;;
esac

MAJOR=$(sed -nE 's/^releaseMajor *= *([0-9]+).*/\1/p' gradle.properties)
MAJOR="${MAJOR:-1}"

# Last release of this channel (tags look like v1.26.11.05.1432 or v1.26.11.05.1432-beta).
if [ "$BRANCH" = "main" ]; then
  LAST_TAG=$(git tag --merged HEAD --sort=-creatordate | grep -E '^v[0-9]+\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{4}$' | head -1 || true)
else
  LAST_TAG=$(git tag --merged HEAD --sort=-creatordate | grep -E '^v[0-9]+\.[0-9]{2}\.[0-9]{2}\.[0-9]{2}\.[0-9]{4}(-beta)?$' | head -1 || true)
fi
RANGE="${LAST_TAG:+$LAST_TAG..}HEAD"

# Release only when there are user-facing changes (feat/fix/perf), or on any merge into main.
SUBJECTS=$(git log --no-merges --format='%s' "$RANGE" | grep -vE '^chore: Release ' || true)
CHANGES=$(echo "$SUBJECTS" | grep -E '^(feat|fix|perf)(\(.+\))?!?: ' || true)
if [ -z "$CHANGES" ] && ! { [ "$BRANCH" = "main" ] && [ -n "$SUBJECTS" ]; }; then
  echo "No feat/fix/perf commits since ${LAST_TAG:-the start}, skipping release."
  echo "published=false" >> "$GITHUB_OUTPUT"
  exit 0
fi

VERSION="${MAJOR}.$(date -u +%y.%m.%d.%H%M)${SUFFIX}"
TAG="v${VERSION}"
echo "Releasing $TAG (changes since ${LAST_TAG:-the start})"

# Release notes, grouped like before.
NOTES=""
add_section() { # title, regex
  local lines
  lines=$(echo "$SUBJECTS" | grep -E "$2" | sed -E 's/^[a-z]+(\(.+\))?!?: /* /' || true)
  if [ -n "$lines" ]; then
    [ -n "$NOTES" ] && NOTES+=$'\n\n'
    NOTES+="### $1"$'\n\n'"$lines"
  fi
}
add_section '✨ New Features' '^feat'
add_section '🔧 Improvements' '^perf'
add_section '🐛 Bug Fixes' '^fix'
[ -z "$NOTES" ] && NOTES="* Stable release of the latest beta"
DATE=$(date -u +%Y-%m-%d)
HEADER="## [${VERSION}](https://github.com/${REPO}/releases/tag/${TAG}) (${DATE})"
DESCRIPTION="${HEADER}"$'\n\n'"${NOTES}"

# Build.
sed -i -E "s/^version = .*/version = ${VERSION}/" gradle.properties
./gradlew :patches:buildAndroid generatePatchesList --no-daemon
MPP="patches/build/libs/patches-${VERSION}.mpp"
test -f "$MPP"

# Files Morphe Manager and the README read.
jq --arg v "$VERSION" '.version=$v' patches-list.json > patches-list.json.tmp && mv patches-list.json.tmp patches-list.json
python3 .github/scripts/generate_patches_readme.py "$REPO" "$BRANCH" patches-list.json README.md
jq -n \
  --arg created "$(date -u +%Y-%m-%dT%H:%M:%S)" \
  --arg desc "$DESCRIPTION" \
  --arg url "https://github.com/${REPO}/releases/download/${TAG}/patches-${VERSION}.mpp" \
  --arg v "$VERSION" \
  '{created_at:$created, description:$desc, download_url:$url, signature_download_url:"", version:$v}' > patches-bundle.json
{ printf '%s\n\n' "$DESCRIPTION"; cat CHANGELOG.md; } > CHANGELOG.md.tmp && mv CHANGELOG.md.tmp CHANGELOG.md

# Commit, tag, publish.
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git add CHANGELOG.md gradle.properties patches-bundle.json patches-list.json README.md
git commit -m "chore: Release ${TAG} [skip ci]"
git tag "$TAG"
git push origin "HEAD:${BRANCH}" "$TAG"

PRE_FLAG=""; [ "$PRERELEASE" = "true" ] && PRE_FLAG="--prerelease"
gh release create "$TAG" "$MPP" --title "$TAG" --notes "$NOTES" $PRE_FLAG

# Keep dev up to date with main after a stable release.
if [ "$BRANCH" = "main" ]; then
  git fetch origin dev
  git checkout -B dev origin/dev
  if git merge --no-edit -m "chore: Merge main into dev [skip ci]" main; then
    git push origin dev
  else
    git merge --abort || true
    echo "::warning::Could not merge main back into dev automatically."
  fi
fi

echo "published=true" >> "$GITHUB_OUTPUT"
echo "tag=${TAG}" >> "$GITHUB_OUTPUT"
