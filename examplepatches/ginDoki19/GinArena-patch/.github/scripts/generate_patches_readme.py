#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Spoilers are collapsed by default. They are expanded (open) only if the
README marker explicitly says: <!-- PATCHES_START EXPANDED -->

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
import os
import unicodedata
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
by_pkg = {}   # (packageName, formFactor) -> { name, emoji, patches, targets }
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
                "emoji":   pkg_emoji(form_factor),
                "patches": {},
                "targets": pkg_entry.get("targets", []),
            }
        # Deduplicate patches that appear across multiple packages
        if patch["name"] not in by_pkg[key]["patches"]:
            by_pkg[key]["patches"][patch["name"]] = patch


# Unicode general categories github-slugger 2.0.0 keeps: letters, combining marks and
# numbers except the "No" group (superscripts, vulgar fractions). Everything else is deleted.
ANCHOR_CATEGORIES = frozenset({
    "Lu", "Ll", "Lt", "Lm", "Lo",   # letters
    "Mn", "Mc", "Me",               # combining marks
    "Nd", "Nl",                     # decimal and letter numbers
})


def anchor(name):
    """Convert a patch name to the anchor GitHub actually generates for the heading.

    GitHub's rule (github-slugger) is NOT "replace punctuation runs with a hyphen". It
    DELETES every character that is not a letter, mark or number, keeps space / "-" / "_",
    then turns each remaining space into a hyphen. Those rules differ whenever punctuation
    sits between spaces:

        "Remove ads & bloat"    -> GitHub: remove-ads--bloat      (two hyphens)
                                -> old:    remove-ads-bloat       (one)  X dead link

    Fidelity: checked against github-slugger 2.0.0 on all 63,461 single-codepoint cases in
    the BMP and on 4,026 random strings. 156 single-codepoint cases differ - characters the
    library's character table does not know yet, Arabic Extended-B (U+0870+) being the largest
    group - and none of them occurs in any patch name in this repo.
    The category test (rather than str.isalnum()) is what keeps combining marks: a name typed
    as "e" + U+0301 slugs like the precomposed "e-acute", as GitHub does it.

    Deliberately NOT the same as the checker's heading_text(): a patch name is placed into a
    heading as-is, so this must not read it as Markdown. A name "a__b" stays "a__b", which is
    what GitHub renders for that heading too.

    Fixed 2026-11-14. Six README rows were dead because of this.
    """
    kept = [
        c for c in name.strip().lower()
        if c in " -_" or unicodedata.category(c) in ANCHOR_CATEGORIES
    ]
    return "".join(kept).replace(" ", "-")


# A pipe that is already escaped by an odd run of backslashes must not be escaped twice.
PIPE_RUN = re.compile(r"(?<!\\)(\\*)\|")


def esc_prose(text):
    """Make a value safe inside one Markdown table cell written as prose.

    Order matters. Angle brackets are escaped on the raw text, and the "<br>" for a line
    break is inserted afterwards, so the tag this script writes is never escaped and no
    placeholder character has to be juggled. A pipe splits the cell whatever follows it, so
    it is escaped - unless the text already escaped it with an odd number of backslashes, in
    which case escaping it again would produce a literal backslash followed by a real split.

    Ampersands are left alone: they are written literally in this README, and switching them
    to entities would change how already-published text reads.
    """
    s = str(text or "").replace("<", "&lt;").replace(">", "&gt;")
    s = s.replace("\n", "<br>")
    return PIPE_RUN.sub(lambda m: m.group(1) + ("|" if len(m.group(1)) % 2 else r"\|"), s)


def esc_link_text(text):
    """Like esc_prose, plus the two characters that would end a link's label early."""
    return esc_prose(text).replace("[", r"\[").replace("]", r"\]")


def split_cells(row):
    """Split a table row on its unescaped pipes."""
    cells, buf, i = [], [], 0
    while i < len(row):
        if row[i] == "\\":
            buf.append(row[i:i + 2]); i += 2; continue
        if row[i] == "|":
            cells.append("".join(buf)); buf = []; i += 1; continue
        buf.append(row[i]); i += 1
    cells.append("".join(buf))
    return cells


def table_row(cells):
    """Join cells into a row and refuse to emit one that is not a clean row.

    Cheaper than noticing a broken table on GitHub: if a value ever slips through escaping
    with a pipe in it, the build stops here instead of publishing a mangled README.
    """
    row = "| " + " | ".join(cells) + " |"
    got = len(split_cells(row)) - 2          # the two empty cells outside the outer pipes
    if got != len(cells):
        raise SystemExit(
            f"refusing to write a malformed table row ({got} cells, "
            f"expected {len(cells)}): {row[:160]}"
        )
    return row


def patches_table(patches):
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
            opts_cell = "<br>".join(f"• {esc_prose(t)}" for t in parts)
        else:
            opts_cell = ""
        rows.append(table_row([
            f"[{esc_link_text(p['name'])}](#{a})",
            esc_prose(p.get("description")),
            opts_cell,
        ]))
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
        label = f"🧪&nbsp;{esc_prose(ver)}" if t.get("isExperimental") else esc_prose(ver)
        cells.append(label)

    if not cells:
        return ""

    header = "| " + " | ".join(cells) + " |"
    sep = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, sep]

    # Optional description row — only rendered if at least one target has one
    descs = [esc_prose(t.get("description")) for t in targets]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, tbl, expanded=False):
    """Wrap a patches table in a <details> spoiler with a versions sub-table.
    If expanded=True, the spoiler is open by default (for repos with few patches).
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


def download_url():
    """Direct link to this release's .mpp asset.

    Prefers patches-bundle.json, which @MorpheApp/changelog rewrites before this script runs
    (plugin order in .releaserc: changelog -> gradle -> exec). Falls back to the same template
    the changelog plugin uses, so the two can never disagree. A stale bundle file is detected
    by checking that it points at *this* version.
    """
    bundle = json_path.parent / "patches-bundle.json"
    if bundle.exists():
        try:
            d = json.loads(bundle.read_text(encoding="utf-8"))
            url = d.get("download_url") or ""
            # Compare the version FIELD, not a substring of the URL: an asset name that omits
            # the version would otherwise be rejected and silently replaced.
            if url and str(d.get("version", "")).lstrip("v") == ver:
                return url
        except (json.JSONDecodeError, OSError):
            pass
    return f"https://github.com/{owner}/{repo}/releases/download/v{ver}/patches-{ver}.mpp"


def build_content(expanded=False):
    """Build the full generated patches section."""
    url = download_url()
    asset = url.rsplit("/", 1)[-1] or f"patches-{ver}.mpp"   # label matches the real file
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"**[⬇️ Download {asset}]({url})**"
    ]

    # One spoiler per app, in the order they appear in the JSON
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        label   = f"{entry['emoji']} {entry['name']}"
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded))
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
        f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

# Spoilers stay collapsed unless the README marker explicitly requests
# expansion: <!-- PATCHES_START EXPANDED -->
expanded = "EXPANDED" in actual_start

generated  = build_content(expanded=expanded)

# Replace template links if present
readme = readme.replace("https://morphe.software/add-source?github=xyz-user/xyz-patches", f"https://morphe.software/add-source?github={repo_full}")
readme = readme.replace("https://github.com/xyz-user/xyz-patches", f"https://github.com/{repo_full}")

# A function, not a replacement string. re.sub reads a string replacement as a template:
# "\\1" raises "invalid group reference", "\\x41" raises "bad escape", and "\\n" turns into a
# real newline that splits a table row. Any of those in a patch description used to crash the
# release - or, for "\\n", quietly break the table - because the generated text is passed
# straight through as the replacement.
new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    lambda _m: f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total} patches, expanded={expanded})")
