#!/usr/bin/env python3
"""Prepare and publish automated Morphe upstream updates.

The prepare phase runs with a read-only GITHUB_TOKEN. It merges an exact
upstream release tag, builds and validates the patch bundle, commits the
candidate locally, and exports an incremental Git bundle plus a release plan.

The publish phase runs in a separate job with write permissions. It validates
the prepared bundle and artifact, publishes the release, and advances the
target branch. It never executes code received from upstream.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile
from dataclasses import asdict, dataclass
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
UPSTREAM_URL = "https://github.com/MorpheApp/morphe-patches.git"
PROJECT_REPOSITORY = "sashade8-ship-it/dual-vot-patches"

PROJECT_OWNED_PATHS = (
    "README.md",
    "CHANGELOG.md",
    "patches-bundle.json",
    "patches-list.json",
    "CONTRIBUTING.md",
    ".github/ISSUE_TEMPLATE/bug_report.yml",
    ".github/ISSUE_TEMPLATE/feature_request.yml",
    ".github/workflows/crowdin_pull.yml",
    ".github/workflows/crowdin_push.yml",
    ".github/workflows/build_pull_request.yml",
    ".github/workflows/release.yml",
    ".github/workflows/upstream_sync.yml",
    ".github/workflows/upstream_sync_channel.yml",
    ".github/scripts/sync_upstream.py",
)

# The updater itself always runs from main. When it first joins a newer stable
# branch into dev, retain that controller instead of the historical copy in dev;
# otherwise a controller test or workflow change can leave the published dev
# branch red even though the candidate build succeeded.
CONTROLLER_PATHS = (
    ".github/workflows/crowdin_pull.yml",
    ".github/workflows/crowdin_push.yml",
    ".github/workflows/build_pull_request.yml",
    ".github/workflows/release.yml",
    ".github/workflows/upstream_sync.yml",
    ".github/workflows/upstream_sync_channel.yml",
    ".github/scripts/sync_upstream.py",
    ".github/scripts/test_sync_upstream.py",
)

UPSTREAM_FILES_REMOVED_FROM_DERIVATIVE = (
    ".github/workflows/open_pull_request.yml",
    "patches-bundle.png",
)

REQUIRED_SOURCE_PATHS = (
    "extensions/youtube/src/main/java/app/morphe/extension/youtube/"
    "patches/voiceovertranslation/VoiceOverTranslationCoordinator.java",
    "extensions/youtube/src/main/java/app/morphe/extension/youtube/"
    "patches/voiceovertranslation/yandex/YandexVoiceOverTranslationPatch.java",
    "patches/src/main/kotlin/app/morphe/patches/youtube/video/"
    "voiceovertranslation/YandexVoiceOverTranslationPatch.kt",
)

REQUIRED_PATCH_NAMES = (
    "Voice over translation",
    "Yandex voice-over translation",
)

# These files overlap when Morphe's Add-on support is first merged into a Dual VoT
# branch.  They may be kept from the Dual side only after both sides prove that the
# public Add-on contract is already present.  Any later upstream redesign remains a
# manual source merge instead of silently discarding code.
ADDON_COMPATIBILITY_CONFLICTS = {
    "extensions/youtube/src/main/java/app/morphe/extension/youtube/patches/"
    "voiceovertranslation/VoiceOverTranslationPatch.java": (
        ("addOnTranslationStateChangeCallback", "CopyOnWriteArraySet", "deactivateTranslation", "isSessionEnabled"),
        ("addOnTranslationStateChangeCallback", "CopyOnWriteArraySet", "deactivateTranslation", "isSessionEnabled"),
    ),
    "extensions/youtube/src/main/java/app/morphe/extension/youtube/videoplayer/"
    "VoiceOverTranslationButton.java": (
        ("VoiceOverTranslationCoordinator.toggleOfficial", "VoiceOverTranslationCoordinator.isOfficialActive"),
        ("addOnTranslationStateChangeCallback", "VoiceOverTranslationPatch.toggleTranslation"),
    ),
}

DUAL_YANDEX_STRINGS_PATH = re.compile(
    r"^patches/src/main/resources/addresources/values(?:-[^/]+)?/youtube/strings\.xml$"
)
STRING_RESOURCE_LINE = re.compile(
    r'^\s*<string\s+name="([^"]+)"(?:\s[^>]*)?>.*</string>\s*$'
)
DUAL_OWNED_MORPHE_STRING_NAMES = {
    "morphe_vot_screen_title",
    "morphe_vot_screen_summary",
    "morphe_vot_enabled_title",
}
LEGACY_RESOURCE_NORMALIZATIONS = (
    ("вЂў", "•"),
    ("вЂ¦", "…"),
    ("в†’", "→"),
    ("В°", "°"),
    ("Hide 'More videos' button", r"Hide \'More videos\' button"),
    ("Hide 'More videos' overlay", r"Hide \'More videos\' overlay"),
    ("Hides 'More videos' overlay", r"Hides \'More videos\' overlay"),
    ("off, 'More videos' overlay", r"off, \'More videos\' overlay"),
)


class SyncError(RuntimeError):
    """An expected safety stop that should be reported as an automation issue."""


@dataclass(frozen=True)
class ReleasePlan:
    channel: str
    branch: str
    upstream_version: str
    version: str
    commit: str
    release: bool
    tag: str | None
    artifact_name: str | None
    artifact_sha256: str | None
    release_title: str | None
    release_notes: str | None


def run(
    *args: str,
    check: bool = True,
    capture: bool = False,
    cwd: Path = ROOT,
    env: dict[str, str] | None = None,
) -> subprocess.CompletedProcess[str]:
    print("+", " ".join(args), flush=True)
    completed = subprocess.run(
        args,
        cwd=cwd,
        env=env,
        check=False,
        text=True,
        encoding="utf-8",
        errors="replace",
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
    )
    if check and completed.returncode != 0:
        details = ""
        if capture:
            details = f"\nstdout:\n{completed.stdout}\nstderr:\n{completed.stderr}"
        raise SyncError(
            f"Command failed with exit code {completed.returncode}: "
            f"{' '.join(args)}{details}"
        )
    return completed


def output_of(*args: str, cwd: Path = ROOT) -> str:
    return run(*args, capture=True, cwd=cwd).stdout.strip()


def write_github_output(name: str, value: str) -> None:
    output = os.environ.get("GITHUB_OUTPUT")
    if output:
        with Path(output).open("a", encoding="utf-8") as stream:
            stream.write(f"{name}={value}\n")
    print(f"{name}={value}")


def git_path_exists(ref: str, path: str) -> bool:
    return run("git", "cat-file", "-e", f"{ref}:{path}", check=False).returncode == 0


def restore_path_from(ref: str, path: str) -> None:
    if git_path_exists(ref, path):
        run("git", "restore", f"--source={ref}", "--staged", "--worktree", "--", path)
    else:
        run("git", "rm", "-rf", "--ignore-unmatch", "--", path)


def unresolved_paths() -> list[str]:
    result = output_of("git", "diff", "--name-only", "--diff-filter=U")
    return [line for line in result.splitlines() if line]


def merge_dual_yandex_strings(base: str, ours: str, theirs: str) -> str:
    """Keep upstream XML plus fork-owned Dual Yandex string entries.

    The resolver is intentionally narrow: the local side may differ from the
    merge base only by single-line ``dualvot_yandex_*`` strings and the three
    labels that distinguish the built-in translator. Any other local edit
    remains a manual source conflict.
    """

    entries: dict[str, str] = {}
    ours_without_dual: list[str] = []
    for line in ours.splitlines(keepends=True):
        match = STRING_RESOURCE_LINE.fullmatch(line.rstrip("\r\n"))
        name = match.group(1) if match is not None else ""
        if not (
            name.startswith("dualvot_yandex_")
            or name in DUAL_OWNED_MORPHE_STRING_NAMES
        ):
            ours_without_dual.append(line)
            continue
        if name in entries:
            raise SyncError(f"Duplicate local Dual-owned string: {name}")
        normalized_line = line
        for legacy, canonical in LEGACY_RESOURCE_NORMALIZATIONS:
            normalized_line = normalized_line.replace(legacy, canonical)
        entries[name] = normalized_line

    dual_names = {name for name in entries if name.startswith("dualvot_yandex_")}
    if not dual_names:
        raise SyncError("No local Dual Yandex strings found in resource conflict")

    def without_owned_and_blank_lines(value: str) -> list[str]:
        remaining: list[str] = []
        for line in value.splitlines():
            match = STRING_RESOURCE_LINE.fullmatch(line)
            name = match.group(1) if match is not None else ""
            if name.startswith("dualvot_yandex_") or name in DUAL_OWNED_MORPHE_STRING_NAMES:
                continue
            if line.strip():
                remaining.append(line.strip())
        return remaining

    local_without_dual = "".join(ours_without_dual)
    for legacy, canonical in LEGACY_RESOURCE_NORMALIZATIONS:
        local_without_dual = local_without_dual.replace(legacy, canonical)

    if without_owned_and_blank_lines(local_without_dual) != without_owned_and_blank_lines(base):
        raise SyncError(
            "Local resource conflict contains changes outside approved Dual-owned strings"
        )

    upstream_names = {
        match.group(1)
        for line in theirs.splitlines()
        if (match := STRING_RESOURCE_LINE.fullmatch(line)) is not None
    }
    duplicates = sorted(dual_names & upstream_names)
    if duplicates:
        raise SyncError(
            "Upstream already defines Dual Yandex strings: " + ", ".join(duplicates)
        )

    newline = "\r\n" if "\r\n" in theirs else "\n"
    replaced_names: set[str] = set()
    upstream_lines: list[str] = []
    for line in theirs.splitlines(keepends=True):
        match = STRING_RESOURCE_LINE.fullmatch(line.rstrip("\r\n"))
        name = match.group(1) if match is not None else ""
        if name in DUAL_OWNED_MORPHE_STRING_NAMES:
            replacement = entries.get(name)
            if replacement is None:
                raise SyncError(f"Missing local Dual-owned string: {name}")
            if replacement.endswith(("\n", "\r")):
                replacement = replacement.rstrip("\r\n") + newline
            upstream_lines.append(replacement)
            replaced_names.add(name)
        else:
            upstream_lines.append(line)
    missing_replacements = DUAL_OWNED_MORPHE_STRING_NAMES - replaced_names
    if missing_replacements:
        raise SyncError(
            "Upstream removed Dual-owned Morphe strings: "
            + ", ".join(sorted(missing_replacements))
        )
    merged_upstream = "".join(upstream_lines)
    closing = re.search(r"(?m)^\s*</resources>\s*$", merged_upstream)
    if closing is None:
        raise SyncError("Upstream strings resource has no closing resources element")

    block = "".join(entries[name] for name in entries if name in dual_names)
    if block and not block.endswith(("\n", "\r")):
        block += newline
    prefix = merged_upstream[: closing.start()]
    if prefix and not prefix.endswith(("\n", "\r")):
        prefix += newline
    return prefix + block + merged_upstream[closing.start() :]


def resolve_dual_yandex_string_conflicts() -> None:
    for path in unresolved_paths():
        if DUAL_YANDEX_STRINGS_PATH.fullmatch(path) is None:
            continue
        base = run("git", "show", f":1:{path}", capture=True).stdout
        ours = run("git", "show", f":2:{path}", capture=True).stdout
        theirs = run("git", "show", f":3:{path}", capture=True).stdout
        merged = merge_dual_yandex_strings(base, ours, theirs)
        destination = ROOT / path
        destination.write_text(merged, encoding="utf-8", newline="")
        run("git", "add", "--", path)


def resolve_addon_compatibility_conflicts() -> None:
    """Resolve only the known initial Add-on API overlap after contract checks."""
    for path in unresolved_paths():
        contract = ADDON_COMPATIBILITY_CONFLICTS.get(path)
        if contract is None:
            continue

        ours_markers, theirs_markers = contract
        ours = run("git", "show", f":2:{path}", capture=True).stdout
        theirs = run("git", "show", f":3:{path}", capture=True).stdout
        if not all(marker in ours for marker in ours_markers):
            continue
        if not all(marker in theirs for marker in theirs_markers):
            continue

        restore_path_from("HEAD", path)


def merge_ref(
    ref: str,
    project_preference: str,
    label: str,
    controller_preference: str | None = None,
) -> bool:
    """Merge ref without committing and resolve only explicitly owned files.

    Unknown source conflicts stop the automation. This is the central guard
    that prevents a build from silently dropping upstream or Dual VoT code.
    """

    before = output_of("git", "rev-parse", "HEAD")
    if run("git", "merge-base", "--is-ancestor", ref, "HEAD", check=False).returncode == 0:
        return False

    merge = run("git", "merge", "--no-commit", "--no-ff", ref, check=False)
    if merge.returncode not in (0, 1):
        raise SyncError(f"Could not start merge of {label}")

    preferred_ref = "HEAD" if project_preference == "ours" else "MERGE_HEAD"
    for path in PROJECT_OWNED_PATHS:
        restore_path_from(preferred_ref, path)

    if controller_preference is not None:
        controller_ref = "HEAD" if controller_preference == "ours" else "MERGE_HEAD"
        for path in CONTROLLER_PATHS:
            restore_path_from(controller_ref, path)

    # The upstream version is authoritative; the Dual suffix is added later.
    if "gradle.properties" in unresolved_paths():
        restore_path_from("MERGE_HEAD", "gradle.properties")

    for path in UPSTREAM_FILES_REMOVED_FROM_DERIVATIVE:
        run("git", "rm", "-rf", "--ignore-unmatch", "--", path)

    resolve_dual_yandex_string_conflicts()
    resolve_addon_compatibility_conflicts()

    remaining = unresolved_paths()
    if remaining:
        run("git", "merge", "--abort", check=False)
        raise SyncError(
            "Manual source merge required. Unresolved paths: "
            + ", ".join(remaining)
        )

    # A merge may contain only changes to project-owned generated files that
    # were restored above. Commit the merge even when its tree is unchanged so
    # the upstream tag becomes an ancestor and is not retried forever.
    run("git", "commit", "--no-edit")

    return output_of("git", "rev-parse", "HEAD") != before


def json_from_git(ref: str, path: str) -> dict:
    raw = output_of("git", "show", f"{ref}:{path}")
    try:
        value = json.loads(raw)
    except json.JSONDecodeError as error:
        raise SyncError(f"Invalid JSON in {ref}:{path}: {error}") from error
    if not isinstance(value, dict):
        raise SyncError(f"Expected an object in {ref}:{path}")
    return value


def bundle_version_from_git(ref: str) -> str:
    version = json_from_git(ref, "patches-bundle.json").get("version")
    if not isinstance(version, str) or not version.strip():
        raise SyncError(f"Missing version in {ref}:patches-bundle.json")
    return version.strip().removeprefix("v")


def upstream_base(version: str) -> str:
    return version.split("-dualvot.", 1)[0].removeprefix("v")


def dualvot_revision(version: str) -> tuple[int, ...]:
    match = re.search(
        r"-dualvot\.(\d+(?:\.\d+)*)(?:-|$)",
        version,
        flags=re.IGNORECASE,
    )
    if match is None:
        raise SyncError(f"Missing Dual VoT revision in version: {version!r}")
    return tuple(int(part) for part in match.group(1).split("."))


def format_dualvot_revision(revision: tuple[int, ...]) -> str:
    return ".".join(str(part) for part in revision)


def validate_version(version: str) -> None:
    if not re.fullmatch(r"\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?", version):
        raise SyncError(f"Unsafe or unsupported upstream version: {version!r}")


def validate_manager_local_datetime(value: object) -> None:
    if not isinstance(value, str):
        raise SyncError("patches-bundle.json created_at must be a string")
    try:
        parsed = datetime.fromisoformat(value)
    except ValueError as error:
        raise SyncError(
            f"Invalid patches-bundle.json created_at: {value!r}"
        ) from error
    if parsed.tzinfo is not None:
        raise SyncError(
            "patches-bundle.json created_at must be a timezone-free "
            "LocalDateTime for Morphe Manager"
        )


def set_gradle_version(version: str) -> None:
    path = ROOT / "gradle.properties"
    text = path.read_text(encoding="utf-8")
    updated, count = re.subn(
        r"(?m)^version\s*=\s*.*$",
        f"version = {version}",
        text,
        count=1,
    )
    if count != 1:
        raise SyncError("Could not update version in gradle.properties")
    path.write_text(updated, encoding="utf-8")


def extract_dual_sections(changelog: str) -> list[str]:
    headings = list(re.finditer(r"(?m)^## (.+)$", changelog))
    sections: list[str] = []
    for index, heading in enumerate(headings):
        title = heading.group(1)
        if "-dualvot." not in title.lower():
            continue
        end = headings[index + 1].start() if index + 1 < len(headings) else len(changelog)
        sections.append(changelog[heading.start() : end].strip())
    return sections


def update_changelog(
    version: str,
    upstream_version: str,
    previous_changelog: str,
    upstream_changelog: str,
    channel: str,
) -> None:
    date = datetime.now(timezone.utc).date().isoformat()
    channel_label = "stable" if channel == "stable" else "pre-release"
    new_section = f"""## {version} ({date})

### Automated Morphe update

* Update the {channel_label} base to [Morphe Patches {upstream_version}](
  https://github.com/MorpheApp/morphe-patches/releases/tag/v{upstream_version}).
* Preserve Google/other and Yandex voice-over translation, mutual exclusion,
  volume controls, and automatic reset when the video changes.
* Build and structural Dual VoT checks passed before publication.
""".strip()

    historical = [
        section
        for section in extract_dual_sections(previous_changelog)
        if not section.startswith(f"## {version} ")
    ]
    combined = "\n\n".join([new_section, *historical, upstream_changelog.strip()])
    (ROOT / "CHANGELOG.md").write_text(combined.rstrip() + "\n", encoding="utf-8")


def release_notes(version: str, upstream_version: str, channel: str) -> str:
    release_kind = "Stable" if channel == "stable" else "Pre-release"
    return f"""## Dual VoT Patches {version}

{release_kind} automated update based on Morphe Patches {upstream_version}.

### Included

- Google/other and Yandex voice-over translation in one patch bundle.
- Separate player controls with mutual exclusion.
- Dual VoT volume controls and automatic reset when the video changes.
- Requests for previously untranslated Yandex videos.

### Validation

- Android patch bundle compiled successfully.
- Both translation patches are present in generated metadata.
- Required Dual VoT integration sources and bundle manifest were verified.

This release was produced automatically. Runtime regressions that cannot be
detected by compilation should be reported in this repository.
""".strip()


def update_bundle_metadata(
    version: str,
    notes: str,
) -> None:
    created_at = datetime.now(timezone.utc).replace(tzinfo=None).isoformat(timespec="seconds")
    data = {
        "created_at": created_at,
        "description": notes,
        "download_url": (
            f"https://github.com/{PROJECT_REPOSITORY}/releases/download/"
            f"v{version}/patches-{version}.mpp"
        ),
        "signature_download_url": "",
        "version": version,
    }
    (ROOT / "patches-bundle.json").write_text(
        json.dumps(data, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )


def gradle_environment() -> dict[str, str]:
    env = os.environ.copy()
    token = env.get("GITHUB_TOKEN") or env.get("GH_TOKEN")
    if not token:
        raise SyncError("GITHUB_TOKEN is required to read Morphe GitHub Packages")
    env["GITHUB_TOKEN"] = token
    env.setdefault("GITHUB_ACTOR", os.environ.get("GITHUB_ACTOR", "github-actions[bot]"))
    return env


def build_and_generate(repository: str, branch: str) -> None:
    gradlew = "gradlew.bat" if os.name == "nt" else "./gradlew"
    run(
        gradlew,
        ":patches:buildAndroid",
        "generatePatchesList",
        "--no-daemon",
        env=gradle_environment(),
    )
    run(
        sys.executable,
        ".github/scripts/generate_patches_readme.py",
        repository,
        branch,
        "patches-list.json",
        "README.md",
    )


def parse_manifest(raw: str) -> dict[str, str]:
    unfolded = re.sub(r"\r?\n ", "", raw)
    values: dict[str, str] = {}
    for line in unfolded.splitlines():
        if ": " in line:
            key, value = line.split(": ", 1)
            values[key] = value
    return values


def validate_candidate(version: str) -> Path:
    for relative in REQUIRED_SOURCE_PATHS:
        if not (ROOT / relative).is_file():
            raise SyncError(f"Required Dual VoT source is missing: {relative}")

    patches_list = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
    if patches_list.get("version") != version:
        raise SyncError(
            f"patches-list.json has version {patches_list.get('version')!r}, "
            f"expected {version!r}"
        )
    names = {
        patch.get("name")
        for patch in patches_list.get("patches", [])
        if isinstance(patch, dict)
    }
    missing_names = [name for name in REQUIRED_PATCH_NAMES if name not in names]
    if missing_names:
        raise SyncError("Required patches missing from metadata: " + ", ".join(missing_names))

    artifact = ROOT / "patches" / "build" / "libs" / f"patches-{version}.mpp"
    if not artifact.is_file() or artifact.stat().st_size < 1_000_000:
        raise SyncError(f"Missing or truncated Android patch bundle: {artifact}")

    with zipfile.ZipFile(artifact) as archive:
        try:
            manifest_raw = archive.read("META-INF/MANIFEST.MF").decode("utf-8")
        except KeyError as error:
            raise SyncError("Patch bundle has no META-INF/MANIFEST.MF") from error
    manifest = parse_manifest(manifest_raw)
    if manifest.get("Version") != version:
        raise SyncError(
            f"Bundle manifest version {manifest.get('Version')!r}, expected {version!r}"
        )
    if manifest.get("Name") != "Dual VoT Patches":
        raise SyncError(f"Unexpected bundle name: {manifest.get('Name')!r}")

    metadata = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
    if metadata.get("version") != version:
        raise SyncError("patches-bundle.json version mismatch")
    validate_manager_local_datetime(metadata.get("created_at"))

    return artifact


def configure_git_identity() -> None:
    run("git", "config", "user.name", "dual-vot-updater[bot]")
    run(
        "git",
        "config",
        "user.email",
        "41898282+github-actions[bot]@users.noreply.github.com",
    )


def checkout_channel(branch: str) -> None:
    run("git", "fetch", "--no-tags", "origin", "main", "dev")
    run("git", "fetch", "--tags", "upstream", "main", "dev")
    run("git", "checkout", "-B", branch, f"origin/{branch}")


def ensure_upstream_remote() -> None:
    remotes = output_of("git", "remote").splitlines()
    if "upstream" in remotes:
        run("git", "remote", "set-url", "upstream", UPSTREAM_URL)
    else:
        run("git", "remote", "add", "upstream", UPSTREAM_URL)


def create_incremental_bundle(output_dir: Path, branch: str) -> Path:
    bundle = output_dir / "candidate.bundle"
    run(
        "git",
        "bundle",
        "create",
        str(bundle),
        "HEAD",
        f"^origin/{branch}",
    )
    run("git", "bundle", "verify", str(bundle))
    return bundle


def prepare(channel: str, output_dir: Path, repository: str) -> None:
    branch = "main" if channel == "stable" else "dev"
    upstream_branch = "main" if channel == "stable" else "dev"
    output_dir.mkdir(parents=True, exist_ok=True)

    configure_git_identity()
    ensure_upstream_remote()
    checkout_channel(branch)

    upstream_version = bundle_version_from_git(f"upstream/{upstream_branch}")
    validate_version(upstream_version)
    upstream_tag = f"refs/tags/v{upstream_version}"
    if run("git", "show-ref", "--verify", "--quiet", upstream_tag, check=False).returncode != 0:
        raise SyncError(f"Upstream release tag v{upstream_version} does not exist")

    local_version = bundle_version_from_git("HEAD")
    local_base = upstream_base(local_version)
    revision = dualvot_revision(local_version)
    previous_changelog = (ROOT / "CHANGELOG.md").read_text(encoding="utf-8")
    branch_changed = False

    if channel == "dev":
        stable_version = bundle_version_from_git("origin/main")
        revision = max(revision, dualvot_revision(stable_version))
        stable_base = upstream_base(stable_version)
        dev_matches_stable = upstream_version == stable_base
        branch_changed |= merge_ref(
            "origin/main",
            project_preference="theirs" if dev_matches_stable else "ours",
            label="the latest Dual VoT stable branch",
            controller_preference="theirs",
        )
        local_version = bundle_version_from_git("HEAD")
        local_base = upstream_base(local_version)
        revision = max(revision, dualvot_revision(local_version))

        if dev_matches_stable:
            if not branch_changed:
                write_github_output("updated", "false")
                return
            commit = output_of("git", "rev-parse", "HEAD")
            plan = ReleasePlan(
                channel=channel,
                branch=branch,
                upstream_version=upstream_version,
                version=stable_version,
                commit=commit,
                release=False,
                tag=None,
                artifact_name=None,
                artifact_sha256=None,
                release_title=None,
                release_notes=None,
            )
            create_incremental_bundle(output_dir, branch)
            (output_dir / "plan.json").write_text(
                json.dumps(asdict(plan), ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )
            write_github_output("updated", "true")
            write_github_output("version", stable_version)
            return

    if upstream_version == local_base:
        if branch_changed:
            commit = output_of("git", "rev-parse", "HEAD")
            plan = ReleasePlan(
                channel=channel,
                branch=branch,
                upstream_version=upstream_version,
                version=local_version,
                commit=commit,
                release=False,
                tag=None,
                artifact_name=None,
                artifact_sha256=None,
                release_title=None,
                release_notes=None,
            )
            create_incremental_bundle(output_dir, branch)
            (output_dir / "plan.json").write_text(
                json.dumps(asdict(plan), ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )
            write_github_output("updated", "true")
            write_github_output("version", local_version)
        else:
            write_github_output("updated", "false")
        return

    upstream_changelog = output_of("git", "show", f"{upstream_tag}:CHANGELOG.md")
    merge_ref(upstream_tag, project_preference="ours", label=f"Morphe {upstream_version}")

    # The Dual VoT revision identifies our feature set, not the Morphe base.
    # Preserve it when only upstream Morphe changes, and keep stable/dev on the
    # same Dual VoT generation whenever they contain the same integration.
    version = (
        f"{upstream_version}-dualvot."
        f"{format_dualvot_revision(revision)}"
    )
    validate_version(version)
    set_gradle_version(version)
    notes = release_notes(version, upstream_version, channel)
    update_changelog(
        version,
        upstream_version,
        previous_changelog,
        upstream_changelog,
        channel,
    )
    update_bundle_metadata(version, notes)
    build_and_generate(repository, branch)

    # generatePatchesList is authoritative, but the release version must stay
    # exactly aligned across the bundle, list, JSON and tag.
    patches_list_path = ROOT / "patches-list.json"
    patches_list = json.loads(patches_list_path.read_text(encoding="utf-8"))
    patches_list["version"] = version
    patches_list_path.write_text(
        json.dumps(patches_list, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    run(
        sys.executable,
        ".github/scripts/generate_patches_readme.py",
        repository,
        branch,
        "patches-list.json",
        "README.md",
    )

    artifact = validate_candidate(version)
    run("git", "add", "-A")
    if not output_of("git", "status", "--porcelain"):
        raise SyncError("Upstream version changed but candidate has no Git changes")
    run(
        "git",
        "commit",
        "-m",
        f"chore: update {channel} base to Morphe {upstream_version}",
    )

    commit = output_of("git", "rev-parse", "HEAD")
    artifact_sha256 = hashlib.sha256(artifact.read_bytes()).hexdigest()
    copied_artifact = output_dir / artifact.name
    shutil.copy2(artifact, copied_artifact)

    plan = ReleasePlan(
        channel=channel,
        branch=branch,
        upstream_version=upstream_version,
        version=version,
        commit=commit,
        release=True,
        tag=f"v{version}",
        artifact_name=artifact.name,
        artifact_sha256=artifact_sha256,
        release_title=f"Dual VoT Patches {version}",
        release_notes=notes,
    )
    create_incremental_bundle(output_dir, branch)
    (output_dir / "plan.json").write_text(
        json.dumps(asdict(plan), ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    write_github_output("updated", "true")
    write_github_output("version", version)


def load_plan(input_dir: Path) -> ReleasePlan:
    raw = json.loads((input_dir / "plan.json").read_text(encoding="utf-8"))
    allowed = {"stable", "dev"}
    if raw.get("channel") not in allowed:
        raise SyncError("Invalid channel in release plan")
    expected_branch = "main" if raw["channel"] == "stable" else "dev"
    if raw.get("branch") != expected_branch:
        raise SyncError("Release plan branch does not match channel")
    validate_version(str(raw.get("upstream_version", "")))
    validate_version(str(raw.get("version", "")))
    commit = str(raw.get("commit", ""))
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise SyncError("Invalid commit in release plan")
    return ReleasePlan(**raw)


def cleanup_release(repository: str, tag: str) -> None:
    run(
        "gh",
        "release",
        "delete",
        tag,
        "--repo",
        repository,
        "--yes",
        "--cleanup-tag",
        check=False,
    )
    run("git", "push", "origin", f":refs/tags/{tag}", check=False)


def publish(input_dir: Path, repository: str) -> None:
    # The publish job runs in a fresh checkout. Configure an identity here as
    # well as in prepare because annotated release tags require a committer.
    configure_git_identity()
    plan = load_plan(input_dir)
    run("git", "fetch", "--no-tags", "origin", plan.branch)
    candidate_ref = "refs/remotes/automation/candidate"
    run(
        "git",
        "fetch",
        str(input_dir / "candidate.bundle"),
        f"HEAD:{candidate_ref}",
    )
    candidate = output_of("git", "rev-parse", candidate_ref)
    if candidate != plan.commit:
        raise SyncError("Candidate bundle commit does not match release plan")
    if (
        run(
            "git",
            "merge-base",
            "--is-ancestor",
            f"origin/{plan.branch}",
            candidate_ref,
            check=False,
        ).returncode
        != 0
    ):
        raise SyncError(
            f"Remote {plan.branch} changed incompatibly while the candidate was building"
        )

    if not plan.release:
        run("git", "push", "origin", f"{candidate_ref}:refs/heads/{plan.branch}")
        return

    if not plan.tag or not plan.artifact_name or not plan.artifact_sha256:
        raise SyncError("Incomplete release plan")
    artifact = input_dir / plan.artifact_name
    if not artifact.is_file():
        raise SyncError(f"Prepared artifact is missing: {plan.artifact_name}")
    digest = hashlib.sha256(artifact.read_bytes()).hexdigest()
    if digest != plan.artifact_sha256:
        raise SyncError("Prepared artifact SHA-256 mismatch")

    if run("gh", "release", "view", plan.tag, "--repo", repository, check=False).returncode == 0:
        raise SyncError(f"Release {plan.tag} already exists")
    if run("git", "ls-remote", "--exit-code", "--tags", "origin", plan.tag, check=False).returncode == 0:
        raise SyncError(f"Tag {plan.tag} already exists")

    run("git", "tag", "-a", plan.tag, candidate_ref, "-m", plan.release_title or plan.tag)
    run("git", "push", "origin", f"refs/tags/{plan.tag}")

    notes_file = input_dir / "release-notes.md"
    notes_file.write_text((plan.release_notes or "").rstrip() + "\n", encoding="utf-8")
    release_command = [
        "gh",
        "release",
        "create",
        plan.tag,
        str(artifact),
        "--repo",
        repository,
        "--verify-tag",
        "--title",
        plan.release_title or plan.tag,
        "--notes-file",
        str(notes_file),
    ]
    if plan.channel == "dev":
        release_command.append("--prerelease")
    else:
        release_command.append("--latest")

    try:
        run(*release_command)
        run("git", "push", "origin", f"{candidate_ref}:refs/heads/{plan.branch}")
    except Exception:
        cleanup_release(repository, plan.tag)
        raise


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest="command", required=True)

    prepare_parser = subparsers.add_parser("prepare")
    prepare_parser.add_argument("--channel", choices=("stable", "dev"), required=True)
    prepare_parser.add_argument("--output-dir", type=Path, required=True)
    prepare_parser.add_argument(
        "--repository",
        default=os.environ.get("GITHUB_REPOSITORY", PROJECT_REPOSITORY),
    )

    publish_parser = subparsers.add_parser("publish")
    publish_parser.add_argument("--input-dir", type=Path, required=True)
    publish_parser.add_argument(
        "--repository",
        default=os.environ.get("GITHUB_REPOSITORY", PROJECT_REPOSITORY),
    )

    return parser.parse_args()


def main() -> int:
    args = parse_args()
    try:
        if args.command == "prepare":
            prepare(args.channel, args.output_dir.resolve(), args.repository)
        else:
            publish(args.input_dir.resolve(), args.repository)
    except SyncError as error:
        print(f"::error::{error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
