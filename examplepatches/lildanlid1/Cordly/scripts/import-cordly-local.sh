#!/usr/bin/env bash
# Cordly source import without GitHub Actions (for accounts with Actions billing lock)
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"
ARCHIVE="Cordly.zip"
if [[ ! -s "$ARCHIVE" ]]; then
  echo "Cordly.zip is missing from the repository root."
  exit 1
fi
if ! command -v unzip >/dev/null 2>&1; then
  echo "Please install unzip (e.g. sudo apt install unzip)."
  exit 1
fi

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT
unzip -q "$ARCHIVE" -d "$WORKDIR"
for required in gradle.properties .github/workflows/build.yml patches/src/main/resources/venus/bootstrap.js; do
  if [[ ! -f "$WORKDIR/Cordly/$required" ]]; then
    echo "Archive is missing Cordly/$required. No repository files changed."
    exit 1
  fi
done

cp -a "$WORKDIR/Cordly/." .
rm -- "$ARCHIVE"
if [[ -f scripts/verify_source_setup.py ]] && command -v python3 >/dev/null 2>&1; then
  python3 scripts/verify_source_setup.py
fi

git add -A
if git diff --cached --quiet; then
  echo "Cordly source was already imported."
else
  git commit -m "feat: import Cordly v1.23.0 complete source"
  git push origin HEAD:main
fi
echo "Cordly source import complete."
