#!/usr/bin/env bash
# Rejects a second, forked copy of a patch implementation.
#
# src/main/kotlin is compiled as one group per top-level directory. Two groups that
# declare the same top-level name (for example dev.jason's gboardCloneThingPatch and a
# copy under a second group) both compile fine, but only one of them is ever wired into
# the bundle, so an edit to the other is silently ignored. That is exactly how the
# src/main/kotlin/patches fork of the dev.jason suite went unnoticed.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

tmp="$(mktemp -d)"
trap 'rm -rf "${tmp}"' EXIT

: > "${tmp}/all.tsv"
for group_dir in src/main/kotlin/*/; do
    group_dir="${group_dir%/}"
    [ -d "${group_dir}" ] || continue
    group="$(basename "${group_dir}")"
    # grep exits 1 for files without a top-level val, which would abort the whole run.
    find "${group_dir}" -name '*.kt' -print0 \
        | { xargs -0 grep -hoE '^(internal |private |public )?val `?[A-Za-z_][A-Za-z0-9_]*' 2>/dev/null || true; } \
        | sed -E 's/^(internal |private |public )?val `?//' \
        | sort -u \
        | sed "s|$|\t${group}|" >> "${tmp}/all.tsv"
done

set +e
report="$(awk -F'\t' '
    { groups[$1] = groups[$1] " " $2; count[$1]++ }
    END {
        bad = 0
        for (name in count) {
            if (count[name] > 1) {
                printf "  %s (in%s)\n", name, groups[name]
                bad = 1
            }
        }
        exit bad
    }
' "${tmp}/all.tsv")"
status=$?
set -e

if [ "${status}" -ne 0 ]; then
    echo "error: the same top-level Kotlin name is declared in more than one source group:" >&2
    printf '%s\n' "${report}" >&2
    echo "error: keep a single implementation per feature; a forked copy compiles but is" >&2
    echo "error: never wired into the bundle, so fixes made in the other tree are ignored." >&2
    exit 1
fi

# A file name may only exist in one group as well. This catches copies that declare no
# top-level val (enums, objects, helpers such as GboardExpressionCorpusPatchState), where a
# fork would otherwise be invisible to the declaration check above.
: > "${tmp}/basenames.tsv"
for group_dir in src/main/kotlin/*/; do
    group_dir="${group_dir%/}"
    [ -d "${group_dir}" ] || continue
    group="$(basename "${group_dir}")"
    while IFS= read -r -d '' path; do
        printf '%s\t%s\n' "${path##*/}" "${group}" >> "${tmp}/basenames.tsv"
    done < <(find "${group_dir}" -name '*.kt' -print0)
done

set +e
file_report="$(awk -F'\t' '
    { owners[$1] = owners[$1] " " $2; count[$1]++ }
    END {
        bad = 0
        for (name in count) {
            if (count[name] > 1) {
                printf "  %s (in%s)\n", name, owners[name]
                bad = 1
            }
        }
        exit bad
    }
' "${tmp}/basenames.tsv" | sort)"
file_status=$?
set -e

if [ "${file_status}" -ne 0 ]; then
    echo "error: the same Kotlin file name exists in more than one source group:" >&2
    printf '%s\n' "${file_report}" >&2
    echo "error: keep one authoritative copy per file; delete the duplicate or rename the" >&2
    echo "error: unrelated one so an edit cannot land in the copy nothing uses." >&2
    exit 1
fi

echo "  no cross-group duplicate declarations or file names"
