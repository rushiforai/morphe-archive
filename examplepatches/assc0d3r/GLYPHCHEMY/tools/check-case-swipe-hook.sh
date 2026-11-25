#!/usr/bin/env bash
# Rejects a Smart bar case swipe hook that would ship a VerifyError.
#
# The hook injects an invoke-static into Gboard's commit funnel `Lowy;->f(InputConnection,
# CharSequence, int)V` and replaces the text argument with the runtime's answer. The flags int and
# the text argument are both single-register parameters, so passing the wrong register assembles
# fine, passes the patch, and then crashes the keyboard on every input field:
#   VerifyError ... void owy.f(InputConnection, CharSequence, int) failed to verify:
#   [0x0] register v4 has type Integer but expected Reference: java.lang.CharSequence
#
# Two guards:
#  - the patch must build its hook from CaseSwipeHook instead of a register literal, so the
#    register always follows the funnel signature;
#  - the compiled CaseSwipeHook is executed for every funnel shape (static, instance, reordered)
#    and must pass the CharSequence register, never the flags register.
#
# Usage: check-case-swipe-hook.sh <root> <java> <javac> <classes-dir> <kotlin-stdlib> <work-dir>
set -euo pipefail

if [ "$#" -ne 6 ]; then
    echo "usage: $0 <root> <java> <javac> <classes-dir> <kotlin-stdlib> <work-dir>" >&2
    exit 2
fi

ROOT="$1"
JAVA_BIN="$2"
JAVAC_BIN="$3"
CLASSES_DIR="$4"
KOTLIN_STDLIB="$5"
WORK_DIR="$6"

PATCH_SOURCE="${ROOT}/src/main/kotlin/dev/custom/gboardpatches/patches/keyboard/SmartBarCaseSwipePatch.kt"
DRIVER_SOURCE="${ROOT}/tools/caseswipe/CaseSwipeHookCheck.java"

fail() {
    echo "error: $*" >&2
    exit 1
}

# 1. The patch itself must not carry a hand-written hook register.
if grep -nE '"[^"]*invoke-static[^"]*applyCommittedCase' "${PATCH_SOURCE}" >/dev/null; then
    grep -nE '"[^"]*invoke-static[^"]*applyCommittedCase' "${PATCH_SOURCE}" >&2
    fail "SmartBarCaseSwipePatch.kt spells out an applyCommittedCase invoke."
    fail "build the hook with CaseSwipeHook.instructions() so its register follows the signature."
fi
grep -q 'CaseSwipeHook.instructions(' "${PATCH_SOURCE}" \
    || fail "SmartBarCaseSwipePatch.kt does not build its hook with CaseSwipeHook.instructions()."

# 2. Run the compiled hook against the funnel shapes.
if [ ! -d "${CLASSES_DIR}" ]; then
    fail "compiled classes are missing at ${CLASSES_DIR}; run this after the Kotlin compile."
fi
if [ ! -f "${KOTLIN_STDLIB}" ]; then
    fail "kotlin-stdlib not found at ${KOTLIN_STDLIB}."
fi

if [[ "${OSTYPE:-}" == msys* || "${OSTYPE:-}" == cygwin* || "${OS:-}" == Windows_NT ]]; then
    CLASSPATH_SEP=";"
    to_path() { cygpath -w "$1"; }
else
    CLASSPATH_SEP=":"
    to_path() { printf '%s' "$1"; }
fi

rm -rf "${WORK_DIR}"
mkdir -p "${WORK_DIR}"

"${JAVAC_BIN}" -cp "$(to_path "${CLASSES_DIR}")" -d "$(to_path "${WORK_DIR}")" \
    "$(to_path "${DRIVER_SOURCE}")" \
    || fail "could not compile the Smart bar case swipe register check."

"${JAVA_BIN}" \
    -cp "$(to_path "${CLASSES_DIR}")${CLASSPATH_SEP}$(to_path "${WORK_DIR}")${CLASSPATH_SEP}$(to_path "${KOTLIN_STDLIB}")" \
    CaseSwipeHookCheck \
    || fail "the Smart bar case swipe hook passes the wrong register; refusing to build."
