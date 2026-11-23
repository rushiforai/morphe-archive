#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> [1/4] ktlintFormat (auto-fix style)"
./gradlew :patches:ktlintFormat

echo "==> [2/4] ktlintCheck + test + build (JVM side, CI parity)"
./gradlew :patches:ktlintCheck :patches:test :patches:build

echo "==> [3/4] generatePatchesList + buildAndroid (artifact - MUST be last)"
rm -f patches/build/libs/*.mpp   # no stale bundles in the transfer dir
./gradlew :patches:generatePatchesList :patches:buildAndroid

echo "==> [4/4] summary"
python3 - <<'PY'
import json
d = json.load(open("patches-list.json", encoding="utf-8"))
print("patches:", len(d["patches"]))
print("apps:", sorted({c["name"] for p in d["patches"] for c in (p.get("compatiblePackages") or [])}))
PY
ls -lh patches/build/libs/*.mpp