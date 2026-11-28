#!/usr/bin/env bash
# Applies patches to an APK and refuses to report success without "INFO: Applied:" evidence.
#
# morphe-cli exits 0 for a patch it never ran. When the selection is incompatible with the APK in
# front of it, the run prints
#
#   INFO: Skipping "English QWERTY Flick Case": incompatible with
#   com.google.android.inputmethod.latin 18.8.0.1022711984-beta-arm64-v8a
#   INFO: Applying 0 patches...
#   INFO: Saved to /tmp/out.apk
#
# and still writes a rebuilt APK, so the exit status and the output file prove nothing. Only
#
#   INFO: Applied: <patch name>
#
# shows the patch executed. This wrapper keeps the apply log next to the output and delegates that
# check to tools/check-apply-evidence.sh, so a skipped patch fails the command and says why.
#
# Usage: apply-patch.sh <input.apk> <output.apk> <patch name> [<patch-name>...]
#
# Env:
#   JAVA               java binary to use (default: java)
#   MPP                patch bundle (default: dist/patches-1.0.60.mpp)
#   LOG                apply log path (default: <output.apk minus .apk>.apply.log)
#   EXTRA_MORPHE_ARGS  extra morphe-cli arguments, e.g. --continue-on-error
set -euo pipefail

usage() {
    echo "usage: $0 <input.apk> <output.apk> <patch name> [<patch-name>...]" >&2
    echo "env: JAVA, MPP, LOG, EXTRA_MORPHE_ARGS" >&2
    exit 2
}

[ "$#" -ge 3 ] || usage

INPUT="$1"
OUTPUT="$2"
shift 2

for name in "$@"; do
    [ -n "${name}" ] || { echo "error: empty patch name" >&2; exit 2; }
done

HERE="$(cd "$(dirname "$0")" && pwd)"
MPP="${MPP:-dist/patches-1.0.60.mpp}"
JAVA="${JAVA:-java}"
LOG="${LOG:-${OUTPUT%.apk}.apply.log}"

mkdir -p "$(dirname "${OUTPUT}")"

args=()
for name in "$@"; do
    args+=(-e "${name}")
done

# shellcheck disable=SC2086
set +e
"${JAVA}" -jar libs/morphe-cli.jar patch \
    -p "${MPP}" --exclusive "${args[@]}" ${EXTRA_MORPHE_ARGS:-} \
    --unsigned -o "${OUTPUT}" "${INPUT}" >"${LOG}" 2>&1
status=$?
set -e

# The evidence check runs even when morphe-cli failed: it distinguishes "skipped" from "applied,
# then an unrelated patch aborted the run" instead of reporting one as the other.
bash "${HERE}/check-apply-evidence.sh" "${LOG}" "$@" || exit 1

if [ "${status}" -ne 0 ]; then
    echo "error: morphe-cli exited ${status} after the patches above were applied; see ${LOG}." >&2
    echo "error: the output APK is incomplete, so this is not a successful run." >&2
    exit "${status}"
fi

echo "ok: applied and evidenced: $* (log: ${LOG})"
