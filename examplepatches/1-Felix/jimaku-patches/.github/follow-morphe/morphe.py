"""Follow Morphe's stable releases: read a release's YouTube targets and rewrite Jimaku's to match.

Plain standard library, so the workflow runs it without installing anything.
"""

import argparse
import json
import re
import subprocess
import urllib.request
from pathlib import Path

MORPHE_REPO = "MorpheApp/morphe-patches"
ROOT = Path(__file__).resolve().parents[2]
RECORD = Path(__file__).resolve().parent / "followed.txt"
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jimaku/patches/shared/Constants.kt"
LIBS = ROOT / "gradle/libs.versions.toml"
SETTINGS = ROOT / "settings.gradle.kts"

YOUTUBE = "com.google.android.youtube"
MIN_SDK_FLOOR = 28  # Jimaku's code is built for Android 9 and up.

PATCHER = r'morphe-patcher = "([^"]+)"'
PLUGIN = r'id\("app\.morphe\.patches"\) version "([^"]+)"'


def version_key(version: str) -> tuple:
    """Sort key for versions like v2.0.0, 2.1.0-dev.1 and 21.30.216; a pre-release sorts below its release."""
    release, _, pre = version.strip().removeprefix("v").partition("-")
    numbers = tuple(int(part) for part in release.split("."))
    if not pre:
        return numbers, 1, ()
    return numbers, 0, tuple((0, int(part), "") if part.isdigit() else (1, 0, part) for part in pre.split("."))


def is_newer(candidate: str, current: str) -> bool:
    return version_key(candidate) > version_key(current)


def youtube_entry(patches_list: dict) -> dict:
    """Morphe's YouTube compatibility entry, its targets cut to those every YouTube patch declares."""
    entries = [
        package
        for patch in patches_list["patches"]
        for package in (patch.get("compatiblePackages") or [])
        if package.get("packageName") == YOUTUBE
    ]
    if not entries:
        raise ValueError("No Morphe patch declares YouTube")
    common = set.intersection(*({target["version"] for target in entry["targets"]} for entry in entries))
    entry = dict(entries[0])
    entry["targets"] = [target for target in entries[0]["targets"] if target["version"] in common]
    return entry


def current_line(entry: dict) -> list:
    """The stable targets sharing the newest stable target's leading number, newest first."""
    stable = sorted(
        (target for target in entry["targets"] if not target.get("isExperimental")),
        key=lambda target: version_key(target["version"]),
        reverse=True,
    )
    if not stable:
        raise ValueError("Morphe declares no stable YouTube target")
    line = stable[0]["version"].split(".")[0]
    return [target for target in stable if target["version"].split(".")[0] == line]


def _targets_block(targets: list) -> str:
    lines = ["targets = listOf("]
    for target in targets:
        lines += [
            "            AppTarget(",
            f'                version = "{target["version"]}",',
            f"                minSdk = {max(target['minSdk'], MIN_SDK_FLOOR)},",
            "            ),",
        ]
    lines.append("        )")
    return "\n".join(lines)


def _signatures_block(signatures: list) -> str:
    lines = ["signatures = setOf("]
    lines += [f'            "{signature}",' for signature in signatures]
    lines.append("        )")
    return "\n".join(lines)


def _replace_once(pattern: str, replacement: str, text: str) -> str:
    result, count = re.subn(pattern, lambda _: replacement, text, count=1, flags=re.DOTALL)
    if count != 1:
        raise ValueError(f"Constants.kt has no match for {pattern}")
    return result


def rewrite_constants(kotlin: str, entry: dict, targets: list) -> str:
    """Constants.kt with COMPATIBILITY_YOUTUBE taken from Morphe's entry and the given targets."""
    text = _replace_once(r"apkFileType = ApkFileType\.\w+", f"apkFileType = ApkFileType.{entry['apkFileType']}", kotlin)
    colour = entry["appIconColor"].removeprefix("#").upper()
    text = _replace_once(r"appIconColor = 0x[0-9A-Fa-f]+", f"appIconColor = 0x{colour}", text)
    current = set(re.findall(r'"([0-9a-f]{64})"', text.split("signatures = setOf(", 1)[1].split(")", 1)[0]))
    if current != set(entry["signatures"]):
        text = _replace_once(r"signatures = setOf\(.*?\n        \)", _signatures_block(entry["signatures"]), text)
    return _replace_once(r"targets = listOf\(.*?\n        \)", _targets_block(targets), text)


def raise_version(text: str, pattern: str, morphe_version: str) -> str:
    """Raise the version the pattern's group matches to Morphe's, never lower it."""
    match = re.search(pattern, text)
    if not match:
        raise ValueError(f"No match for {pattern}")
    if not is_newer(morphe_version, match.group(1)):
        return text
    return text[: match.start(1)] + morphe_version + text[match.end(1):]


def _joined(items: list) -> str:
    if len(items) == 1:
        return items[0]
    return ", ".join(items[:-1]) + " and " + items[-1]


def commit_subject(tag: str, targets: list, targets_changed: bool, libs_changed: bool) -> str:
    if targets_changed:
        noun = "target" if len(targets) == 1 else "targets"
        return f"bump: YouTube {_joined([t['version'] for t in targets])}, the stable {noun} of Morphe {tag}"
    if libs_changed:
        return f"bump: build with Morphe {tag}'s patcher"
    return f"chore: Morphe {tag} followed, nothing to change"


def latest_stable_tag() -> str:
    """GitHub's Latest release of Morphe's patches, which is never a pre-release."""
    command = ["gh", "release", "view", "-R", MORPHE_REPO, "--json", "tagName", "-q", ".tagName"]
    return subprocess.run(command, check=True, capture_output=True, encoding="utf-8").stdout.strip()


def morphe_file(tag: str, path: str) -> str:
    url = f"https://raw.githubusercontent.com/{MORPHE_REPO}/{tag}/{path}"
    with urllib.request.urlopen(url, timeout=60) as response:
        return response.read().decode("utf-8")


def _entry_and_targets(tag: str):
    entry = youtube_entry(json.loads(morphe_file(tag, "patches-list.json")))
    return entry, current_line(entry)


def check(tag, dry_run=False) -> dict:
    """Whether to follow a Morphe release; a tag given by hand, or a run off main, is a dry run that never pushes."""
    dry_run = dry_run or tag is not None
    tag = tag or latest_stable_tag()
    follow = dry_run or is_newer(tag, RECORD.read_text(encoding="utf-8").strip())
    outputs = {"follow": follow, "dry_run": dry_run, "tag": tag, "targets": [], "signatures": []}
    if follow:
        entry, targets = _entry_and_targets(tag)
        outputs["targets"] = [target["version"] for target in targets]
        outputs["signatures"] = entry["signatures"]
    return outputs


def update(tag: str) -> dict:
    """Rewrite Jimaku's targets, raise its Morphe libraries and record the tag, in this checkout."""
    entry, targets = _entry_and_targets(tag)
    constants = CONSTANTS.read_text(encoding="utf-8")
    new_constants = rewrite_constants(constants, entry, targets)
    libs = LIBS.read_text(encoding="utf-8")
    new_libs = raise_version(libs, PATCHER, _version_of(morphe_file(tag, "gradle/libs.versions.toml"), PATCHER))
    settings = SETTINGS.read_text(encoding="utf-8")
    new_settings = raise_version(settings, PLUGIN, _version_of(morphe_file(tag, "settings.gradle.kts"), PLUGIN))
    for path, old, new in [(CONSTANTS, constants, new_constants), (LIBS, libs, new_libs), (SETTINGS, settings, new_settings)]:
        if new != old:
            path.write_text(new, encoding="utf-8")
    RECORD.write_text(tag + "\n", encoding="utf-8")
    targets_changed = new_constants != constants
    libs_changed = new_libs != libs or new_settings != settings
    return {
        "changed": targets_changed or libs_changed,
        "subject": commit_subject(tag, targets, targets_changed, libs_changed),
    }


def _version_of(text: str, pattern: str) -> str:
    match = re.search(pattern, text)
    if not match:
        raise ValueError(f"Morphe's file has no match for {pattern}")
    return match.group(1)


def _print_outputs(outputs: dict) -> None:
    for key, value in outputs.items():
        if isinstance(value, bool):
            value = "true" if value else "false"
        elif isinstance(value, list):
            value = json.dumps(value)
        print(f"{key}={value}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest="command", required=True)
    check_command = commands.add_parser("check", help="print whether to follow, as GITHUB_OUTPUT lines")
    check_command.add_argument("--tag", help="a Morphe tag to test by hand (a dry run)")
    check_command.add_argument("--dry-run", action="store_true", help="test, and push nothing")
    update_command = commands.add_parser("update", help="rewrite Jimaku's files for a Morphe tag")
    update_command.add_argument("--tag", required=True)
    args = parser.parse_args()
    _print_outputs(check(args.tag, args.dry_run) if args.command == "check" else update(args.tag))


if __name__ == "__main__":
    main()
