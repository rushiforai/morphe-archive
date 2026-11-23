#!/usr/bin/env bash
# Stage reviewed v2.1.8 dev.2 paused-player patch and verified scoped runtime.
set -euo pipefail
[[ "${GITHUB_ACTIONS:-}" == "true" && "${GITHUB_REF:-}" == "refs/heads/main" ]] || {
  echo "::error::Official staging requires main Actions" >&2; exit 1;
}
[[ "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "APPROVE" || "${NICOID_OFFICIAL_RELEASE_APPROVED:-}" == "VERIFY" ]] || {
  echo "::error::Explicit approval or verification required" >&2; exit 1;
}
grep -Eq '^version[[:space:]]*=[[:space:]]*2[.]1[.]8[[:space:]]*$' gradle.properties || {
  echo "::error::Expected v2.1.8" >&2; exit 1;
}
mpp=patches/build/libs/patches-2.1.8.mpp
test -s "$mpp"
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.8
scratch=$(mktemp -d)
trap 'rm -rf "$scratch"' EXIT
cp "$mpp" "$scratch/compiled.mpp"
curl --fail --location --silent --show-error --retry 3 --retry-delay 2 \
  "https://github.com/chikuwadon/nicoid-re-patches/releases/download/v2.1.7/patches-2.1.7.mpp" \
  --output "$scratch/v2.1.7.mpp"
echo "d7220da8b7a7b8d630160b1b17234dd471ee6a96c7da6363b912516c53177081  $scratch/v2.1.7.mpp" | sha256sum -c -
python3 porting/revisions/v2.1.0-release/prepare_smali_tools.py
tools=porting/revisions/v2.0.0-dev.1/tools
python3 - "$scratch/compiled.mpp" "$scratch/v2.1.7.mpp" "$mpp" "$tools" "$scratch" <<'PY'
from pathlib import Path
import hashlib
import sys
from zipfile import ZipFile

STAGE_SHA = "8b10ba1255c74bebe47c121199a2a4cf0b04e920"
SYNC_SHA = "a7199e106e5e56a9459df1e5495948d437ca8335"
SNAPSHOT_SHA = "eaa769e14bb5e29f86d83f58a19bb7d2a7b1b4b5184f5cdc839d5eea846c184f"
DEV = "2.1.8-dev.2"
STABLE = "2.1.8"
ROOT = Path("porting/revisions/v2.1.8-dev.2")
source = ROOT / "stage_candidate.py"
sync_source = ROOT / "sync_payload.py"
snapshot = ROOT / "runtime-overlay.dex.gz"

def read_verified(path, expected):
    blob = path.read_bytes()
    actual = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
    if actual != expected:
        raise SystemExit("Reviewed release input changed: " + str(path))
    return blob.decode("utf-8")

if hashlib.sha256(snapshot.read_bytes()).hexdigest() != SNAPSHOT_SHA:
    raise SystemExit("Verified scoped runtime snapshot checksum mismatch")

stage_code = read_verified(source, STAGE_SHA)
sync_code = read_verified(sync_source, SYNC_SHA)
if stage_code.count(DEV) != 4 or sync_code.count(DEV) != 1:
    raise SystemExit("Unexpected dev version marker count; refusing to stage")
stage_code = stage_code.replace(DEV, STABLE)
sync_code = sync_code.replace(DEV, STABLE)

compiled, approved, output, tools, tmp = (Path(p).resolve() for p in sys.argv[1:])
intermediate = tmp / "v2.1.8-pause-fixed.mpp"
staging = {"__file__": str(source.resolve()), "__name__": "reviewed_218_staging"}
exec(compile(stage_code, str(source), "exec"), staging)
staging["stage"](compiled, approved, intermediate, tools)
sync = {"__file__": str(sync_source.resolve()), "__name__": "reviewed_218_sync"}
exec(compile(sync_code, str(sync_source), "exec"), sync)
sync["merge"](intermediate, output, tools)
with ZipFile(output) as archive:
    with ZipFile(approved) as original:
        for member in ("nicoid/method-delta.dex", "nicoid/resources.zip"):
            if archive.read(member) != original.read(member):
                raise SystemExit("Native patch/resource changed: " + member)
print("PASS: exact reviewed v2.1.8 staged and scoped runtime synchronized")
PY
python3 .github/scripts/verify_android_mpp.py "$mpp" 2.1.8
sha256sum "$mpp"
