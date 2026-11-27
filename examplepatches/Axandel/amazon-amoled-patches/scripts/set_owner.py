#!/usr/bin/env python3
"""Replaces the CHANGE_ME placeholders with your GitHub user name.

Usage, from the repository root:  python3 scripts/set_owner.py <github-user>
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
FILES = [
    "README.md",
    "patches/build.gradle.kts",
    ".github/ISSUE_TEMPLATE/bug_report.yml",
    ".github/ISSUE_TEMPLATE/feature_request.yml",
]

if len(sys.argv) != 2 or not sys.argv[1].strip():
    raise SystemExit("Usage: python3 scripts/set_owner.py <github-user>")
owner = sys.argv[1].strip()
for name in FILES:
    path = ROOT / name
    text = path.read_text(encoding="utf-8")
    if "CHANGE_ME" in text:
        path.write_text(text.replace("CHANGE_ME", owner), encoding="utf-8")
        print(f"Updated {name}")
