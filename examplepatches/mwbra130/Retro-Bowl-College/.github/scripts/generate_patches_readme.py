#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Spoilers always start closed (plain <details>, no "open" attribute) —
the repo owner wants readers to expand only the app they came for.

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


def pkg_emoji(pkg):
    """No emoji prefix on package labels."""
    return ""

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
                "emoji":   pkg_emoji(pkg),
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[pkg]["patches"]:
            by_pkg[pkg]["patches"][patch["name"]] = patch


def anchor(name):
    """Convert a patch name to a GitHub-compatible anchor slug."""
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")


def patches_table(patches):
    """Render a sorted markdown table of patches with name, description, and options."""
    rows = [
        "| Patch | Description | Options |",
        "|----------|----------------|-----------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        a = anchor(p["name"])
        options = p.get("options") or []
        if options:
            # Show only option titles as a bullet list
            parts = [opt.get("title") or opt.get("key") or "" for opt in options]
            opts_cell = "<br>".join(f"• {t}" for t in parts)
        else:
            opts_cell = ""
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| [{p['name']}](#{a}) | {desc} | {opts_cell} |")
    return "\n".join(rows)


def versions_table(targets):
    """Render a markdown table of supported versions.
    Experimental versions are marked.
    Versions with a description get it shown in a second row below.
    """
    if not targets:
        return ""

    cells = []
    for t in targets:
        ver   = t["version"]
        if ver is None:
            continue
        label = ver
        cells.append(label)

    if not cells:
        return ""

    header = "| " + " | ".join(cells) + " |"
    sep = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, sep]

    # Optional description row — only rendered if at least one target has one
    descs = [(t.get("description") or "").replace("\n", "<br>") for t in targets]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, tbl, expanded=False):
    """Wrap a patches table in a <details> spoiler with a versions sub-table.
    If expanded=True, the spoiler is open by default (for repos with few patches).
    """
    noun = "patch" if count == 1 else "patches"
    vtbl = versions_table(targets)
    versions_section = f"**Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{tbl}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    # One spoiler per app, in the order they appear in the JSON
    for pkg, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        label   = entry["name"]
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        noun = "patch" if len(uni_patches) == 1 else "patches"
        tag  = "<details open>" if expanded else "<details>"
        lines.append(f"""{tag}
<summary>Universal&nbsp;&nbsp;•&nbsp;&nbsp;{len(uni_patches)} {noun}</summary>
<br>

{patches_table(uni_patches)}

</details>""")
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
        f"Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

# Spoilers always start closed — no auto-expand, and an EXPANDED
# marker (kept parseable above for compatibility) no longer opens them.
expanded = False

generated  = build_content(expanded=expanded)

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

# Stamp the hand-maintained "current bundle" lines with this release's
# version so they never lag a release behind. The version comes from
# patches-list.json (.version is set by the jq step in .releaserc's
# prepareCmd just before this script runs). Patterns tolerate an
# optional prerelease suffix (dev branch versions like 1.68.0-dev.1).
_VER = r"v\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?"
readme = re.sub(
    rf"(current bundle: \[){_VER}(\]\([^)]*/tag/){_VER}(\))",
    rf"\g<1>v{ver}\g<2>v{ver}\g<3>",
    readme,
)
readme = re.sub(
    rf"(Reflects bundle ){_VER}(\.)",
    rf"\g<1>v{ver}\g<2>",
    readme,
)

# Keep the header app/patch counts in step with patches-list.json.
readme = re.sub(
    r"\*\*\d+ apps · \d+ patches\*\*",
    f"**{len(by_pkg)} apps · {total} patches**",
    readme,
    count=1,
)

# ---------- App icon grid ----------
# The grid between <!-- GRID_START --> / <!-- GRID_END --> is regenerated
# from patches-list.json on every release: app name, patch count and the
# experimental marker come from the JSON, and the picture is the app's
# Play Store icon. Icons already in the README are reused, so a picture
# is only fetched for a genuinely new app. A failed fetch never fails
# the release — the cell falls back to a placeholder and a warning is
# printed so the owner can spot it in the release commit.
GRID_EXCLUDE_PACKAGES = {
    "com.google.android.apps.messaging",  # Google Messages: patch does not work, owner keeps it out of the grid
}


def fetch_play_icon(pkg):
    """Best-effort Play Store icon URL (og:image), sized =w128-h128."""
    try:
        import urllib.request
        url = f"https://play.google.com/store/apps/details?id={pkg}&hl=en_US"
        req = urllib.request.Request(url, headers={
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36",
        })
        with urllib.request.urlopen(req, timeout=15) as resp:
            page = resp.read().decode("utf-8", "ignore")
        m = re.search(r'property="og:image" content="([^"]+)"', page) or \
            re.search(r'content="([^"]+)" property="og:image"', page)
        if not m:
            return None
        return re.sub(r"=[^=]*$", "", m.group(1)) + "=w128-h128"
    except Exception:
        return None


def build_grid(readme_text):
    known_icons = {}
    for m in re.finditer(r'<img src="([^"]+)"[^>]*>\s*<br><b>(.*?)</b>', readme_text):
        known_icons[m.group(2)] = m.group(1)
    apps = []
    for pkg, entry in by_pkg.items():
        if pkg in GRID_EXCLUDE_PACKAGES:
            continue
        name = entry["name"]
        count = len(entry["patches"])
        sub = f"{count} patch" if count == 1 else f"{count} patches"
        targets = entry.get("targets", [])
        if targets and all(t.get("isExperimental") for t in targets):
            sub += " · 🧪 experimental"
        icon = known_icons.get(name) or fetch_play_icon(pkg)
        if icon is None:
            sys.stderr.write(f"WARNING: could not fetch Play Store icon for {name} ({pkg}); using placeholder\n")
            icon = "https://placehold.co/128x128/png?text=" + name[0]
        apps.append((name, icon, sub))
    apps.sort(key=lambda a: a[0].casefold())
    cells = [
        f'<td align="center" width="20%">\n'
        f'<img src="{icon}" width="72" height="72" alt="{name} icon">\n'
        f"<br><b>{name}</b>\n"
        f"<br><sub>{sub}</sub>\n"
        f"</td>"
        for name, icon, sub in apps
    ]
    rows = ["<tr>\n" + "\n".join(cells[i:i + 5]) + "\n</tr>" for i in range(0, len(cells), 5)]
    return "<table>\n" + "\n".join(rows) + "\n</table>"


if "<!-- GRID_START -->" in readme and "<!-- GRID_END -->" in readme:
    grid = build_grid(readme)
    readme = re.sub(
        r"<!-- GRID_START -->.*?<!-- GRID_END -->",
        lambda _: f"<!-- GRID_START -->\n{grid}\n<!-- GRID_END -->",
        readme,
        flags=re.DOTALL,
    )
else:
    sys.stderr.write("WARNING: GRID_START / GRID_END markers not found; icon grid left unchanged\n")

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
