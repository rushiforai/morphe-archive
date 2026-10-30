#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Spoilers are expanded (open by default) if:
  1. Total patch count <= AUTO_EXPAND_THRESHOLD.
  2. The README marker explicitly says: <!-- PATCHES_START EXPANDED -->

python3 generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md] [counterpart.json]
"""

import json
import re
import sys
import os
from pathlib import Path


if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme] [counterpart.json]")
    sys.exit(1)

repo_full   = sys.argv[1]
branch      = sys.argv[2]
json_path   = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")
counterpart_path = Path(sys.argv[5]) if len(sys.argv) > 5 else None


if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full} (expected owner/repo)")

owner, repo = repo_full.split("/", 1)


with open(json_path, encoding="utf-8") as f:
    data = json.load(f)
source_version = data['version'].lstrip('v')
prerelease_data = None
if counterpart_path:
    counterpart = json.loads(counterpart_path.read_text())
    if counterpart:
        if '<!-- PATCHES_START SUMMARY -->' not in readme_path.read_text():
            raise ValueError('Counterpart metadata requires the summary table format')
        current_is_preview = bool(re.match(r'^v?\d+\.\d+\.\d+-', data['version']))
        other_is_preview = bool(re.match(r'^v?\d+\.\d+\.\d+-', counterpart['version']))
        if current_is_preview == other_is_preview:
            raise ValueError('Expected one stable and one prerelease catalogue')
        if current_is_preview:
            data, prerelease_data = counterpart, data
        else:
            prerelease_data = counterpart


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
    return f"{name} ({suffix})" if suffix and not name.endswith(suffix) else name


def entry_versions(entry):
    return sorted({str(target['version']) for patch in entry['patches'].values()
                   for package in patch.get('compatiblePackages') or []
                   if package['packageName'] == entry['package'] and package.get('formFactor') == entry['form_factor']
                   for target in package.get('targets', [])})


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
                "form_factor": form_factor,
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
            opts_cell = "<br>".join(f"• {t}" for t in parts)
        else:
            opts_cell = ""
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| [{p['name']}](#{a}) | {desc} | {opts_cell} |")
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


def spoiler(label, package, count, targets, tbl, expanded=False):
    """Wrap a patches table in a <details> spoiler with a versions sub-table.
    If expanded=True, the spoiler is open by default (for repos with few patches).
    """
    noun = "patch" if count == 1 else "patches"
    vtbl = versions_table(targets)
    package_line = f"**Package name:** `{package}`\n\n"
    versions_section = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{package_line}{versions_section}{tbl}

</details>"""


def build_content(expanded=False):
    """Build the full generated patches section."""
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    # One spoiler per app, in the order they appear in the JSON
    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        label   = f"{entry['emoji']} {entry['name']}"
        lines.append(spoiler(label, entry["package"], len(patches), entry["targets"], patches_table(patches), expanded))
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

# Marker pattern: original full catalogue, EXPANDED, or compact SUMMARY.
START_PATTERN = r"<!-- PATCHES_START(?:\s+(?:EXPANDED|SUMMARY))?\s*-->"
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

# Auto-expand threshold
AUTO_EXPAND_THRESHOLD = 20

# Spoilers are expanded if:
# 1. Total patch count is small (≤ AUTO_EXPAND_THRESHOLD)
#    with only a few patches where collapsing adds no benefit.
# 2. The README marker explicitly requests it: <!-- PATCHES_START EXPANDED -->
expanded = (
    total <= AUTO_EXPAND_THRESHOLD or
    "EXPANDED" in actual_start
)

if 'SUMMARY' in actual_start:
    # The full per-patch descriptions live on the bilingual documentation site.
    # Keep the original full-catalogue behaviour for existing normal markers.
    # Use the same channel comparison as the homepage; only table presentation
    # combines channels. Neither source metadata file is changed.
    sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
    from generate_docs_catalog import _app_groups, _app_profile
    if prerelease_data:
        stable_groups = _app_groups(data)
        for key, group in _app_groups(prerelease_data).items():
            package = group['package']
            preview = {
                'name': pkg_label(package['name'], package.get('formFactor')),
                'package': package['packageName'], 'form_factor': package.get('formFactor'),
                'patches': {patch['name']: patch for patch, _ in group['patches']},
                'targets': package.get('targets', []),
            }
            if key not in by_pkg:
                by_pkg[key] = dict(preview, prerelease_only=True)
            elif _app_profile(stable_groups[key]) != _app_profile(group):
                by_pkg[key]['prerelease'] = preview
    elif re.match(r'^v?\d+\.\d+\.\d+-', data['version']):
        for entry in by_pkg.values():
            entry['prerelease_only'] = True
    slugs = {
        'be.persgroep.android.news.mobiledm': 'demorgen',
        'be.humo.tvgids': 'humo',
        'be.persgroep.android.news.mobilehln': 'hln',
        'com.twipemobile.nbmobile': 'nieuwsblad',
        'com.twipemobile.dsmobile': 'dsnieuws',
        'com.talpa.kijk': 'kijk-android-tv',
        'nl.uitzendinggemist': 'npo-start-android-tv',
        'nl.tvgids': 'tvgids-nl',
        'nl.rtl.videoland.v2': 'videoland-android-tv',
        'nl.marktplaats.android': 'marktplaats',
        'nl.negentwee': '9292',
        'com.supportware.Buienradar': 'buienradar', 'nl.flitsmeister': 'flitsmeister', 'nl.dumpert': 'dumpert',
        'nl.rtl.rtlnieuws': 'rtl-nieuws', 'nl.omroepbrabant.android': 'omroep-brabant',
        'nl.vi': 'voetbal-international',
        'com.eoffice.android': 'nos-teletekst',
        'be.persgroep.android.news.mobilead': 'ad', 'org.yoki.android.buienalarm': 'buienalarm',
        'nl.ftm.ftmpulse': 'ftm', 'com.twipemobile.nrc': 'nrc',
        'nl.sanomamedia.android.nu': 'nunl', 'be.persgroep.android.news.mobilepa': 'parool',
        'be.persgroep.android.news.mobiletr': 'trouw', 'be.persgroep.android.news.mobilevk': 'volkskrant',
        'com.xs2theworld.weeronline': 'weeronline', 'nl.weerplaza.app': 'weerplaza',
    }
    site = 'https://morphe-patches.neerdael.nl'
    if prerelease_data:
        preview_version = prerelease_data['version'].lstrip('v')
        lines = [f'**Patch bundles:** [Stable v{ver}](https://github.com/{repo_full}/releases/tag/v{ver}) · '
                 f'[Pre-release v{preview_version}](https://github.com/{repo_full}/releases/tag/v{preview_version}) · {len(by_pkg)} apps']
    else:
        lines = [f'**Patch bundle [v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})** · `{branch}` · {len(by_pkg)} apps · {total} patches']
    categories = [
        ('Weather', {'buienalarm', 'buienradar', 'weeronline', 'weerplaza'}),
        ('News and reading', {'demorgen', 'humo', 'hln', 'nieuwsblad', 'dsnieuws', 'ad', 'ftm', 'nrc', 'nunl', 'parool', 'trouw', 'volkskrant', 'rtl-nieuws', 'omroep-brabant', 'voetbal-international', 'nos-teletekst'}),
        ('Traffic and navigation', {'9292', 'flitsmeister'}),
        ('Entertainment', {'dumpert', 'tvgids-nl', 'kijk-android-tv', 'npo-start-android-tv', 'videoland-android-tv'}),
        ('Other apps', {'marktplaats'}),
    ]
    for category, members in categories:
        entries = [entry for entry in by_pkg.values()
                   if slugs.get(entry['package']) in members or
                   (category == 'Other apps' and entry['package'] not in slugs)]
        if not entries:
            continue
        lines += ['', f'### {category}', '', '| App | Changes | Target app versions | Input | Patches |',
                  '| --- | --- | --- | --- | --- |']
        for entry in sorted(entries, key=lambda e: e['name'].casefold()):
            slug = slugs.get(entry['package'])
            link = f'{site}/apps/{slug}/' if slug else f'{site}/apps/'
            if branch == 'dev' and slug:
                link = f'https://github.com/{repo_full}/blob/dev/docs/site/en/apps/{slug}.md'
            preview = entry.get('prerelease')
            patches = [*entry['patches'].values(), *(preview['patches'].values() if preview else [])]
            packages = [cp for p in patches for cp in (p.get('compatiblePackages') or [])
                        if cp['packageName'] == entry['package'] and cp.get('formFactor') == entry['form_factor']]
            versions = sorted({str(t['version']) for cp in packages for t in cp.get('targets', [])})
            version_text = ', '.join(versions)
            if preview and entry_versions(entry) != entry_versions(preview):
                version_text = ', '.join(entry_versions(entry)) + ' (stable)<br>' + ', '.join(entry_versions(preview)) + ' (pre-release)'
            formats = ', '.join(sorted({cp.get('apkFileType', '—') for cp in packages}))
            names = {patch['name'] for patch in patches}
            changes = [label for label, present in [
                ('Ads', 'Hide ads' in names), ('Tracking', 'Disable tracking' in names),
                ('Prompts', any(n in names for n in ('Skip consent screens', 'Hide Premium banner', 'Hide Pro notices'))),
                ('Articles', 'Read full articles' in names),
                ('Plus/Pro', any(n.startswith('Unlock ') for n in names)),
                ('Compatibility', any(n.startswith('Fix ') for n in names)),
                ('Partner services', 'Disable partner services' in names),
                ('Newspaper tab', 'Hide newspaper tab' in names),
            ] if present]
            badge = ' **Pre-release**' if preview or entry.get('prerelease_only') else ''
            count = f"{len(entry['patches'])} stable / {len(preview['patches'])} pre-release" if preview else str(len(entry['patches']))
            lines.append(f"| [{entry['name']}]({link}){badge} | {' · '.join(changes) or 'See guide'} | {version_text} | {formats} | {count} |")
    if universal:
        lines += ['', f'**Universal patches:** {len(universal)}. See individual compatibility in the full catalogue.']
    catalogue = f'{site}/reference/catalogue/'
    english_catalogue = f'{site}/en/reference/catalogue/'
    if branch == 'dev':
        catalogue = f'https://github.com/{repo_full}/blob/dev/docs/site/nl/reference/catalogue.md'
        english_catalogue = f'https://github.com/{repo_full}/blob/dev/docs/site/en/reference/catalogue.md'
    lines += ['', f'[Full descriptions, defaults and build targets]({catalogue}) · '
              f'[English]({english_catalogue})', '',
              'Targets and defaults vary by patch; the bundle version is separate from each app version.']
    generated = '\n'.join(lines)
else:
    generated = build_content(expanded=expanded)

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
print(f"✅ Injected patches section into {readme_path} (v{source_version}, branch={branch}, expanded={expanded})")
