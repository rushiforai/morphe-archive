#!/usr/bin/env bash
# Official v2.1.5: restage the exact reviewed dev.17 code with stable-version strings.
set -euo pipefail
[[ "$GITHUB_ACTIONS" == "true" && "$GITHUB_REF" == "refs/heads/main" ]] || {
  echo "::error::Official staging requires main Actions" >&2; exit 1;
}
[[ "$NICOID_OFFICIAL_RELEASE_APPROVED" == "APPROVE" || "$NICOID_OFFICIAL_RELEASE_APPROVED" == "VERIFY" ]] || {
  echo "::error::Explicit approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]5[[:space:]]*$' gradle.properties || {
  echo "::error::Expected v2.1.5" >&2; exit 1;
}
mpp=patches/build/libs/patches-2.1.5.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.5
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"
curl --fail --location --silent --show-error --retry 3 --retry-delay 2 \
  "https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.4/patches-2.1.4.mpp" \
  --output "$scratch/v2.1.4.mpp"
echo "58c9d990d36d9f05e58e29bcb4ad45da8a435a16c8f4a649d82d02a538995df4  $scratch/v2.1.4.mpp" | sha256sum -c -
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
tools=porting/revisions/v2.0.0-dev.1/tools
python3 - "$scratch/compiled.mpp" "$scratch/v2.1.4.mpp" "$mpp" "$tools" <<'PY'
from pathlib import Path
import hashlib
import sys
source = Path("porting/revisions/v2.1.5-dev.17/stage_candidate.py").resolve()
blob = source.read_bytes()
actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
if actual != "279e924b826960f71190587a8044ad3ecd98fcb8":
    raise SystemExit("Unreviewed dev.17 source change")
script = blob.decode("utf-8")
if script.count("2.1.5-dev.17") != 4:
    raise SystemExit("Unexpected version owners")
script = script.replace("2.1.5-dev.17", "2.1.5")
namespace = {"__file__": str(source), "__name__": "v215_stable_staging"}
exec(compile(script, str(source), "exec"), namespace)
compiled, approved, output, tools = (Path(x) for x in sys.argv[1:])
namespace["stage"](compiled, approved, output, tools)
PY
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.5
sha256sum "$mpp"
