#!/usr/bin/env bash
# Rejects an apply run that did not actually apply the patch it was asked for.
#
# morphe-cli exits 0 and writes the output APK even when a selected patch is skipped as
# incompatible with the target build:
#
#   INFO: Skipping "Emojis, stickers & GIFs Tab Order": incompatible with
#   com.google.android.inputmethod.latin 18.8.0.1022711984-beta-arm64-v8a
#   INFO: Saved to dist/out.apk
#
# So `morphe-cli ... && echo verified` proves nothing, and neither does the presence of an APK: a
# port whose 18.8 gate was never added looks exactly like a port that applied. Only a line
#
#   INFO: Applied: <patch name>
#
# shows the patch ran. This check reads the apply log for that exact line and fails when it is
# missing, naming the reason when the log says why (incompatible, or a patch exception).
#
# This is the check half of tools/apply-patch.sh, which runs morphe-cli and calls it; it is also
# usable on a log from a run started by hand.
#
# Usage: check-apply-evidence.sh <apply-log> <patch-name> [<patch-name>...]
set -euo pipefail

usage() {
    echo "usage: $0 <apply-log> <patch-name> [<patch-name>...]" >&2
    exit 2
}

[ "$#" -ge 2 ] || usage
LOG="$1"
shift

[ -f "${LOG}" ] || {
    echo "error: apply log not found: ${LOG}" >&2
    exit 2
}
[ -r "${LOG}" ] || {
    echo "error: apply log is not readable: ${LOG}" >&2
    exit 2
}

# Matches a line whose text after the prefix is exactly the patch name. A substring test would let
# "Swipe Down" pass on an "Applied: Swipe Down to Dismiss Keyboard" line, and a patch-name prefix is
# a real hazard here: several patch names in this bundle start with another patch's name.
log_has_exact() {
    local prefix="$1" name="$2"
    awk -v prefix="${prefix}" -v want="${name}" '
        {
            line = $0
            sub(/\r$/, "", line)
            at = index(line, prefix)
            if (at > 0 && substr(line, at + length(prefix)) == want) {
                found = 1
            }
        }
        END { exit found ? 0 : 1 }
    ' "${LOG}"
}

status=0
for name in "$@"; do
    if [ -z "${name}" ]; then
        echo "error: empty patch name" >&2
        status=1
        continue
    fi
    if log_has_exact "Applied: " "${name}"; then
        echo "  applied: ${name}"
        continue
    fi

    status=1
    # The skip line carries a reason after the name (Skipping "X": incompatible with ...), so it is
    # matched literally rather than by the exact-suffix rule used for the Applied line.
    if grep -Fq "Skipping \"${name}\":" "${LOG}"; then
        echo "error: morphe-cli skipped \"${name}\": the patch is incompatible with this APK." >&2
        echo "error: the run still exited 0 and wrote an APK, so the output proves nothing." >&2
        echo "error: add the release to the patch's gate before claiming this apply verified the port." >&2
    elif log_has_exact "Failed: " "${name}"; then
        echo "error: \"${name}\" failed during the apply; see ${LOG}." >&2
    else
        echo "error: ${LOG} has no \"Applied: ${name}\" line." >&2
        echo "error: either the patch never ran (not selected, or not offered for this APK)," >&2
        echo "error: or the log is from a different run. An APK in the output directory is not evidence." >&2
    fi
done

exit "${status}"
