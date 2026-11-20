#!/usr/bin/env bash
# Stage v2.1.3 from the approved v2.1.2 runtime, retaining Android classes.dex.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::Staging requires main Actions"; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit approval required"; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]3[[:space:]]*$' gradle.properties || {
  echo "::error::Expected stable v2.1.3"; exit 1;
}
mpp=patches/build/libs/patches-2.1.3.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.3
compiled=$(mktemp /tmp/nicoid-v213-compiled-XXXXXXXX.mpp)
trap 'rm -f "$compiled"' EXIT
cp "$mpp" "$compiled"
python3 porting/revisions/v2.1.0-release/verify_dev28.py
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
python3 porting/revisions/v2.1.3-release/stage_candidate.py \
  --compiled "$compiled" --output "$mpp" \
  --tools porting/revisions/v2.0.0-dev.1/tools
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.3
sha256sum "$mpp"
