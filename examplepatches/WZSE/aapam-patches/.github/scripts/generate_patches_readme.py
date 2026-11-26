#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Spoilers are collapsed by default to keep the README compact, unless the marker
explicitly says: <!-- PATCHES_START EXPANDED -->

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


def md_cell(text):
    """Escape pipes and collapse newlines for markdown table cells."""
    return (text or "").replace("|", "\\|").replace("\n", "<br>")


def format_version(target):
    """Format a version label as inline code, marking experimental targets."""
    ver = target.get("version")
    if not ver:
        return None
    return f"🧪 `{ver}`" if target.get("isExperimental") else f"`{ver}`"


# Group patches by package; patches with no compatiblePackages are universal.
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
                "patches": {},
                "targets": [],
                "patch_versions": {},  # patch_name -> set of version strings (None = all)
            }

        entry = by_pkg[pkg]
        entry["patches"].setdefault(patch["name"], patch)

        existing_versions = {t["version"]: t for t in entry["targets"] if t.get("version")}
        targets = pkg_entry.get("targets") or []

        specific_vers = []
        for target in targets:
            ver_str = target.get("version")
            if not ver_str:
                continue
            specific_vers.append(ver_str)
            if ver_str not in existing_versions:
                entry["targets"].append(target)
                existing_versions[ver_str] = target
            elif target.get("description") and not existing_versions[ver_str].get("description"):
                existing_versions[ver_str]["description"] = target["description"]

        pv = entry["patch_versions"].setdefault(patch["name"], set())
        if specific_vers:
            pv.update(specific_vers)
        else:
            pv.add(None)


def patches_table(patches, all_versions=None, patch_versions=None):
    """Render a compact markdown table of deduplicated patches.

    Includes a Versions column only when an app has multiple versions and
    patches differ in which versions they support.
    Includes an Options column only when at least one patch defines options.
    """
    all_versions = all_versions or []
    patch_versions = patch_versions or {}

    show_versions = False
    if len(all_versions) > 1:
        all_ver_set = set(all_versions)
        for p in patches:
            pv = patch_versions.get(p["name"], set())
            if None not in pv and pv != all_ver_set:
                show_versions = True
                break

    show_options = any(p.get("options") for p in patches)

    headers = ["Patch", "Description"]
    aligns = [":---", ":---"]
    if show_versions:
        headers.append("Versions")
        aligns.append(":---")
    if show_options:
        headers.append("Options")
        aligns.append(":---")

    rows = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join(aligns) + " |",
    ]

    for p in sorted(patches, key=lambda x: x["name"].lower()):
        cells = [
            f"**{md_cell(p['name'])}**",
            md_cell(p.get("description")),
        ]

        if show_versions:
            pv = patch_versions.get(p["name"], set())
            if None in pv or pv == set(all_versions):
                cells.append("All")
            else:
                ordered = [f"`{v}`" for v in all_versions if v in pv]
                cells.append(", ".join(ordered))

        if show_options:
            options = p.get("options") or []
            if options:
                parts = [md_cell(opt.get("title") or opt.get("key") or "") for opt in options]
                cells.append("<br>".join(f"• {t}" for t in parts))
            else:
                cells.append("")

        rows.append("| " + " | ".join(cells) + " |")

    return "\n".join(rows)


def summary_table():
    """Render an at-a-glance index of all apps, supported versions, and patch counts."""
    rows = [
        "| App | Supported Versions | Patches |",
        "| :--- | :--- | :---: |",
    ]
    for entry in by_pkg.values():
        vers = [format_version(t) for t in entry["targets"] if t.get("version")]
        ver_cell = ", ".join(vers) if vers else "Any"
        count = len(entry["patches"])
        rows.append(f"| **{md_cell(entry['name'])}** | {ver_cell} | {count} |")

    if universal:
        rows.append(f"| **Universal** | Any | {len(universal)} |")

    return "\n".join(rows)


def version_notes(targets):
    """Render optional target version notes if any exist."""
    notes = []
    for t in targets:
        desc = t.get("description")
        ver = t.get("version")
        if desc and ver:
            notes.append(f"> **{ver}:** {desc.replace(chr(10), ' ')}")
    return ("\n".join(notes) + "\n\n") if notes else ""


def app_details(entry, expanded=False):
    """Render a single flat <details> block for an app."""
    patches = list(entry["patches"].values())
    all_versions = [t["version"] for t in entry["targets"] if t.get("version")]
    noun = "patch" if len(patches) == 1 else "patches"
    tag = "<details open>" if expanded else "<details>"

    if not all_versions:
        ver_hint = "Any version"
    elif len(all_versions) <= 2:
        ver_hint = ", ".join(f"<code>{v}</code>" for v in all_versions)
    else:
        ver_hint = f"{len(all_versions)} versions"

    tbl = patches_table(patches, all_versions, entry["patch_versions"])
    notes = version_notes(entry["targets"])

    return f"""{tag}
<summary><b>{entry['name']}</b> — {len(patches)} {noun} ({ver_hint})</summary>
<br>

{notes}{tbl}

</details>"""


def build_content(expanded=False):
    """Build the compact generated patches section."""
    app_count = len(by_pkg)
    app_noun = "app" if app_count == 1 else "apps"
    patch_noun = "patch" if total == 1 else "patches"

    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f" · `{branch}` · {total} {patch_noun} across {app_count} {app_noun}",
        "",
        summary_table(),
        "",
    ]

    for entry in by_pkg.values():
        lines.append(app_details(entry, expanded=expanded))
        lines.append("")

    if universal:
        uni_patches = list(universal.values())
        noun = "patch" if len(uni_patches) == 1 else "patches"
        tag = "<details open>" if expanded else "<details>"
        lines.append(f"""{tag}
<summary><b>Universal</b> — {len(uni_patches)} {noun}</summary>
<br>

{patches_table(uni_patches)}

</details>""")
        lines.append("")

    return "\n".join(lines).rstrip()


raw_ver = data["version"]
ver = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    print(build_content(expanded=False))
    sys.stderr.write(
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)
expanded = "EXPANDED" in actual_start
generated = build_content(expanded=expanded)

readme = readme.replace(
    "https://morphe.software/add-source?github=xyz-user/xyz-patches",
    f"https://morphe.software/add-source?github={repo_full}",
)
readme = readme.replace(
    "https://github.com/xyz-user/xyz-patches",
    f"https://github.com/{repo_full}",
)

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
try:
    print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
except UnicodeEncodeError:
    print(f"[OK] Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
