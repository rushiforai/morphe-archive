#!/usr/bin/env python3
"""Render the patch catalog from patches-list.json into README.md."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any

START_MARKER = re.compile(r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->")
END_MARKER = "<!-- PATCHES_END -->"


def markdown(value: Any) -> str:
    text = "" if value is None else str(value)
    return text.replace("|", r"\|").replace("\n", "<br>")


def anchor(value: str) -> str:
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", value.lower())).strip("-")


def version_table(targets: list[dict[str, Any]]) -> str:
    values = []
    descriptions = []
    for target in targets:
        version = target.get("version")
        if version is None:
            continue
        label = str(version)
        if target.get("isExperimental"):
            label = f"experimental {label}"
        values.append(label)
        descriptions.append(markdown(target.get("description")))

    if not values:
        return ""

    result = [
        "| " + " | ".join(values) + " |",
        "| " + " | ".join(":---:" for _ in values) + " |",
    ]
    if any(descriptions):
        result.append("| " + " | ".join(descriptions) + " |")
    return "\n".join(result)


def patch_table(patches: list[dict[str, Any]]) -> str:
    rows = [
        "| Patch | Description | Options |",
        "| --- | --- | --- |",
    ]
    for patch in sorted(patches, key=lambda item: item.get("name", "")):
        options = patch.get("options") or []
        option_text = "<br>".join(
            f"- {markdown(option.get('title') or option.get('key'))}"
            for option in options
        )
        name = markdown(patch.get("name"))
        rows.append(
            f"| [{name}](#{anchor(str(patch.get('name', '')))}) | "
            f"{markdown(patch.get('description'))} | {option_text} |"
        )
    return "\n".join(rows)


def details(label: str, patches: list[dict[str, Any]], targets: list[dict[str, Any]], expanded: bool) -> str:
    count = len(patches)
    noun = "patch" if count == 1 else "patches"
    tag = "<details open>" if expanded else "<details>"
    versions = version_table(targets)
    supported = f"**Supported versions:**\n\n{versions}\n\n" if versions else ""
    return (
        f"{tag}\n<summary>{markdown(label)} &middot; {count} {noun}</summary>\n\n"
        f"{supported}{patch_table(patches)}\n\n</details>"
    )


def render(data: dict[str, Any], repository: str, branch: str, expanded: bool) -> str:
    grouped: dict[str, dict[str, Any]] = {}
    universal: dict[str, dict[str, Any]] = {}

    for patch in data.get("patches", []):
        compatibilities = patch.get("compatiblePackages") or []
        if not compatibilities:
            universal.setdefault(patch.get("name", ""), patch)
            continue
        for compatibility in compatibilities:
            package_name = compatibility.get("packageName", "unknown")
            entry = grouped.setdefault(
                package_name,
                {
                    "name": compatibility.get("name") or package_name,
                    "targets": compatibility.get("targets") or [],
                    "patches": {},
                },
            )
            entry["patches"].setdefault(patch.get("name", ""), patch)

    total = sum(len(entry["patches"]) for entry in grouped.values()) + len(universal)
    version = str(data.get("version", "")).lstrip("v")
    lines = [
        f"> **[v{version}](https://github.com/{repository}/releases/tag/v{version})**"
        f" &middot; `{markdown(branch)}` &middot; {total} patches total",
        "",
    ]

    for entry in grouped.values():
        lines.append(
            details(
                entry["name"],
                list(entry["patches"].values()),
                entry["targets"],
                expanded,
            )
        )
        lines.append("")

    if universal:
        lines.append(details("Universal", list(universal.values()), [], expanded))
        lines.append("")

    return "\n".join(lines).rstrip()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("repository", help="GitHub owner/repository, for example madhu-gowda6/atharv-patches")
    parser.add_argument("branch")
    parser.add_argument("json_file", nargs="?", type=Path, default=Path("patches-list.json"))
    parser.add_argument("readme_file", nargs="?", type=Path, default=Path("README.md"))
    args = parser.parse_args()

    if "/" not in args.repository:
        raise SystemExit("repository must use the owner/repository format")

    data = json.loads(args.json_file.read_text(encoding="utf-8"))
    readme = args.readme_file.read_text(encoding="utf-8")
    marker = START_MARKER.search(readme)
    if marker is None:
        raise SystemExit(
            f"README markers {START_MARKER.pattern} and {END_MARKER} were not found"
        )
    end = readme.find(END_MARKER, marker.end())
    if end == -1:
        raise SystemExit(
            f"README markers {START_MARKER.pattern} and {END_MARKER} were not found"
        )

    total = sum(
        len(patch.get("compatiblePackages") or []) or 1
        for patch in data.get("patches", [])
    )
    expanded = total <= 20 or "EXPANDED" in marker.group(0)
    generated = render(data, args.repository, args.branch, expanded)
    replacement = f"{marker.group(0)}\n{generated}\n{END_MARKER}"
    end_position = end + len(END_MARKER)
    updated = readme[: marker.start()] + replacement + readme[end_position:]
    args.readme_file.write_text(updated, encoding="utf-8")
    print(
        f"Generated {args.readme_file} for {data.get('version')} "
        f"on {args.branch} ({total} compatibility entries)."
    )


if __name__ == "__main__":
    main()
