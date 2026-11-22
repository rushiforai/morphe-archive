#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Versions listed in tested-versions.json (package name -> [versions]) appear in
the "Tested" column; any other declared target appears as user-reported.
Only the latest version of each kind is shown.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md] [tested-versions.json]
"""

import json
import re
import sys
import urllib.error
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from html import escape, unescape
from pathlib import Path


# Display Play Store app icons in the generated patches list.
INCLUDE_APP_ICONS = False

# Optional icon URL or path relative to README.md, keyed by package name.
ICON_OVERRIDES = {
    "universal": ".github/assets/universal-icon.svg",
    # "com.example.app": "https://example.com/icon.png",
}


if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme] [tested-json]")
    sys.exit(1)

repo_full   = sys.argv[1]
branch      = sys.argv[2]
json_path   = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")
tested_path = Path(sys.argv[5]) if len(sys.argv) > 5 else Path("tested-versions.json")


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)

# Redirects /<package name> to the Play Store icon, or returns 404 if unavailable.
PLAY_STORE_ICON_URL = "https://publicmetadata.co.uk"
BLANK_ICON_PATH = ".github/assets/blank-app-icon.svg"


with open(json_path, encoding="utf-8") as f:
    data = json.load(f)

# package name -> versions verified by the maintainer; anything else is user-reported
tested_map = {}
if tested_path.exists():
    with open(tested_path, encoding="utf-8") as f:
        tested_map = json.load(f)


# Emoji and label suffix for each form factor. Mobile and unspecified use no suffix.
FORM_FACTORS = {
    "TV":         ("📺", "Android TV"),
    "WEARABLE":   ("⌚", "Wear OS"),
    "AUTOMOTIVE": ("🚗", "Android Automotive"),
}


def pkg_emoji(form_factor):
    """Return the emoji for a non-mobile form factor, or None for standard apps."""
    return FORM_FACTORS.get(form_factor, (None, None))[0]


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


def app_label(entry):
    """Return the app name with any non-mobile form factor emoji."""
    return f"{entry['emoji']} {entry['name']}" if entry["emoji"] else entry["name"]


def app_icon(package_name, size=24):
    """Return an app icon, or an empty string when icons are off or unavailable."""
    if not INCLUDE_APP_ICONS:
        return ""
    src = icons.get(package_name) if package_name else ICON_OVERRIDES.get("universal")
    if not src:
        return ""
    return f'<img src="{escape(src)}" width="{size}" height="{size}" alt="">'


class _NoRedirectHandler(urllib.request.HTTPRedirectHandler):
    """Make a redirect raise an HTTPError instead of following it."""

    def redirect_request(self, *args, **kwargs):
        return None


_no_redirect_opener = urllib.request.build_opener(_NoRedirectHandler)


def icon_api_status(url):
    """Return the icon API's HTTP status, or None if the request failed."""
    request = urllib.request.Request(
        url, method="HEAD", headers={"User-Agent": "patches-readme-generator"}
    )
    try:
        with _no_redirect_opener.open(request, timeout=15) as response:
            return response.status
    except urllib.error.HTTPError as ex:
        return ex.code
    except OSError as ex:
        sys.stderr.write(f"Icon lookup failed for {url}: {ex}\n")
        return None


def existing_icons(readme_text):
    """Return existing README icons keyed by their displayed app label."""
    found = {}
    for line in readme_text.splitlines():
        cells = line.split("|")
        if len(cells) < 3:
            continue
        app_cell = cells[1].strip()
        img = re.search(r'<img src="([^"]*)"', app_cell)
        if img:
            label = re.sub(r"^<img[^>]*>\s*", "", app_cell)
            found[unescape(label)] = unescape(img.group(1))
    return found


def resolve_icon(package_name, current):
    """Resolve an app icon, retaining an existing one without another lookup."""
    override = ICON_OVERRIDES.get(package_name)
    if override:
        return override
    if current:
        return current

    api_url = f"{PLAY_STORE_ICON_URL}/{package_name}"
    status = icon_api_status(api_url)
    if status is not None and 300 <= status < 400:
        print(f"Found icon for {package_name}")
        return api_url
    if status == 404:
        print(f"No icon for {package_name}, using the blank icon")
        return BLANK_ICON_PATH

    sys.stderr.write(f"Icon lookup failed for {package_name} (HTTP {status}), will retry next run\n")
    return None


def resolve_icons(package_names, existing):
    """Resolve missing app icons in parallel."""
    with ThreadPoolExecutor(max_workers=8) as executor:
        resolved = executor.map(
            lambda name: resolve_icon(name, existing.get(name)), package_names
        )
        return dict(zip(package_names, resolved))


def latest_version(targets, package, want_tested):
    """Return the last declared target version in the tested or reported bucket."""
    tested_versions = set(tested_map.get(package, []))
    result = None
    for t in targets:
        ver = t["version"]
        if ver is None:
            continue
        if (ver in tested_versions) == want_tested:
            result = f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver
    return result or "—"


def options_cell(patch):
    """Render option titles as a bullet list, or an empty cell."""
    options = patch.get("options") or []
    return "<br>".join(f"• {opt.get('title') or opt.get('key') or ''}" for opt in options)


def build_content():
    """Build the full generated patches section."""
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total",
        "",
    ]

    # Options column only exists when at least one patch declares options
    any_options = any(
        p.get("options")
        for e in by_pkg.values() for p in e["patches"].values()
    ) or any(p.get("options") for p in universal.values())
    opts_header = " | ⚙️&nbsp;Options" if any_options else ""
    opts_sep    = " |--------" if any_options else ""

    lines += [
        f"| 📦&nbsp;App | 💊&nbsp;Patch | ⚡&nbsp;Function{opts_header} | ✅&nbsp;Tested | 👤&nbsp;User-reported |",
        f"|-----|--------|----------{opts_sep}|---------|----------------|",
    ]
    for entry in by_pkg.values():
        # Unlock Premium first, the rest alphabetical
        patches  = sorted(entry["patches"].values(), key=lambda x: (x["name"] != "Unlock Premium", x["name"]))
        tested   = latest_version(entry["targets"], entry["package"], want_tested=True)
        reported = latest_version(entry["targets"], entry["package"], want_tested=False)
        label = app_label(entry)
        icon = app_icon(entry["package"])
        app_cell = f"{icon} {label}" if icon else label
        for i, p in enumerate(patches):
            desc = (p.get("description") or "").replace("\n", "<br>")
            opts = f" | {options_cell(p)}" if any_options else ""
            lines.append(
                f"| {app_cell if i == 0 else ''} | {p['name']} | {desc}{opts}"
                f" | {tested} | {reported} |"
            )

    # Universal patches (no specific app)
    if universal:
        universal_icon = app_icon(None)
        lines += [
            "",
            f"**{universal_icon or '🌐'} Universal patches**",
            "",
            f"| 💊&nbsp;Patch | ⚡&nbsp;Function{opts_header} |",
            f"|--------|----------{opts_sep}|",
        ]
        for p in sorted(universal.values(), key=lambda x: x["name"]):
            desc = (p.get("description") or "").replace("\n", "<br>")
            opts = f" | {options_cell(p)}" if any_options else ""
            lines.append(f"| {p['name']} | {desc}{opts} |")

    return "\n".join(lines)


# Build and inject
raw_ver = data["version"]
# Strip leading "v" if present
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

icons = {}
if INCLUDE_APP_ICONS:
    existing_by_label = existing_icons(readme)
    existing = {
        entry["package"]: existing_by_label[app_label(entry)]
        for entry in by_pkg.values()
        if app_label(entry) in existing_by_label
    }
    package_names = sorted({entry["package"] for entry in by_pkg.values()})
    icons = resolve_icons(package_names, existing)

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
