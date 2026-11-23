#!/usr/bin/env python3
"""
Updates the patch list in README.md from patches-list.json, between the
<!-- PATCHES_START --> and <!-- PATCHES_END --> markers, and the supported
Booking.com versions between <!-- VERSIONS_START --> and <!-- VERSIONS_END -->.

The README's rows are written by hand (short texts, links to patches.md), so
they are kept. The script only:
- fixes the Default column and the counts,
- drops the rows of patches that are gone,
- adds a row for a new patch, from its description, to its category's table
  (a new category gets its own table at the end),
- rewrites the summary line and the supported versions.

python3 generate_booking_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path

if len(sys.argv) < 3:
    print("Usage: generate_booking_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo = sys.argv[1]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("docs/booking/README.md")
details_path = readme_path.parent / "patches.md"

# Category names in the code and the README's section names, where they differ.
SECTION_OF = {"Prices": "Price"}

data = json.loads(json_path.read_text(encoding="utf-8"))
# The merged bundle has every app's patches; this README lists only com.booking's.
PACKAGE = "com.booking"
patches = {p["name"]: p for p in data["patches"]
           if any(c.get("packageName") == PACKAGE for c in p.get("compatiblePackages") or [])}
version = str(data["version"]).lstrip("v")

versions = []
for p in patches.values():
    for c in p.get("compatiblePackages") or []:
        for t in c.get("targets") or []:
            v = t.get("version")
            if v and v not in versions:
                versions.append(v)


def section_of(patch):
    category = patch.get("category") or "Other"
    return SECTION_OF.get(category, category)


def cell(text):
    return (text or "").replace("|", "\\|").replace("\n", " ")


def spoken(items):
    return items[0] if len(items) == 1 else ", ".join(items[:-1]) + " and " + items[-1]


def anchor(name):
    return re.sub(r"[^a-z0-9 -]", "", name.lower()).replace(" ", "-")


detail_headings = set()
if details_path.exists():
    detail_headings = {m.group(1).strip() for m in
                       re.finditer(r"^### (.+)$", details_path.read_text(encoding="utf-8"), re.MULTILINE)}

readme = readme_path.read_text(encoding="utf-8")
block = re.search(r"<!-- PATCHES_START[^>]*-->\n(.*?)<!-- PATCHES_END -->", readme, re.DOTALL)
if not block:
    sys.stderr.write(f"Markers not found in {readme_path}.\n")
    sys.exit(1)

# Read the sections the README has: <details> with a summary, an intro and a table.
sections = []
for m in re.finditer(r"<details( open)?>\n<summary><b>(.+?)</b> \(\d+\)</summary>\n(.*?)</details>",
                     block.group(1), re.DOTALL):
    body = m.group(3)
    intro = body.split("| Patch |")[0].strip()
    rows = {}
    for line in body.splitlines():
        row = re.match(r"\| (\[(.+?)\]\(.*?\)|[^|]+?) \| (on|off) \| (.*) \|$", line)
        if row:
            rows[(row.group(2) or row.group(1)).strip()] = line
    sections.append({"open": bool(m.group(1)), "name": m.group(2), "intro": intro, "rows": rows})

for name in sorted({section_of(p) for p in patches.values()} - {s["name"] for s in sections}):
    sections.append({"open": False, "name": name, "intro": "", "rows": {}})

lines = []
for section in sections:
    group = [n for n in section["rows"] if n in patches and section_of(patches[n]) == section["name"]]
    group += sorted((n for n, p in patches.items() if section_of(p) == section["name"] and n not in group),
                    key=str.lower)
    if not group:
        continue
    lines += [f"<details{' open' if section['open'] else ''}>",
              f"<summary><b>{section['name']}</b> ({len(group)})</summary>", ""]
    if section["intro"]:
        lines += [section["intro"], ""]
    lines += ["| Patch | Default | What it does |", "| --- | --- | --- |"]
    for name in group:
        default = "on" if patches[name].get("default") else "off"
        if name in section["rows"]:
            lines.append(re.sub(r" \| (on|off) \| ", f" | {default} | ", section["rows"][name], count=1))
        else:
            link = f"[{cell(name)}](patches.md#{anchor(name)})" if name in detail_headings else cell(name)
            lines.append(f"| {link} | {default} | {cell(patches[name].get('description'))} |")
    lines += ["", "</details>", ""]

off = sorted((n for n, p in patches.items() if not p.get("default")), key=str.lower)
summary = f"{len(patches)} patches, " + (f"all on by default except {spoken(off)}." if off else "all on by default.")
summary += f" Supported Booking.com versions: {', '.join(versions) or 'any'}."

generated = "\n".join([summary, ""] + lines).rstrip()
readme = readme[:block.start()] + f"<!-- PATCHES_START -->\n{generated}\n<!-- PATCHES_END -->" + readme[block.end():]

# The supported versions in the intro.
if versions:
    readme = re.sub(r"<!-- VERSIONS_START -->.*?<!-- VERSIONS_END -->",
                    lambda m: f"<!-- VERSIONS_START -->{spoken(versions)}<!-- VERSIONS_END -->", readme, flags=re.DOTALL)
readme_path.write_text(readme, encoding="utf-8", newline="")
print(f"Wrote {len(patches)} patches for {repo} v{version} into {readme_path}")
