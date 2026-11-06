#!/usr/bin/env python3
"""Verify a combined Ayufa Patches JP bundle (.mpp).

Checks that the single bundle really contains all four patch sets:

- bundle structure: patch classes dex plus all five extension
  payloads (newx, shared, twitch, extension, kakaotalk) and the
  resource sets (addresources with the Japanese settings resources,
  reactnative/, hermes/).
- MANIFEST metadata points at this project and carries a
  Patcher-Version.
- the Japanese settings resources hold the full Piko settings
  translation and the full KakaoTalk settings translation.
- patch inventory: since v1.2.0 the bundle ships upstream's patches
  individually again (no umbrella patches). When a patches-list.json
  from the build is given, it must contain exactly the patches of the
  four source copies -- 52 for X (com.twitter.android), 14 for
  Twitch (tv.twitch.android.app; upstream 13 plus one Ayufa original),
  32 for LINE (jp.naver.line.android) and 76 for KakaoTalk
  (com.kakao.talk) -- plus upstream's named universal patch
  "Disable Sentry telemetry" (no compatible packages; the KakaoTalk
  "Disable Sentry" patch depends on it, and it is part of upstream's
  own patches-list.json). Since v1.2.1 the patch NAMES are
  upstream's English names, never translated: the Morphe patcher
  executes patches sorted by name, so translated names changed the
  execution order versus upstream and broke patches on device (see
  docs/UPSTREAM.md). Only descriptions and in-app UI strings are
  Japanese, so every listed description must contain Japanese text.
  Every listed name must also be present in classes.dex. When
  upstream adds/removes/renames a patch, update EXPECTED_PATCHES
  together with the source copies (see docs/UPSTREAM.md).

Writes a bundle-summary.json next to the bundle and exits non-zero
when any check fails.
"""

import argparse
import json
import re
import sys
import zipfile
from pathlib import Path

EXPECTED_EXTENSIONS = {
    "extensions/newx.mpe",
    "extensions/shared.mpe",
    "extensions/twitch.mpe",
    "extensions/extension.mpe",
    "extensions/kakaotalk.mpe",
}
JA_STRINGS_ENTRY = "addresources/values-ja-rJP/newx/strings.xml"
JA_KAKAO_STRINGS_ENTRY = "addresources/values-ja-rJP/kakaotalk/strings.xml"
# Named patches with no compatible packages that upstream ships and
# the bundle legitimately contains: "Disable Sentry telemetry" is a
# shared dependency of the KakaoTalk "Disable Sentry" patch (see
# sources/kakao/UPSTREAM_BASE.md). Its description is translated
# like the KakaoTalk descriptions.
EXPECTED_UNIVERSAL_PATCHES = {
    "Disable Sentry telemetry",
}
# The full listed patch inventory of the four source copies
# (sources/piko @ 340dd02, sources/twitch @ v1.5.0 base,
# sources/line @ v3.10.0 base, sources/kakao @ v1.5.0 base). Patch names
# are upstream's English names and are NEVER translated (the patcher
# sorts execution by name; see docs/UPSTREAM.md). The X list is kept
# in the exact order of upstream crimera/piko-newx v3.73.0's
# published patches-list.json.
EXPECTED_PATCHES = {
    "com.twitter.android": {
        "NewX: Remove ads",
        "NewX: Disable blur effects",
        "NewX: Restore Twitter branding",
        "NewX: Browse tweet object",
        "NewX: Open canonical URLs",
        "NewX: Clone",
        "NewX: Crash logs",
        "NewX: Custom font",
        "NewX: Custom sharing domain",
        "NewX: Permanent share links",
        "NewX: Remove share tracking parameters",
        "NewX: Customize drawer items",
        "NewX: Theme",
        "NewX: Feature switch overrides",
        "NewX: Enable quality-of-life feature flags",
        "NewX: Customize inline actions",
        "NewX: Inline download button",
        "NewX: Redirect downloads to chosen folder",
        "NewX: Log HLS audio renditions",
        "NewX: Customize media menu items",
        "NewX: Set default media tab",
        "NewX: Gallery profile Photos tab",
        "NewX: Customize navigation bar",
        "NewX: Hide post author actions",
        "NewX: Hide post reply bar",
        "NewX: Customize post menu items",
        "NewX: Set default profile post sorting",
        "NewX: Customize profile tabs",
        "NewX: Set default reply sorting",
        "NewX: Server error logging",
        "NewX: Disable video player scrolling",
        "NewX: Hide premium upsell",
        "NewX: Unlock color customization",
        "NewX: Unlock downloads",
        "NewX: Customize timeline tabs",
        "NewX: Disable automatic timeline refresh",
        "NewX: Filter For You by topic",
        "NewX: Hide AI-generated posts",
        "NewX: Hide Discover more",
        "NewX: Hide compose button",
        "NewX: Hide new posts pill",
        "NewX: Hide post dividers",
        "NewX: Hide Spaces bar",
        "NewX: Hide timeline tabs bar",
        "NewX: Hide who to follow",
        "NewX: Restore pinned home tab",
        "NewX: Restore timeline position",
        "NewX: Show poll results",
        "NewX: Show sensitive media",
        "NewX: Hide posts by verified account type",
        "NewX: Filter posts by keyword",
        "NewX: Translator",
    },
    "tv.twitch.android.app": {
        "Block client-requested ads",
        "Hide feed and display ads",
        "Block stream ads",
        "Auto-claim bonus channel points",
        "Show deleted messages",
        "Inspect Twitch APK",
        "Playback diagnostics",
        "Favorite emotes",
        "BTTV, FFZ and 7TV emotes",
        "Hide subscription discount banners",
        "Hide Turbo promotions",
        "Reload stream",
        "UI settings",
        # Ayufa original patch (not from upstream; added in v1.3.0).
        # Its name is English by the same never-translate rule.
        "Ayufa: Startup tab",
    },
    # LINE patches from andrewliang25/morphe-patches (v3.10.0 base).
    # Only the LINE set is bundled; upstream's Facebook patches are
    # not injected into the build (see docs/UPSTREAM.md).
    "jp.naver.line.android": {
        "[General] Trust user-installed CAs",
        "[Chat] Hide AI Friends button",
        "[Chat] Hide community button",
        "[General] Custom font",
        "[General] Redirect LINE Pay",
        "[General] Disable VOOM",
        "[General] Open links in external browser",
        "[Fix] Restore biometric login",
        "[Fix] Restore location maps via MicroG-RE",
        "[Fix] Restore push notifications",
        "[Fix] Restore chat backup sign-in via MicroG-RE",
        "[Ad] Hide ad views",
        "[General] Hide Agent i buttons",
        "[Chat] Hide attach menu extra tools",
        "[Chat] Hide calendar buttons",
        "[Chat] Hide tips under messages",
        "[Chat] Hide Events button",
        "[Chat] Hide LINE GIFT button",
        "[Home] Hide Home content feed",
        "[Home] Hide Home modules",
        "[Tab] Hide LINE TODAY tab",
        "[General] Hide new item badges",
        "[Premium] Disable LINE Premium",
        "[Premium] Hide premium unsend upsells",
        "[Tab] Hide Shopping tab",
        "[Chat] Hide Transfer button",
        "[Tab] Hide VOOM tab",
        "[Tab] Hide Wallet tab",
        "[Chat] Keep chats unread",
        "[Chat] Keep unsent messages",
        "[Ad] Remove banner ads",
        "[General] Andrew's Patch Setting",
    },
    # KakaoTalk patches from AmpleReVanced/revanced-patches (v1.5.0 base).
    # Only the KakaoTalk set is bundled; upstream's other apps' patches
    # are not injected into the build (see docs/UPSTREAM.md).
    "com.kakao.talk": {
        "Add Packet Handler",
        "Add Pine Lib",
        "Add settings resources",
        "Add settings tab",
        "Allow Hide on Any Chat",
        "Allow Open Chat Managers To Block Members",
        "Allow custom profile images",
        "Allow direct thread reply editing",
        "Allow invisible characters",
        "Allow open chat media bundle",
        "Allow profile media download",
        "Allow reply to feed",
        "Always Show Kick Button",
        "Block reactions on deleted or hidden messages",
        "Block replies on deleted or hidden messages",
        "Bypass Moat check",
        "Bypass input mention limit in non-multichat",
        "Change model",
        "Change package name",
        "Custom branding",
        "Default external browser",
        "Disable 300+ unread limit",
        "Disable 99 unread limit",
        "Disable AdFit environment detection",
        "Disable ChatRoomAdController",
        "Disable Collapse Button",
        "Disable Community Tab",
        "Disable Friend Feed tab",
        "Disable Friend Lists ad",
        "Disable OpenChat feed ad",
        "Disable Pay banner ad",
        "Disable S2Event",
        "Disable SDK Tracker",
        "Disable Sentry",
        "Disable ShortForm ad",
        "Disable Talk Share Log",
        "Disable abuse detection report",
        "Disable chat room list ad",
        "Disable navigation bar animation",
        "Disable open chat room comments",
        "Disable verifying signature",
        "Enable Markdown",
        "Enable send big text",
        "Force enable debug mode",
        "Force enable emoticon plus feature",
        "Ghost Mode",
        "Hide More tab Game tab",
        "Hide More tab components",
        "Hook Package Manager",
        "Ignore forward restriction",
        "Open profile from open chat feed",
        "Override feature flag",
        "Register settings activity",
        "Remove BizBoard ads",
        "Remove More tab ad",
        "Remove OpenLink chat room list ad",
        "Remove Short-form Tab",
        "Remove feed ad",
        "Remove focus ad",
        "Remove local connect tab",
        "Remove native ad",
        "Remove shop tab",
        "Remove tab banner ads",
        "Restore keyword notification log",
        "Show chatroom channel ID",
        "Show deleted, hidden, or edited messages",
        "Show message details",
        "Show message read receipts",
        "Show messages restricted to mobile",
        "Spoof App ID",
        "Spoof apk checksums",
        "Spoof attestation package name",
        "Spoof installer package name",
        "Spoof signature",
        "Strip image metadata",
        "Version info patch",
    },
}
# Upstream crimera/piko-newx v3.73.0's published patches-list.json
# order for X (the generated list must keep this order).
EXPECTED_X_ORDER = [
    "NewX: Remove ads",
    "NewX: Disable blur effects",
    "NewX: Restore Twitter branding",
    "NewX: Browse tweet object",
    "NewX: Open canonical URLs",
    "NewX: Clone",
    "NewX: Crash logs",
    "NewX: Custom font",
    "NewX: Custom sharing domain",
    "NewX: Permanent share links",
    "NewX: Remove share tracking parameters",
    "NewX: Customize drawer items",
    "NewX: Theme",
    "NewX: Feature switch overrides",
    "NewX: Enable quality-of-life feature flags",
    "NewX: Customize inline actions",
    "NewX: Inline download button",
    "NewX: Redirect downloads to chosen folder",
    "NewX: Log HLS audio renditions",
    "NewX: Customize media menu items",
    "NewX: Set default media tab",
    "NewX: Gallery profile Photos tab",
    "NewX: Customize navigation bar",
    "NewX: Hide post author actions",
    "NewX: Hide post reply bar",
    "NewX: Customize post menu items",
    "NewX: Set default profile post sorting",
    "NewX: Customize profile tabs",
    "NewX: Set default reply sorting",
    "NewX: Server error logging",
    "NewX: Disable video player scrolling",
    "NewX: Hide premium upsell",
    "NewX: Unlock color customization",
    "NewX: Unlock downloads",
    "NewX: Customize timeline tabs",
    "NewX: Disable automatic timeline refresh",
    "NewX: Filter For You by topic",
    "NewX: Hide AI-generated posts",
    "NewX: Hide Discover more",
    "NewX: Hide compose button",
    "NewX: Hide new posts pill",
    "NewX: Hide post dividers",
    "NewX: Hide Spaces bar",
    "NewX: Hide timeline tabs bar",
    "NewX: Hide who to follow",
    "NewX: Restore pinned home tab",
    "NewX: Restore timeline position",
    "NewX: Show poll results",
    "NewX: Show sensitive media",
    "NewX: Hide posts by verified account type",
    "NewX: Filter posts by keyword",
    "NewX: Translator",
]
EXPECTED_LISTED_COUNT = sum(
    len(names) for names in EXPECTED_PATCHES.values()
) + len(EXPECTED_UNIVERSAL_PATCHES)
# Code markers proving all four patch sets survived in classes.dex,
# plus the settings key of a settings-gated opt-in NewX patch (Hide
# post dividers).
DEX_CODE_MARKERS = [
    b"app/crimera/patches/newx",
    b"dev/twitchpatches/patches",
    b"app/andrewliang/patches",
    b"app/revanced/patches/kakaotalk",
    b"newx.timeline.hide_post_dividers",
]
# The Twitch settings screen title must be inside the Twitch extension
# payload (the feature toggles live there at runtime).
TWITCH_EXTENSION_MARKER = "パッチ設定"
# A LINE settings switch label must be inside the LINE extension
# payload (the "Andrew's Patch Setting" screen lives there at runtime).
LINE_EXTENSION_MARKER = "トークを未読のままにする"
# The KakaoTalk extension payload must carry the KakaoTalk extension
# classes (its settings UI text lives in the addresources strings,
# so a class-name marker is used instead of a UI string).
KAKAO_EXTENSION_MARKER = "app/revanced/extension/kakaotalk"


def fail(message: str, failures: list[str]) -> None:
    failures.append(message)
    print(f"FAIL: {message}")


def ok(message: str) -> None:
    print(f"ok: {message}")


def load_patches(patches_list_path: Path) -> list[dict]:
    """Return [{name, description, packages}] from a patches-list.json."""
    data = json.loads(patches_list_path.read_text(encoding="utf-8"))
    entries = data["patches"] if isinstance(data, dict) else data
    patches = []
    for entry in entries:
        if isinstance(entry, str):
            patches.append({"name": entry, "description": None, "packages": []})
        else:
            compat = entry.get("compatiblePackages") or []
            if isinstance(compat, dict):
                packages = sorted(compat.keys())
            else:
                packages = sorted(
                    item["packageName"] for item in compat if item.get("packageName")
                )
            patches.append(
                {
                    "name": str(entry["name"]),
                    "description": entry.get("description"),
                    "packages": packages,
                }
            )
    return patches


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", help="Path to the .mpp bundle")
    parser.add_argument("--version", default=None, help="Expected bundle version")
    parser.add_argument(
        "--patches-list",
        default=None,
        help="patches-list.json generated alongside the bundle",
    )
    parser.add_argument(
        "--summary",
        default=None,
        help="Where to write bundle-summary.json (default: next to the bundle)",
    )
    args = parser.parse_args()

    bundle_path = Path(args.bundle)
    failures: list[str] = []
    summary: dict = {"bundle": bundle_path.name}

    with zipfile.ZipFile(bundle_path) as archive:
        names = set(archive.namelist())

        for entry in sorted(EXPECTED_EXTENSIONS):
            if entry in names:
                ok(f"extension payload present: {entry}")
            else:
                fail(f"missing extension payload: {entry}", failures)
        summary["extensions"] = sorted(names & EXPECTED_EXTENSIONS)

        if "classes.dex" in names:
            ok("classes.dex present")
            dex = archive.read("classes.dex")
        else:
            fail("classes.dex missing", failures)
            dex = b""
        summary["dex_bytes"] = len(dex)

        twitch_ext = (
            archive.read("extensions/twitch.mpe")
            if "extensions/twitch.mpe" in names
            else b""
        )
        line_ext = (
            archive.read("extensions/extension.mpe")
            if "extensions/extension.mpe" in names
            else b""
        )
        kakao_ext = (
            archive.read("extensions/kakaotalk.mpe")
            if "extensions/kakaotalk.mpe" in names
            else b""
        )

        rn_assets = [n for n in names if n.startswith("reactnative/") and n.endswith(".js")]
        if len(rn_assets) >= 20:
            ok(f"reactnative assets present: {len(rn_assets)} js files")
        else:
            fail(f"reactnative assets incomplete: {len(rn_assets)} js files", failures)
        summary["reactnative_js_files"] = len(rn_assets)

        if any(n.startswith("hermes/") for n in names):
            ok("hermes assets present")
        else:
            fail("hermes assets missing", failures)

        if JA_STRINGS_ENTRY in names:
            ja_xml = archive.read(JA_STRINGS_ENTRY).decode("utf-8")
            string_count = len(re.findall(r"<string\s+name=", ja_xml))
            if string_count >= 400:
                ok(f"Japanese settings resources present: {string_count} strings")
            else:
                fail(f"Japanese settings resources too small: {string_count} strings", failures)
            if not re.search(r"[\u3040-\u30ff]", ja_xml):
                fail("Japanese settings resources contain no kana", failures)
            summary["ja_overlay_strings"] = string_count
        else:
            fail(f"Japanese settings resources missing: {JA_STRINGS_ENTRY}", failures)

        if JA_KAKAO_STRINGS_ENTRY in names:
            kakao_ja_xml = archive.read(JA_KAKAO_STRINGS_ENTRY).decode("utf-8")
            kakao_string_count = len(re.findall(r"<string\s+name=", kakao_ja_xml))
            if kakao_string_count >= 187:
                ok(
                    "Japanese KakaoTalk settings resources present: "
                    f"{kakao_string_count} strings"
                )
            else:
                fail(
                    "Japanese KakaoTalk settings resources too small: "
                    f"{kakao_string_count} strings",
                    failures,
                )
            if not re.search(r"[\u3040-\u30ff]", kakao_ja_xml):
                fail("Japanese KakaoTalk settings resources contain no kana", failures)
            summary["ja_kakao_strings"] = kakao_string_count
        else:
            fail(
                f"Japanese KakaoTalk settings resources missing: {JA_KAKAO_STRINGS_ENTRY}",
                failures,
            )

        # Unfold continuation lines of the JAR manifest format at the
        # byte level: lines wrap at 72 bytes, which can split a
        # multi-byte UTF-8 character (the Japanese bundle description)
        # across the wrap, so decoding first would fail.
        manifest = (
            archive.read("META-INF/MANIFEST.MF")
            .replace(b"\r\n ", b"")
            .replace(b"\n ", b"")
            .decode("utf-8")
        )
        fields = dict(
            line.split(": ", 1) for line in manifest.splitlines() if ": " in line
        )
        summary["manifest"] = fields
        if fields.get("Name") == "Ayufa Patches JP":
            ok("MANIFEST Name is Ayufa Patches JP")
        else:
            fail(f"MANIFEST Name is {fields.get('Name')!r}", failures)
        if args.version and fields.get("Version") != args.version:
            fail(
                f"MANIFEST Version is {fields.get('Version')!r}, "
                f"expected {args.version!r}",
                failures,
            )
        if fields.get("Patcher-Version"):
            ok(f"Patcher-Version: {fields['Patcher-Version']}")
        else:
            fail("MANIFEST has no Patcher-Version", failures)

    for marker in DEX_CODE_MARKERS:
        if marker in dex:
            ok(f"dex code marker present: {marker.decode()}")
        else:
            fail(f"dex code marker missing: {marker.decode()}", failures)
    if TWITCH_EXTENSION_MARKER.encode("utf-8") in twitch_ext:
        ok("Twitch extension contains the パッチ設定 screen strings")
    else:
        fail("Twitch extension lacks パッチ設定 strings", failures)
    if LINE_EXTENSION_MARKER.encode("utf-8") in line_ext:
        ok("LINE extension contains the translated settings screen strings")
    else:
        fail("LINE extension lacks translated settings screen strings", failures)
    if KAKAO_EXTENSION_MARKER.encode("utf-8") in kakao_ext:
        ok("KakaoTalk extension contains the KakaoTalk extension classes")
    else:
        fail("KakaoTalk extension lacks the KakaoTalk extension classes", failures)

    listed: list[dict] = []
    if args.patches_list:
        listed = load_patches(Path(args.patches_list))
        if len(listed) == EXPECTED_LISTED_COUNT:
            ok(f"patches list contains exactly {len(listed)} patches")
        else:
            fail(
                f"patches list contains {len(listed)} patches, "
                f"expected exactly {EXPECTED_LISTED_COUNT} "
                f"(X {len(EXPECTED_PATCHES['com.twitter.android'])} + "
                f"Twitch {len(EXPECTED_PATCHES['tv.twitch.android.app'])} + "
                f"LINE {len(EXPECTED_PATCHES['jp.naver.line.android'])} + "
                f"KakaoTalk {len(EXPECTED_PATCHES['com.kakao.talk'])} + "
                f"universal {len(EXPECTED_UNIVERSAL_PATCHES)})",
                failures,
            )
        seen: set[tuple[str, str]] = set()
        for patch in listed:
            if not patch["packages"] and patch["name"] not in EXPECTED_UNIVERSAL_PATCHES:
                fail(
                    f"listed patch has no compatible packages and is not a "
                    f"known universal patch: {patch['name']!r}",
                    failures,
                )
            for package in patch["packages"]:
                seen.add((package, patch["name"]))
                expected_names = EXPECTED_PATCHES.get(package)
                if expected_names is None:
                    fail(f"listed patch targets unexpected app: {package}", failures)
                elif patch["name"] not in expected_names:
                    fail(
                        f"listed patch for {package} is {patch['name']!r}, "
                        f"expected one of the upstream English patch names",
                        failures,
                    )
            description = patch.get("description")
            if description is not None and not re.search(
                r"[\u3040-\u30ff\u4e00-\u9fff]", description
            ):
                fail(
                    f"listed patch {patch['name']!r} has a non-Japanese "
                    f"description: {description!r}",
                    failures,
                )
            if patch["name"].encode("utf-8") not in dex:
                fail(f"listed patch name missing from classes.dex: {patch['name']}", failures)
        expected_pairs = {
            (package, name)
            for package, names in EXPECTED_PATCHES.items()
            for name in names
        }
        if seen != expected_pairs:
            fail(
                f"listed (app, patch) pairs differ: missing "
                f"{sorted(expected_pairs - seen)}, unexpected {sorted(seen - expected_pairs)}",
                failures,
            )
        x_order = [
            patch["name"]
            for patch in listed
            if "com.twitter.android" in patch["packages"]
        ]
        if x_order == EXPECTED_X_ORDER:
            ok("X patches are listed in upstream's published order")
        else:
            fail(
                "X patches are not listed in upstream's published order: "
                f"{x_order}",
                failures,
            )
    else:
        for package, names in EXPECTED_PATCHES.items():
            for name in names:
                if name.encode("utf-8") in dex:
                    listed.append({"name": name, "packages": [package]})
                else:
                    fail(f"patch name missing from dex: {name}", failures)
        if listed:
            ok(f"all {len(listed)} patch names found in dex (no list given)")

    summary["listed_patches"] = listed
    summary["listed_patch_count"] = len(listed)
    summary["newx_patch_count"] = sum(
        1 for p in listed if "com.twitter.android" in p["packages"]
    )
    summary["twitch_patch_count"] = sum(
        1 for p in listed if "tv.twitch.android.app" in p["packages"]
    )
    summary["line_patch_count"] = sum(
        1 for p in listed if "jp.naver.line.android" in p["packages"]
    )
    summary["kakao_patch_count"] = sum(
        1 for p in listed if "com.kakao.talk" in p["packages"]
    )

    summary_path = (
        Path(args.summary)
        if args.summary
        else bundle_path.parent / "bundle-summary.json"
    )
    summary_path.write_text(
        json.dumps(summary, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    print(f"summary written: {summary_path}")
    print(
        f"patches: NewX (X) = {summary['newx_patch_count']}, "
        f"Twitch = {summary['twitch_patch_count']}, "
        f"LINE = {summary['line_patch_count']}, "
        f"KakaoTalk = {summary['kakao_patch_count']}"
    )

    if failures:
        print(f"\n{len(failures)} check(s) FAILED")
        return 1
    print("\nAll bundle checks passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
