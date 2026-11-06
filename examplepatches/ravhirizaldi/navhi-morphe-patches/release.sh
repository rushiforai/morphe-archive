#!/usr/bin/env bash
# Manual release: GitHub Actions is unusable on this account (billing), so the
# whole semantic-release pipeline is reproduced here.
#
#   ./release.sh patch    1.0.0 -> 1.0.1
#   ./release.sh minor    1.0.1 -> 1.1.0
#   ./release.sh 2.3.4    explicit version
#
# Needs GITHUB_ACTOR + GITHUB_TOKEN in the environment and `gh` logged in.
set -euo pipefail
cd "$(dirname "$0")"

bump() {
  local current=$1 kind=$2
  IFS=. read -r major minor patch <<<"$current"
  case $kind in
    major) echo "$((major + 1)).0.0" ;;
    minor) echo "$major.$((minor + 1)).0" ;;
    patch) echo "$major.$minor.$((patch + 1))" ;;
    *) echo "$kind" ;;
  esac
}

current=$(sed -n 's/^version = //p' gradle.properties)
version=$(bump "$current" "$1")
tag="v$version"
echo "releasing $current -> $version"

sed -i "s/^version = .*/version = $version/" gradle.properties

# The list generator picks an arbitrary .mpp from build/libs, so leave only this run's copy.
rm -f patches/build/libs/*.mpp
GITHUB_ACTOR=${GITHUB_ACTOR:?set GITHUB_ACTOR} ./gradlew buildAndroid generatePatchesList

python3 - "$version" <<'PY'
import datetime, json, sys
version = sys.argv[1]
bundle_path = "patches-bundle.json"
bundle = json.load(open(bundle_path))
bundle.update({
    # No trailing Z: the manager parses this straight with java.time.LocalDateTime.parse
    "created_at": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
    "download_url": f"https://github.com/ravhirizaldi/navhi-morphe-patches/releases/download/v{version}/patches-{version}.mpp",
    "version": version,
})
json.dump(bundle, open(bundle_path, "w"), indent=2)

patch_list = "patches-list.json"
data = json.load(open(patch_list))
data["version"] = version
json.dump(data, open(patch_list, "w"), indent=2)
PY

python3 .github/scripts/generate_patches_readme.py rawhirizaldi/navhi-morphe-patches main

git add -A
git commit -m "chore: release $tag"
git tag "$tag"
git push origin HEAD "$tag"

gh release create "$tag" "patches/build/libs/patches-$version.mpp" \
  --title "$tag" --notes "Manual release. See CHANGELOG.md."

# Then merge the branch into main if you released from dev.
