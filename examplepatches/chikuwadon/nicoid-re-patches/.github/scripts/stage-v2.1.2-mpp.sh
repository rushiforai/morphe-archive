#!/usr/bin/env bash
# Stage only the reviewed v2.1.2-dev.14 runtime with a stable v2.1.2 version.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || { echo "::error::Staging requires main Actions"; exit 1; }
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || { echo "::error::Explicit approval required"; exit 1; }
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]2[[:space:]]*$' gradle.properties || { echo "::error::Expected stable v2.1.2"; exit 1; }
test -s patches/build/libs/patches-2.1.2.mpp
compiled=$(mktemp /tmp/nicoid-v212-compiled-XXXXXXXX.mpp)
trap 'rm -f "$compiled"' EXIT
cp patches/build/libs/patches-2.1.2.mpp "$compiled"
python3 porting/revisions/v2.1.0-release/verify_dev28.py
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
python3 porting/revisions/v2.1.2-release/stage_candidate.py \
  --compiled "$compiled" --output patches/build/libs/patches-2.1.2.mpp \
  --tools porting/revisions/v2.0.0-dev.1/tools
unzip -tq patches/build/libs/patches-2.1.2.mpp
unzip -p patches/build/libs/patches-2.1.2.mpp META-INF/MANIFEST.MF | grep -Fq 'Version: 2.1.2'
python3 - <<'PY'
from zipfile import ZipFile
with ZipFile('patches/build/libs/patches-2.1.2.mpp') as z:
    blob=z.read('nicoid/helpers.mpe')
    assert b'PlaylistBackup213' in blob
    assert b'2.1.2' in blob
    assert b'2.1.2-dev.14' not in blob
    for key in [b'AppResume253',b'ResumeModes272',b'Media3Diagnostics276',b'AmbientCard217']:
        assert key in blob,key
print('PASS: staged v2.1.2 contains reviewed playback and backup bytecode')
PY
sha256sum patches/build/libs/patches-2.1.2.mpp
