#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
import os
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


by_pkg = {}
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


def build_content():
    ver   = data["version"].lstrip("v")
    total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total",
        "",
        "| App | Package | Versions | Patches |",
        "|-----|---------|----------|---------|",
    ]

    for _pkg, entry in by_pkg.items():
        app_name = entry["name"]
        package  = f"`{_pkg}`"
        targets = entry.get("targets", [])
        if targets:
            versions = ", ".join(
                f"[EXP] {t['version']}" if t.get("isExperimental") else t["version"]
                for t in targets
                if t.get("version")
            )
        else:
            versions = ""
        patch_names = sorted(entry["patches"].keys())
        if len(patch_names) == 1:
            patches = patch_names[0]
        else:
            patches = "<ul>" + "".join(f"<li>{pn}</li>" for pn in patch_names) + "</ul>"
        lines.append(f"| {app_name} | {package} | {versions} | {patches} |")

    if universal:
        uni_names = sorted(universal.keys())
        if len(uni_names) == 1:
            patches = uni_names[0]
        else:
            patches = "<ul>" + "".join(f"<li>{n}</li>" for n in uni_names) + "</ul>"
        lines.append(f"| _Universal Patches_ | | | {patches} |")

    lines.append("")
    return "\n".join(lines)


raw_ver = data["version"]
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    print(build_content())
    sys.stderr.write(
        f"ERROR: Markers not found in {readme_path}. Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

generated  = build_content()

readme = readme.replace(
    "https://morphe.software/add-source?github=xyz-user/xyz-patches",
    f"https://morphe.software/add-source?github={repo_full}"
)
readme = readme.replace(
    "https://github.com/xyz-user/xyz-patches",
    f"https://github.com/{repo_full}"
)

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches)")
