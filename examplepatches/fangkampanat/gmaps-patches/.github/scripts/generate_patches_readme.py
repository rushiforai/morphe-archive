#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

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

repo_full = sys.argv[1]
branch = sys.argv[2]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)


with open(json_path, encoding="utf-8") as file:
    data = json.load(file)


def pkg_emoji(_pkg):
    """Return a standard package emoji regardless of the package name."""
    return "📦"


# Group patches by package; patches with no compatiblePackages are universal.
by_pkg = {}
universal = {}

for patch in data["patches"]:
    compatible_packages = patch.get("compatiblePackages")
    if not compatible_packages:
        if patch["name"] not in universal:
            universal[patch["name"]] = patch
        continue

    for package_entry in compatible_packages:
        package_name = package_entry["packageName"]
        name = package_entry.get("name") or package_name
        if package_name not in by_pkg:
            by_pkg[package_name] = {
                "name": name,
                "emoji": pkg_emoji(package_name),
                "patches": {},
                "targets": package_entry.get("targets", []),
            }
        if patch["name"] not in by_pkg[package_name]["patches"]:
            by_pkg[package_name]["patches"][patch["name"]] = patch


def anchor(name):
    """Convert a patch name to a GitHub-compatible anchor slug."""
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")


def patches_table(patches):
    """Render a sorted Markdown table of patches."""
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]
    for patch in sorted(patches, key=lambda item: item["name"]):
        patch_anchor = anchor(patch["name"])
        options = patch.get("options") or []
        if options:
            parts = [option.get("title") or option.get("key") or "" for option in options]
            options_cell = "<br>".join(f"• {title}" for title in parts)
        else:
            options_cell = ""
        description = (patch.get("description") or "").replace("\n", "<br>")
        rows.append(
            f"| [{patch['name']}](#{patch_anchor}) | {description} | {options_cell} |"
        )
    return "\n".join(rows)


def versions_table(targets):
    """Render a Markdown table of supported versions."""
    if not targets:
        return ""

    cells = []
    for target in targets:
        version = target["version"]
        if version is None:
            continue
        label = f"🧪&nbsp;{version}" if target.get("isExperimental") else version
        cells.append(label)

    if not cells:
        return ""

    header = "| " + " | ".join(cells) + " |"
    separator = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, separator]

    descriptions = [
        (target.get("description") or "").replace("\n", "<br>") for target in targets
    ]
    if any(descriptions):
        rows.append("| " + " | ".join(descriptions) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, table, expanded=False):
    """Wrap a patches table in a details block with supported versions."""
    noun = "patch" if count == 1 else "patches"
    versions = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{versions}\n\n" if versions else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{table}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    total_noun = "patch" if total == 1 else "patches"
    lines = [
        f"> **[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} {total_noun} total"
    ]

    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        label = f"{entry['emoji']} {entry['name']}"
        lines.append(
            spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded)
        )
        lines.append("")

    if universal:
        universal_patches = list(universal.values())
        noun = "patch" if len(universal_patches) == 1 else "patches"
        tag = "<details open>" if expanded else "<details>"
        lines.append(
            f"""{tag}
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;{len(universal_patches)} {noun}</summary>
<br>

{patches_table(universal_patches)}

</details>"""
        )
        lines.append("")

    return "\n".join(lines)


raw_version = data["version"]
version = raw_version.lstrip("v")
total = sum(len(entry["patches"]) for entry in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

start_pattern = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
end_marker = "<!-- PATCHES_END -->"
marker_match = re.search(start_pattern, readme)

if not marker_match or end_marker not in readme:
    print(build_content(expanded=False))
    sys.stderr.write(
        f"Markers <!-- PATCHES_START [EXPANDED] --> / {end_marker} not found in "
        f"{readme_path}. Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)
auto_expand_threshold = 20
expanded = total <= auto_expand_threshold or "EXPANDED" in actual_start
generated = build_content(expanded=expanded)

new_readme = re.sub(
    rf"{start_pattern}.*?{re.escape(end_marker)}",
    f"{actual_start}\n{generated}\n{end_marker}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(
    f"Injected patches section into {readme_path} "
    f"(v{version}, branch={branch}, {total} "
    f"{'patch' if total == 1 else 'patches'}, expanded={expanded})"
)
