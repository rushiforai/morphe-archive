"""The GitHub release body for one CHANGELOG section, laid out like v0.27.0's.

Publish used to post the CHANGELOG section as it stood, so v0.27.0's body was rewritten by hand
afterwards. This writes that body: the source index description's summary, then New in this
release, Fixes and changes and Behind the scenes with every bullet of the section word for word,
the reports the release changed something for, a link to the changelog, How to update and What was
checked, the last filled in from the walk receipt publish has already checked. The run stops on a
group heading it doesn't know, text outside a bullet, a dash the project's writing rules keep out
of public text, or a body that doesn't carry every bullet exactly once.

    py -3.13 -I scripts/release_notes.py --version 0.28.0 --walk <walk folder>/walk-receipt.json --out notes.md
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO_URL = "https://github.com/SysAdminDoc/HushMessenger"
# Each CHANGELOG group and the part of the body it goes under, in the order the body lists them.
GROUPS = {
    "New": "New in this release",
    "Settings": "New in this release",
    "Reported issues": "Fixes and changes",
    "Changed and fixed": "Fixes and changes",
    "Docs": "Behind the scenes",
    "Checks": "Behind the scenes",
}
PARTS = ("New in this release", "Fixes and changes", "Behind the scenes")
# Em and en dashes, and spaced hyphens standing in for one.
DASHES = (chr(0x2014), chr(0x2013), " - ", " -- ")
# The release walk phones by ro.product.model, as walk-receipt.ps1 lists them.
PHONES = {"SM-S908U1": "a Galaxy S22 Ultra", "SM-S938B": "a Galaxy S25 Ultra"}
# What each walk step opened, in plain words.
STEPS = {
    "chat": "a chat",
    "inbox": "the inbox",
    "settings-controls": "the HushMessenger Controls tab",
    "settings-app": "the HushMessenger App tab",
    "message-log": "the message log",
    "auto-reply": "auto reply",
    "settings": "Messenger's own settings",
    "story-settings": "story settings",
    "contact-settings": "contact settings",
}
# Record lines that name the APK rather than a hook, which Get-FamilyCodes in release.ps1 skips too.
RECORD_FACTS = re.compile(r"^(#|version |code |sha256 )")


class NotesError(Exception):
    pass


def spoken(items: list[str]) -> str:
    return items[0] if len(items) == 1 else ", ".join(items[:-1]) + " and " + items[-1]


def read_section(changelog: str, version: str) -> str:
    text = changelog.replace("\r\n", "\n")
    match = re.search(rf"^## {re.escape(version)} \([^)\n]*\)\n(.*?)(?=^## |\Z)", text, re.MULTILINE | re.DOTALL)
    if not match or not match.group(1).strip():
        raise NotesError(f"CHANGELOG.md has no section for {version}")
    return match.group(1)


def read_groups(section: str) -> dict[str, list[str]]:
    """The section's bullets under the part of the body each group goes to."""
    parts: dict[str, list[str]] = {part: [] for part in PARTS}
    group = None
    for line in section.split("\n"):
        if not line.strip():
            continue
        if line.startswith("### "):
            group = line[4:].strip()
            if group not in GROUPS:
                raise NotesError(f"the ### {group} group isn't one the notes know ({', '.join(GROUPS)})")
        elif line.startswith("- ") and group:
            parts[GROUPS[group]].append(line[2:].strip())
        else:
            raise NotesError(f"the section has text outside a bullet under a ### group: {line.strip()[:60]!a}")
    if not any(parts.values()):
        raise NotesError("the section has no bullets")
    return parts


def read_reports(bullets: list[str]) -> list[int]:
    """Every issue a bullet's Refs names, in order."""
    found = set()
    for bullet in bullets:
        refs = bullet.partition("Refs ")[2]
        found.update(int(number) for number in re.findall(r"#(\d+)", refs))
    return sorted(found)


def read_summary(root: Path, version: str) -> str:
    index = json.loads((root / "patches-bundle.json").read_text(encoding="utf-8"))
    if index.get("version") != version:
        raise NotesError(f"patches-bundle.json is at {index.get('version')}, not {version}")
    summary = str(index.get("description") or "").split("\n\n### ", 1)[0].strip()
    if not summary:
        raise NotesError("the source index description has no summary to open the notes with")
    return " ".join(summary.split())


def read_target(readme: str) -> tuple[str, str]:
    """The Messenger version README's supported builds table names, and its APKMirror page."""
    version = re.search(r"^\| Version \| `([^`]+)` \|$", readme, re.MULTILINE)
    page = re.search(r"^\| APKMirror download \| \[([^\]]+)\]\((https://www\.apkmirror\.com/[^)]+)\) \|$", readme, re.MULTILINE)
    if not version or not page:
        raise NotesError("README.md's Supported Messenger builds table has no Version or APKMirror download row")
    if page.group(1) != version.group(1):
        raise NotesError(f"README.md's APKMirror download names {page.group(1)}, not {version.group(1)}")
    # APKMirror's release page ends in the version with dashes: .../facebook-messenger-585-0-0-53-94-release/
    if not page.group(2).rstrip("/").endswith("-" + version.group(1).replace(".", "-") + "-release"):
        raise NotesError(f"README.md's APKMirror download links another release's page: {page.group(2)!a}")
    return version.group(1), page.group(2)


def read_floor(readme: str, app: str, pattern: str) -> str:
    match = re.search(pattern, readme)
    if not match:
        raise NotesError(f"README.md doesn't say which {app} version is needed")
    return match.group(1)


def read_patch_count(root: Path, version: str) -> int:
    catalog = json.loads((root / "patches-list.json").read_text(encoding="utf-8"))
    if catalog.get("version") != version:
        raise NotesError(f"patches-list.json is at {catalog.get('version')}, not {version}")
    return len(catalog["patches"])


def read_builds(root: Path) -> tuple[int, int]:
    """How many Messenger builds have a profile record, and how many families their hooks make."""
    records = sorted((root / "scripts/profiles").glob("*.txt"))
    if not records:
        raise NotesError("scripts/profiles has no records")
    families = set()
    for record in records:
        lines = record.read_text(encoding="utf-8").splitlines()
        families.add("\n".join(line for line in lines if not RECORD_FACTS.match(line)))
    return len(records), len(families)


def read_walk(path: Path) -> str:
    """One sentence on where the walk ran and what it opened."""
    receipt = json.loads(path.read_text(encoding="utf-8-sig"))
    if receipt.get("result") != "PASS" or receipt.get("crashes") != 0:
        raise NotesError(f"the walk receipt at {path} isn't a passing walk with no crashes")
    if receipt.get("emulator"):
        device = f"an emulator on Android API {receipt['sdk']}" if receipt.get("sdk") else "an emulator"
    else:
        device = PHONES.get(receipt.get("device"), f"a {receipt.get('device')}")
    opened = [step["id"] for step in receipt.get("steps") or [] if step.get("opened") is True]
    if not opened:
        raise NotesError(f"the walk receipt at {path} lists no screen it opened")
    names = []
    for step in opened:
        if step in ("settings-controls", "settings-app") and {"settings-controls", "settings-app"} <= set(opened):
            if step == "settings-controls":
                names.append("both HushMessenger settings tabs")
            continue
        names.append(STEPS.get(step, step.replace("-", " ")))
    screens = spoken(names)
    return (f"An APK patched from this exact bundle was installed on {device}, signed in to Messenger. "
            f"{screens[0].upper()}{screens[1:]} all opened, with no crashes.")


def build_notes(root: Path, version: str, walk: Path) -> str:
    section = read_section((root / "CHANGELOG.md").read_text(encoding="utf-8"), version)
    parts = read_groups(section)
    bullets = [bullet for part in PARTS for bullet in parts[part]]
    readme = (root / "README.md").read_text(encoding="utf-8").replace("\r\n", "\n")
    target, page = read_target(readme)
    manager = read_floor(readme, "Morphe Manager", r"Morphe Manager \((\d+(?:\.\d+)+) or newer\)")
    desktop = read_floor(readme, "Morphe Desktop", r"Morphe Desktop (\d+(?:\.\d+)+) or newer")
    builds, families = read_builds(root)

    blocks = [read_summary(root, version)]
    for part in PARTS:
        if parts[part]:
            blocks.append(f"### {part}")
            blocks.append("\n".join("- " + bullet for bullet in parts[part]))
    reports = read_reports(bullets)
    if reports:
        blocks.append("### Reports this release changed something for")
        blocks.append(spoken([f"#{number}" for number in reports]) + ".")
    blocks.append(f"Full history is in the [changelog]({REPO_URL}/blob/main/CHANGELOG.md).")
    blocks.append("### How to update")
    blocks.append("\n".join([
        f"1. Update Messenger to {target} first. Any build on [APKMirror's {target} page]({page}) works, "
        "and a `nodpi` one keeps the icons sharp.",
        f"2. In Morphe Manager ({manager} or newer), open **Sources** and refresh HushMessenger. "
        f"The card should say **{read_patch_count(root, version)} patches**.",
        "3. Patch Messenger again and install it over your current one. Your settings carry over.",
    ]))
    blocks.append(f"Patching on a computer? `patches-{version}.mpp` below is the same bundle for Morphe Desktop {desktop} "
                  "or newer. It's a patch bundle, not a Messenger APK. `SHA256SUMS.txt` and its signature let you "
                  "check the download, and the README says how.")
    blocks.append("### What was checked")
    family_text = "the one build family" if families == 1 else f"each of the {families} build families"
    build_text = f"the one Messenger {target} build" if builds == 1 else f"all {builds} Messenger {target} builds"
    blocks.append("\n".join([
        f"- The full test suite, plus a patch run against {build_text} on file.",
        f"- Morphe Desktop patched and rebuilt one APK from {family_text}.",
        f"- {read_walk(walk)}",
    ]))
    body = "\n\n".join(blocks) + "\n"

    lines = body.split("\n")
    for bullet in bullets:
        if lines.count("- " + bullet) != 1:
            raise NotesError(f"the notes don't carry this bullet exactly once: {bullet[:60]!a}")
    for dash in DASHES:
        if dash in body:
            raise NotesError(f"the notes use {dash!a} as a dash, so rewrite that line")
    return body


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="The GitHub release body for one CHANGELOG section.")
    parser.add_argument("--root", default=str(Path(__file__).resolve().parents[1]))
    parser.add_argument("--version", required=True)
    parser.add_argument("--walk", required=True, help="the walk-receipt.json publish checked")
    parser.add_argument("--out", required=True)
    args = parser.parse_args(argv)
    try:
        body = build_notes(Path(args.root), args.version, Path(args.walk))
    except NotesError as error:
        print(f"release notes: {error}", file=sys.stderr)
        return 1
    Path(args.out).write_bytes(body.encode("utf-8"))
    print(f"release notes: {sum(1 for line in body.split(chr(10)) if line.startswith('- '))} bullets in {args.out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
