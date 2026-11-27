# SPDX-License-Identifier: AGPL-3.0-or-later
"""Check the README and app pages against Reseam's compiled bundle catalog."""

import re
import sys
import tomllib
from collections import defaultdict
from pathlib import Path
from typing import NamedTuple
from zipfile import BadZipFile, ZipFile

ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs/reseam"


class Patch(NamedTuple):
    description: str
    default: str
    versions: set[str]
    options: set[str]


def require(condition: bool, problem: str) -> None:
    if not condition:
        raise ValueError(problem)


def section(text: str, heading: str) -> str:
    sections = re.split(r"^## (.+)$", text, flags=re.MULTILINE)
    for name, body in zip(sections[1::2], sections[2::2]):
        if name.strip() == heading:
            return body
    return ""


def table(text: str, heading: str) -> tuple[list[str], list[list[str]]]:
    lines = section(text, heading).splitlines()
    rows = [
        [cell.strip() for cell in re.split(r"(?<!\\)\|", line.strip()[1:-1])]
        for line in lines
        if line.strip().startswith("|") and line.strip().endswith("|")
    ]
    require(len(rows) >= 2, f"{heading}: missing table")
    header, separator, *body = rows
    require(len(set(header)) == len(header), f"{heading}: duplicate column")
    require(all(len(row) == len(header) for row in rows), f"{heading}: inconsistent row width")
    require(all(re.fullmatch(r":?-{3,}:?", cell) is not None for cell in separator),
            f"{heading}: missing table separator")
    return header, body


def code_values(cell: str) -> set[str]:
    require(re.fullmatch(r"`[^`]+`(, `[^`]+`)*", cell) is not None,
            f"Expected backticked values, got {cell!r}")
    values = re.findall(r"`([^`]+)`", cell)
    require(len(values) == len(set(values)), f"Repeated value in {cell!r}")
    return set(values)


def catalog(bundle: Path) -> dict[str, dict[str, Patch]]:
    with ZipFile(bundle) as archive:
        patches = tomllib.loads(archive.read("manifest.toml").decode())["patches"]

    apps: dict[str, dict[str, Patch]] = defaultdict(dict)
    for patch in patches:
        if patch["hidden"]:
            continue
        name = patch["name"]
        description = patch["description"]
        require(bool(name.strip() and description.strip()), f'{patch["id"]}: missing name or description')
        compatibility = patch["compatibility"]
        require(compatibility["kind"] == "packages", f"{name}: declare app compatibility")
        for target in compatibility["packages"]:
            package = target["package"]
            versions = set(target["versions"]) | {str(code) for code in target.get("version_codes", [])}
            require(bool(versions), f"{name}: pin the compatible versions of {package}")
            require(name not in apps[package], f"{package}: duplicate patch {name!r}")
            default = "On" if patch["enabled_by_default"] else "Off"
            options = {option["title"] for option in patch["options"]}
            apps[package][name] = Patch(description, default, versions, options)
    return apps


def check_app(page: Path, name: str, package: str, patches: dict[str, Patch]) -> None:
    text = page.read_text()
    require(text.startswith(f"# {name}\n"), f"{page.name}: expected title {name!r}")
    version_heading = "Tested version" if section(text, "Tested version") else "Compatible version"
    header, versions = table(text, version_heading)
    require(header == ["Package", version_heading] and len(versions) == 1,
            f"{page.name}: expected one package and version row")
    expected_versions = set().union(*(patch.versions for patch in patches.values()))
    require(code_values(versions[0][0]) == {package}, f"{page.name}: package differs from README")
    require(code_values(versions[0][1]) == expected_versions,
            f"{page.name}: app versions differ from catalog, expected {sorted(expected_versions)}")

    header, rows = table(text, "Patches")
    require(header == ["Patch", "What it does", "Default"], f"{page.name}: unexpected Patches columns")
    actual = {patch_name: (description.replace(r"\|", "|"), default) for patch_name, description, default in rows}
    expected = {patch_name: (patch.description, patch.default) for patch_name, patch in patches.items()}
    require(len(actual) == len(rows), f"{page.name}: repeated patch")
    require(actual.keys() == expected.keys(),
            f"{page.name}: patch names differ from catalog: {sorted(actual.keys() ^ expected.keys())}")
    for patch_name, metadata in expected.items():
        require(actual[patch_name] == metadata, f"{page.name}: {patch_name} requires {metadata}")

    options = section(text, "Options")
    blocks = re.split(r"^### (.+)$", options, flags=re.MULTILINE)
    option_pages = dict(zip(blocks[1::2], blocks[2::2]))
    require(len(option_pages) == len(blocks[1::2]), f"{page.name}: repeated option section")
    expected_option_patches = {patch_name for patch_name, patch in patches.items() if patch.options}
    require(option_pages.keys() == expected_option_patches,
            f"{page.name}: expected option sections for {sorted(expected_option_patches)}")
    for patch_name, body in option_pages.items():
        for title in patches[patch_name].options:
            require(f"`{title}`" in body, f"{page.name}: document the {patch_name} option {title!r}")


def check_readme(apps: dict[str, dict[str, Patch]]) -> None:
    header, rows = table((ROOT / "README.md").read_text(), "Supported apps")
    reseam_column = "Reseam" if "Reseam" in header else "Reseam preview"
    require(reseam_column in header and header[:2] == ["App", "Package"], "README: expected Reseam app column")
    column = header.index(reseam_column)
    linked_packages = set()
    linked_pages = set()
    for row in rows:
        name, package_cell = row[:2]
        cell = row[column]
        if cell == "—":
            continue
        match = re.fullmatch(r"\[(\d+) (patch|patches)\]\((docs/reseam/[a-z0-9]+\.md)\)", cell)
        require(match is not None, f"README: invalid Reseam link for {name}")
        count, noun, path = match.groups()
        package, = code_values(package_cell)
        require(package in apps and package not in linked_packages, f"README: unexpected package {package}")
        patches = apps[package]
        expected_count = len(patches)
        require(int(count) == expected_count and (noun == "patch") == (expected_count == 1),
                f"README: {name} needs a link for {expected_count} Reseam patches")
        page = ROOT / path
        require(page not in linked_pages, f"README: repeated link to {path}")
        linked_packages.add(package)
        linked_pages.add(page)
        check_app(page, name, package, patches)

    require(linked_packages == apps.keys(),
            f"README: missing Reseam packages: {sorted(apps.keys() - linked_packages)}")
    require(linked_pages == set(DOCS.glob("*.md")), "README: Reseam links differ from docs/reseam app pages")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("Usage: reseam-check-docs.py BUNDLE")
    try:
        check_readme(catalog(Path(sys.argv[1])))
    except (BadZipFile, KeyError, OSError, ValueError) as error:
        sys.exit(f"Reseam catalog check failed: {error}")
    print("Reseam catalog matches the README and app pages.")
