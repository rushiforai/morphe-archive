#!/usr/bin/env bash
# Official v2.1.7: stage the exact reviewed development candidate with stable metadata.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::Official staging requires main Actions" >&2; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]7[[:space:]]*$' gradle.properties || {
  echo "::error::Expected v2.1.7" >&2; exit 1;
}
mpp=patches/build/libs/patches-2.1.7.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.7
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"
curl --fail --location --silent --show-error --retry 3 --retry-delay 2 \
  "https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.6/patches-2.1.6.mpp" \
  --output "$scratch/v2.1.6.mpp"
echo "c8e1c627bb15c46ebf49345bc0a703f00ed05998783fb280326c555527bb2978  $scratch/v2.1.6.mpp" | sha256sum -c -
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
tools=porting/revisions/v2.0.0-dev.1/tools
python3 - "$scratch/compiled.mpp" "$scratch/v2.1.6.mpp" "$mpp" "$tools" <<'PY'
from pathlib import Path
import hashlib
import sys
source = Path("porting/revisions/v2.1.7-dev.3/stage_candidate.py").resolve()
blob = source.read_bytes()
actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
if actual != "037591be923b803b0ae66d87acb0a7a768a2e0ce":
    raise SystemExit("Reviewed development stage source checksum mismatch")
script = blob.decode("utf-8")
if script.count('VERSION = "2.1.7-dev.3"') != 1:
    raise SystemExit("Unexpected version declaration in reviewed source")
script = script.replace('VERSION = "2.1.7-dev.3"', 'VERSION = "2.1.7"')
namespace = {"__file__": str(source), "__name__": "nicoid_reviewed_release_staging"}
exec(compile(script, str(source), "exec"), namespace)
compiled, approved, output, tools = (Path(x) for x in sys.argv[1:])
namespace["stage"](compiled, approved, output, tools)
PY
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.7
sha256sum "$mpp"
