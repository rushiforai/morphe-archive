#!/usr/bin/env bash
# Workspace cleanup script for Morphe Patches repository
# Thoroughly purges local build artifacts, temporary decompilation files, test reports, and bytecode caches.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

echo "Cleaning up workspace in $REPO_ROOT..."

# 1. Remove loose APKs, patch bundles & diagnostic logs in root
echo "==> Removing loose APKs, bundles, logs, and databases..."
rm -rf ./*.apk ./*.apkm ./*.xapk ./*.mpp ./*.mpe ./*.idsig ./*.logcat ./*.tombstone ./androguard.db*

# 2. Clean temporary decompilation and cache directories
echo "==> Removing temporary cache directories (Morphe & tools)..."
rm -rf morphe-temporary-files/ morphe-data/ tools/ scratch/ apks-ultima-version/ apks/ candidate_apks/
find . -maxdepth 3 -type d -name "morphe-data" -exec rm -rf {} + 2>/dev/null || true
find . -maxdepth 3 -type d -name "morphe-temporary-files" -exec rm -rf {} + 2>/dev/null || true

# 3. Clean Gradle build outputs
echo "==> Cleaning Gradle build directories..."
rm -rf build/ patches/build/ patches/patches/ patches/bin/ extensions/extension/build/

# 4. Clean Python bytecode caches
echo "==> Cleaning Python caches..."
find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
find . -type f -name "*.py[cod]" -delete 2>/dev/null || true
rm -rf .pytest_cache/

echo "Workspace cleanup complete!"
