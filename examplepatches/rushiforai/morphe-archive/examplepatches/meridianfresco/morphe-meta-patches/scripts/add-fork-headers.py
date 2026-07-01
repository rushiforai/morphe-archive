#!/usr/bin/env python3
"""
Insert a per-file GitLab ReVanced Patches URL for sources missing a Forked-from header.

Run `sync-fork-headers-gitlab.py` afterward to normalize all files (GitHub/raw → GitLab blob).
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

FORK_RE = re.compile(r"(?s)/\s*\*\s*\n\s*\*\s*Forked from:")
GITLAB_PREFIX = (
    "https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/"
)


def gitlab_url(text: str, filename: str) -> str | None:
    matches = list(re.finditer(r"^package\s+([a-zA-Z0-9_.]+)\s*$", text, re.MULTILINE))
    if not matches:
        return None
    pkg = matches[-1].group(1)
    rev = pkg.replace("app.morphe", "app.revanced", 1)
    rel = "/".join(rev.split(".")) + "/" + filename
    return GITLAB_PREFIX + rel


def insert_after_leading_comment(text: str, header: str) -> str:
    m = re.match(r"^(\s*/\*.*?\*/\s*\n)", text, re.DOTALL)
    if not m:
        return header + text
    end = m.end(1)
    return text[:end] + "\n" + header + text[end:]


def main() -> None:
    root = Path(__file__).resolve().parent.parent
    kotlin_root = root / "patches" / "src" / "main" / "kotlin"
    if not kotlin_root.is_dir():
        print("patches Kotlin root not found", file=sys.stderr)
        sys.exit(1)
    for p in sorted(kotlin_root.rglob("*.kt")):
        t = p.read_text(encoding="utf-8")
        if FORK_RE.search(t):
            continue
        url = gitlab_url(t, p.name)
        if not url:
            print("skip (no package):", p.relative_to(root), file=sys.stderr)
            continue
        header = f"/*\n * Forked from:\n * {url}\n */\n\n"
        stripped = t.lstrip()
        if stripped.startswith("/*"):
            t = insert_after_leading_comment(t, header)
        else:
            t = header + t
        p.write_text(t, encoding="utf-8", newline="\n")
        print(p.relative_to(root))


if __name__ == "__main__":
    main()
