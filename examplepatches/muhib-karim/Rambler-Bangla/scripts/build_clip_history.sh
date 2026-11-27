#!/usr/bin/env bash
# Usage: source tools/tool-env.sh; scripts/build_clip_history.sh BASE.apk OUTPUT.apk
set -euo pipefail
exec python3 "$(dirname "$0")/clip_history_build.py" "$@"
