#!/usr/bin/env python3
"""Adds words reported as rejected by the Wordfeud server to wordlists/<code>/remove.txt.

Used by the "Word list reports" workflow (repository_dispatch from the report worker). A word is only added when
  - the ruleset has a word list (wordlists/manifest.json),
  - it normalises to a valid word of that language (same rules as build.py),
  - it is currently in that language's list (wordlists/<code>/words.txt.gz), and
  - it is not already in remove.txt.
Everything else is ignored, so junk reports cannot add arbitrary lines.

Usage: python3 tools/wordlists/report.py --ruleset 2 --words NDJ,XYZ
Prints "code=<code>" and "added=<comma separated words>" (empty when nothing was added) for the workflow.
"""
import argparse
import gzip
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import build  # noqa: E402  (same directory)

MAX_WORDS = 8


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--ruleset", required=True)
    ap.add_argument("--words", required=True)
    args = ap.parse_args()

    try:
        ruleset = str(int(args.ruleset))
    except ValueError:
        print("code=\nadded=")
        return 0
    with open(build.MANIFEST, encoding="utf-8") as f:
        manifest = json.load(f)
    code = manifest.get("rulesets", {}).get(ruleset)
    if not code:
        print("code=\nadded=")
        return 0
    with open(build.SOURCES, encoding="utf-8") as f:
        lang = json.load(f)["languages"][code]
    norm = build.normaliser(lang)

    folder = os.path.join(build.WORDLISTS, code)
    with gzip.open(os.path.join(folder, "words.txt.gz"), "rt", encoding="utf-8") as f:
        current = set(line.rstrip("\n") for line in f)
    remove_path = os.path.join(folder, "remove.txt")
    already = set(build.read_word_file(remove_path, norm))

    added = []
    for raw in args.words.split(",")[:MAX_WORDS]:
        w = norm(raw)
        if w and w in current and w not in already and w not in added:
            added.append(w)
    if added:
        with open(remove_path, "a", encoding="utf-8") as f:
            for w in added:
                f.write(w + "\n")
    print("code=%s\nadded=%s" % (code, ",".join(added)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
