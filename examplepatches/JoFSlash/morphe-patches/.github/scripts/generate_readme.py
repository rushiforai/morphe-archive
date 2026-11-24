#!/usr/bin/env python3
"""
Writes an app's patch list in its docs/<app>/README.md from patches-list.json, between the
<!-- PATCHES_START --> and <!-- PATCHES_END --> markers, and its supported versions between
<!-- VERSIONS_START --> and <!-- VERSIONS_END -->. The app's settings are in .github/apps/<app>.json:
"package" picks its patches out of the merged bundle, "readme" says how its list is written.

"readme" has one of two styles:

- "generated": the list is written from the patches' descriptions, one folded table per category,
  in the order of "order" (other categories after it, by name), each with its "intro" line.
- "kept": the README's rows are written by hand (short texts, links to patches.md), so they are
  kept. The script only fixes the Default column and the counts, drops the rows of patches that
  are gone, adds a row for a new patch from its description to its category's table (a new
  category gets its own table at the end) and rewrites the summary line. "sections" maps a
  category in the code to the README's section name, where they differ.

python3 generate_readme.py <app> <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def cell(text):
    return (text or "").replace("|", "\\|").replace("\n", " ")


def spoken(items):
    return items[0] if len(items) == 1 else ", ".join(items[:-1]) + " and " + items[-1]


def anchor(name):
    return re.sub(r"[^a-z0-9 -]", "", name.lower()).replace(" ", "-")


def generated_list(app, settings, patches, version, versions):
    order = settings.get("order", [])
    intro = settings.get("intro", {})
    lines = [
        f"Version {version}, {len(patches)} patches. Supported {app['name']} versions: {', '.join(versions) or 'any'}.",
        "",
    ]
    categories = order + sorted({p.get("category") or "Other" for p in patches.values()} - set(order))
    for category in categories:
        group = sorted((p for p in patches.values() if (p.get("category") or "Other") == category),
                       key=lambda p: p["name"].lower())
        if not group:
            continue
        # Each group folds, so the list doesn't push the rest of the README down.
        lines += ["<details>", f"<summary><b>{category}</b> ({len(group)})</summary>", ""]
        if category in intro:
            lines += [intro[category], ""]
        lines += ["| Patch | Default | What it does |", "| --- | --- | --- |"]
        for p in group:
            options = [o.get("title") or o.get("key") for o in p.get("options") or []]
            desc = cell(p.get("description"))
            if options:
                desc += " Options: " + ", ".join(cell(o) for o in options) + "."
            lines.append(f"| {cell(p['name'])} | {'on' if p.get('default') else 'off'} | {desc} |")
        lines += ["", "</details>", ""]
    return "\n".join(lines).rstrip()


def kept_list(app, settings, patches, versions, block, details_path):
    section_names = settings.get("sections", {})

    def section_of(patch):
        category = patch.get("category") or "Other"
        return section_names.get(category, category)

    detail_headings = set()
    if details_path.exists():
        detail_headings = {m.group(1).strip() for m in
                           re.finditer(r"^### (.+)$", details_path.read_text(encoding="utf-8"), re.MULTILINE)}

    # Read the sections the README has: <details> with a summary, an intro and a table.
    sections = []
    for m in re.finditer(r"<details( open)?>\n<summary><b>(.+?)</b> \(\d+\)</summary>\n(.*?)</details>",
                         block, re.DOTALL):
        body = m.group(3)
        intro = body.split("| Patch |")[0].strip()
        rows = {}
        for line in body.splitlines():
            row = re.match(r"\| (\[(.+?)\]\(.*?\)|[^|]+?) \| (on|off) \| (.*) \|$", line)
            if row:
                rows[(row.group(2) or row.group(1)).strip()] = line
        sections.append({"open": bool(m.group(1)), "name": m.group(2), "intro": intro, "rows": rows})

    for name in sorted({section_of(p) for p in patches.values()} - {s["name"] for s in sections}):
        sections.append({"open": False, "name": name, "intro": "", "rows": {}})

    lines = []
    for section in sections:
        group = [n for n in section["rows"] if n in patches and section_of(patches[n]) == section["name"]]
        group += sorted((n for n, p in patches.items() if section_of(p) == section["name"] and n not in group),
                        key=str.lower)
        if not group:
            continue
        lines += [f"<details{' open' if section['open'] else ''}>",
                  f"<summary><b>{section['name']}</b> ({len(group)})</summary>", ""]
        if section["intro"]:
            lines += [section["intro"], ""]
        lines += ["| Patch | Default | What it does |", "| --- | --- | --- |"]
        for name in group:
            default = "on" if patches[name].get("default") else "off"
            if name in section["rows"]:
                lines.append(re.sub(r" \| (on|off) \| ", f" | {default} | ", section["rows"][name], count=1))
            else:
                link = f"[{cell(name)}](patches.md#{anchor(name)})" if name in detail_headings else cell(name)
                lines.append(f"| {link} | {default} | {cell(patches[name].get('description'))} |")
        lines += ["", "</details>", ""]

    off = sorted((n for n, p in patches.items() if not p.get("default")), key=str.lower)
    summary = f"{len(patches)} patches, " + (f"all on by default except {spoken(off)}." if off else "all on by default.")
    summary += f" Supported {app['name']} versions: {', '.join(versions) or 'any'}."
    return "\n".join([summary, ""] + lines).rstrip()


def main():
    if len(sys.argv) < 4:
        sys.exit("Usage: generate_readme.py <app> <owner/repo> <branch> [patches-list.json] [README.md]")
    key, repo = sys.argv[1], sys.argv[2]
    app_path = ROOT / ".github" / "apps" / f"{key}.json"
    if not app_path.exists():
        sys.exit(f"No app {key}: there is no {app_path.relative_to(ROOT)}")
    app = json.loads(app_path.read_text(encoding="utf-8"))
    settings = app.get("readme")
    if not settings or settings.get("style") not in ("generated", "kept"):
        sys.exit(f"{key}: \"readme\" in {app_path.relative_to(ROOT)} needs a \"style\": generated or kept")

    json_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("patches-list.json")
    readme_path = Path(sys.argv[5]) if len(sys.argv) > 5 else ROOT / app["docs"]

    data = json.loads(json_path.read_text(encoding="utf-8"))
    # The merged bundle has every app's patches; this README lists only this app's.
    patches = {p["name"]: p for p in data["patches"]
               if any(c.get("packageName") == app["package"] for c in p.get("compatiblePackages") or [])}
    version = str(data["version"]).lstrip("v")

    versions = []
    for p in patches.values():
        for c in p.get("compatiblePackages") or []:
            for t in c.get("targets") or []:
                v = t.get("version")
                if v and v not in versions:
                    versions.append(v)

    readme = readme_path.read_text(encoding="utf-8")
    block = re.search(r"<!-- PATCHES_START[^>]*-->\n?(.*?)<!-- PATCHES_END -->", readme, re.DOTALL)
    if settings["style"] == "kept":
        if not block:
            sys.exit(f"Markers not found in {readme_path}.")
        generated = kept_list(app, settings, patches, versions, block.group(1), readme_path.parent / "patches.md")
    else:
        generated = generated_list(app, settings, patches, version, versions)
        if not block:
            print(generated)
            sys.exit(f"Markers not found in {readme_path}; printed the list instead.")
    readme = readme[:block.start()] + f"<!-- PATCHES_START -->\n{generated}\n<!-- PATCHES_END -->" + readme[block.end():]

    # The supported versions in the intro, if the README has the markers for them.
    if versions:
        readme = re.sub(r"<!-- VERSIONS_START -->.*?<!-- VERSIONS_END -->",
                        lambda m: f"<!-- VERSIONS_START -->{spoken(versions)}<!-- VERSIONS_END -->", readme,
                        flags=re.DOTALL)
    readme_path.write_text(readme, encoding="utf-8", newline="")
    print(f"Wrote {len(patches)} patches for {repo} v{version} into {readme_path}")


if __name__ == "__main__":
    main()
