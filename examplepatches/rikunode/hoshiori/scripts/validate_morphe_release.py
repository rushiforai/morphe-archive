#!/usr/bin/env python3
"""Preflight Android Morphe Manager metadata AND generated Android .mpp.

Morphe Manager expects created_at as Kotlin LocalDateTime (no timezone).
A valid desktop JVM bundle without a .dex can still appear as 0 patches
on Android Manager, so both gates are mandatory.
"""
from datetime import datetime
import json
from pathlib import Path
import re
import struct
import zipfile

ROOT = Path(__file__).resolve().parents[1]
VERSION = next(line.split("=", 1)[1].strip() for line in (ROOT / "gradle.properties").read_text(encoding="utf-8").splitlines() if line.strip().startswith("version ="))
OWNER = "rikunode"
REPOSITORY = "hoshiori"
EXPECTED_NAMES = {
    "Hide native PR entries from article feeds",
    "Clone Hatena Bookmark for safe side-by-side testing",
    "Hide weekly bookmark ranking announcement",
    "Block ads in in-app article browser",
    "Preserve article WebView cookies and storage",
}


def validate_manifest(data: dict) -> None:
    value = data.get("created_at")
    if not isinstance(value, str) or not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}", value):
        raise ValueError("created_at requires Kotlin LocalDateTime YYYY-MM-DDTHH:mm:ss WITHOUT offset or Z")
    try:
        datetime.strptime(value, "%Y-%m-%dT%H:%M:%S")
    except ValueError as exc:
        raise ValueError("created_at is not a valid date") from exc
    expected = f"https://github.com/{OWNER}/{REPOSITORY}/releases/download/v{VERSION}/patches-{VERSION}.mpp"
    if data.get("download_url") != expected:
        raise ValueError("download_url/version/repository mismatch")
    if data.get("version") != VERSION:
        raise ValueError("remote source version mismatch")
    if data.get("signature_download_url") not in ("", None):
        raise ValueError("Unexpected signature URL; verify that the asset exists")
    if not isinstance(data.get("description"), str) or not data["description"].strip():
        raise ValueError("Source description missing")


def validate_index(data: dict) -> None:
    if data.get("version") != VERSION:
        raise ValueError("patch index version mismatch")
    patches = data.get("patches")
    if not isinstance(patches, list) or len(patches) != 5:
        raise ValueError("expected exactly five patches")
    if {p.get("name") for p in patches} != EXPECTED_NAMES:
        raise ValueError("patch names do not match release")
    for patch in patches:
        packages = patch.get("compatiblePackages")
        if not isinstance(packages, list) or len(packages) != 1:
            raise ValueError("expected exactly one supported package per patch")
        item = packages[0]
        if item.get("packageName") != "com.hatena.android.bookmark":
            raise ValueError("unexpected package name")
        targets = item.get("targets")
        if not isinstance(targets, list) or len(targets) != 1:
            raise ValueError("expected one supported version per patch")
        if targets[0].get("version") != "5.80":
            raise ValueError("wrong supported Hatena version")
        codes = targets[0].get("versionCodes")
        if not isinstance(codes, dict) or set(codes.values()) != {58000}:
            raise ValueError("wrong supported Hatena version code")


def validate_bundle(path: Path) -> None:
    if not path.is_file():
        raise ValueError(f".mpp release artifact not found: {path}")
    with zipfile.ZipFile(path) as bundle:
        if bundle.testzip():
            raise ValueError("bad zip checksum in bundle")
        entries = bundle.namelist()
        dexs = [x for x in entries if x.endswith(".dex")]
        if not dexs:
            raise ValueError("Android Morphe Manager requires classes.dex")
        if not any(x.endswith(".class") for x in entries):
            raise ValueError("Desktop Morphe JVM metadata missing")
        binary = b"".join(bundle.read(name) for name in dexs)
        if not binary.startswith(b"dex\n"):
            raise ValueError("Invalid Android dex magic")
        if len(binary) < 112 or struct.unpack_from("<I", binary, 0x60)[0] <= 0:
            raise ValueError("Empty DEX class_defs_size")
        for cls in (b"CloneHatenaBookmarkPatchKt", b"HideNativePrEntriesPatchKt", b"HideWeeklyRankingPatchKt", b"BlockAdsInAppBrowserPatchKt", b"PreserveArticleWebStoragePatchKt"):
            if cls not in binary:
                raise ValueError(f"Missing compiled patch in Android dex: {cls!r}")
        manifest = bundle.read("META-INF/MANIFEST.MF").decode("utf-8")
        for string in (f"Version: {VERSION}", "Patcher-Version:"):
            if string not in manifest:
                raise ValueError(f"Missing bundle manifest: {string}")


def main() -> None:
    remote = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
    index = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
    validate_manifest(remote)
    validate_index(index)
    validate_bundle(ROOT / "patches/build/libs" / f"patches-{VERSION}.mpp")
    print("MORPHE_ANDROID_SOURCE_PASS: JSON created_at, version, 5 patches, 58000, Android classes.dex")


if __name__ == "__main__":
    main()
