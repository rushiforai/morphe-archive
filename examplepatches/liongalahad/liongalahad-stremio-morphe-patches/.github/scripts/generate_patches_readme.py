#!/usr/bin/env python3
"""Regenerate the README patch table from patches-list.json."""

import json
import re
import sys
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")
    sys.stderr.reconfigure(encoding="utf-8")

if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [README]")
    sys.exit(1)

repo_full = sys.argv[1]
branch = sys.argv[2]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")

if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)
data = json.loads(json_path.read_text(encoding="utf-8"))


def anchor(name):
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")


patch_order = {
    "Side-by-side installation": 100,
    "Multi-account": 200,
    "Addon reordering": 300,
}

patch_docs = {
    "Side-by-side installation": "patches/side-by-side-installation/README.md",
    "Multi-account": "patches/multi-account/README.md",
    "Addon reordering": "patches/addon-reordering/README.md",
}


def patches_table(patches):
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]
    for patch in sorted(
        patches,
        key=lambda item: (patch_order.get(item["name"], 10_000), item["name"]),
    ):
        options = patch.get("options") or []
        options_cell = "<br>".join(
            f"• {option.get('title') or option.get('key') or ''}" for option in options
        )
        description = (patch.get("description") or "").replace("\n", "<br>")
        docs = patch_docs.get(patch["name"], f"#{anchor(patch['name'])}")
        rows.append(
            f"| [{patch['name']}]({docs}) | {description} | {options_cell} |"
        )
    return "\n".join(rows)


def versions_table(targets):
    labels = []
    descriptions = []
    for target in targets:
        version = target.get("version")
        if version is None:
            continue
        labels.append(f"🧪&nbsp;{version}" if target.get("isExperimental") else version)
        descriptions.append((target.get("description") or "").replace("\n", "<br>"))
    if not labels:
        return ""
    rows = [
        "| " + " | ".join(labels) + " |",
        "| " + " | ".join(":---:" for _ in labels) + " |",
    ]
    if any(descriptions):
        rows.append("| " + " | ".join(descriptions) + " |")
    return "\n".join(rows)


by_package = {}
universal = {}
for patch in data["patches"]:
    compatible_packages = patch.get("compatiblePackages")
    if not compatible_packages:
        universal.setdefault(patch["name"], patch)
        continue
    for package in compatible_packages:
        package_name = package["packageName"]
        entry = by_package.setdefault(
            package_name,
            {
                "name": package.get("name") or package_name,
                "patches": {},
                "targets": package.get("targets", []),
            },
        )
        entry["patches"].setdefault(patch["name"], patch)


def details(label, patches, targets, expanded):
    count = len(patches)
    noun = "patch" if count == 1 else "patches"
    tag = "<details open>" if expanded else "<details>"
    versions = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{versions}\n\n" if versions else ""
    return (
        f"{tag}\n"
        f"<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>\n"
        f"<br>\n\n{versions_section}{patches_table(patches)}\n\n</details>"
    )


raw_version = data["version"]
version = raw_version.lstrip("v")
total = sum(len(entry["patches"]) for entry in by_package.values()) + len(universal)
readme = readme_path.read_text(encoding="utf-8")

start_pattern = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
end_marker = "<!-- PATCHES_END -->"
marker_match = re.search(start_pattern, readme)
if not marker_match or end_marker not in readme:
    raise RuntimeError(f"Patch table markers were not found in {readme_path}")

actual_start = marker_match.group(0)
expanded = total <= 20 or "EXPANDED" in actual_start
content = [
    f"> **[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})**"
    f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;{total} patches total"
]

for entry in by_package.values():
    content.append(
        details(
            f"📦 {entry['name']}",
            list(entry["patches"].values()),
            entry["targets"],
            expanded,
        )
    )

if universal:
    content.append(details("🌐 Universal", list(universal.values()), [], expanded))

generated = "\n".join(content)
new_readme = re.sub(
    rf"{start_pattern}.*?{re.escape(end_marker)}",
    f"{actual_start}\n{generated}\n{end_marker}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(
    f"Injected patches section into {readme_path} "
    f"(v{version}, branch={branch}, {total} patches, expanded={expanded})"
)
