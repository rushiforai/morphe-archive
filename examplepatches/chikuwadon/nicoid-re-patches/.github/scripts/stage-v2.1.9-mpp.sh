#!/usr/bin/env bash
# Stage the reviewed v2.1.9 candidate with a version-only promotion.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == true && "${GITHUB_REF:-}" == refs/heads/main ]] || {
  echo "::error::Official staging requires main Actions" >&2; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == APPROVE || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == VERIFY ]] || {
  echo "::error::Explicit approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]9[[:space:]]*$' gradle.properties
mpp=patches/build/libs/patches-2.1.9.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.9
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"
python3 porting/revisions/v2.1.9-release/stage_candidate.py --compiled "$scratch/compiled.mpp" --output "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.9
sha256sum "$mpp"
