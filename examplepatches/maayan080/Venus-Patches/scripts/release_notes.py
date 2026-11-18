#!/usr/bin/env python3
"""Check CHANGELOG.md and print one release's notes, in the format Morphe Manager draws as sections.

    python3 scripts/release_notes.py --check     # every entry, fails on anything Morphe can't split up
    python3 scripts/release_notes.py 1.6.1       # the GitHub release body for 1.6.1

Morphe Manager reads CHANGELOG.md from main (see AGENTS.md). Each "### " heading becomes a card
(App support, New, Fixes, Improvements, Performance) and each "* **Scope:** text" bullet a row.
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CHANGELOG = ROOT / "CHANGELOG.md"
REPO = "https://github.com/VenusIsJaded/Venus-Patches"

# The headings Morphe Manager maps to its own icons and titles, in the order they're written. App support comes
# first, so the Discord version a release works with is the first thing you read.
SECTIONS = ["### 🚀 Updated App Support", "### ✨ New Features", "### 🐛 Bug Fixes", "### 🔧 Improvements",
            "### ⚡ Performance Improvements"]
HEADING = re.compile(r"^## (?:\[(?P<linked>[^\]]+)\]\((?P<url>[^)]+)\)|(?P<bare>\S+)) \((?P<date>\d{4}-\d{2}-\d{2})\)$")
BULLET = re.compile(r"^\* \*\*Discord(?: - [^*:]+)?:\*\* (?P<desc>\S.*[^.])$")
# Release-page leftovers that don't belong in notes (see AGENTS.md).
BANNED = re.compile(r"good to know|sha-?256|^#+ install|wasn't published separately|checked by patching", re.I | re.M)


def entries(text):
    """(version, heading line, body) for every release, newest first."""
    found, current = [], None
    for line in text.splitlines():
        match = HEADING.match(line)
        if match:
            current = [match.group("linked") or match.group("bare"), line, []]
            found.append(current)
        elif line.startswith("## "):
            raise SystemExit(f"CHANGELOG.md: bad release heading: {line}")
        elif current:
            current[2].append(line)
        elif line.strip():
            raise SystemExit("CHANGELOG.md: text before the first release heading")
    return [(v, h, "\n".join(b).strip()) for v, h, b in found]


def check():
    text = CHANGELOG.read_text()
    if BANNED.search(text):
        raise SystemExit(f"CHANGELOG.md: remove '{BANNED.search(text).group(0)}' (see AGENTS.md)")
    seen = set()
    for version, heading, body in entries(text):
        if version in seen:
            raise SystemExit(f"CHANGELOG.md: {version} is listed twice")
        seen.add(version)
        url = HEADING.match(heading).group("url")
        if url and not url.startswith(f"{REPO}/compare/v") or url and not url.endswith(f"...v{version}"):
            raise SystemExit(f"CHANGELOG.md: {version} compare link should end in ...v{version}")
        order, section, bullets = [], None, 0
        for line in body.splitlines():
            if not line.strip():
                continue
            if line.startswith("#"):
                if line not in SECTIONS:
                    raise SystemExit(f"CHANGELOG.md {version}: unknown section '{line}'. Use one of {SECTIONS}")
                if line in order:
                    raise SystemExit(f"CHANGELOG.md {version}: '{line}' appears twice")
                if order and SECTIONS.index(line) < SECTIONS.index(order[-1]):
                    raise SystemExit(f"CHANGELOG.md {version}: put sections in this order: {SECTIONS}")
                order.append(line); section = line
                continue
            if not section:
                raise SystemExit(f"CHANGELOG.md {version}: text outside a section: {line}")
            bullet_match = BULLET.match(line)
            if not bullet_match:
                raise SystemExit(f"CHANGELOG.md {version}: write '* **Discord - Patch name:** Short change' "
                                 f"on one line, without a full stop: {line}")
            if section == "### 🐛 Bug Fixes" and not bullet_match.group("desc").startswith("Fixed "):
                raise SystemExit(f"CHANGELOG.md {version}: every bug fix must start with 'Fixed ': {line}")
            bullets += 1
        if not bullets:
            raise SystemExit(f"CHANGELOG.md {version}: no changes listed")
    print(f"CHANGELOG.md: {len(seen)} releases in Morphe's section format")


def notes(version):
    for found, heading, body in entries(CHANGELOG.read_text()):
        if found == version.lstrip("v"):
            return heading + "\n\n" + body + "\n"
    raise SystemExit(f"CHANGELOG.md has no {version}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    if sys.argv[1] == "--check":
        check()
    else:
        sys.stdout.write(notes(sys.argv[1]))
