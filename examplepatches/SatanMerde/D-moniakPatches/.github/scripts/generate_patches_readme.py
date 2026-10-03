#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

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
    """Return a standard package emoji regardless of the package name."""
    return "📦"

# Group patches by package; patches with no compatiblePackages are universal.
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
    """Render a sorted markdown table of patches with name and description."""
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description |",
        "|----------|----------------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        a = anchor(p["name"])
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| [{p['name']}](#{a}) | {desc} |")
    return "\n".join(rows)


def versions_table(targets):
    """Render a markdown table of supported versions."""
    if not targets:
        return ""

    cells = []
    for t in targets:
        ver = t["version"]
        if ver is None:
            continue
        label = f"🧪&nbsp;{ver}" if t.get("isExperimental") else ver
        cells.append(label)

    if not cells:
        return ""

    header = "| " + " | ".join(cells) + " |"
    sep = "| " + " | ".join(":---:" for _ in cells) + " |"
    rows = [header, sep]

    descs = [(t.get("description") or "").replace("\n", "<br>") for t in targets]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")

    return "\n".join(rows)


def spoiler(label, count, targets, tbl, expanded=True):
    """Wrap a patches table in a <details> spoiler."""
    noun = "patch" if count == 1 else "patches"
    vtbl = versions_table(targets)
    versions_section = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return f"""{tag}
<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>
<br>

{versions_section}{tbl}

</details>"""


def build_content(expanded=True):
    """Build the full generated patches section separated by functional and experimental."""
    total_unique = len(data.get("patches", []))
    total_exp = sum(1 for p in data.get("patches", []) if "(Experimental)" in p.get("name", ""))
    total_func = total_unique - total_exp

    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"**{total_unique} patchs au total** ({total_func} validés & fonctionnels • {total_exp} expérimentaux)",
        "",
        "---",
        "",
        "### ✅ Patchs validés & fonctionnels / Tested & Functional Patches",
        "",
        "> [!TIP]",
        "> **🇫🇷 Français :** Ces patchs ont été rigoureusement testés et confirmés pleinement opérationnels sur appareil réel.  ",
        "> **🇬🇧 English :** These patches have been thoroughly tested and confirmed fully functional on real hardware.",
        ""
    ]

    # Sort apps alphabetically
    sorted_apps = sorted(by_pkg.items(), key=lambda item: item[1]["name"].lower())

    func_apps = []
    for pkg, entry in sorted_apps:
        f_patches = {name: p for name, p in entry["patches"].items() if "(Experimental)" not in p["name"]}
        if f_patches:
            func_apps.append((pkg, {
                "name": entry["name"],
                "emoji": entry["emoji"],
                "patches": f_patches,
                "targets": entry["targets"],
            }))

    exp_apps = []
    for pkg, entry in sorted_apps:
        e_patches = {name: p for name, p in entry["patches"].items() if "(Experimental)" in p["name"]}
        if e_patches:
            exp_apps.append((pkg, {
                "name": entry["name"],
                "emoji": entry["emoji"],
                "patches": e_patches,
                "targets": entry["targets"],
            }))

    # Functional apps
    for pkg, entry in func_apps:
        patches = list(entry["patches"].values())
        label = f"{entry['emoji']} {entry['name']}"
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded=True))
        lines.append("")

    # Experimental apps
    lines.extend([
        "---",
        "",
        "### 🧪 Patchs expérimentaux (en développement) / Experimental Patches (AI-Generated)",
        "",
        "> [!WARNING]",
        "> **🇫🇷 Risque très élevé de non-fonctionnement :** Ces patchs sont générés par IA et n'ont pas encore été testés sur appareils réels. Les chances qu'ils ne marchent pas sont très élevées.  ",
        "> 💡 **Vous voulez qu'un patch fonctionne ?** [Faites une demande dédiée sur GitHub](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=patch_request.yml) pour qu'il soit rétro-ingénié et rendu 100% opérationnel à la prochaine mise à jour !",
        ">",
        "> <br>",
        ">",
        "> **🇬🇧 High Failure Rate Notice:** These patches are AI-generated and haven't been tested on real hardware yet. The chances of failure are high.  ",
        "> 💡 **Want a patch to work?** [Submit a request here](https://github.com/SatanMerde/D-moniakPatches/issues/new?template=patch_request.yml) to prioritize reverse-engineering and make it fully functional in the next update!",
        ""
    ])

    for pkg, entry in exp_apps:
        patches = list(entry["patches"].values())
        label = f"{entry['emoji']} {entry['name']}"
        lines.append(spoiler(label, len(patches), entry["targets"], patches_table(patches), expanded=True))
        lines.append("")

    # Universal patches (no specific app)
    if universal:
        uni_patches = list(universal.values())
        noun = "patch" if len(uni_patches) == 1 else "patches"
        lines.append(f"""<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;{len(uni_patches)} {noun}</summary>
<br>

{patches_table(uni_patches)}

</details>""")
        lines.append("")

    return "\n".join(lines)


# Build and inject
raw_ver = data["version"]
ver = raw_ver.lstrip("v")
total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

readme = readme_path.read_text(encoding="utf-8")

START_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER = "<!-- PATCHES_END -->"

marker_match = re.search(START_PATTERN, readme)

if not marker_match or END_MARKER not in readme:
    print(build_content(expanded=True))
    sys.stderr.write(
        f"⚠️ Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_path}. "
        "Printed to stdout instead.\n"
    )
    sys.exit(1)

actual_start = marker_match.group(0)

generated = build_content(expanded=True)

total_apps = len(by_pkg)
total_unique = len(data.get("patches", []))
total_exp = sum(1 for p in data.get("patches", []) if "(Experimental)" in p.get("name", ""))
total_func = total_unique - total_exp

# Update badge counters in README if present
readme = re.sub(
    r'(https://img\.shields\.io/badge/Patches-)\d+(-[0-9a-fA-F]+)',
    rf'\g<1>{total_unique}\g<2>',
    readme
)
readme = re.sub(
    r'(https://img\.shields\.io/badge/Fonctionnels-)\d+(-[0-9a-fA-F]+)',
    rf'\g<1>{total_func}\g<2>',
    readme
)
readme = re.sub(
    r'(https://img\.shields\.io/badge/Expérimentaux-)\d+(-[0-9a-fA-F]+)',
    rf'\g<1>{total_exp}\g<2>',
    readme
)
readme = re.sub(
    r'(https://img\.shields\.io/badge/Apps(?:_Support%C3%A9es)?-)\d+(-[0-9a-fA-F]+)',
    rf'\g<1>{total_apps}\g<2>',
    readme
)

# Export endpoint JSONs for Shields.io dynamic badge endpoints
try:
    badges_dir = Path(".github/badges")
    badges_dir.mkdir(parents=True, exist_ok=True)
    (badges_dir / "apps.json").write_text(json.dumps({
        "schemaVersion": 1,
        "label": "Apps",
        "message": str(total_apps),
        "color": "00C853"
    }, indent=2), encoding="utf-8")
    (badges_dir / "patches.json").write_text(json.dumps({
        "schemaVersion": 1,
        "label": "Patches",
        "message": str(total_unique),
        "color": "8A2BE2"
    }, indent=2), encoding="utf-8")
except Exception:
    pass

new_readme = re.sub(
    rf"{START_PATTERN}.*?{re.escape(END_MARKER)}",
    f"{actual_start}\n{generated}\n{END_MARKER}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
try:
    print(f"✅ Injected patches section into {readme_path} (v{ver}, branch={branch}, {total_unique} patches, {total_apps} apps)")
except UnicodeEncodeError:
    print(f"[OK] Injected patches section into {readme_path} (v{ver}, branch={branch}, {total_unique} patches, {total_apps} apps)")
