#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Each app gets a collapsible section with a table of its patches. The first app's
section is open; with <!-- PATCHES_START EXPANDED --> all of them are.

If the README also has <!-- APP_BADGES_START --> / <!-- APP_BADGES_END --> markers,
the badges between them are rewritten with each app's supported version.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path
from urllib.parse import quote


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


# Label suffix for each form factor. Mobile and unspecified use no suffix.
FORM_FACTORS = {
    "TV":         "Android TV",
    "WEARABLE":   "Wear OS",
    "AUTOMOTIVE": "Android Automotive",
}

# Simple Icons slug for each app's badge. Apps not listed get their name as the label instead.
APP_LOGOS = {
    "com.instagram.android":                 "instagram",
    "com.google.android.apps.youtube.music": "youtubemusic",
    "com.spotify.music":                     "spotify",
}

BADGE_COLOR       = "0B0B0F"
BADGE_LABEL_COLOR = "30363d"


def pkg_label(name, form_factor):
    """Return the app name, with the form factor appended if it is not mobile."""
    suffix = FORM_FACTORS.get(form_factor)
    return f"{name} ({suffix})" if suffix else name


# Group patches by package and form factor; patches with no compatiblePackages are universal.
# The same package name can be used by different apps for each form factor.
# JSON structure: compatiblePackages is a list of objects with
# { packageName, name, formFactor, targets: [{ version, isExperimental, description }] }
by_pkg = {}   # (packageName, formFactor) -> { package, name, patches, targets }
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
                "package": pkg,
                "name":    pkg_label(name, form_factor),
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[key]["patches"]:
            by_pkg[key]["patches"][patch["name"]] = patch


def anchor(name):
    """Convert a patch name to a GitHub-compatible anchor slug."""
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")


# Patch names used by more than one app (e.g. "Liquid Glass navigation bar" for Instagram and
# Spotify) link to "<name> (<app>)" sections, so each row reaches its own app's section.
_name_apps = {}
for _entry in by_pkg.values():
    for _name in _entry["patches"]:
        _name_apps.setdefault(_name, set()).add(_entry["name"])
shared_names = {n for n, apps in _name_apps.items() if len(apps) > 1}


def patches_table(patches, app=None):
    """Render a sorted markdown table of patches: name, description and whether Morphe Manager selects it."""
    rows = [
        "| Patch | What it does | Selected |",
        "|-------|--------------|:--------:|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        a = anchor(f"{p['name']} ({app})" if app and p["name"] in shared_names else p["name"])
        desc = (p.get("description") or "").replace("\n", "<br>").replace("|", "\\|")
        selected = "Yes" if p.get("default", True) else "No"
        rows.append(f"| [{p['name']}](#{a}) | {desc} | {selected} |")
    return "\n".join(rows)


def versions_text(targets):
    """The supported versions as text, experimental ones marked."""
    out = []
    for t in targets:
        ver = t.get("version")
        if ver is None:
            continue
        out.append(f"{ver} (experimental)" if t.get("isExperimental") else ver)
    return ", ".join(out)


def section(label, count, targets, tbl, open_):
    """Wrap a patches table in a collapsible section."""
    noun = "patch" if count == 1 else "patches"
    versions = versions_text(targets)
    details = f"{count} {noun}, {versions}" if versions else f"{count} {noun}"
    tag = "<details open>" if open_ else "<details>"
    return f"""{tag}
<summary><b>{label}</b>&nbsp;&nbsp;{details}</summary>
<br>

{tbl}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    lines = [
        f"**[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**, {total} patches. "
        "Click a patch for its settings and how it works.",
        "",
    ]

    # One section per app, in the order they appear in the JSON
    for i, entry in enumerate(by_pkg.values()):
        patches = list(entry["patches"].values())
        lines.append(section(entry["name"], len(patches), entry["targets"],
                             patches_table(patches, entry["name"]), expanded or i == 0))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        lines.append(section("Universal", len(uni_patches), [], patches_table(uni_patches), expanded))
        lines.append("")

    return "\n".join(lines)


def badge_escape(text):
    """Escape text for a shields.io static badge path."""
    return quote(text.replace("-", "--").replace("_", "__"), safe="")


def app_badges():
    """One shields.io badge per app with its first supported version."""
    badges = []
    for entry in by_pkg.values():
        versions = [t["version"] for t in entry["targets"] if t.get("version") is not None]
        if not versions:
            continue
        version = versions[0]
        logo = APP_LOGOS.get(entry["package"])
        params = f"style=flat&labelColor={BADGE_LABEL_COLOR}"
        if logo:
            url = f"https://img.shields.io/badge/{badge_escape(version)}-{BADGE_COLOR}?{params}&logo={logo}&logoColor=white"
        else:
            url = f"https://img.shields.io/badge/{badge_escape(entry['name'])}-{badge_escape(version)}-{BADGE_COLOR}?{params}"
        badges.append(f'  <img alt="{entry["name"]} {version}" src="{url}">')
    return "\n".join(badges)


# Build and inject
raw_ver = data["version"]
# Strip leading "v" if present
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

# Marker pattern: matches both <!-- PATCHES_START --> and <!-- PATCHES_START EXPANDED -->
START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    # Fallback: print to stdout so CI can catch the issue
    print(build_content(expanded=False))
    sys.stderr.write(
        f"Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

# Every app's section is open only when the README marker asks for it: <!-- PATCHES_START EXPANDED -->
expanded = "EXPANDED" in actual_start

generated = build_content(expanded=expanded)

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    lambda _: f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)

# The app version badges, if the README has a place for them
BADGES_START = "<!-- APP_BADGES_START -->"
BADGES_END   = "<!-- APP_BADGES_END -->"
if BADGES_START in new_readme and BADGES_END in new_readme:
    new_readme = re.sub(
        rf"{re.escape(BADGES_START)}.*?{re.escape(BADGES_END)}",
        lambda _: f"{BADGES_START}\n{app_badges()}\n  {BADGES_END}",
        new_readme,
        flags=re.DOTALL,
    )

readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
