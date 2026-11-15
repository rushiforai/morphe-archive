#!/usr/bin/env bash
# Official hotfix: retain compiled Morphe 2.3 Kotlin patch code from dev.1.
# Substitute only the dev.18-verified media/resource payload.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::v2.0.4 official MPP builds are restricted to main"; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" ||
   "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit official build approval required"; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2\.0\.4[[:space:]]*$' gradle.properties || {
  echo "::error::Expected stable v2.0.4, not a development version"; exit 1;
}
revision=porting/revisions/v2.0.0-dev.1
official=porting/revisions/v2.0.4-release
bundle=patches/build/libs/patches-2.0.4.mpp
test -s "$bundle" || { echo "::error::Gradle-built Kotlin MPP not found"; exit 1; }
compiled=$(mktemp /tmp/nicoid-v204-compiled-XXXXXXXX.mpp)
payload=$(mktemp /tmp/nicoid-v204-payload-XXXXXXXX.mpp)
trap 'rm -f "$compiled" "$payload"' EXIT
cp "$bundle" "$compiled"
python3 "$revision/bootstrap_tools.py"
python3 "$revision/bootstrap_live.py"
curl -fLs --retry 3 https://github.com/chikuwadon/nicoid-re-patches/releases/download/v1.11.1/patches-1.11.1.mpp -o /tmp/nicoid-stable-v111.mpp
echo "8920e9cdc9fc49178be5bc78cdb990627f4e7a7be83fef782eece3e7c443bcce  /tmp/nicoid-stable-v111.mpp" | sha256sum -c -
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okhttp3/okhttp/3.14.9/okhttp-3.14.9.jar -o /tmp/nicoid-v2-okhttp.jar
curl -fLs --retry 3 https://repo.maven.apache.org/maven2/com/squareup/okio/okio/1.17.2/okio-1.17.2.jar -o /tmp/nicoid-v2-okio.jar
python3 "$official/build_mpp.py" \
  --base /tmp/nicoid-stable-v111.mpp \
  --tools "$revision/tools" --media "$revision/deps" \
  --compile-jar /tmp/nicoid-v2-okhttp.jar --compile-jar /tmp/nicoid-v2-okio.jar \
  --output "$payload"
python3 "$official/verify_mpp.py" /tmp/nicoid-stable-v111.mpp "$payload"
python3 "$official/combine_mpp.py" "$compiled" "$payload" "$bundle"
python3 - <<'PY'
from pathlib import Path
from zipfile import ZipFile
bundle = Path("patches/build/libs/patches-2.0.4.mpp")
target = Path("patches/src/main/resources/nicoid")
with ZipFile(bundle) as candidate:
    assert candidate.testzip() is None
    assert b"Version: 2.0.4\r\n" in candidate.read("META-INF/MANIFEST.MF")
    for filename in ("helpers.mpe", "method-delta.dex", "resources.zip"):
        data = candidate.read("nicoid/" + filename)
        assert data, filename
        (target / filename).write_bytes(data)
    assert any(b"Missing original nicoid 6.49 APK entry" in candidate.read(name)
        for name in candidate.namelist()
        if name.endswith((".dex", ".class", ".jar")) and not name.startswith("nicoid/"))
print("PASS: official v2.0.4 retains the Morphe 2.3 fix and verified media payloads")
PY
sha256sum "$bundle"
