#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

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


def pkg_emoji(pkg):
    """Return a standard package emoji regardless of the package name."""
    return "📦"

# Group patches by package; patches with no compatiblePackages are universal.
by_pkg = {}   # packageName -> { name, emoji, patches }
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
                "emoji":   pkg_emoji(pkg),
                "patches": {},
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[pkg]["patches"]:
            by_pkg[pkg]["patches"][patch["name"]] = patch


def build_content():
    """Build the generated patches section: one bullet list of patch names per app."""
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    # One section per app, in the order they appear in the JSON
    for pkg, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        lines.append("")
        lines.append(f"**{entry['emoji']} {entry['name']}** ({len(patches)})")
        for p in sorted(patches, key=lambda x: x["name"]):
            lines.append(f"- {p['name']}")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        lines.append("")
        lines.append(f"**🌐 Universal** ({len(uni_patches)})")
        for p in sorted(uni_patches, key=lambda x: x["name"]):
            lines.append(f"- {p['name']}")

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
    print(build_content())
    sys.stderr.write(
        f"WARNING: Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
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
