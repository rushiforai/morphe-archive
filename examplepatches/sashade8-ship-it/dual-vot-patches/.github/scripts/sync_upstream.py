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

STREAMING_DATA_REQUEST_PATH = (
    "extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/"
    "spoof/requests/StreamingDataRequest.java"
)

# Morphe 1.44.0-dev.3 added uncached download requests in the same constructor
# and fetch loop that Dual VoT extends for ordinary byte-addressable audio
# streams. Resolve only this exact three-way conflict. A later edit to any side
# changes its blob id and deliberately falls back to a manual source merge.
STREAMING_DATA_REQUEST_DOWNLOAD_CONFLICT_BLOBS = (
    "2d468bc3ba3464b15b72dde8eadc35eeaced8811",
    "997cfd829f487b438b4190409c5e8059c09a89eb",
    "c6848c11ac1b23d985794c79973f365ae9b3f883",
)

# Morphe 1.44.0-dev.5 made download clients explicit after the earlier download
# support had already been combined with Dual VoT's direct-stream path. Keep the
# exact blob guard so any later edit to the common request loop remains manual.
STREAMING_DATA_REQUEST_CLIENT_ORDER_CONFLICT_BLOBS = (
    "c6848c11ac1b23d985794c79973f365ae9b3f883",
    "a5cac157943a1ced527aa9ac33781888c3b5ce01",
    "e3b9f5eebb00b69212c17ac4bc213fc1d9fa4c7b",
)

# Morphe 1.44.0 stable contains both download changes above, while the Dual
# stable branch still has only the direct-stream path. Compose the two verified
# transformations only for this exact cumulative stable conflict.
STREAMING_DATA_REQUEST_STABLE_CLIENT_ORDER_CONFLICT_BLOBS = (
    "2d468bc3ba3464b15b72dde8eadc35eeaced8811",
    "997cfd829f487b438b4190409c5e8059c09a89eb",
    "e3b9f5eebb00b69212c17ac4bc213fc1d9fa4c7b",
)

DUAL_YANDEX_STRINGS_PATH = re.compile(
    r"^patches/src/main/resources/addresources/values(?:-[^/]+)?/youtube/strings\.xml$"
)

DUAL_YANDEX_ARRAYS_PATH = "patches/src/main/resources/addresources/values/youtube/arrays.xml"
# Dev16 adds Morphe icon-style arrays after the shared base, next to the
# existing Dual Yandex arrays. Only this verified three-way shape is accepted.
DEV16_ARRAYS_CONFLICT_BLOBS = (
    "388e6e06134c92b55ca65dff94a2346a508dd6c6",
    "edb341c8024a71da1629fb2b200d97a5af44c9f2",
    "983528dfbaa32da29dacc9b104cc95ce27ddbf79",
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


def merge_dual_yandex_arrays(base: str, ours: str, theirs: str) -> str:
    """Combine the verified, disjoint Yandex and Morphe icon arrays."""
    closing = "</resources>"
    if any(value.count(closing) != 1 for value in (base, ours, theirs)):
        raise SyncError("Unexpected arrays resource structure")
    base_prefix, base_suffix = base.split(closing)
    ours_prefix, ours_suffix = ours.split(closing)
    theirs_prefix, theirs_suffix = theirs.split(closing)
    if base_suffix != ours_suffix or base_suffix != theirs_suffix:
        raise SyncError("Arrays resource changed after closing element")
    if not ours_prefix.startswith(base_prefix) or not theirs_prefix.startswith(base_prefix):
        raise SyncError("Arrays resource changed outside appended blocks")

    dual_block = ours_prefix[len(base_prefix):]
    upstream_block = theirs_prefix[len(base_prefix):]
    names = re.compile(r'<string-array name="([^"]+)"')
    dual_names = names.findall(dual_block)
    upstream_names = names.findall(upstream_block)
    expected_dual = {
        "dualvot_yandex_target_language_entries",
        "dualvot_yandex_target_language_entry_values",
        "dualvot_yandex_source_language_entries",
        "dualvot_yandex_source_language_entry_values",
        "dualvot_yandex_timer_position_entries",
        "dualvot_yandex_timer_position_entry_values",
    }
    expected_upstream = {
        "morphe_player_icon_style_entries",
        "morphe_player_icon_style_entry_values",
        "morphe_shorts_icon_style_entries",
        "morphe_shorts_icon_style_entry_values",
    }
    if (set(dual_names) != expected_dual or len(dual_names) != len(expected_dual)
            or set(upstream_names) != expected_upstream
            or len(upstream_names) != len(expected_upstream)):
        raise SyncError("Unexpected Yandex or Morphe arrays")
    if (dual_block.count("</string-array>") != len(expected_dual)
            or upstream_block.count("</string-array>") != len(expected_upstream)):
        raise SyncError("Malformed appended arrays")
    return theirs_prefix + dual_block + closing + theirs_suffix


def resolve_dual_yandex_arrays_conflict() -> None:
    path = DUAL_YANDEX_ARRAYS_PATH
    if path not in unresolved_paths():
        return
    blobs = tuple(
        output_of("git", "rev-parse", f":{stage}:{path}") for stage in (1, 2, 3)
    )
    if blobs != DEV16_ARRAYS_CONFLICT_BLOBS:
        return
    base, ours, theirs = (
        run("git", "show", f":{stage}:{path}", capture=True).stdout
        for stage in (1, 2, 3)
    )
    merged = merge_dual_yandex_arrays(base, ours, theirs)
    (ROOT / path).write_text(merged, encoding="utf-8", newline="")
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


def replace_exact_once(value: str, old: str, new: str, label: str) -> str:
    count = value.count(old)
    if count != 1:
        raise SyncError(f"Expected one {label} block, found {count}")
    return value.replace(old, new, 1)


def merge_streaming_data_request_download_support(ours: str) -> str:
    """Combine the known Dual direct-stream path with Morphe downloads."""
    original_merged_markers = (
        "fetchDirectStreamRequest",
        "fetchRequestForDownload",
        "DIRECT_STREAM_CLIENT_ORDER",
        "lastPlayerHeaders",
        "directStreamsOnly, includeVideoDetails",
        "getPlayerResponseConnectionFromRoute(clientType, includeVideoDetails)",
    )
    client_order_merged_markers = (
        "private static List<ClientType> buildClientOrder",
        "fetchDirectStreamRequest",
        "DIRECT_STREAM_CLIENT_ORDER, false, true",
        "clientOrderToUse, false, false",
        "clientOrder, true, false",
        "boolean isDownload,",
        "boolean directStreamsOnly",
        "getPlayerResponseConnectionFromRoute(clientType, includeVideoDetails)",
    )
    if (
        all(marker in ours for marker in original_merged_markers)
        or all(marker in ours for marker in client_order_merged_markers)
    ):
        return ours

    replacements = (
        (
            "    private static volatile boolean fallbackWithTVDash;\n",
            "    private static volatile boolean fallbackWithTVDash;\n"
            "    private static volatile Map<String, String> lastPlayerHeaders = "
            "Collections.emptyMap();\n",
            "streaming header state",
        ),
        (
            "            boolean directStreamsOnly\n    ) {\n"
            "        this.videoId = videoId;",
            "            boolean directStreamsOnly,\n"
            "            boolean includeVideoDetails\n    ) {\n"
            "        this.videoId = videoId;",
            "streaming request constructor",
        ),
        (
            "                        directStreamsOnly));\n",
            "                        directStreamsOnly, includeVideoDetails));\n",
            "constructor fetch call",
        ),
        (
            "    public static void fetchRequest(String videoId, boolean isInline, "
            "Map<String, String> fetchHeaders) {\n",
            "    public static void fetchRequest(String videoId, boolean isInline, "
            "Map<String, String> fetchHeaders) {\n"
            "        // Keep the latest player headers so downloads can resolve tracks that were never opened.\n"
            "        if (fetchHeaders != null && !fetchHeaders.isEmpty()) {\n"
            "            lastPlayerHeaders = fetchHeaders;\n"
            "        }\n",
            "cached streaming request",
        ),
        (
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, false)",
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, false, false)",
            "cached request constructor call",
        ),
        (
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, true)",
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, true, false)",
            "direct request constructor call",
        ),
        (
            "    @Nullable\n"
            "    public static StreamingDataRequest getRequestForVideoId(String videoId) {",
            "    /**\n"
            "     * Resolves a video that the app never opened, using the latest player headers.\n"
            "     * Deliberately not cached, so downloads cannot evict the streams of videos being watched.\n"
            "     */\n"
            "    public static StreamingDataRequest fetchRequestForDownload(String videoId) {\n"
            "        // The video details name the saved file, so the download asks for them as well.\n"
            "        return new StreamingDataRequest(videoId, false, lastPlayerHeaders, false, true);\n"
            "    }\n\n"
            "    @Nullable\n"
            "    public static StreamingDataRequest getRequestForVideoId(String videoId) {",
            "download request method",
        ),
        (
            "                                          boolean showErrorToasts) {\n"
            "        Utils.verifyOffMainThread();",
            "                                          boolean showErrorToasts,\n"
            "                                          boolean includeVideoDetails) {\n"
            "        Utils.verifyOffMainThread();",
            "player request sender",
        ),
        (
            "            HttpURLConnection connection = "
            "PlayerRoutes.getPlayerResponseConnectionFromRoute(clientType);\n",
            "            HttpURLConnection connection =\n"
            "                    PlayerRoutes.getPlayerResponseConnectionFromRoute("
            "clientType, includeVideoDetails);\n",
            "player route creation",
        ),
        (
            "            boolean directStreamsOnly\n    ) {\n"
            "        final boolean debugEnabled = BaseSettings.DEBUG.get();",
            "            boolean directStreamsOnly,\n"
            "            boolean includeVideoDetails\n    ) {\n"
            "        final boolean debugEnabled = BaseSettings.DEBUG.get();",
            "stream fetch method",
        ),
        (
            "            HttpURLConnection connection = send("
            "clientType, videoId, authorization, showErrorToast);\n",
            "            HttpURLConnection connection =\n"
            "                    send(clientType, videoId, authorization, "
            "showErrorToast, includeVideoDetails);\n",
            "primary player request",
        ),
        (
            "                HttpURLConnection fallBackConnection = send("
            "clientType, videoId, authorization, showErrorToast);\n",
            "                HttpURLConnection fallBackConnection =\n"
            "                        send(clientType, videoId, authorization, "
            "showErrorToast, includeVideoDetails);\n",
            "fallback player request",
        ),
    )
    merged = ours
    for old, new, label in replacements:
        merged = replace_exact_once(merged, old, new, label)

    for marker in original_merged_markers:
        if marker not in merged:
            raise SyncError(f"Merged streaming request is missing: {marker}")
    return merged


def merge_streaming_data_request_client_order(ours: str) -> str:
    """Combine Morphe's explicit download clients with Dual direct streams."""
    merged_markers = (
        "private static List<ClientType> buildClientOrder",
        "fetchDirectStreamRequest",
        "DIRECT_STREAM_CLIENT_ORDER, false, true",
        "clientOrderToUse, false, false",
        "clientOrder, true, false",
        "boolean isDownload,",
        "boolean directStreamsOnly",
        "No direct stream client succeeded",
        "No client could resolve the download",
    )
    if all(marker in ours for marker in merged_markers):
        return ours

    replacements = (
        (
            "    public static void setClientOrderToUse(List<ClientType> availableClients, ClientType preferredClient) {\n"
            "        Objects.requireNonNull(preferredClient);\n\n"
            "        List<ClientType> orderToUse = new ArrayList<>(availableClients.size());\n"
            "        orderToUse.add(preferredClient);\n\n"
            "        for (ClientType client : availableClients) {\n"
            "            if (client.requireJS && !JavaScriptEngineSupport.supportsJavaScriptEngine()) {\n"
            "                Logger.printDebug(() -> \"Could not find JavaScript engine. Skipping JavaScript client: \" + client.name());\n"
            "                continue;\n"
            "            }\n\n"
            "            if (client != preferredClient) {\n"
            "                orderToUse.add(client);\n"
            "            }\n"
            "        }\n\n"
            "        clientOrderToUse = orderToUse.toArray(new ClientType[0]);\n"
            "        Logger.printDebug(() -> \"Available spoof clients: \" + orderToUse);\n"
            "    }",
            "    public static void setClientOrderToUse(List<ClientType> availableClients, ClientType preferredClient) {\n"
            "        List<ClientType> orderToUse = buildClientOrder(availableClients, preferredClient);\n\n"
            "        clientOrderToUse = orderToUse.toArray(new ClientType[0]);\n"
            "        Logger.printDebug(() -> \"Available spoof clients: \" + orderToUse);\n"
            "    }\n\n"
            "    private static List<ClientType> buildClientOrder(List<ClientType> availableClients,\n"
            "                                                     ClientType preferredClient) {\n"
            "        Objects.requireNonNull(preferredClient);\n\n"
            "        List<ClientType> orderToUse = new ArrayList<>(availableClients.size());\n"
            "        orderToUse.add(preferredClient);\n\n"
            "        for (ClientType client : availableClients) {\n"
            "            if (client.requireJS && !JavaScriptEngineSupport.supportsJavaScriptEngine()) {\n"
            "                Logger.printDebug(() -> \"Could not find JavaScript engine. Skipping JavaScript client: \" + client.name());\n"
            "                continue;\n"
            "            }\n\n"
            "            if (client != preferredClient) {\n"
            "                orderToUse.add(client);\n"
            "            }\n"
            "        }\n\n"
            "        return orderToUse;\n"
            "    }",
            "client order builder",
        ),
        (
            "            boolean directStreamsOnly,\n"
            "            boolean includeVideoDetails\n"
            "    ) {\n"
            "        this.videoId = videoId;\n"
            "        this.isInline = isInline;\n"
            "        this.future = Utils.submitOnBackgroundThread(\n"
            "                () -> fetch(resolveVideoIdToFetch(videoId), isInline, playerHeaders,\n"
            "                        directStreamsOnly, includeVideoDetails));",
            "            boolean includeVideoDetails,\n"
            "            ClientType[] clientOrder,\n"
            "            boolean isDownload,\n"
            "            boolean directStreamsOnly\n"
            "    ) {\n"
            "        this.videoId = videoId;\n"
            "        this.isInline = isInline;\n"
            "        this.future = Utils.submitOnBackgroundThread(\n"
            "                () -> fetch(resolveVideoIdToFetch(videoId), isInline, playerHeaders,\n"
            "                        includeVideoDetails, clientOrder, isDownload, directStreamsOnly));",
            "streaming request constructor",
        ),
        (
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, false, false)",
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, false,\n"
            "                clientOrderToUse, false, false)",
            "cached request constructor call",
        ),
        (
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, true, false)",
            "new StreamingDataRequest(videoId, isInline, fetchHeaders, false,\n"
            "                DIRECT_STREAM_CLIENT_ORDER, false, true)",
            "direct request constructor call",
        ),
        (
            "    public static StreamingDataRequest fetchRequestForDownload(String videoId) {\n"
            "        // The video details name the saved file, so the download asks for them as well.\n"
            "        return new StreamingDataRequest(videoId, false, lastPlayerHeaders, false, true);\n"
            "    }",
            "    public static StreamingDataRequest fetchRequestForDownload(String videoId,\n"
            "                                                               List<ClientType> downloadClients,\n"
            "                                                               ClientType preferredClient) {\n"
            "        ClientType[] clientOrder = buildClientOrder(downloadClients, preferredClient)\n"
            "                .toArray(new ClientType[0]);\n"
            "        // The video details name the saved file, so the download asks for them as well.\n"
            "        return new StreamingDataRequest(videoId, false, lastPlayerHeaders, true,\n"
            "                clientOrder, true, false);\n"
            "    }",
            "download request method",
        ),
        (
            "            boolean directStreamsOnly,\n"
            "            boolean includeVideoDetails\n"
            "    ) {\n"
            "        final boolean debugEnabled = BaseSettings.DEBUG.get();\n"
            "        final long fetchStartTime = System.currentTimeMillis();\n"
            "        String authorization = playerHeaders.get(AUTHORIZATION_HEADER);\n"
            "        ClientType[] clients = directStreamsOnly\n"
            "                ? DIRECT_STREAM_CLIENT_ORDER\n"
            "                : clientOrderToUse;",
            "            boolean includeVideoDetails,\n"
            "            ClientType[] clientOrder,\n"
            "            boolean isDownload,\n"
            "            boolean directStreamsOnly\n"
            "    ) {\n"
            "        final boolean debugEnabled = BaseSettings.DEBUG.get();\n"
            "        final long fetchStartTime = System.currentTimeMillis();\n"
            "        String authorization = playerHeaders.get(AUTHORIZATION_HEADER);\n"
            "        ClientType[] clients = clientOrder;",
            "stream fetch method",
        ),
        (
            "            final boolean showErrorToast = !directStreamsOnly\n"
            "                    && ((++i == clients.length) || debugEnabled);",
            "            // Independent direct/download requests report their own failure.\n"
            "            final boolean showErrorToast = ((++i == clients.length) || debugEnabled)\n"
            "                    && !isDownload && !directStreamsOnly;",
            "request error reporting",
        ),
        (
            "                if (!directStreamsOnly) {\n"
            "                    lastSpoofedClientType = clientType;\n"
            "                }",
            "                // Stats for nerds describes playback, not a direct/download request.\n"
            "                if (!isDownload && !directStreamsOnly) {\n"
            "                    lastSpoofedClientType = clientType;\n"
            "                }",
            "spoof client state",
        ),
        (
            "        if (directStreamsOnly) {\n"
            "            Logger.printInfo(() -> \"No direct stream client succeeded\");\n"
            "            return null;\n"
            "        }\n\n"
            "        lastSpoofedClientType = null;",
            "        if (directStreamsOnly) {\n"
            "            Logger.printInfo(() -> \"No direct stream client succeeded\");\n"
            "            return null;\n"
            "        }\n"
            "        if (isDownload) {\n"
            "            Logger.printDebug(() -> \"No client could resolve the download: \" + videoId);\n"
            "            return null;\n"
            "        }\n\n"
            "        lastSpoofedClientType = null;",
            "independent request failure",
        ),
        (
            "        ClientType preferredClient = clientOrderToUse[0];",
            "        ClientType preferredClient = clients[0];",
            "preferred client error hint",
        ),
    )
    merged = ours
    for old, new, label in replacements:
        merged = replace_exact_once(merged, old, new, label)

    for marker in merged_markers:
        if marker not in merged:
            raise SyncError(f"Merged streaming request is missing: {marker}")
    return merged


def merge_streaming_data_request_stable_client_order(ours: str) -> str:
    """Apply both verified download merges for the cumulative stable update."""
    with_downloads = merge_streaming_data_request_download_support(ours)
    return merge_streaming_data_request_client_order(with_downloads)


def resolve_streaming_data_request_conflict() -> None:
    if STREAMING_DATA_REQUEST_PATH not in unresolved_paths():
        return

    stage_blobs = tuple(
        output_of("git", "rev-parse", f":{stage}:{STREAMING_DATA_REQUEST_PATH}")
        for stage in (1, 2, 3)
    )
    if stage_blobs == STREAMING_DATA_REQUEST_DOWNLOAD_CONFLICT_BLOBS:
        merge_known_conflict = merge_streaming_data_request_download_support
    elif stage_blobs == STREAMING_DATA_REQUEST_CLIENT_ORDER_CONFLICT_BLOBS:
        merge_known_conflict = merge_streaming_data_request_client_order
    elif stage_blobs == STREAMING_DATA_REQUEST_STABLE_CLIENT_ORDER_CONFLICT_BLOBS:
        merge_known_conflict = merge_streaming_data_request_stable_client_order
    else:
        return

    ours = run(
        "git", "show", f":2:{STREAMING_DATA_REQUEST_PATH}", capture=True
    ).stdout
    merged = merge_known_conflict(ours)
    destination = ROOT / STREAMING_DATA_REQUEST_PATH
    destination.write_text(merged, encoding="utf-8", newline="")
    run("git", "add", "--", STREAMING_DATA_REQUEST_PATH)


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
    resolve_dual_yandex_arrays_conflict()
    resolve_addon_compatibility_conflicts()
    resolve_streaming_data_request_conflict()

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
