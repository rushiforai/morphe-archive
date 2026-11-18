#!/usr/bin/env python3
# Copyright (C) 2026 Lokesh Sparrow
# SPDX-License-Identifier: GPL-3.0-or-later
"""Refresh the app index in the README and the per-app pages from patches-list.json + apps.json.

The release job runs this after ``generatePatchesList``. Only the text between marker comments
is replaced; everything else in the README and in docs/apps/*.md is hand-written and left alone.

README.md
    <!-- APPS_START --> ... <!-- APPS_END -->   release line, featured apps, legend, app index,
                                                patches for any app
docs/apps/<slug>.md  (created from a template the first time an app appears)
    <!-- HEADER_START --> ... <!-- HEADER_END -->     title, badges, supported versions
    <!-- PATCHES_START --> ... <!-- PATCHES_END -->   the app's patch table
README also has <!-- BADGES_START --> ... <!-- BADGES_END --> for the apps and patches count badges.

Every app in the bundle needs an entry in apps.json and an icon in assets/icons/<package>.svg|png;
otherwise the script fails, so an app never ships undocumented. Above CATEGORY_THRESHOLD apps the
index is split into collapsible categories.

Usage: generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md] [apps.json]
"""

import json
import re
import sys
from pathlib import Path
from urllib.parse import quote

CATEGORY_THRESHOLD = 30
# The Featured row is one line of cards on a phone; a sixth starts to squeeze it.
FEATURED_MAX = 5
SEP = "&nbsp;&nbsp;•&nbsp;&nbsp;"
BADGE = "https://img.shields.io/badge/{label}-{value}-{color}?style=for-the-badge&labelColor=0d1117"


def plural(count, word):
    return word if count == 1 else (word + "es" if word.endswith("h") else word + "s")


def badge(label, value, color):
    enc = lambda s: quote(str(s).replace("-", "--").replace("_", "__"), safe="")
    return f"![{label}]({BADGE.format(label=enc(label), value=enc(value), color=color)})"


def icon(package, root):
    for suffix in ("svg", "png"):
        if (root / "assets" / "icons" / f"{package}.{suffix}").is_file():
            return f"assets/icons/{package}.{suffix}"
    return None


def cell(text):
    return (text or "").replace("\n", "<br>").replace("|", "\\|")


def collect(patch_list):
    apps, generic = {}, {}
    for patch in patch_list["patches"]:
        packages = patch.get("compatiblePackages")
        if not packages:
            generic.setdefault(patch["name"], patch)
            continue
        for compat in packages:
            app = apps.setdefault(compat["packageName"], {"targets": compat.get("targets") or [], "patches": {}})
            app["patches"].setdefault(patch["name"], patch)
    return apps, generic


def versions(targets):
    return [("🧪 " if t.get("isExperimental") else "") + t["version"] for t in targets if t.get("version")]


def patch_table(patches):
    out = ["| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |", "|---|---|---|"]
    for p in sorted(patches, key=lambda p: p["name"].lower()):
        options = "<br>".join("• " + (o.get("title") or o.get("key") or "") for o in p.get("options") or [])
        out.append(f"| **{cell(p['name'])}** | {cell(p.get('description'))} | {options} |")
    return "\n".join(out)


def replace_block(text, name, body, where):
    pattern = rf"<!-- {name}_START[^>]*-->.*?<!-- {name}_END -->"
    if not re.search(pattern, text, flags=re.DOTALL):
        sys.exit(f"Markers <!-- {name}_START --> / <!-- {name}_END --> not found in {where}")
    return re.sub(pattern, lambda _: f"<!-- {name}_START -->\n{body}\n<!-- {name}_END -->", text, flags=re.DOTALL)


PAGE_TEMPLATE = """<!-- HEADER_START -->
<!-- HEADER_END -->

## Features

_Hand-written: what this app gets._

## FAQ

_Hand-written: questions about this app only._

## Patches

<!-- PATCHES_START -->
<!-- PATCHES_END -->
"""


def main(argv):
    if len(argv) < 3:
        sys.exit("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme] [apps.json]")
    slug, branch = argv[1], argv[2]
    list_file = Path(argv[3] if len(argv) > 3 else "patches-list.json")
    readme = Path(argv[4] if len(argv) > 4 else "README.md")
    meta_file = Path(argv[5] if len(argv) > 5 else readme.parent / "apps.json")
    root = readme.parent
    patch_list = json.loads(list_file.read_text(encoding="utf-8"))
    meta = json.loads(meta_file.read_text(encoding="utf-8"))
    info = meta["apps"]
    version = patch_list["version"].lstrip("v")
    release = f"https://github.com/{slug}/releases/tag/v{version}"

    apps, generic = collect(patch_list)
    problems = [f"{p}: no entry in {meta_file.name}" for p in apps if p not in info]
    problems += [f"{p}: no icon in assets/icons" for p in apps if not icon(p, root)]
    if problems:
        sys.exit("App metadata missing:\n  " + "\n  ".join(problems))
    total = len(generic) + sum(len(a["patches"]) for a in apps.values())
    order = sorted(apps, key=lambda p: info[p]["name"].lower())

    # README index
    head = f"> **[v{version}]({release})**{SEP}`{branch}`{SEP}**{len(apps)}** {plural(len(apps), 'app')}{SEP}**{total}** patches"
    featured = sorted((p for p in order if info[p].get("featured")), key=lambda p: info[p]["featured"])[:FEATURED_MAX]
    cards = "\n".join(
        f'<td align="center" width="170"><a href="docs/apps/{info[p]["slug"]}.md"><img src="{icon(p, root)}" width="44" '
        f'height="44" alt=""><br><b>{info[p]["name"]}</b></a><br><sub>{len(apps[p]["patches"])} '
        f'{plural(len(apps[p]["patches"]), "patch")}</sub><br><sub>{info[p].get("blurb", "")}</sub></td>' for p in featured)
    legend = "&nbsp;&nbsp;".join(f"{k}&nbsp;{v}" for k, v in meta.get("legend", {}).items())

    def rows(packages):
        out = ["| App | Highlights | Patches | Version | File | Loki Patches menu |", "|---|---|:---:|---|---|---|"]
        for p in packages:
            a, vs = info[p], versions(apps[p]["targets"])
            out.append(f'| <img src="{icon(p, root)}" width="20" height="20" align="top" alt=""> '
                       f'[**{a["name"]}**](docs/apps/{a["slug"]}.md) | {a.get("highlights", "")} | '
                       f'{len(apps[p]["patches"])} | {"`" + vs[-1] + "`" if vs else "any"} | **{a["file"]}** | {a["menu"]} |')
        return "\n".join(out)

    if len(apps) > CATEGORY_THRESHOLD:
        cats = {}
        for p in order:
            cats.setdefault(info[p].get("category", "Other"), []).append(p)
        index = "\n\n".join(f"<details>\n<summary><b>{c}</b>{SEP}{len(ps)} {plural(len(ps), 'app')}</summary>\n\n{rows(ps)}\n\n</details>"
                            for c, ps in sorted(cats.items()))
    else:
        index = rows(order)
    parts = [head, ""]
    if featured:
        parts += ["### Featured", "", f"<table>\n<tr>\n{cards}\n</tr>\n</table>", ""]
    parts += ["### All apps", "", f"<sub>{legend}</sub>", "", index, ""]
    if generic:
        parts += ["### For any app", "", "Off by default; tick them in Manager for any app.", "",
                  patch_table(generic.values()), ""]
    text = readme.read_text(encoding="utf-8")
    text = replace_block(text, "APPS", "\n".join(parts), readme)
    badges = " ".join([
        f"[{badge('apps', len(apps), '2563eb')}](#apps)",
        f"[{badge('patches', total, '14b8a6')}](#apps)",
    ])
    text = replace_block(text, "BADGES", badges, readme)
    readme.write_text(text, encoding="utf-8", newline="\n")

    # Per-app pages
    for p in order:
        a, vs = info[p], versions(apps[p]["targets"])
        page = root / "docs" / "apps" / f"{a['slug']}.md"
        page.parent.mkdir(parents=True, exist_ok=True)
        body = page.read_text(encoding="utf-8") if page.exists() else PAGE_TEMPLATE
        n = len(apps[p]["patches"])
        header = "\n".join([
            f'# <img src="../../{icon(p, root)}" width="36" height="36" align="top" alt=""> {a["name"]}',
            "",
            " ".join([badge("version", vs[-1] if vs else "any", "2563eb"), badge("patches", n, "14b8a6"),
                      badge("file", a["file"], "0ea5e9"), badge("menu", a["menu"], "6e7681")]),
            "",
            f"[← All apps](../../README.md#apps){SEP}`{p}`{SEP}[v{version}]({release})",
            "",
            "**🎯 Supported versions:** " + (" · ".join(f"`{v}`" for v in vs) if vs else "any"),
        ])
        body = replace_block(body, "HEADER", header, page)
        body = replace_block(body, "PATCHES", patch_table(apps[p]["patches"].values()), page)
        page.write_text(body, encoding="utf-8", newline="\n")
    print(f"✅ README index + {len(order)} app pages (v{version}, {len(apps)} apps, {total} patches)")


if __name__ == "__main__":
    main(sys.argv)
