#!/usr/bin/env python3
"""Rewrite the patches list in README.md from patches-list.json.

Run after `./gradlew generatePatchesList`. Everything between the PATCHES_START
and PATCHES_END markers is replaced; the rest of the README is left alone.
"""

import json
import pathlib
import sys
from urllib.parse import quote

ROOT = pathlib.Path(__file__).resolve().parents[2]
README = ROOT / "README.md"
PATCHES_LIST = ROOT / "patches-list.json"
DOCS = ROOT / "docs"

START = "<!-- PATCHES_START -->"
END = "<!-- PATCHES_END -->"

REPOSITORY = "lchanc3/morphe-patches"


def escape(text):
    """Keep a description from breaking out of its table cell."""
    return (text or "").replace("|", "\\|").replace("\n", " ").strip()


def anchor(name):
    return name.lower().replace(" ", "-").replace("'", "")


def app_sections(patches):
    """Group patches by the app they patch, keeping each app's order stable."""
    apps = {}
    for patch in patches:
        for package in patch.get("compatiblePackages") or []:
            name = package.get("name") or package["packageName"]
            apps.setdefault(name, {"package": package, "patches": []})
            apps[name]["patches"].append(patch)
    return dict(sorted(apps.items(), key=lambda item: item[0].lower()))


def versions_table(package):
    targets = package.get("targets") or []
    labelled = [
        ("🧪&nbsp;" if target.get("isExperimental") else "") + (target.get("version") or "any")
        for target in targets
    ]
    if not labelled:
        return ""
    return (
        "**Supported versions:**\n\n"
        + "| " + " | ".join(labelled) + " |\n"
        + "| " + " | ".join([":---:"] * len(labelled)) + " |\n"
    )


def patches_table(patches):
    rows = [
        "| Patch | Description | Options |",
        "|---|---|---|",
    ]
    for patch in patches:
        options = "<br>".join(
            "`" + option["key"] + "`" for option in patch.get("options") or []
        )
        rows.append(
            f"| **{escape(patch['name'])}** | {escape(patch.get('description'))} | {options} |"
        )
    return "\n".join(rows) + "\n"


def app_notes(name):
    """A link to the app's hand written guide, docs/<app>.md, if it has any.

    Linked rather than pulled in, so the README stays a list of patches.
    """
    path = DOCS / f"{name}.md"
    if not path.is_file():
        return ""
    # Quoted, since an app name like "Local Dream" has a space a link cannot.
    link = quote(path.relative_to(ROOT).as_posix())
    # The table already ends a line, so this starts straight at the text.
    return f"📖 安裝前必讀、常見問題與功能說明：[{name} 使用說明]({link})\n"


def render(data):
    patches = [patch for patch in data["patches"] if patch.get("name")]
    apps = app_sections(patches)
    version = data.get("version", "")

    out = [
        START,
        f"> **[v{version}](https://github.com/{REPOSITORY}/releases/tag/v{version})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;{len(patches)} patches"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;{len(apps)} app{'s' if len(apps) != 1 else ''}",
        "",
    ]

    for name, section in apps.items():
        out += [
            "<details open>",
            f"<summary>📦 {name}&nbsp;&nbsp;•&nbsp;&nbsp;{len(section['patches'])} patches</summary>",
            "",
            versions_table(section["package"]),
            patches_table(section["patches"]),
            app_notes(name),
            "</details>",
            "",
        ]

    out.append(END)
    return "\n".join(out)


def main():
    data = json.loads(PATCHES_LIST.read_text(encoding="utf-8"))
    readme = README.read_text(encoding="utf-8")

    if START not in readme or END not in readme:
        sys.exit(f"{README.name} has no {START} / {END} markers")

    before = readme[: readme.index(START)]
    after = readme[readme.index(END) + len(END) :]
    updated = before + render(data) + after

    if updated == readme:
        print("README.md is already up to date")
        return

    README.write_text(updated, encoding="utf-8", newline="\n")
    print("README.md patches list updated")


if __name__ == "__main__":
    main()
