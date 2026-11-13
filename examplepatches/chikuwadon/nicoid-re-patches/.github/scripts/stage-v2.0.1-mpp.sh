#!/usr/bin/env bash
# Generate the v2.0.1 release payload from the pinned v1.11.1 base and the
# already verified dev.8 source. Never reuse a development MPP as a release.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::Official v2.0.1 MPP builds are restricted to main CI"; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" ||
   "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit official build approval required"; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2\.0\.1[[:space:]]*$' gradle.properties || {
  echo "::error::Expected the official v2.0.1 version"; exit 1;
}
revision=porting/revisions/v2.0.0-dev.1
official=porting/revisions/v2.0.1-release
python3 "$revision/bootstrap_tools.py"
python3 "$revision/bootstrap_live.py"
curl -fLs --retry 3 https://github.com/chikuwadon/nicoid-re-patches/releases/download/v1.11.1/patches-1.11.1.mpp -o /tmp/nicoid-stable-v111.mpp
echo "8920e9cdc9fc49178be5bc78cdb990627f4e7a7be83fef782eece3e7c443bcce  /tmp/nicoid-stable-v111.mpp" | sha256sum -c -
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.14.9/okhttp-3.14.9.jar -o /tmp/nicoid-v2-okhttp.jar
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.jar -o /tmp/nicoid-v2-okio.jar
mkdir -p patches/build/libs
python3 "$official/build_mpp.py" \
  --base /tmp/nicoid-stable-v111.mpp \
  --tools "$revision/tools" --media "$revision/deps" \
  --compile-jar /tmp/nicoid-v2-okhttp.jar --compile-jar /tmp/nicoid-v2-okio.jar \
  --output patches/build/libs/patches-2.0.1.mpp
python3 "$official/verify_mpp.py" /tmp/nicoid-stable-v111.mpp patches/build/libs/patches-2.0.1.mpp
python3 - <<'PY'
from pathlib import Path
from zipfile import ZipFile
target=Path("patches/src/main/resources/nicoid")
with ZipFile("patches/build/libs/patches-2.0.1.mpp") as candidate:
    assert candidate.testzip() is None
    for filename in ("helpers.mpe","resources.zip"):
        (target/filename).write_bytes(candidate.read("nicoid/"+filename))
    assert b"Version: 2.0.1\r\n" in candidate.read("META-INF/MANIFEST.MF")
print("PASS: official v2.0.1 MPP and bundled Android resources are identical")
PY
sha256sum patches/build/libs/patches-2.0.1.mpp
