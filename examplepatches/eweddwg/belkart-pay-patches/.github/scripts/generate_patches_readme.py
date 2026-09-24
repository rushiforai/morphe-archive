#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.
Output is in Russian.

Spoilers are expanded (open by default) if:
  1. Total patch count <= AUTO_EXPAND_THRESHOLD.
  2. The README marker explicitly says: <!-- PATCHES_START EXPANDED -->

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path


if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo_full   = sys.argv[1]
branch      = sys.argv[2]
json_path   = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)


with open(json_path, encoding="utf-8") as f:
    data = json.load(f)


def plural_patches(n):
    """Russian plural form of the word 'патч'."""
    if n % 10 == 1 and n % 100 != 11:
        return "патч"
    if 2 <= n % 10 <= 4 and not 12 <= n % 100 <= 14:
        return "патча"
    return "патчей"


# Group patches by package; patches with no compatiblePackages are universal.
by_pkg = {}   # packageName -> { name, patches, targets }
universal = {}

for patch in data["patches"]:
    cp = patch.get("compatiblePackages")
    if not cp:
        if patch["name"] not in universal:
            universal[patch["name"]] = patch
        continue
    for pkg_entry in cp:
        pkg  = pkg_entry["packageName"]
        name = pkg_entry.get("name") or pkg
        if pkg not in by_pkg:
            by_pkg[pkg] = {
                "name":    name,
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        if patch["name"] not in by_pkg[pkg]["patches"]:
            by_pkg[pkg]["patches"][patch["name"]] = patch


def anchor(name):
    """GitHub-style anchor slug. Keeps Cyrillic letters."""
    slug = re.sub(r"[^\w\- ]", "", name.lower()).strip()
    return re.sub(r"-+", "-", slug.replace(" ", "-"))


def patches_table(patches):
    rows = [
        "| 💊&nbsp;Патч | 📜&nbsp;Описание | ⚙️&nbsp;Параметры |",
        "|----------|----------------|-----------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        options = p.get("options") or []
        if options:
            parts = [opt.get("title") or opt.get("key") or "" for opt in options]
            opts_cell = "<br>".join(f"• {t}" for t in parts)
        else:
            opts_cell = ""
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| [{p['name']}](#{anchor(p['name'])}) | {desc} | {opts_cell} |")
    return "\n".join(rows)


def versions_table(targets):
    if not targets:
        return ""

    cells = []
    for t in targets:
        ver = t["version"]
        if ver is None:
            continue
        cells.append(f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver)

    if not cells:
        return ""

    rows = [
        "| " + " | ".join(cells) + " |",
        "| " + " | ".join(":---:" for _ in cells) + " |",
    ]

    descs = [(t.get("description") or "").replace("\n", "<br>") for t in targets]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, tbl, expanded=False):
    vtbl = versions_table(targets)
    versions_section = f"**🎯 Поддерживаемые версии:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {plural_patches(count)}</summary>
<br>

{versions_section}{tbl}

</details>"""


def build_content(expanded=False):
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"Всего патчей: {total}"
    ]

    for pkg, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        label   = f"📦 {entry['name']}"
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded))
        lines.append("")

    if universal:
        uni_patches = list(universal.values())
        lines.append(spoiler("🌐 Универсальные", len(uni_patches), [], patches_table(uni_patches), expanded))
        lines.append("")

    return "\n".join(lines)


ver   = data["version"].lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    print(build_content(expanded=False))
    sys.stderr.write(
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

AUTO_EXPAND_THRESHOLD = 20
expanded = total <= AUTO_EXPAND_THRESHOLD or "EXPANDED" in actual_start

generated = build_content(expanded=expanded)

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    lambda _: f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
