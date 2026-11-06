#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Output is one simple table (patch, app, app version, description). A patch name links to
docs/<patch-name>.md or docs/<app-name>-<patch-name>.md when that page exists.

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


# Emoji and label suffix for each form factor. Mobile and unspecified use no suffix.
FORM_FACTORS = {
    "TV":         ("📺", "Android TV"),
    "WEARABLE":   ("⌚", "Wear OS"),
    "AUTOMOTIVE": ("🚗", "Android Automotive"),
}


def pkg_emoji(form_factor):
    """Return the emoji for a form factor, or a standard package emoji."""
    return FORM_FACTORS.get(form_factor, ("📦", None))[0]


def pkg_label(name, form_factor):
    """Return the app name, with the form factor appended if it is not mobile."""
    suffix = FORM_FACTORS.get(form_factor, (None, None))[1]
    return f"{name} ({suffix})" if suffix else name


# Group patches by package and form factor; patches with no compatiblePackages are universal.
# The same package name can be used by different apps for each form factor.
# JSON structure: compatiblePackages is a list of objects with
# { packageName, name, formFactor, targets: [{ version, isExperimental, description }] }
by_pkg = {}   # (packageName, formFactor) -> { name, package, emoji, patches, targets }
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
        form_factor = pkg_entry.get("formFactor")
        key  = (pkg, form_factor)
        if key not in by_pkg:
            by_pkg[key] = {
                "name":    pkg_label(name, form_factor),
                "package": pkg,
                "emoji":   pkg_emoji(form_factor),
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[key]["patches"]:
            by_pkg[key]["patches"][patch["name"]] = patch


def anchor(name):
    """Convert a patch name to a GitHub-compatible anchor slug."""
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")


def doc_link(patch, app_name):
    """Return the relative link to the patch's docs page in docs/, if one exists."""
    for slug in (anchor(patch["name"]), anchor(f"{app_name} {patch['name']}")):
        if (readme_path.parent / "docs" / f"{slug}.md").exists():
            return f"docs/{slug}.md"
    return None


def version_list(targets):
    """Return the supported app versions as text, e.g. "9.30.53" or "Any"."""
    vers = [
        (f"{t['version']} (experimental)" if t.get("isExperimental") else t["version"])
        for t in targets if t.get("version")
    ]
    return ", ".join(vers) if vers else "Any"


def build_content():
    """Build the generated patches section: one simple table, one row per patch."""
    rows = [
        "| Patch | App | App version | What it does |",
        "| --- | --- | --- | --- |",
    ]

    entries = [(e["name"], e["targets"], list(e["patches"].values())) for e in by_pkg.values()]
    if universal:
        entries.append(("Any app", [], list(universal.values())))

    for app_name, targets, patches in sorted(entries, key=lambda e: e[0]):
        for p in sorted(patches, key=lambda x: x["name"]):
            link = doc_link(p, app_name)
            name = f"[{p['name']}]({link})" if link else p["name"]
            desc = (p.get("description") or "").replace("\n", " ").replace("|", "\\|")
            rows.append(f"| {name} | {app_name} | {version_list(targets)} | {desc} |")

    rows.append("")
    rows.append(
        f"<sub>Latest release: [v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})</sub>"
    )
    return "\n".join(rows)


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
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
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
print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches)")
