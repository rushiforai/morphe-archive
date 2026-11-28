#!/usr/bin/env bash
# Guards the designed layout of README.md.
#
# The README is not generated. Its shell is hand-designed and it is what the project page looks
# like: the centred banner, the capsule-render hero and footer, the glass badge row, the jump
# pills, the section order, and the <details> card used for every patch. Wording, patch entries and
# numbers inside those structures may change; the shell may not, and the card format must stay the
# same shape.
#
# Run this after editing README.md (and in CI) so a content update that drops a tag, reorders a
# section or flattens a card fails loudly instead of quietly changing how the page renders.
#
# Usage: check-readme-layout.sh [README.md]
#
# The checks are intentionally structural, not a checksum: adding a patch card, changing a
# description or bumping a count passes, while moving a section, re-wrapping a badge, editing the
# hero URL or turning a card into plain Markdown fails.
set -euo pipefail

README="${1:-README.md}"

fail() {
    echo "error: $*" >&2
    exit 1
}

[ -f "${README}" ] || fail "README not found: ${README}"
[ -s "${README}" ] || fail "README is empty: ${README}"

# --- line endings and trailing newline -------------------------------------------------------
# The design was authored with LF; CRLF changes every line in review and can break the HTML blocks.
# Counted with tr rather than grep: MSYS grep and awk read files in text mode and strip CR before
# matching, so a CR pattern never matches on Git Bash even when the bytes are there.
cr_count=$(tr -cd '\r' < "${README}" | wc -c | tr -d ' ')
[ "${cr_count}" -eq 0 ] ||
    fail "README has ${cr_count} CR bytes (CRLF line endings); the layout is authored with LF."
[ "$(tail -c 1 "${README}" | od -An -c | tr -d ' \n')" = '\n' ] ||
    fail "README does not end with a newline."

# --- opening shell ---------------------------------------------------------------------------
# Three nested centred divs open the page and are closed together further down, so the count is
# deliberately not balanced: 6 opens, 4 closes.
# grep exits 1 on zero matches, which set -e would turn into a silent exit instead of a message.
opens=$(grep -c '<div' "${README}" || true)
closes=$(grep -c '</div>' "${README}" || true)
[ "${opens}" -eq 6 ] || fail "expected 6 <div> lines in the shell, found ${opens}."
[ "${closes}" -eq 4 ] || fail "expected 4 </div> lines in the shell, found ${closes}."

head -1 "${README}" | grep -qx '<div align="center">' ||
    fail "README must start with the centred opening div."
sed -n '3p' "${README}" | grep -q '<img src="assets/glyphchemy-banner.svg"' ||
    fail "the banner image line moved (expected on line 3)."

# --- hero and footer -------------------------------------------------------------------------
for section in header footer; do
    count=$(grep -c "capsule-render.vercel.app.*section=${section}" "${README}" || true)
    [ "${count}" -eq 1 ] || fail "expected exactly one capsule-render ${section} banner, found ${count}."
done
grep -q 'customColorList=1,9,14,23,26' "${README}" ||
    fail "the hero/footer gradient (customColorList=1,9,14,23,26) is the design; it is missing."

# --- glass badge row -------------------------------------------------------------------------
badges=$(grep -c 'img.shields.io/badge/' "${README}" || true)
[ "${badges}" -eq 5 ] || fail "expected the 5-badge glass row, found ${badges} badges."
grep -q 'labelColor=1a1b26' "${README}" ||
    fail "the badge row lost its glass treatment (labelColor=1a1b26)."
for alt in 'alt="Release"' 'alt="Add to Morphe"' 'alt="Target Gboard"' 'alt="Patches Count"' 'alt="Privacy"'; do
    grep -q "${alt}" "${README}" || fail "badge missing: ${alt}."
done

# --- quick jump pills ------------------------------------------------------------------------
for anchor in '#-the-vibe-tldr' '#-quick-run-install' '#-compatibility-check' \
    '#-the-patch-stash-89-patches' '#-tasker-god-mode' '#%EF%B8%8F-cook-it-yourself-local-build'; do
    grep -q "href=\"${anchor}\"" "${README}" || fail "jump pill anchor missing: ${anchor}."
done

# --- section order ---------------------------------------------------------------------------
expected_sections=$(cat <<'EOF'
## ✨ The Vibe (TL;DR)
## 📱 Compatibility Check
## ⚡ Quick Run (Install)
## 🧩 The Patch Stash (89 Patches)
## ⚡ Tasker God-Mode
## 🛠️ Cook It Yourself (Local Build)
EOF
)
actual_sections=$(grep '^## ' "${README}" || true)
[ "${actual_sections}" = "${expected_sections}" ] || {
    echo "--- expected ---" >&2
    echo "${expected_sections}" >&2
    echo "--- actual ---" >&2
    echo "${actual_sections}" >&2
    fail "the top-level section list or its order changed."
}

# --- patch cards -----------------------------------------------------------------------------
# Every patch is the same card: <details> / <summary><b>name</b> <code>slug</code>…</summary> /
# <br> / blank / > description / </details>. Counts and shape are checked, not the text.
cards=$(grep -c '^<details>$' "${README}" || true)
[ "${cards}" -gt 0 ] || fail "no patch cards found."
summaries=$(grep -c '^<summary>' "${README}" || true)
closed=$(grep -c '^</details>$' "${README}" || true)
brs=$(grep -c '^<br>$' "${README}" || true)
[ "${summaries}" -eq "${cards}" ] ||
    fail "card shape broken: ${summaries} summaries for ${cards} <details>."
[ "${closed}" -eq "${cards}" ] ||
    fail "card shape broken: ${closed} </details> for ${cards} <details>."
[ "${brs}" -ge "${cards}" ] ||
    fail "card shape broken: ${brs} <br> lines for ${cards} cards."
awk '
    /^<details>$/ { want = 1; next }
    want == 1 && /^<summary><b>/ { want = 0; next }
    want == 1 { print "line " NR ": <details> not followed by <summary><b>"; bad = 1; exit }
    END { exit bad ? 1 : 0 }
' "${README}" || fail "a patch card does not open with <summary><b>."

# --- fixed blocks ----------------------------------------------------------------------------
grep -q '^```mermaid$' "${README}" || fail "the install mermaid diagram is missing."
grep -qx '> \[!TIP\]' "${README}" || fail "the compatibility TIP callout is missing."
grep -qx '> \[!CAUTION\]' "${README}" || fail "the install CAUTION callout is missing."
grep -q 'Intent Action: dev.custom.gboard.ENTER_PRESSED' "${README}" ||
    fail "the Tasker intent block is missing."
grep -q 'GNU General Public License v3.0' "${README}" || fail "the licensing block is missing."

echo "ok: README layout intact (${README}: ${opens} divs, ${badges} badges, ${cards} cards)"
