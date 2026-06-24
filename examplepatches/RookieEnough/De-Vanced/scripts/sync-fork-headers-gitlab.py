#!/usr/bin/env python3
"""
Set each Kotlin file's 'Forked from' to the mirrored path on GitLab ReVanced Patches:
https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/...

Maps package app.morphe.* -> app.revanced.* (same relative path as upstream).
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

GITLAB_PREFIX = (
    "https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/"
)
GITHUB_REVANCED_BLOB = re.compile(
    r"https://github\.com/ReVanced/revanced-patches/blob/[a-f0-9]+/"
    r"(patches/src/main/kotlin/(app/revanced/[^\s)]+))"
)
GITLAB_RAVANCED_RAW = re.compile(
    r"https://gitlab\.com/ReVanced/ravanced-patches/-/raw/main/"
    r"(patches/src/main/kotlin/(app/revanced/[^\s)]+))"
)
GENERIC_LINEAGE_BLOCK = re.compile(
    r"/\*\n \* Forked from:\n \* https://github\.com/ReVanced/revanced-patches[^\n]*\n \*/\n*",
    re.MULTILINE,
)
ORIGINAL_HARD_FORK = re.compile(
    r"(\* Original code hard forked from:\n \* )"
    r"https://github\.com/ReVanced/revanced-patches/blob/[a-f0-9]+/"
    r"patches/src/main/kotlin/(app/revanced/[^\n]+)",
)
FORK_BLOCK = re.compile(
    r"/\*\n \* Forked from:\n \* https://[^\n]+\n \*/\n*",
    re.MULTILINE,
)


def package_from_source(text: str) -> str | None:
    matches = list(
        re.finditer(r"^package\s+([a-zA-Z0-9_.]+)\s*$", text, re.MULTILINE)
    )
    return matches[-1].group(1) if matches else None


def gitlab_url(pkg: str, filename: str) -> str:
    rev_pkg = pkg.replace("app.morphe", "app.revanced", 1)
    rel = "/".join(rev_pkg.split(".")) + "/" + filename
    return GITLAB_PREFIX + rel


def process_file(path: Path) -> bool:
    raw = path.read_text(encoding="utf-8")
    text = raw

    text = GITHUB_REVANCED_BLOB.sub(lambda m: GITLAB_PREFIX + m.group(2), text)
    text = GITLAB_RAVANCED_RAW.sub(lambda m: GITLAB_PREFIX + m.group(2), text)
    text = ORIGINAL_HARD_FORK.sub(lambda m: m.group(1) + GITLAB_PREFIX + m.group(2), text)

    text = GENERIC_LINEAGE_BLOCK.sub("", text)

    pkg = package_from_source(text)
    if not pkg:
        if text != raw:
            path.write_text(text, encoding="utf-8", newline="\n")
            return True
        return False

    url = gitlab_url(pkg, path.name)
    block = f"/*\n * Forked from:\n * {url}\n */\n"

    matches = list(FORK_BLOCK.finditer(text))
    if len(matches) == 0:
        m_pkg = re.search(r"^package\s+", text, re.MULTILINE)
        if m_pkg:
            text = text[: m_pkg.start()] + block + text[m_pkg.start() :]
    elif len(matches) == 1:
        m = matches[0]
        text = text[: m.start()] + block + text[m.end() :]
    else:
        first, last = matches[0], matches[-1]
        text = text[: first.start()] + block + text[last.end() :]

    if text != raw:
        path.write_text(text, encoding="utf-8", newline="\n")
        return True
    return False


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    kotlin_root = root / "patches" / "src" / "main" / "kotlin"
    if not kotlin_root.is_dir():
        print("missing kotlin root", file=sys.stderr)
        sys.exit(1)
    changed = 0
    for p in sorted(kotlin_root.rglob("*.kt")):
        if process_file(p):
            changed += 1
            print(p.relative_to(root))
    print(f"Updated {changed} files", file=sys.stderr)


if __name__ == "__main__":
    main()
