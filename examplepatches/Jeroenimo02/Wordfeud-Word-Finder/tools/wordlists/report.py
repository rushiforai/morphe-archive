#!/usr/bin/env python3
"""Adds reported words to wordlists/<code>/remove.txt (type remove) or add.txt (type add).

Used by the "Word list reports" workflow (repository_dispatch from the report worker). A word is only taken when
  - the ruleset has a word list (wordlists/manifest.json),
  - it normalises to a valid word of that language (same rules as build.py),
  - type remove (the server rejected it): it is currently in the list and not already in remove.txt;
  - type add (it was played, so the server accepted it): it is not in the list, not in add.txt, and not in
    remove.txt (a word the server once rejected is left to the reviewer).
Everything else is ignored, so junk reports cannot add arbitrary lines.

Usage: python3 tools/wordlists/report.py [--type remove|add] --ruleset 2 --words NDJ,XYZ
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
    ap.add_argument("--type", default="remove")
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
    add_path = os.path.join(folder, "add.txt")
    removed = set(build.read_word_file(remove_path, norm))
    additions = set(build.read_word_file(add_path, norm))
    kind = args.type if args.type in ("remove", "add") else ""
    target = remove_path if kind == "remove" else add_path

    added = []
    for raw in args.words.split(",")[:MAX_WORDS]:
        w = norm(raw)
        if not w or w in added:
            continue
        if kind == "remove" and w in current and w not in removed:
            added.append(w)
        elif kind == "add" and w not in current and w not in additions and w not in removed:
            added.append(w)
    if added:
        with open(target, "a", encoding="utf-8") as f:
            for w in added:
                f.write(w + "\n")
    print("code=%s\nadded=%s" % (code, ",".join(added)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
