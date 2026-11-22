#!/usr/bin/env bash
# Finish a release that semantic-release left half done.
#
# semantic-release pushes the release commit and the tag, then the git notes ref
# refs/notes/semantic-release-<tag>, and only then creates the GitHub release. GitHub sometimes
# rejects the notes push with a bare "(failed)", which stops the job before the GitHub release
# exists, while patches-bundle.json on main already points Morphe Manager at its asset.
#
# Run in the same job, right after a failed semantic-release step: the bundle in
# patches/build/libs was built and signed there. Retries the notes push, then creates the GitHub
# release with that bundle if it is missing. Does nothing unless HEAD is a release commit with a
# tag.
set -euo pipefail

tag=$(git describe --exact-match --tags HEAD 2>/dev/null || true)
if [[ -z "$tag" ]]; then
  echo "HEAD has no release tag; nothing to finish."
  exit 0
fi
version=${tag#v}
notes_ref="refs/notes/semantic-release-$tag"

if git ls-remote --exit-code origin "$notes_ref" >/dev/null 2>&1; then
  echo "$notes_ref already on the remote."
else
  git notes --ref "semantic-release-$tag" add -f -m '{"channels":[null]}' "$tag"
  for attempt in 1 2 3 4 5; do
    if git push origin "$notes_ref"; then
      echo "Pushed $notes_ref (attempt $attempt)."
      break
    fi
    if [[ $attempt == 5 ]]; then
      echo "::warning::Could not push $notes_ref; the next release may not see $tag as released."
    else
      sleep $((attempt * 10))
    fi
  done
fi

if gh release view "$tag" >/dev/null 2>&1; then
  echo "GitHub release $tag already exists."
  exit 0
fi

asset="patches/build/libs/patches-$version.mpp"
if [[ ! -f "$asset" ]]; then
  echo "::error::$asset was not built in this job; cannot publish $tag."
  exit 1
fi
if ! unzip -z "$asset" | grep -q '^MorpheSig1 '; then
  echo "::error::$asset is not signed; refusing to publish it."
  exit 1
fi

jq -r '.description' patches-bundle.json > release-notes.md
gh release create "$tag" "$asset" --title "$tag" --notes-file release-notes.md --verify-tag --latest
echo "Published GitHub release $tag."
