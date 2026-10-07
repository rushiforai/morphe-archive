#!/usr/bin/env python3
"""Render the patch catalogue of this repository into the README.

The catalogue is built from ``patches-list.json`` (emitted by the Gradle
``generatePatchesList`` task) and injected between the ``<!-- PATCHES_START -->``
and ``<!-- PATCHES_END -->`` markers of the README.

Usage::

    update_readme_catalogue.py <owner/repo> <branch> [patches-list.json] [README.md]

Spoilers are rendered open when the bundle contains at most
``AUTO_EXPAND_PATCH_COUNT`` patches, or when the start marker explicitly asks for
it (``<!-- PATCHES_START EXPANDED -->``).
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

AUTO_EXPAND_PATCH_COUNT = 20

START_MARKER_PATTERN = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
END_MARKER = "<!-- PATCHES_END -->"

#: Emoji used for the spoiler of every supported application.
APP_EMOJI = "📦"
#: Emoji used for the spoiler holding patches that apply to any application.
UNIVERSAL_EMOJI = "🌐"

TABLE_HEADER = (
    "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
    "|----------|----------------|-----------|",
)


@dataclass(frozen=True)
class Target:
    """A single application build a patch was verified against."""

    version: str
    experimental: bool = False
    description: str = ""

    @property
    def label(self) -> str:
        return f"🧪&nbsp;{self.version}" if self.experimental else self.version

    @classmethod
    def from_json(cls, entry: dict) -> "Target | None":
        version = entry.get("version")
        if not version:
            return None
        return cls(
            version=version,
            experimental=bool(entry.get("isExperimental")),
            description=_single_line(entry.get("description")),
        )


@dataclass(frozen=True)
class Patch:
    """A patch as it is published in ``patches-list.json``."""

    name: str
    description: str
    options: tuple[str, ...]

    @property
    def anchor(self) -> str:
        """The GitHub anchor of the patch heading in this README."""
        return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", self.name.lower())).strip("-")

    @property
    def options_cell(self) -> str:
        return "<br>".join(f"• {title}" for title in self.options)

    @classmethod
    def from_json(cls, entry: dict) -> "Patch":
        titles = (
            option.get("title") or option.get("key") or ""
            for option in entry.get("options") or []
        )
        return cls(
            name=entry["name"],
            description=_single_line(entry.get("description")),
            options=tuple(title for title in titles if title),
        )


@dataclass
class AppGroup:
    """Every patch that targets one application package."""

    package_name: str
    label: str
    targets: tuple[Target, ...]
    patches: dict[str, Patch] = field(default_factory=dict)


def _single_line(value: str | None) -> str:
    """Collapse a multi-line JSON value so it fits into a markdown table cell."""
    return (value or "").replace("\n", "<br>")


def load_catalogue(path: Path) -> dict:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def group_patches(data: dict) -> tuple[list[AppGroup], list[Patch]]:
    """Split the catalogue into per-application groups plus universal patches."""
    groups: dict[str, AppGroup] = {}
    universal: dict[str, Patch] = {}

    for entry in data["patches"]:
        patch = Patch.from_json(entry)
        compatible = entry.get("compatiblePackages")

        if not compatible:
            universal.setdefault(patch.name, patch)
            continue

        for package in compatible:
            package_name = package["packageName"]
            group = groups.get(package_name)
            if group is None:
                targets = tuple(
                    target
                    for target in (
                        Target.from_json(raw) for raw in package.get("targets") or []
                    )
                    if target is not None
                )
                group = groups[package_name] = AppGroup(
                    package_name=package_name,
                    label=package.get("name") or package_name,
                    targets=targets,
                )
            group.patches.setdefault(patch.name, patch)

    return list(groups.values()), list(universal.values())


def render_patch_table(patches: list[Patch]) -> str:
    rows = list(TABLE_HEADER)
    for patch in sorted(patches, key=lambda item: item.name):
        rows.append(
            f"| [{patch.name}](#{patch.anchor}) | {patch.description} | {patch.options_cell} |"
        )
    return "\n".join(rows)


def render_versions(targets: tuple[Target, ...]) -> str:
    """Render the row of supported versions, including an optional notes row."""
    if not targets:
        return ""

    header = "| " + " | ".join(target.label for target in targets) + " |"
    separator = "| " + " | ".join(":---:" for _ in targets) + " |"
    rows = [header, separator]

    notes = [target.description for target in targets]
    if any(notes):
        rows.append("| " + " | ".join(notes) + " |")

    return "\n".join(rows)


def render_spoiler(
    label: str,
    patches: list[Patch],
    targets: tuple[Target, ...] = (),
    *,
    expanded: bool,
) -> str:
    """Wrap one application's patch table into a collapsible section."""
    count = len(patches)
    noun = "patch" if count == 1 else "patches"
    versions = render_versions(targets)
    versions_block = f"**🎯 Supported versions:**\n\n{versions}\n\n" if versions else ""

    return (
        f"{'<details open>' if expanded else '<details>'}\n"
        f"<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun}</summary>\n"
        f"<br>\n\n"
        f"{versions_block}{render_patch_table(patches)}\n\n"
        f"</details>"
    )


def render_catalogue(
    *,
    version: str,
    branch: str,
    owner: str,
    repo: str,
    groups: list[AppGroup],
    universal: list[Patch],
    expanded: bool,
) -> str:
    total = sum(len(group.patches) for group in groups) + len(universal)

    lines = [
        f"> **[v{version}](https://github.com/{owner}/{repo}/releases/tag/v{version})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} patches total"
    ]

    for group in groups:
        patches = list(group.patches.values())
        lines.append(
            render_spoiler(
                f"{APP_EMOJI} {group.label}",
                patches,
                group.targets,
                expanded=expanded,
            )
        )
        lines.append("")

    if universal:
        lines.append(
            render_spoiler(f"{UNIVERSAL_EMOJI} Universal", universal, expanded=expanded)
        )
        lines.append("")

    return "\n".join(lines)


def inject(readme_text: str, generated: str) -> tuple[str, bool]:
    """Replace the marked section of ``readme_text`` with ``generated``.

    Returns the updated README and whether the markers were found.
    """
    match = re.search(START_MARKER_PATTERN, readme_text)
    if match is None or END_MARKER not in readme_text:
        return readme_text, False

    start_marker = match.group(0)
    replacement = f"{start_marker}\n{generated}\n{END_MARKER}"

    updated = re.sub(
        rf"{START_MARKER_PATTERN}.*?{re.escape(END_MARKER)}",
        lambda _match: replacement,
        readme_text,
        flags=re.DOTALL,
    )
    return updated, True


def parse_args(argv: list[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("repository", help="repository in owner/name form")
    parser.add_argument("branch", help="branch the release is built from")
    parser.add_argument(
        "patches_list", nargs="?", default="patches-list.json", type=Path,
        help="path to patches-list.json",
    )
    parser.add_argument(
        "readme", nargs="?", default="README.md", type=Path, help="path to README.md"
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    # Keep the emoji status line printable on consoles that default to a legacy
    # code page (Windows); the generated files themselves are always UTF-8.
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8", errors="replace")

    args = parse_args(sys.argv[1:] if argv is None else argv)

    if "/" not in args.repository:
        raise SystemExit(f"Invalid repository '{args.repository}', expected owner/repo")
    owner, repo = args.repository.split("/", 1)

    data = load_catalogue(args.patches_list)
    version = str(data["version"]).lstrip("v")
    groups, universal = group_patches(data)

    readme_text = args.readme.read_text(encoding="utf-8")
    start_marker = re.search(START_MARKER_PATTERN, readme_text)
    expanded = (
        sum(len(group.patches) for group in groups) + len(universal)
    ) <= AUTO_EXPAND_PATCH_COUNT or (start_marker is not None and "EXPANDED" in start_marker.group(0))

    generated = render_catalogue(
        version=version,
        branch=args.branch,
        owner=owner,
        repo=repo,
        groups=groups,
        universal=universal,
        expanded=expanded,
    )

    updated, injected = inject(readme_text, generated)
    if not injected:
        print(generated)
        sys.stderr.write(
            f"⚠️  Markers {START_MARKER_PATTERN} / {END_MARKER} not found in "
            f"{args.readme}. The catalogue was printed to stdout instead.\n"
        )
        return 1

    args.readme.write_text(updated, encoding="utf-8")
    total = sum(len(group.patches) for group in groups) + len(universal)
    print(
        f"✅ Injected the patch catalogue into {args.readme} "
        f"(v{version}, branch={args.branch}, {total} patches, expanded={expanded})"
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
