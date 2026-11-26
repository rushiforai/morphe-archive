#!/bin/bash
# AllMorphe Update Script
# Regenerates sources.txt, bundles.json and install-all.sh from the
# morphe-patches.software catalog. Run locally or via GitHub Actions.

set -e

echo "📡 AllMorphe: refreshing bundle index..."

cd "$(dirname "$0")/.."
python3 fetch_patches.py

echo "✅ AllMorphe index refreshed."
echo "📌 Review with 'git diff', then commit & push to update the index."