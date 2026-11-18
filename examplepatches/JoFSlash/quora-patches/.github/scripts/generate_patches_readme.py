#!/usr/bin/env python3
"""
Writes the patch list in README.md from patches-list.json, between the
<!-- PATCHES_START --> and <!-- PATCHES_END --> markers, grouped by category,
and the supported Quora versions between <!-- VERSIONS_START --> and <!-- VERSIONS_END -->.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path

if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo = sys.argv[1]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")

data = json.loads(json_path.read_text(encoding="utf-8"))
patches = data["patches"]
version = str(data["version"]).lstrip("v")

ORDER = ["Privacy", "Feed", "Reading", "App"]
INTRO = {
    "Privacy": "On by default. They stop data collection and change nothing you see.",
    "Feed": "What the feed and question pages show.",
    "Reading": "How answers look and load.",
    "App": "The app around the pages: prompts, tabs, notifications, gestures.",
}

versions = []
for p in patches:
    for c in p.get("compatiblePackages") or []:
        for t in c.get("targets") or []:
            v = t.get("version")
            if v and v not in versions:
                versions.append(v)


def cell(text):
    return (text or "").replace("|", "\\|").replace("\n", " ")


lines = [
    f"Version {version}, {len(patches)} patches. Supported Quora versions: {', '.join(versions) or 'any'}.",
    "",
]
categories = ORDER + sorted({p.get("category") or "Other" for p in patches} - set(ORDER))
for category in categories:
    group = sorted((p for p in patches if (p.get("category") or "Other") == category), key=lambda p: p["name"].lower())
    if not group:
        continue
    # Each group folds, so the list doesn't push the rest of the README down.
    lines += ["<details>", f"<summary><b>{category}</b> ({len(group)})</summary>", ""]
    if category in INTRO:
        lines += [INTRO[category], ""]
    lines += ["| Patch | Default | What it does |", "| --- | --- | --- |"]
    for p in group:
        options = [o.get("title") or o.get("key") for o in p.get("options") or []]
        desc = cell(p.get("description"))
        if options:
            desc += " Options: " + ", ".join(cell(o) for o in options) + "."
        lines.append(f"| {cell(p['name'])} | {'on' if p.get('default') else 'off'} | {desc} |")
    lines += ["", "</details>", ""]

generated = "\n".join(lines).rstrip()

readme = readme_path.read_text(encoding="utf-8")
start = re.search(r"<!-- PATCHES_START[^>]*-->", readme)
end = "<!-- PATCHES_END -->"
if not start or end not in readme:
    print(generated)
    sys.stderr.write(f"Markers not found in {readme_path}; printed the list instead.\n")
    sys.exit(1)

readme = re.sub(r"<!-- PATCHES_START[^>]*-->.*?<!-- PATCHES_END -->",
                lambda m: f"<!-- PATCHES_START -->\n{generated}\n{end}", readme, flags=re.DOTALL)

# The supported versions in the intro, if the README has the markers for them.
if versions:
    spoken = versions[0] if len(versions) == 1 else ", ".join(versions[:-1]) + " and " + versions[-1]
    readme = re.sub(r"<!-- VERSIONS_START -->.*?<!-- VERSIONS_END -->",
                    lambda m: f"<!-- VERSIONS_START -->{spoken}<!-- VERSIONS_END -->", readme, flags=re.DOTALL)
readme_path.write_text(readme, encoding="utf-8")
print(f"Wrote {len(patches)} patches for {repo} v{version} into {readme_path}")
