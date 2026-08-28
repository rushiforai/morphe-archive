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


with open(json_path, encoding="utf-8") as f:
    data = json.load(f)


def pkg_emoji(pkg):
    """Return a standard package emoji regardless of the package name."""
    return "📦"


# Group patches by package; patches with no compatiblePackages are universal.
# JSON structure: compatiblePackages is a list of objects with
# { packageName, name, targets: [{ version, isExperimental, description }] }
by_pkg = {}
universal = {}

for patch in data["patches"]:
    compatible_packages = patch.get("compatiblePackages")

    if not compatible_packages:
        # Deduplicate universal patches by name.
        if patch["name"] not in universal:
            universal[patch["name"]] = patch
        continue

    for pkg_entry in compatible_packages:
        package_name = pkg_entry["packageName"]
        display_name = pkg_entry.get("name") or package_name

        if package_name not in by_pkg:
            by_pkg[package_name] = {
                "name": display_name,
                "emoji": pkg_emoji(package_name),
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }

        # Deduplicate patches within each package.
        if patch["name"] not in by_pkg[package_name]["patches"]:
            by_pkg[package_name]["patches"][patch["name"]] = patch


def anchor(name):
    """Convert a patch name to a GitHub-compatible anchor slug."""
    return re.sub(
        r"-+",
        "-",
        re.sub(r"[^a-z0-9]+", "-", name.lower()),
    ).strip("-")


def patches_table(patches):
    """Render a sorted Markdown table of patches with name, description, and options."""
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]

    for patch in sorted(patches, key=lambda item: item["name"]):
        patch_anchor = anchor(patch["name"])
        options = patch.get("options") or []

        if options:
            option_titles = [
                option.get("title") or option.get("key") or ""
                for option in options
            ]
            options_cell = "<br>".join(f"• {title}" for title in option_titles)
        else:
            options_cell = ""

        description = (patch.get("description") or "").replace("\n", "<br>")

        rows.append(
            f"| [{patch['name']}](#{patch_anchor}) | "
            f"{description} | {options_cell} |"
        )

    return "\n".join(rows)


def versions_table(targets):
    """
    Render a Markdown table of supported versions.

    Experimental versions get a 🧪 prefix.
    Versions with a description get it shown in a second row below.
    """
    versioned_targets = [
        target
        for target in targets
        if target.get("version") is not None
    ]

    if not versioned_targets:
        return ""

    cells = []

    for target in versioned_targets:
        version = target["version"]
        label = (
            f"🧪&nbsp;{version}"
            if target.get("isExperimental")
            else version
        )
        cells.append(label)

    header = "| " + " | ".join(cells) + " |"
    separator = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, separator]

    descriptions = [
        (target.get("description") or "").replace("\n", "<br>")
        for target in versioned_targets
    ]

    if any(descriptions):
        rows.append("| " + " | ".join(descriptions) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, table, expanded=False):
    """
    Wrap a patches table in a <details> block with a versions sub-table.

    If expanded=True, the block is open by default.
    """
    noun = "patch" if count == 1 else "patches"
    version_table = versions_table(targets)

    versions_section = (
        f"**🎯 Supported versions:**\n\n{version_table}\n\n"
        if version_table
        else ""
    )

    tag = "<details open>" if expanded else "<details>"

    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{table}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    lines = [
        f"> **[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    # One block per app, in the order they appear in the JSON.
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        label = f"{entry['emoji']} {entry['name']}"

        lines.append(
            spoiler(
                label,
                len(patches),
                entry["targets"],
                patches_table(patches),
                expanded,
            )
        )
        lines.append("")

    # Universal patches with no specific target app.
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


# Build and inject.
raw_version = data["version"]
version = raw_version.lstrip("v")
total = sum(len(entry["patches"]) for entry in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    print(build_content(expanded=False))
    sys.stderr.write(
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} "
        f"not found in {readme_path}. Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

AUTO_EXPAND_THRESHOLD = 20

expanded = (
    total <= AUTO_EXPAND_THRESHOLD
    or "EXPANDED" in actual_start
)

generated = build_content(expanded=expanded)

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)

readme_path.write_text(new_readme, encoding="utf-8")

print(
    f"✅ Injected patches section into {readme_path} "
    f"(v{version}, branch={branch}, {total} patches, expanded={expanded})"
)