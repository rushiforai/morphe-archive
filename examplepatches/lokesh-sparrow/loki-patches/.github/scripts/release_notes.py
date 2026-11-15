#!/usr/bin/env python3
# Copyright (C) 2026 Lokesh Sparrow
# SPDX-License-Identifier: GPL-3.0-or-later
"""Release notes in the Loki Patches format, printed to stdout for semantic-release.

semantic-release (@semantic-release/exec generateNotesCmd) uses the output as the notes of the
release; the same text becomes the CHANGELOG entry, the description Morphe Manager shows
(patches-bundle.json) and the GitHub release body.

    ## 3.0.1 (2026-11-14)

    ### Fixes
    - **Truecaller:** the premium description says the after-call screen has a switch.

    **36 patches for 4 apps.** Full list in the [README](https://github.com/<repo>#apps).

The commit scope names the app (fix(truecaller): ...). It is written as the app's name from
apps.json, which is what Morphe Manager matches to badge only the apps a release changes.
Commits with another scope or none get a line without an app name.

Usage: release_notes.py <owner/repo> <next version> [last tag] [patches-list.json] [apps.json]
"""

import datetime
import json
import re
import subprocess
import sys
from pathlib import Path

SECTIONS = [("feat", "New Features"), ("fix", "Fixes"), ("perf", "Improvements"), ("bump", "Updated App Support")]
HEADER = re.compile(r"^(?P<type>\w+)(?:\((?P<scope>[^)]*)\))?(?P<bang>!)?:\s*(?P<subject>.+)$")


def compact(text):
    return re.sub(r"[^a-z0-9]", "", text.lower())


def app_names(meta):
    names = {}
    for package, app in meta.get("apps", {}).items():
        for key in (app["name"], app.get("slug", ""), package.split(".")[-1], package):
            if key:
                names[compact(key)] = app["name"]
    return names


def commits(last_tag):
    rng = f"{last_tag}..HEAD" if last_tag else "HEAD"
    out = subprocess.run(["git", "log", "--no-merges", "--format=%s%x1f%b%x1e", rng],
                         capture_output=True, text=True, check=True).stdout
    for record in out.split("\x1e"):
        if record.strip():
            subject, _, body = record.strip().partition("\x1f")
            yield subject.strip(), body


def sentence(text):
    text = text.strip()
    text = text[0].upper() + text[1:] if text else text
    return text if text.endswith((".", "!", "?")) else text + "."


def main(argv):
    if len(argv) < 3:
        sys.exit("Usage: release_notes.py <owner/repo> <next version> [last tag] [patches-list.json] [apps.json]")
    slug, version = argv[1], argv[2]
    last_tag = argv[3] if len(argv) > 3 and argv[3] else None
    list_file = Path(argv[4] if len(argv) > 4 else "patches-list.json")
    meta = json.loads(Path(argv[5] if len(argv) > 5 else "apps.json").read_text(encoding="utf-8"))
    names = app_names(meta)

    grouped = {kind: [] for kind, _ in SECTIONS}
    for subject, body in commits(last_tag):
        m = HEADER.match(subject)
        if not m or m["type"] not in grouped:
            continue
        app = names.get(compact(m["scope"] or ""))
        line = f"- **{app}:** {sentence(m['subject'])}" if app else f"- {sentence(m['subject'])}"
        if line not in grouped[m["type"]]:
            grouped[m["type"]].append(line)

    # Apps first in the order of their names, general lines after them.
    def key(line):
        found = re.match(r"- \*\*(.+?):\*\*", line)
        return (0, found.group(1).lower()) if found else (1, "")

    date = datetime.date.today().isoformat()
    parts = [f"## {version} ({date})", ""]
    for kind, title in SECTIONS:
        if grouped[kind]:
            parts += [f"### {title}"] + sorted(grouped[kind], key=key) + [""]
    if list_file.exists():
        patches = json.loads(list_file.read_text(encoding="utf-8"))["patches"]
        apps = {c["packageName"] for p in patches for c in (p.get("compatiblePackages") or [])}
        parts.append(f"**{len(patches)} patches for {len(apps)} apps.** "
                     f"Full list in the [README](https://github.com/{slug}#apps).")
    print("\n".join(parts).rstrip())


if __name__ == "__main__":
    main(sys.argv)
