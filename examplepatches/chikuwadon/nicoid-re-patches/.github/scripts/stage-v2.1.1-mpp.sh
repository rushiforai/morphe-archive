#!/usr/bin/env bash
# Stage the official v2.1.1 payload from immutable reviewed v2.1.0 Media3 bytecode.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || { echo "::error::Official v2.1.1 MPP must be staged on main Actions"; exit 1; }
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || { echo "::error::Explicit approval/verification mode required"; exit 1; }
grep -Eq '^version[[:space:]]*=[[:space:]]*2\.1\.1[[:space:]]*$' gradle.properties || { echo "::error::Expected v2.1.1 stable Gradle version"; exit 1; }
revision=porting/revisions/v2.1.1-release
tools=porting/revisions/v2.0.0-dev.1/tools
bundle=patches/build/libs/patches-2.1.1.mpp
test -s "$bundle" || { echo "::error::Missing actual Gradle Kotlin-compiled MPP"; exit 1; }
compiled=$(mktemp /tmp/nicoid-v211-compiled-XXXXXXXX.mpp)
trap 'rm -f "$compiled"' EXIT
cp "$bundle" "$compiled"
python3 porting/revisions/v2.1.0-release/verify_dev28.py
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
python3 "$revision/stage_candidate.py" --compiled "$compiled" --output "$bundle" --tools "$tools"
unzip -tq "$bundle"
unzip -p "$bundle" META-INF/MANIFEST.MF | grep -Fq 'Version: 2.1.1'
sha256sum "$bundle"
