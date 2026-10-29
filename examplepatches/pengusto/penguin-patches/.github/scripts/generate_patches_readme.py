#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

The catalogue and app details stay collapsed regardless of patch count.
Use <!-- PATCHES_START EXPANDED --> to explicitly open them instead.
Optional PATCHES_SUMMARY_START / PATCHES_SUMMARY_END markers receive a short
release summary, so the introduction stays in sync with the release catalogue.
PATCHES_PREVIEWS_START / PATCHES_PREVIEWS_END embed each released image pair
from the evidence gallery; FINAMP_COUNT_START / FINAMP_COUNT_END sync its CTA.

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import html
import json
import posixpath
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
readme = readme_path.read_text(encoding="utf-8")
inline_previews = "<!-- PATCHES_PREVIEWS_START -->" in readme


def pkg_emoji(pkg):
    """Return a standard package emoji regardless of the package name."""
    return "📦"

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


# Keep release metadata unchanged; these are documentation destinations only.
GUIDES = {
    "org.fossify.calendar": "docs/CALENDAR.md",
    "org.fossify.messages": "docs/MESSAGES.md",
    "org.fossify.filemanager": "docs/FILE_MANAGER.md",
    "org.fossify.contacts": "docs/CONTACTS.md",
    "org.fossify.musicplayer": "docs/MUSIC.md",
    "de.mm20.launcher2.release": "docs/KVAESITSO.md",
    "org.fossify.clock": "docs/CLOCK.md",
    "org.tasks": "docs/TASKS.md",
    "com.nononsenseapps.feeder": "docs/FEEDER.md",
    "me.ash.reader": "docs/READYOU.md",
    "com.unicornsonlsd.finamp": "docs/FINAMP_NATIVE.md",
    "ml.docilealligator.infinityforreddit.plus": "docs/INFINITY.md",
}
PATCH_GUIDES = {
    "Separate all-day reminder defaults": "docs/CALENDAR_REMINDERS.md",
}
EXAMPLES_PATH = Path(__file__).resolve().parents[2] / "docs/PATCH_EXAMPLES.md"
gallery = EXAMPLES_PATH.read_text(encoding="utf-8").split("\n## About these comparisons", 1)[0]
EXAMPLES = dict(re.findall(r'<a id="([^"]+)"></a>(.*?)(?=\n<a id=|\Z)', gallery, re.DOTALL))


def patches_table(patches, guide=None):
    """Render a sorted markdown table of patches with name, description, and options."""
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
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
        destination = PATCH_GUIDES.get(p["name"], guide)
        label = f"[{p['name']}]({destination})" if destination else p["name"]
        if a in EXAMPLES:
            example = f"#preview-{a}" if inline_previews else f"docs/PATCH_EXAMPLES.md#{a}"
            label += f"<br>[Before / after]({example})"
        # Preserve incoming README patch links, including the template's slug.
        legacy = ""
        if "'" in p["name"]:
            github_slug = anchor(p["name"].replace("'", ""))
            legacy = f'<a id="{github_slug}"></a>'
        rows.append(f'| <a id="{a}"></a>{legacy}{label} | {desc} | {opts_cell} |')
    return "\n".join(rows)


def versions_table(targets):
    """Render a markdown table of supported versions.
    Experimental versions get a 🧪 prefix.
    Versions with a description get it shown in a second row below.
    """
    if not targets:
        return ""

    cells = []
    for t in targets:
        ver   = t["version"]
        if ver is None:
            continue
        label = f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver
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
    If expanded=True, the spoiler is explicitly open by default.
    """
    noun = "patch" if count == 1 else "patches"
    vtbl = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{tbl}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    tag = "<details open>" if expanded else "<details>"
    app_noun = "app" if len(by_pkg) == 1 else "apps"
    patch_noun = "patch" if total == 1 else "patches"
    lines = [
        tag,
        f"<summary><strong>All {len(by_pkg)} {app_noun} and supported versions</strong></summary>",
        "",
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} {patch_noun} total"
    ]

    # One spoiler per app, in the order they appear in the JSON
    for pkg, entry in by_pkg.items():
        patches = list(entry["patches"].values())
        label   = f"{entry['emoji']} {entry['name']}"
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches, GUIDES.get(pkg)), expanded))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        noun = "patch" if len(uni_patches) == 1 else "patches"
        tag  = "<details open>" if expanded else "<details>"
        lines.append(f"""{tag}
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;{len(uni_patches)} {noun}</summary>
<br>

{patches_table(uni_patches)}

</details>""")
        lines.append("")

    lines.append("</details>")
    return "\n".join(lines)


def preview_section(patch):
    """Reuse the original evidence and baseline labels at README-relative paths."""
    slug = anchor(patch["name"])
    if slug not in EXAMPLES:
        raise ValueError(f"Missing before/after evidence for {patch['name']}")
    section = EXAMPLES[slug].strip()
    alts = re.findall(r'<img [^>]*alt="([^"]+)"', section)
    if len(alts) != 2 or not alts[0].startswith("Before:") or not alts[1].startswith("After:"):
        raise ValueError(f"Expected labelled Before/After image pair for {patch['name']}")

    def root_target(target):
        if target == "#before--after":
            return "#patch-previews"
        if target.startswith(("#", "/")) or re.match(r"[a-zA-Z][a-zA-Z0-9+.-]*:", target):
            return target
        return posixpath.normpath(posixpath.join("docs", target))

    section = re.sub(r'(?<=src=")[^"]+', lambda m: root_target(m[0]), section)
    section = re.sub(r'(?<=\]\()[^)]+', lambda m: root_target(m[0]), section)
    # Keep the fragment target outside the disclosure: GitHub does not open a
    # collapsed ancestor automatically when a README link targets its contents.
    section = re.sub(r"^## [^\n]+\n+", "", section, count=1)
    return (f'<a id="preview-{slug}"></a>\n\n<details>\n'
            f'<summary><strong>{html.escape(patch["name"])}</strong> · Before / after</summary>\n<br>\n\n'
            f'{section}\n\n</details>')


def build_previews():
    """Keep every released patch's image pair inside the README, grouped by app."""
    featured = ("com.unicornsonlsd.finamp", "com.nononsenseapps.feeder",
                "ml.docilealligator.infinityforreddit.plus")
    order = sorted(by_pkg, key=lambda pkg: (
        featured.index(pkg) if pkg in featured else len(featured), by_pkg[pkg]["name"].lower()))
    sections = []
    for pkg in order:
        entry = by_pkg[pkg]
        count = len(entry["patches"])
        sections.append(
            f'<a id="previews-{anchor(pkg)}"></a>\n\n'
            f'### {entry["name"]} · {count} {"patch" if count == 1 else "patches"}\n\n'
            + "\n\n".join(preview_section(p) for p in entry["patches"].values())
        )
    if universal:
        sections.append('### Universal patches\n\n'
                        + "\n\n".join(preview_section(p) for p in universal.values()))
    return "\n\n".join(sections)


# Build and inject
raw_ver = data["version"]
# Strip leading "v" if present
ver   = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

# Marker pattern — matches both <!-- PATCHES_START --> and <!-- PATCHES_START EXPANDED -->
START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER    = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    # Fallback: print to stdout so CI can catch the issue
    print(build_content(expanded=False))
    sys.stderr.write(
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

expanded = "EXPANDED" in actual_start

generated  = build_content(expanded=expanded)

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    lambda _: f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
summary = (
    f"**{total} {'patch' if total == 1 else 'patches'} · "
    f"{len(by_pkg)} {'app' if len(by_pkg) == 1 else 'apps'} · "
    f"[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
)
new_readme = re.sub(
    r"(<!-- PATCHES_SUMMARY_START -->).*?(<!-- PATCHES_SUMMARY_END -->)",
    lambda m: f"{m[1]}\n{summary}\n{m[2]}",
    new_readme,
    flags=re.DOTALL,
)
if inline_previews:
    if "<!-- PATCHES_PREVIEWS_END -->" not in new_readme:
        raise ValueError("Missing PATCHES_PREVIEWS_END marker")
    previews = build_previews()
    new_readme = re.sub(
        r"<!-- PATCHES_PREVIEWS_START -->.*?<!-- PATCHES_PREVIEWS_END -->",
        lambda _: f"<!-- PATCHES_PREVIEWS_START -->\n{previews}\n<!-- PATCHES_PREVIEWS_END -->",
        new_readme, flags=re.DOTALL,
    )
finamp_count = len(by_pkg.get("com.unicornsonlsd.finamp", {}).get("patches", {}))
new_readme = re.sub(
    r"<!-- FINAMP_COUNT_START -->.*?<!-- FINAMP_COUNT_END -->",
    lambda _: (f"<!-- FINAMP_COUNT_START -->\n**[Explore the {finamp_count} Finamp "
               f"{'patch' if finamp_count == 1 else 'patches'} →](docs/FINAMP_NATIVE.md)**\n"
               "<!-- FINAMP_COUNT_END -->"),
    new_readme, flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
