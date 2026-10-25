#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from datetime import datetime, timezone
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


# Patch kind -> icon, matched on whole words of the lower-cased patch name (first match wins).
# Whole words keep "pro" from matching "promotions"/"prompts", and the "+" rule only fires on a
# word that ends in "+" (FotMob+, Premium+), not on counts like "99+".
KIND_ICONS = [
    (re.compile(r"\bads\b"), "🚫"),
    (re.compile(r"\btelemetry\b|\bfacebook sdk\b"), "🛡️"),
    (re.compile(r"\blicen[cs]e\b"), "🔑"),
    (re.compile(r"\bnotifications?\b|\bprompts?\b"), "🔕"),
    (re.compile(r"\bpremium\b|\bpro\b|\bfull version\b|\borigin\b|[a-z]\+"), "💎"),
]
# Names the word rules would misfile, keyed by the lower-cased patch name.
KIND_ICON_OVERRIDES = {
    # Hiding promotions is a layout change, not a premium unlock.
    "disable promotions": "🧩",
    "hide promotions": "🧩",
    "hide betting promotions": "🧩",
    "hide partner promotions": "🧩",
    # Hides the upsell tab; it unlocks nothing.
    "hide premium tab": "🧩",
    # Unread-counter display limits, not premium features.
    "remove 99+ unread limit": "🧩",
    "remove 300+ unread limit": "🧩",
    # These fix or keep notifications working; they do not silence them.
    "fix push notifications": "🧩",
    "read notifications without receipt": "🧩",
}
ICON_ORDER = ["🚫", "🛡️", "💎", "🔑", "🔕", "🧩"]
LEGEND = (
    "🚫 ads&nbsp;&nbsp;🛡️ telemetry / tracking&nbsp;&nbsp;💎 premium / pro&nbsp;&nbsp;"
    "🔑 license check&nbsp;&nbsp;🔕 prompts / notifications&nbsp;&nbsp;🧪 experimental"
)


def is_experimental(patch, pkg):
    """A patch is experimental for an app when every target it lists there is."""
    for entry in patch.get("compatiblePackages") or []:
        if entry["packageName"] == pkg:
            targets = entry.get("targets") or []
            return bool(targets) and all(t.get("isExperimental") for t in targets)
    return False


def kind_icon(patch):
    """What the patch does, from its name; experimental is flagged separately."""
    name = patch["name"].lower().strip()
    if name in KIND_ICON_OVERRIDES:
        return KIND_ICON_OVERRIDES[name]
    for pattern, icon in KIND_ICONS:
        if pattern.search(name):
            return icon
    return "🧩"


def version_key(version):
    """Sort key for version strings like 26.09.28, 1.3.63.0921 or 3.10.5-L."""
    return [int(part) for part in re.findall(r"\d+", version or "")]


def app_info(pkg):
    """Union of verified versions, APK type and icon colour across an app's patches."""
    versions, apk_type, color = set(), None, None
    for patch in by_pkg[pkg]["patches"].values():
        for entry in patch.get("compatiblePackages") or []:
            if entry["packageName"] != pkg:
                continue
            apk_type = apk_type or entry.get("apkFileType")
            color = color or entry.get("appIconColor")
            versions.update(t["version"] for t in entry.get("targets") or [] if t.get("version"))
    ordered = sorted(versions, key=version_key)
    return ordered, apk_type, color


def swatch(color):
    """Small square in the app's icon colour (shields.io badge with no text)."""
    hex_color = (color or "#808080").lstrip("#")
    return f'<img src="https://img.shields.io/badge/-%20-{hex_color}?style=flat-square" height="14" alt="">'


def cell(text):
    """Make text safe for a single markdown table cell."""
    return (text or "").replace("|", "\\|").replace("\r", " ").replace("\n", " ").strip()


CATEGORIES_PATH = Path(__file__).with_name("app-categories.json")
OTHER = {"name": "Other", "emoji": "📦"}


def not_on_play():
    """Packages with no Google Play listing (app-categories.json "notOnGooglePlay")."""
    with open(CATEGORIES_PATH, encoding="utf-8") as f:
        return set(json.load(f).get("notOnGooglePlay", []))


def play_link(pkg, missing):
    """Google Play listing link for the overview table, or a dash when the app is not on Play."""
    if pkg in missing:
        return "—"
    return f"[Play](https://play.google.com/store/apps/details?id={pkg})"


def load_categories():
    """Category list in display order, and package -> category index."""
    with open(CATEGORIES_PATH, encoding="utf-8") as f:
        categories = json.load(f)["categories"]
    index = {}
    for i, category in enumerate(categories):
        for pkg in category["packages"]:
            if pkg in index:
                raise ValueError(
                    f"{pkg} is listed under both '{categories[index[pkg]]['name']}' "
                    f"and '{category['name']}' in {CATEGORIES_PATH.name}"
                )
            index[pkg] = i
    return categories, index


def group_apps():
    """[(category, [packages sorted by app name])] in category order, empty ones dropped."""
    categories, index = load_categories()
    groups = [(category, []) for category in categories] + [(OTHER, [])]
    for pkg in by_pkg:
        groups[index.get(pkg, len(categories))][1].append(pkg)
    uncategorised = groups[-1][1]
    if uncategorised:
        sys.stderr.write(
            f"WARNING: no category in {CATEGORIES_PATH.name} for: {', '.join(sorted(uncategorised))}; "
            "listed under Other.\n"
        )
    return [
        (category, sorted(pkgs, key=lambda p: by_pkg[p]["name"].lstrip("#").lower()))
        for category, pkgs in groups
        if pkgs
    ]


def category_title(category, count, noun):
    return f"{category['emoji']} {category['name']} <sub>{count} {noun}{'s' if count != 1 else ''}</sub>"


def build_content():
    """Build the generated patches section: per-category overview tables plus per-app details."""
    groups = group_apps()
    missing_on_play = not_on_play()
    app_count = sum(len(pkgs) for _, pkgs in groups)
    today = datetime.now(timezone.utc).strftime("%Y-%m-%d")

    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"**{app_count}** apps&nbsp;&nbsp;•&nbsp;&nbsp;**{total}** patches"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;updated {today}",
        "",
        LEGEND,
        "",
        " · ".join(f"{category['emoji']} {category['name']}" for category, _ in groups),
    ]

    for category, pkgs in groups:
        lines += [
            "",
            f"#### {category_title(category, len(pkgs), 'app')}",
            "",
            "| | App | Patches | Latest verified | Type | Google Play |",
            "|:-:|---|---|---|:-:|:-:|",
        ]
        for pkg in pkgs:
            entry = by_pkg[pkg]
            patches = sorted(entry["patches"].values(), key=lambda x: x["name"])
            versions, apk_type, color = app_info(pkg)
            kinds = {kind_icon(p) for p in patches}
            icons = " ".join(i for i in ICON_ORDER if i in kinds)
            if any(is_experimental(p, pkg) for p in patches):
                icons += " 🧪"
            latest = f"`{versions[-1]}`" if versions else "any"
            if len(versions) > 1:
                latest += f" <sub>+{len(versions) - 1} older</sub>"
            lines.append(
                f"| {swatch(color)} | **{cell(entry['name'])}** | {icons} {len(patches)} "
                f"| {latest} | {apk_type or 'APK'} | {play_link(pkg, missing_on_play)} |"
            )

    lines += ["", "### 🔍 Patch details"]

    for category, pkgs in groups:
        lines += ["", f"#### {category['emoji']} {category['name']}", ""]
        for pkg in pkgs:
            entry = by_pkg[pkg]
            patches = sorted(entry["patches"].values(), key=lambda x: x["name"])
            versions, _, _ = app_info(pkg)
            version_list = ", ".join(f"`{v}`" for v in reversed(versions)) or "any version"
            lines += [
                "<details>",
                f"<summary><b>{entry['name']}</b> &nbsp;·&nbsp; {len(patches)} "
                f"patch{'es' if len(patches) != 1 else ''} &nbsp;·&nbsp; <code>{pkg}</code></summary>",
                "",
                f"Verified on: {version_list}",
                "",
                "| Patch | What it does | Default |",
                "|---|---|:-:|",
            ]
            for p in patches:
                flag = " 🧪" if is_experimental(p, pkg) else ""
                default = "✅" if p.get("default", True) else "➖"
                lines.append(
                    f"| {kind_icon(p)} **{cell(p['name'])}**{flag} "
                    f"| {cell(p.get('description')) or '—'} | {default} |"
                )
            lines += ["", "</details>"]

    # Universal patches (no specific app)
    if universal:
        uni_patches = sorted(universal.values(), key=lambda x: x["name"])
        lines += [
            "",
            "#### 🌐 Universal",
            "",
            "<details>",
            f"<summary><b>🌐 Universal</b> &nbsp;·&nbsp; {len(uni_patches)} patches</summary>",
            "",
            "| Patch | What it does | Default |",
            "|---|---|:-:|",
        ]
        for p in uni_patches:
            default = "✅" if p.get("default", True) else "➖"
            lines.append(f"| **{cell(p['name'])}** | {cell(p.get('description')) or '—'} | {default} |")
        lines += ["", "</details>"]

    lines += ["", "<sub>✅ on by default&nbsp;&nbsp;➖ off by default (enable it in Morphe Manager)</sub>"]
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

# A function replacement is inserted literally, so backslashes or group references in the
# generated text (e.g. the "\|" that cell() emits) can never be read as regex escapes.
replacement = f"{actual_start}\n{generated}\n{END_MARKER}"
new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    lambda _match: replacement,
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches)")
