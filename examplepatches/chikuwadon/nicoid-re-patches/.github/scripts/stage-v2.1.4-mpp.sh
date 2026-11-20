#!/usr/bin/env bash
# Rebuild approved dev.1 -> dev.2 -> dev.3, then change version strings only.
set -euo pipefail
[[ "$GITHUB_ACTIONS" == "true" && "$GITHUB_REF" == "refs/heads/main" ]] || {
  echo "::error::v2.1.4 staging requires main Actions" >&2; exit 1;
}
[[ "$NICOID_OFFICIAL_RELEASE_APPROVED" == "APPROVE" || "$NICOID_OFFICIAL_RELEASE_APPROVED" == "VERIFY" ]] || {
  echo "::error::Explicit release approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]4[[:space:]]*$' gradle.properties || {
  echo "::error::Expected stable v2.1.4" >&2; exit 1;
}
mpp=patches/build/libs/patches-2.1.4.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.4
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"

curl --fail --location --silent --show-error --retry 3 --retry-delay 2 \
  "https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.3/patches-2.1.3.mpp" \
  --output "$scratch/v2.1.3.mpp"
echo "89e3892ad8cf44666e03bc4af6be3632599a320d8817777b4dfdb56f239c932a  $scratch/v2.1.3.mpp" | sha256sum -c -

# Reconstruct reviewed dev.3 from SHA-pinned binary DEX deltas. A source-only
# compiler rebuild need not match the previously verified DEX byte-for-byte.
# The reconstructed full MPP must match the exact original reviewed SHA-256.
command -v zstd >/dev/null
python3 porting/revisions/v2.1.4-release/reconstruct_dev3.py \
  --base "$scratch/v2.1.3.mpp" --output "$scratch/dev3.mpp"
python3 .github/scripts/verify_android_mpp.py "$scratch/dev3.mpp" 2.1.4-dev.3
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
tools="porting/revisions/v2.0.0-dev.1/tools"

python3 porting/revisions/v2.1.4-release/stage_candidate.py \
  --compiled "$scratch/compiled.mpp" --reviewed "$scratch/dev3.mpp" \
  --output "$mpp" --tools "$tools"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.4
sha256sum "$mpp"
