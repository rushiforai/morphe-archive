#!/bin/sh
# One command to get a fresh sandbox ready for Hermes benchmarks (AGENTS.md, Benchmarking optimizations):
# pinned build tools + compacted runtime, the HBC98 VM, and the Discord bundle for cold_boot.sh.
#   sh scripts/hbc/bench_setup.sh [Discord.apkm]
set -e
cd "$(dirname "$0")/../.."
python3 -c "import zstandard" 2>/dev/null || pip install -q zstandard 2>/dev/null || pip install -q --user zstandard
python3 -c "import sys; sys.path.insert(0, 'scripts'); import build; build.tools(); build.compact_runtime()"
sh scripts/hbc/hermes_vm.sh
APKM="${1:-$(python3 scripts/hbc/find_apkm.py 2>/dev/null)}"
if [ -n "$APKM" ]; then sh scripts/hbc/setup.sh "$APKM"; else echo "No APKM: cold_boot.sh needs sh scripts/hbc/setup.sh Discord.apkm"; fi
