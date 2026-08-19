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


# Group patches by package; patches with no compatiblePackages are universal.
# JSON structure: compatiblePackages is a list of objects with
# { packageName, name, targets: [{ version, isExperimental, description }] }
by_pkg = {}   # packageName -> { name, emoji, patches, targets }
universal = {}

for patch in data["patches"]:
    cp = patch.get("compatiblePackages")
    if not cp:
        # Deduplicate universal patches by name
        if patch["name"] not in universal:
            universal[patch["name"]] = patch
        continue
    for pkg_entry in cp:
        pkg  = pkg_entry["packageName"]
        name = pkg_entry.get("name") or pkg  # fall back to package name if no label
        if pkg not in by_pkg:
            by_pkg[pkg] = {
                "name":    name,
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[pkg]["patches"]:
            by_pkg[pkg]["patches"][patch["name"]] = patch


def patches_table(patches):
    """Render a sorted markdown table of patches and descriptions."""
    rows = [
        "| Patch | Description |",
        "| --- | --- |",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| {p['name']} | {desc} |")
    return "\n".join(rows)


def versions_list(targets):
    """Render the supported versions as a compact comma-separated list."""
    if not targets:
        return ""

    versions = []
    for t in targets:
        ver   = t["version"]
        if ver is None:
            continue
        suffix = " (experimental)" if t.get("isExperimental") else ""
        versions.append(f"`{ver}`{suffix}")

    return ", ".join(versions)


def package_section(label, targets, tbl):
    """Render one package section in the repository's plain README style."""
    supported = versions_list(targets)
    versions_section = f"Supported versions: {supported}\n\n" if supported else ""
    return f"""### {label}

{versions_section}{tbl}"""


def build_content():
    """Build the full generated patches section."""
    lines = [
        f"Current bundle: [v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver}) "
        f"on `{branch}`.",
        "",
    ]

    # One section per app, in the order they appear in the JSON
    for pkg, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        label   = entry["name"]
        lines.append(package_section(label, entry["targets"], patches_table(patches)))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        lines.append(f"""### Universal patches

{patches_table(uni_patches)}""")
        lines.append("")

    return "\n".join(lines)


# Build and inject
raw_ver = data["version"]
# Strip leading "v" if present
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

# Marker pattern — matches both <!-- PATCHES_START --> and <!-- PATCHES_START EXPANDED -->
START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    # Fallback: print to stdout so CI can catch the issue
    print(build_content(expanded=False))
    sys.stderr.write(
        f"Warning: markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

generated = build_content()

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches)")
