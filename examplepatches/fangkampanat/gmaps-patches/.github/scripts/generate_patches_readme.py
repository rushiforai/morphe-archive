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

repo_full = sys.argv[1]
branch = sys.argv[2]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)


with open(json_path, encoding="utf-8") as file:
    data = json.load(file)


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
                "patches": {},
                "targets": package_entry.get("targets", []),
            }
        if patch["name"] not in by_pkg[package_name]["patches"]:
            by_pkg[package_name]["patches"][patch["name"]] = patch


def patches_table(patches):
    """Render a sorted Markdown table of patches."""
    has_options = any(patch.get("options") for patch in patches)
    columns = ["Patch", "Description"] + (["Options"] if has_options else [])
    rows = ["| " + " | ".join(columns) + " |", "| " + " | ".join("---" for _ in columns) + " |"]
    for patch in sorted(patches, key=lambda item: item["name"]):
        options = patch.get("options") or []
        if options:
            parts = [option.get("title") or option.get("key") or "" for option in options]
            options_cell = "<br>".join(f"• {title}" for title in parts)
        else:
            options_cell = ""
        description = (patch.get("description") or "").replace("\n", "<br>")
        cells = [patch["name"], description] + ([options_cell] if has_options else [])
        rows.append("| " + " | ".join(cells) + " |")
    return "\n".join(rows)


def versions_text(targets):
    """Render eligibility without implying that every version was tested."""
    versions = []
    for target in targets:
        version = target["version"]
        version = "Any version" if version is None else version
        if target.get("isExperimental"):
            version += " (experimental)"
        if target.get("description"):
            version += ": " + target["description"].replace("\n", " ")
        versions.append(version)
    return "Eligible versions: " + "; ".join(versions) + "." if versions else ""


def build_content():
    """Build the full generated patches section."""
    total_noun = "patch" if total == 1 else "patches"
    lines = [
        f"[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})"
        f" · {total} {total_noun}",
        "",
    ]

    multiple_groups = len(by_pkg) + bool(universal) > 1
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        if multiple_groups:
            lines.extend([f"### {entry['name']}", ""])
        versions = versions_text(entry["targets"])
        if versions:
            lines.extend([versions, ""])
        lines.append(patches_table(patches))
        lines.append("")

    if universal:
        if multiple_groups:
            lines.extend(["### Universal", ""])
        lines.extend([patches_table(list(universal.values())), ""])

    return "\n".join(lines).rstrip() + "\n"


raw_version = data["version"]
version = raw_version.lstrip("v")
total = sum(len(entry["patches"]) for entry in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

start_pattern = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
end_marker = "<!-- PATCHES_END -->"
marker_match = re.search(start_pattern, readme)

if not marker_match or end_marker not in readme:
    print(build_content())
    sys.stderr.write(
        f"Markers <!-- PATCHES_START [EXPANDED] --> / {end_marker} not found in "
        f"{readme_path}. Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)
generated = build_content()

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
    f"{'patch' if total == 1 else 'patches'})"
)
