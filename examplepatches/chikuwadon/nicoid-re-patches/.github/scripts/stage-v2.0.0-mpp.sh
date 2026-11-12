#!/usr/bin/env bash
# Build v2.0.0 using the device-verified NicoLive sources and v1.11.1
# official base. Only the main-branch approved release/verification job
# may enable this production build path.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::Official v2 build is only allowed on main CI"; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" ||
   "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit release or verification mode is required"; exit 1;
}
revision=porting/revisions/v2.0.0-dev.1
python3 "$revision/bootstrap_tools.py"
python3 "$revision/bootstrap_live.py"
curl -fLs --retry 3 https://github.com/chikuwadon/nicoid-re-patches/releases/download/v1.11.1/patches-1.11.1.mpp -o /tmp/nicoid-stable-v111.mpp
echo "8920e9cdc9fc49178be5bc78cdb990627f4e7a7be83fef782eece3e7c443bcce  /tmp/nicoid-stable-v111.mpp" | sha256sum -c -
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.14.9/okhttp-3.14.9.jar -o /tmp/nicoid-v2-okhttp.jar
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.jar -o /tmp/nicoid-v2-okio.jar
mkdir -p patches/build/libs
python3 "$revision/build_mpp.py" --official-release --ci-without-apk \
  --base /tmp/nicoid-stable-v111.mpp \
  --tools "$revision/tools" --media "$revision/deps" \
  --compile-jar /tmp/nicoid-v2-okhttp.jar --compile-jar /tmp/nicoid-v2-okio.jar \
  --output patches/build/libs/patches-2.0.0.mpp
python3 "$revision/verify_ci_candidate.py" /tmp/nicoid-stable-v111.mpp patches/build/libs/patches-2.0.0.mpp
python3 - <<'PY'
from zipfile import ZipFile
from pathlib import Path
out=Path("patches/src/main/resources/nicoid")
with ZipFile("patches/build/libs/patches-2.0.0.mpp") as source:
    for name in ("helpers.mpe","resources.zip"):
        (out/name).write_bytes(source.read("nicoid/"+name))
    assert b"Version: 2.0.0\r\n" in source.read("META-INF/MANIFEST.MF")
print("PASS: release MPP and repository resources use the same v2 payload")
PY
sha256sum patches/build/libs/patches-2.0.0.mpp
