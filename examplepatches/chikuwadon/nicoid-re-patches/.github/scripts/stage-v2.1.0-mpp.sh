#!/usr/bin/env bash
# Stage only the approved dev.28 sources and the actual current Gradle Kotlin patch.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || { echo "::error::Official v2.1.0 MPP must be staged on main Actions"; exit 1; }
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || { echo "::error::Explicit approval/verification mode required"; exit 1; }
grep -Eq '^version[[:space:]]*=[[:space:]]*2\.1\.0[[:space:]]*$' gradle.properties || { echo "::error::Expected v2.1.0 stable Gradle version"; exit 1; }
revision=porting/revisions/v2.1.0-release
tools=porting/revisions/v2.0.0-dev.1/tools
bundle=patches/build/libs/patches-2.1.0.mpp
test -s "$bundle" || { echo "::error::Missing actual Gradle Kotlin-compiled MPP"; exit 1; }
compiled=$(mktemp /tmp/nicoid-v210-compiled-XXXXXXXX.mpp)
trap 'rm -f "$compiled"' EXIT
cp "$bundle" "$compiled"
python3 "$revision/verify_dev28.py"
python3 "$revision/prepare_smali_tools.py"
python3 "$revision/stage_verified.py" --compiled "$compiled" --output "$bundle" --tools "$tools"
sha256sum "$bundle"
