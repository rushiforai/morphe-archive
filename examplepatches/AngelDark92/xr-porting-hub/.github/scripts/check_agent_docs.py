#!/usr/bin/env python3
"""Validate the repository instruction set.

Checks:
  * required rule files exist and stay ASCII;
  * word budgets keep the loaded context short;
  * AGENTS.md and README.md list exactly the builds in shared/Constants.kt;
  * host adapters do not keep their own supported-build tables;
  * adapters point at the canonical contract and skill;
  * legacy .agents skill mirrors match .opencode.

Run with --fix to regenerate the mirrors, then commit the result.
"""

from __future__ import annotations

import argparse
import re
import shutil
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]

RULE_FILES = {
    "AGENTS.md": 1600,
    ".opencode/skills/morphe-patches/SKILL.md": 2300,
    ".opencode/skills/cavecrew/SKILL.md": 700,
    ".opencode/agents/cavecrew-builder.md": 500,
    ".opencode/agents/cavecrew-investigator.md": 500,
    ".opencode/agents/cavecrew-reviewer.md": 500,
    ".github/copilot-instructions.md": 250,
    ".cursor/rules/project.mdc": 180,
    ".agents/AGENTS.md": 150,
    ".hermes.md": 150,
    "WORKSPACE_CLEANUP.md": 1100,
}

ADAPTER_FILES = [
    ".github/copilot-instructions.md",
    ".cursor/rules/project.mdc",
    ".agents/AGENTS.md",
    ".hermes.md",
    ".opencode/agents/cavecrew-builder.md",
    ".opencode/agents/cavecrew-investigator.md",
    ".opencode/agents/cavecrew-reviewer.md",
    ".opencode/skills/cavecrew/SKILL.md",
]

BUILD_PAIR = re.compile(r"\b\d+\.\d+\.\d+/\d{4,}\b")

MIRRORS = [
    (
        ".opencode/skills/morphe-patches/SKILL.md",
        ".agents/skills/morphe-patches/SKILL.md",
    ),
    (
        ".opencode/skills/cavecrew/SKILL.md",
        ".agents/skills/cavecrew/SKILL.md",
    ),
    (
        ".opencode/skills/cavecrew/references/hermes-roles.md",
        ".agents/skills/cavecrew/references/hermes-roles.md",
    ),
]


def fail(message: str, errors: list[str]) -> None:
    errors.append(message)


def word_count(text: str) -> int:
    return len(re.findall(r"\S+", text))


def parse_constants(errors: list[str]) -> tuple[set[tuple[str, str]], set[tuple[str, str]]]:
    path = ROOT / "patches/src/main/kotlin/app/template/patches/shared/Constants.kt"
    if not path.is_file():
        fail(f"missing registry: {path.relative_to(ROOT)}", errors)
        return set(), set()
    text = path.read_text(encoding="utf-8")
    steam = set(re.findall(r'SteamLinkBuild\("([^"]+)",\s*(\d+)\)', text))
    four = set(re.findall(r'FourXvrBuild\("([^"]+)",\s*(\d+)\)', text))
    if not steam:
        fail("Constants.kt: no SteamLinkBuild pairs found", errors)
    if not four:
        fail("Constants.kt: no FourXvrBuild pairs found", errors)
    return steam, four


def parse_markdown_table(path: Path, errors: list[str]) -> tuple[set[tuple[str, str]], set[tuple[str, str]]]:
    if not path.is_file():
        fail(f"missing document: {path.relative_to(ROOT)}", errors)
        return set(), set()
    steam: set[tuple[str, str]] = set()
    four: set[tuple[str, str]] = set()
    for line in path.read_text(encoding="utf-8").splitlines():
        if not line.startswith("|"):
            continue
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) < 3:
            continue
        app = cells[0]
        pairs = set(re.findall(r"(\d+\.\d+\.\d+)/(\d+)", cells[2]))
        if not pairs:
            continue
        if app == "Steam Link VR":
            steam |= pairs
        elif app == "4XVR":
            four |= pairs
    if not steam:
        fail(f"{path.relative_to(ROOT)}: no Steam Link VR build row", errors)
    if not four:
        fail(f"{path.relative_to(ROOT)}: no 4XVR build row", errors)
    return steam, four


def check_mirrors(fix: bool, errors: list[str]) -> None:
    for source_rel, mirror_rel in MIRRORS:
        source = ROOT / source_rel
        mirror = ROOT / mirror_rel
        if not source.is_file():
            fail(f"missing canonical skill file: {source_rel}", errors)
            continue
        if fix:
            mirror.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, mirror)
            continue
        if not mirror.is_file():
            fail(f"missing mirror: {mirror_rel} (run with --fix)", errors)
            continue
        if source.read_bytes() != mirror.read_bytes():
            fail(f"stale mirror: {mirror_rel} (run with --fix)", errors)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--fix", action="store_true", help="regenerate .agents skill mirrors")
    args = parser.parse_args()
    errors: list[str] = []

    texts: dict[str, str] = {}
    for rel, budget in RULE_FILES.items():
        path = ROOT / rel
        if not path.is_file():
            fail(f"missing rule file: {rel}", errors)
            continue
        raw = path.read_bytes()
        try:
            text = raw.decode("utf-8")
        except UnicodeDecodeError as exc:
            fail(f"{rel}: not UTF-8: {exc}", errors)
            continue
        if not text.isascii():
            bad = next((ch for ch in text if ord(ch) > 127), "?")
            fail(f"{rel}: non-ASCII character {bad!r}; use plain ASCII", errors)
        count = word_count(text)
        if count > budget:
            fail(f"{rel}: {count} words exceeds budget {budget}", errors)
        texts[rel] = text

    constants_steam, constants_four = parse_constants(errors)
    agents_steam, agents_four = parse_markdown_table(ROOT / "AGENTS.md", errors)
    readme_steam, readme_four = parse_markdown_table(ROOT / "README.md", errors)

    for label, expected, actual in (
        ("Steam Link AGENTS.md", constants_steam, agents_steam),
        ("Steam Link README.md", constants_steam, readme_steam),
        ("4XVR AGENTS.md", constants_four, agents_four),
        ("4XVR README.md", constants_four, readme_four),
    ):
        if expected != actual:
            missing = sorted(expected - actual)
            extra = sorted(actual - expected)
            fail(f"{label}: missing={missing} extra={extra}", errors)

    for rel in ADAPTER_FILES:
        text = texts.get(rel)
        if text is None:
            continue
        match = BUILD_PAIR.search(text)
        if match:
            fail(f"{rel}: contains build pair {match.group(0)}; keep the table in AGENTS.md", errors)

    pointers = {
        ".github/copilot-instructions.md": ("AGENTS.md", "morphe-patches"),
        ".cursor/rules/project.mdc": ("AGENTS.md", "morphe-patches"),
        ".agents/AGENTS.md": ("AGENTS.md", "morphe-patches"),
        ".hermes.md": ("AGENTS.md", "morphe-patches"),
        "AGENTS.md": (".opencode/skills/morphe-patches/SKILL.md",),
        ".opencode/skills/morphe-patches/SKILL.md": ("AGENTS.md",),
    }
    for rel, needles in pointers.items():
        text = texts.get(rel)
        if text is None:
            continue
        for needle in needles:
            if needle not in text:
                fail(f"{rel}: missing pointer {needle}", errors)

    check_mirrors(args.fix, errors)

    if errors:
        print("FAIL: agent docs are out of contract")
        for error in errors:
            print(f"  - {error}")
        return 1

    print("PASS: agent docs are in contract")
    for rel, budget in RULE_FILES.items():
        print(f"  {rel}: {word_count(texts[rel])}/{budget} words")
    print(f"  Steam Link bases: {len(constants_steam)}")
    print(f"  4XVR bases: {len(constants_four)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
