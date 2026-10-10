#!/usr/bin/env python3
import json
import sys
from collections import defaultdict
from pathlib import Path

START = "<!-- PATCHES_START -->"
END = "<!-- PATCHES_END -->"
BADGES_START = "<!-- BADGES_START -->"
BADGES_END = "<!-- BADGES_END -->"


def md_escape(value):
    return str(value or "").replace("|", "\\|").replace("\n", " ").strip()


def load(path):
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def listed_patches(data):
    """Patches tied to a specific app. Universal helper patches are serialized with
    "compatiblePackages": null, so they are skipped here."""
    return [p for p in data.get("patches", []) if p.get("compatiblePackages")]


def build_badges(data):
    total = len(listed_patches(data))
    return f"""<p align="center">
  <a href="https://github.com/rahul9999xda/morphe-patches/releases/latest"><img src="https://img.shields.io/github/v/release/rahul9999xda/morphe-patches?label=RELEASE&style=flat-square&color=D4A72C" alt="Latest release"></a>
  <img src="https://img.shields.io/github/downloads/rahul9999xda/morphe-patches/latest/total?label=DOWNLOADS&style=flat-square&color=2F80ED" alt="Downloads">
  <img src="https://img.shields.io/github/last-commit/rahul9999xda/morphe-patches?label=UPDATED&style=flat-square&color=42B85A" alt="Updated">
</p>

<p align="center">
  <a href="https://github.com/rahul9999xda/morphe-patches/stargazers"><img src="https://img.shields.io/github/stars/rahul9999xda/morphe-patches?label=STARS&style=flat-square&color=D4A72C" alt="Stars"></a>
  <img src="https://img.shields.io/badge/PATCHES-{total}-D05A9B?style=flat-square" alt="Patches">
</p>

<p align="center">
  <a href="https://github.com/rahul9999xda/morphe-patches/actions/workflows/build-test-mpp.yml"><img src="https://img.shields.io/github/actions/workflow/status/rahul9999xda/morphe-patches/build-test-mpp.yml?label=BUILD&style=flat-square" alt="Build status"></a>
  <a href="https://github.com/rahul9999xda/morphe-patches/blob/main/LICENSE"><img src="https://img.shields.io/badge/LICENSE-GPLv3-42B85A?style=flat-square" alt="GPLv3 license"></a>
</p>

<p align="center">
  <a href="https://morphe.software/add-source?github=rahul9999xda/morphe-patches"><img src="https://img.shields.io/badge/MORPHE-ADD%20THIS%20SOURCE-18AEEB?style=flat-square" alt="Add this source to Morphe"></a>
</p>"""


def build_section(data):
    apps = defaultdict(lambda: {"patches": {}, "versions": set()})

    for patch in listed_patches(data):
        name = patch.get("name") or "Unnamed patch"
        description = md_escape(patch.get("description"))
        for pkg in patch.get("compatiblePackages") or []:
            app = pkg.get("name") or pkg.get("packageName")
            if not app:
                continue
            entry = apps[app]["patches"]
            if name not in entry or not entry[name]:
                entry[name] = description
            for target in pkg.get("targets") or []:
                version = target.get("version")
                if version:
                    apps[app]["versions"].add(str(version))

    lines = ["## 🩹 Patches list", ""]
    total = len(listed_patches(data))
    version = str(data.get("version") or "")
    if version:
        lines.append(f"> [v{md_escape(version)}](https://github.com/rahul9999xda/morphe-patches/releases/tag/v{md_escape(version)}) · `main` · **{total} patches total**")
    else:
        lines.append(f"> `main` · **{total} patches total**")
    lines.extend(["", ""])

    for app in sorted(apps, key=str.casefold):
        info = apps[app]
        count = len(info["patches"])
        versions = sorted(info["versions"], key=str.casefold)
        lines.append("<details>")
        lines.append(f"<summary><strong>{md_escape(app)}</strong> · {count} {'patch' if count == 1 else 'patches'}</summary>")
        lines.append("")
        lines.append("🎯 **Supported versions:**")
        lines.append("")
        lines.append("  |  ".join(f"`{md_escape(v)}`" for v in versions) if versions else "`Any version`")
        lines.extend(["", "---", "", "| 💊 Patch | 📜 Description |", "| --- | --- |"])
        for patch_name in sorted(info["patches"], key=str.casefold):
            lines.append(f"| **{md_escape(patch_name)}** | {info['patches'][patch_name]} |")
        lines.extend(["", "</details>", ""])

    return "\n".join(lines).rstrip() + "\n"


def replace_marked(readme, start_marker, end_marker, replacement):
    if start_marker not in readme or end_marker not in readme:
        raise SystemExit(f"README must contain {start_marker} and {end_marker} markers")
    start_pos = readme.index(start_marker) + len(start_marker)
    end_pos = readme.index(end_marker)
    if end_pos < start_pos:
        raise SystemExit(f"README markers are in the wrong order: {start_marker}")
    return readme[:start_pos] + "\n" + replacement.rstrip() + "\n" + readme[end_pos:]


def update_readme(readme_path, section, data):
    path = Path(readme_path)
    readme = path.read_text(encoding="utf-8")
    readme = replace_marked(readme, BADGES_START, BADGES_END, build_badges(data))
    readme = replace_marked(readme, START, END, section)
    path.write_text(readme, encoding="utf-8")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("Usage: generate_patches_readme.py patches-list.json README.md")
    data = load(sys.argv[1])
    update_readme(sys.argv[2], build_section(data), data)
