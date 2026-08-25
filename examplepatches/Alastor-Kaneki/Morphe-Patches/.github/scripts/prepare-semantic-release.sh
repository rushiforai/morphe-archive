#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?usage: prepare-semantic-release.sh <version>}"

python3 - "$VERSION" <<'PY'
from pathlib import Path
import re
import sys

version = sys.argv[1]
path = Path("gradle.properties")
lines = path.read_text(encoding="utf-8").splitlines()
updated = False
for index, line in enumerate(lines):
    match = re.match(r"^(\s*version\s*=\s*).*$", line)
    if match:
        lines[index] = f"{match.group(1)}{version}"
        updated = True
        break
if not updated:
    raise SystemExit("gradle.properties does not contain a version property")
path.write_text("\n".join(lines) + "\n", encoding="utf-8")
PY

./gradlew buildAndroid --stacktrace
./gradlew generatePatchesList --stacktrace

jq --arg version "$VERSION" '.version = $version' \
  patches-list.json > patches-list.json.tmp
mv patches-list.json.tmp patches-list.json

BUNDLE="$(find patches/build/libs -maxdepth 1 -type f -name "patches-${VERSION}.mpp" -print -quit)"
if [[ -z "$BUNDLE" ]]; then
  echo "Expected release bundle patches-${VERSION}.mpp was not generated." >&2
  exit 1
fi

ASSET="$(basename "$BUNDLE")"
DIGEST="$(sha256sum "$BUNDLE" | awk '{print $1}')"
SOURCE_COMMIT="${GITHUB_SHA:-unknown}"

mkdir -p releases
jq -n \
  --arg version "$VERSION" \
  --arg tag "v${VERSION}" \
  --arg asset "$ASSET" \
  --arg sha256 "$DIGEST" \
  --arg sourceCommit "$SOURCE_COMMIT" \
  '{version: $version, tag: $tag, asset: $asset, sha256: $sha256, sourceCommit: $sourceCommit}' \
  > releases/latest.json
