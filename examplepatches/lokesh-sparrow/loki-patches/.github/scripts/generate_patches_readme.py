#!/usr/bin/env python3
# Copyright (C) 2026 Lokesh Sparrow
# SPDX-License-Identifier: GPL-3.0-or-later
"""Refresh the patch overview in the README from patches-list.json.

The release job runs this after ``generatePatchesList``. Everything between the
``<!-- PATCHES_START -->`` and ``<!-- PATCHES_END -->`` comments is replaced; the rest of
the README is left alone.

Each app gets a collapsible ``<details>`` block with its supported versions and a table of
its patches. The blocks start open when the bundle is small (AUTO_EXPAND_THRESHOLD patches or
fewer) or when the start marker is written as ``<!-- PATCHES_START EXPANDED -->``.

Usage: generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
"""

import json
import re
import sys
from pathlib import Path

AUTO_EXPAND_THRESHOLD = 20
START_MARKER_RE = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER = "<!-- PATCHES_END -->"
SEP = "&nbsp;&nbsp;•&nbsp;&nbsp;"

# Slug the Morphe template ships; a README copied from it may still carry these links.
TEMPLATE_SLUG = "xyz-user/xyz-patches"


def app_badge(package, readme_dir):
    """Inline <img> of assets/icons/<package>.svg|png beside the README, or a box emoji."""
    for suffix in ("svg", "png"):
        rel = f"assets/icons/{package}.{suffix}"
        if (readme_dir / rel).is_file():
            return f'<img src="{rel}" width="20" height="20" align="top" alt="">'
    return "📦"


def heading_slug(title):
    """The anchor GitHub gives a heading: lower case, runs of other characters become one '-'."""
    slug = re.sub(r"[^a-z0-9]+", "-", title.lower())
    return re.sub(r"-+", "-", slug).strip("-")


def multiline_cell(text):
    return (text or "").replace("\n", "<br>")


def plural(count, word="patch"):
    return word if count == 1 else word + "es"


def collect(patch_list, readme_dir):
    """Split patches into per-app groups (JSON order) and app-independent ones.

    A patch listed under several apps shows up in each of them, but only once per app; the
    first package entry seen for an app decides its label, icon and target versions.
    """
    apps = {}
    generic = {}
    for patch in patch_list["patches"]:
        title = patch["name"]
        packages = patch.get("compatiblePackages")
        if not packages:
            generic.setdefault(title, patch)
            continue
        for compat in packages:
            package = compat["packageName"]
            app = apps.get(package)
            if app is None:
                app = apps[package] = {
                    "label": compat.get("name") or package,
                    "badge": app_badge(package, readme_dir),
                    "targets": compat.get("targets", []),
                    "patches": {},
                }
            app["patches"].setdefault(title, patch)
    return apps, generic


def option_cell(options):
    titles = (o.get("title") or o.get("key") or "" for o in options)
    return "<br>".join("• " + t for t in titles)


def patch_table(patches):
    out = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]
    for patch in sorted(patches, key=lambda p: p["name"]):
        title = patch["name"]
        options = patch.get("options") or []
        cells = (
            f"[{title}](#{heading_slug(title)})",
            multiline_cell(patch.get("description")),
            option_cell(options) if options else "",
        )
        out.append("| " + " | ".join(cells) + " |")
    return "\n".join(out)


def table_row(cells):
    return "| " + " | ".join(cells) + " |"


def version_table(targets):
    """Supported versions as one header row; experimental ones get a 🧪.

    A third row with notes is added when any target carries a description. That row is built
    from every target, including ones that have no version.
    """
    if not targets:
        return ""
    shown = []
    for target in targets:
        version = target["version"]
        if version is not None:
            shown.append(f"🧪&nbsp;{version}" if target.get("isExperimental") else version)
    if not shown:
        return ""
    out = [table_row(shown), table_row(":---:" for _ in shown)]
    notes = [multiline_cell(t.get("description")) for t in targets]
    if any(notes):
        out.append(table_row(notes))
    return "\n".join(out)


def details_block(summary, count, body, open_by_default, targets=None):
    versions = version_table(targets) if targets is not None else ""
    if versions:
        body = f"**🎯 Supported versions:**\n\n{versions}\n\n{body}"
    return "\n".join([
        "<details open>" if open_by_default else "<details>",
        f"<summary>{summary}{SEP}{count} {plural(count)}</summary>",
        "<br>",
        "",
        body,
        "",
        "</details>",
    ])


def render(apps, generic, version, owner, repo, branch, total, open_by_default):
    parts = [
        f"> **[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})**"
        f"{SEP}`{branch}`{SEP}{total} patches total"
    ]
    for app in apps.values():
        patches = list(app["patches"].values())
        summary = f"{app['badge']} {app['label']}"
        parts.append(details_block(summary, len(patches), patch_table(patches),
                                   open_by_default, app["targets"]))
        parts.append("")
    if generic:
        patches = list(generic.values())
        parts.append(details_block("🌐 Universal", len(patches), patch_table(patches), open_by_default))
        parts.append("")
    return "\n".join(parts)


def main(argv):
    if len(argv) < 3:
        print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
        sys.exit(1)
    slug, branch = argv[1], argv[2]
    list_file = Path(argv[3] if len(argv) > 3 else "patches-list.json")
    readme_file = Path(argv[4] if len(argv) > 4 else "README.md")

    if "/" not in slug:
        raise ValueError(f"Invalid repo format: {slug} (expected owner/repo)")
    owner, repo = slug.split("/", 1)

    with open(list_file, encoding="utf-8") as fh:
        patch_list = json.load(fh)

    apps, generic = collect(patch_list, readme_file.parent)
    version = patch_list["version"].lstrip("v")
    total = len(generic) + sum(len(app["patches"]) for app in apps.values())

    def section(open_by_default):
        return render(apps, generic, version, owner, repo, branch, total, open_by_default)

    text = readme_file.read_text(encoding="utf-8")
    start = re.search(START_MARKER_RE, text)
    if start is None or END_MARKER not in text:
        # No place to put it: print the section so the CI log shows it, and fail the step.
        print(section(False))
        sys.stderr.write(
            f"⚠️  Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} not found in {readme_file}. "
            "Printed to stdout instead.\n"
        )
        sys.exit(1)

    start_marker = start.group(0)
    open_by_default = total <= AUTO_EXPAND_THRESHOLD or "EXPANDED" in start_marker
    generated = section(open_by_default)

    for old, new in (
        (f"https://morphe.software/add-source?github={TEMPLATE_SLUG}",
         f"https://morphe.software/add-source?github={slug}"),
        (f"https://github.com/{TEMPLATE_SLUG}", f"https://github.com/{slug}"),
    ):
        text = text.replace(old, new)

    # Lookup with a template string rather than a function on purpose: it keeps the output
    # byte for byte the same as earlier releases produced. Escaped '&' would not survive it.
    text = re.sub(
        rf"{START_MARKER_RE}.*?{re.escape(END_MARKER)}",
        f"{start_marker}\n{generated}\n{END_MARKER}",
        text,
        flags=re.DOTALL,
    )
    readme_file.write_text(text, encoding="utf-8")
    print(f"✅ Injected patches section into {readme_file} "
          f"(v{version}, branch={branch}, {total} patches, expanded={open_by_default})")


if __name__ == "__main__":
    main(sys.argv)
