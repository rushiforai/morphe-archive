#!/usr/bin/env bash
# Official v2.1.6: restage the exact reviewed dev.5 code with stable-version strings.
set -euo pipefail
[[ "$GITHUB_ACTIONS" == "true" && "$GITHUB_REF" == "refs/heads/main" ]] || {
  echo "::error::Official staging requires main Actions" >&2; exit 1;
}
[[ "$NICOID_OFFICIAL_RELEASE_APPROVED" == "APPROVE" || "$NICOID_OFFICIAL_RELEASE_APPROVED" == "VERIFY" ]] || {
  echo "::error::Explicit approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]6[[:space:]]*$' gradle.properties || {
  echo "::error::Expected v2.1.6" >&2; exit 1;
}
mpp=patches/build/libs/patches-2.1.6.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.6
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"
curl --fail --location --silent --show-error --retry 3 --retry-delay 2 \
  "https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.5/patches-2.1.5.mpp" \
  --output "$scratch/v2.1.5.mpp"
echo "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b  $scratch/v2.1.5.mpp" | sha256sum -c -
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
tools=porting/revisions/v2.0.0-dev.1/tools
python3 - "$scratch/compiled.mpp" "$scratch/v2.1.5.mpp" "$mpp" "$tools" <<'PY'
from pathlib import Path
import hashlib
import sys
source = Path("porting/revisions/v2.1.6-dev.5/stage_candidate.py").resolve()
blob = source.read_bytes()
actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
if actual != "8121c476d3e9c83f43441114f238f2444ec6aa67":
    raise SystemExit("Unreviewed dev.5 source change")
script = blob.decode("utf-8")
if script.count("2.1.6-dev.5") != 1:
    raise SystemExit("Unexpected version owners")
script = script.replace("2.1.6-dev.5", "2.1.6")
namespace = {"__file__": str(source), "__name__": "v216_stable_staging"}
exec(compile(script, str(source), "exec"), namespace)
compiled, approved, output, tools = (Path(x) for x in sys.argv[1:])
namespace["stage"](compiled, approved, output, tools)
PY
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.6
sha256sum "$mpp"
