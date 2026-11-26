#!/usr/bin/env python3
"""
Generates the expanded patches section of README.md (and PATCHES.md) from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Usage:
    python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path

AUTO_EXPAND_THRESHOLD = 20

if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo_full = sys.argv[1]
branch = sys.argv[2]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")
patches_md_path = readme_path.parent / "PATCHES.md"

if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)

with open(json_path, encoding="utf-8") as f:
    data = json.load(f)

by_pkg = {}
universal = {}

for patch in data["patches"]:
    cp = patch.get("compatiblePackages")
    if not cp:
        universal.setdefault(patch["name"], patch)
        continue
    for pkg_entry in cp:
        pkg = pkg_entry["packageName"]
        name = pkg_entry.get("name") or pkg
        if pkg not in by_pkg:
            by_pkg[pkg] = {
                "name": name,
                "package": pkg,
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        by_pkg[pkg]["patches"].setdefault(patch["name"], patch)


def patches_table(patches):
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description |",
        "|----------|----------------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| **{p['name']}** | {desc} |")
    return "\n".join(rows)


def versions_table(targets):
    if not targets:
        return ""
    cells = []
    descs = []
    for t in targets:
        ver = t.get("version")
        if ver is None:
            continue
        cells.append(f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver)
        descs.append((t.get("description") or "").replace("\n", "<br>"))
    if not cells:
        return ""
    rows = [
        "| " + " | ".join(cells) + " |",
        "| " + " | ".join(":---:" for _ in cells) + " |",
    ]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")
    return "\n".join(rows)


def spoiler(label, count, targets, tbl, expanded=False):
    noun = "patch" if count == 1 else "patches"
    vtbl = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{tbl}

</details>"""


raw_ver = data["version"]
ver = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)
noun_total = "patch" if total == 1 else "patches"


def build_readme_section(expanded=False):
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;{total} {noun_total} total"
    ]
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        lines.append(spoiler(f"📦 {entry['name']}", len(patches), entry["targets"], patches_table(patches), expanded))
        lines.append("")
    if universal:
        uni_patches = list(universal.values())
        noun = "patch" if len(uni_patches) == 1 else "patches"
        tag = "<details open>" if expanded else "<details>"
        lines.append(
            f"{tag}\n<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;{len(uni_patches)} {noun}</summary>\n<br>\n\n"
            f"{patches_table(uni_patches)}\n\n</details>"
        )
        lines.append("")
    return "\n".join(lines).rstrip()


def build_patches_doc():
    sections = [
        "# Patches",
        "",
        f"> Generated from `patches-list.json` — **v{ver}** (`{branch}`) · **{total} {noun_total}** · back to [README](README.md)",
        "",
        "---",
        "",
    ]
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        sections.append(f"## {entry['name']} ({entry['package']})")
        sections.append("")
        vtbl = versions_table(entry["targets"])
        if vtbl:
            sections.append("**Supported versions:**")
            sections.append("")
            sections.append(vtbl)
            sections.append("")
        sections.append(patches_table(patches))
        sections.append("")
        sections.append("---")
        sections.append("")
    return "\n".join(sections).rstrip() + "\n"


readme = readme_path.read_text(encoding="utf-8")
start_pattern = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
end_marker = "<!-- PATCHES_END -->"

marker_match = re.search(start_pattern, readme)
if not marker_match or end_marker not in readme:
    print(build_readme_section(expanded=True))
    sys.stderr.write(f"Markers <!-- PATCHES_START [EXPANDED] --> / {end_marker} not found in {readme_path}.\n")
    sys.exit(1)

actual_start = marker_match.group(0)
expanded = total <= AUTO_EXPAND_THRESHOLD or "EXPANDED" in actual_start
generated = build_readme_section(expanded=expanded)

new_readme = re.sub(
    rf"{start_pattern}.*?{re.escape(end_marker)}",
    lambda _: f"{actual_start}\n{generated}\n{end_marker}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
patches_md_path.write_text(build_patches_doc(), encoding="utf-8")
print(f"Injected expanded patches section into {readme_path} and wrote {patches_md_path} (v{ver}, {total} patches)")
