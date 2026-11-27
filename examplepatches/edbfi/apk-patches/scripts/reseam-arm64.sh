#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
set -euo pipefail

: "${RESEAM_X64_BIN:?Set RESEAM_X64_BIN to the verified Reseam CLI}"
: "${RESEAM_X64_JAVA_HOME:?Set RESEAM_X64_JAVA_HOME to an x86-64 JDK}"
export JAVA_HOME="$RESEAM_X64_JAVA_HOME"
export QEMU_LD_PREFIX=${QEMU_LD_PREFIX:-/usr/x86_64-linux-gnu}
exec "$RESEAM_X64_BIN" "$@"
