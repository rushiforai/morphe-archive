#!/usr/bin/env python3
"""Prepare/check Morphe mobile source metadata against the exact pinned release MPP.

No Git commits, release publishing, credentials or APK patching occur here.
"""

from pathlib import Path
import argparse
import datetime as dt
import hashlib
import json
import os
import re
import shutil
import subprocess
import tempfile
import zipfile
from bootstrap_from_release import download, verify_bundle

ROOT = Path(__file__).resolve().parents[1]


def load_config():
    source = json.loads((ROOT / "distribution/source.json").read_text())
    provenance = json.loads((ROOT / "PROVENANCE.json").read_text())
    if not re.fullmatch(r"[A-Za-z0-9-]+/[A-Za-z0-9_.-]+", source["repository"]):
        raise ValueError("Invalid owner/repository")
    if not re.fullmatch(
        r"[0-9]+\.[0-9]+\.[0-9]+(?:-[0-9A-Za-z.-]+)?",
        provenance["patch_bundle_version"],
    ):
        raise ValueError("Invalid release version")
    return source, provenance


def release_urls(source, provenance):
    version = provenance["patch_bundle_version"]
    page = "https://github.com/" + source["repository"] + "/releases/tag/v" + version
    name = "bitchord-patches-" + version + ".mpp"
    download = (
        "https://github.com/"
        + source["repository"]
        + "/releases/download/v"
        + version
        + "/"
        + name
    )
    return name, page, download


def manifest_for(bundle, source, provenance):
    name, page, download = release_urls(source, provenance)
    with zipfile.ZipFile(bundle) as archive:
        # Reproducible from the artifact itself, not the time someone runs this script.
        created = dt.datetime(
            *archive.getinfo("META-INF/MANIFEST.MF").date_time
        ).isoformat()
        fields = archive.read("META-INF/MANIFEST.MF").decode().splitlines()
        if "Version: " + provenance["patch_bundle_version"] not in fields:
            raise ValueError("MPP manifest version mismatch")
    return {
        "created_at": created,
        "description": source["description"],
        "download_url": download,
        "signature_download_url": "",
        "version": provenance["patch_bundle_version"],
        "page_url": page,
    }


def validate_metadata(manifest, patches, source, provenance):
    _, page, download = release_urls(source, provenance)
    if set(manifest) != {
        "created_at",
        "description",
        "download_url",
        "signature_download_url",
        "version",
        "page_url",
    }:
        raise ValueError("Unexpected Morphe manifest fields")
    if manifest["download_url"] != download or manifest["page_url"] != page:
        raise ValueError("Morphe metadata must point to this repository/version")
    if (
        manifest["version"] != provenance["patch_bundle_version"]
        or patches["version"] != manifest["version"]
    ):
        raise ValueError("Morphe source/MPP/provenance versions differ")
    timestamp = dt.datetime.fromisoformat(manifest["created_at"])
    if timestamp.tzinfo is not None or not re.fullmatch(
        r"\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d", manifest["created_at"]
    ):
        raise ValueError(
            "Morphe expects an ISO LocalDateTime without a timezone suffix; interpreted as UTC"
        )
    if (
        manifest["description"] != source["description"]
        or manifest["signature_download_url"] != ""
    ):
        raise ValueError("Source description or unsigned-bundle declaration differs")
    names = {patch["name"] for patch in patches["patches"]}
    if len(patches["patches"]) != 2 or names != {
        "Unofficial Telegram music",
        "Install as Bitchord+",
    }:
        raise ValueError("Unexpected public patch list")
    for patch in patches["patches"]:
        if not patch["default"] or len(patch["compatiblePackages"]) != 1:
            raise ValueError("Patch default or compatibility changed")
        app = patch["compatiblePackages"][0]
        if app["packageName"] != "com.music.bitchord" or app["apkFileType"] != "APK":
            raise ValueError("Unexpected target app/file type")
        if (
            len(app["targets"]) != 1
            or app["targets"][0]["version"] != "1.8.1"
            or app["targets"][0]["minSdk"] != 26
            or not app["targets"][0]["isExperimental"]
        ):
            raise ValueError("Review changed mobile compatibility before releasing")
        expected_keys = (
            {"telegramApplicationId", "telegramApplicationHash"}
            if patch["name"] == "Unofficial Telegram music"
            else {"installationName"}
        )
        if {option["key"] for option in patch["options"]} != expected_keys or len(
            patch["options"]
        ) != len(expected_keys):
            raise ValueError("Missing or unexpected API options")
        for option in patch["options"]:
            expected = {
                "telegramApplicationId": 0,
                "telegramApplicationHash": "",
                "installationName": "",
            }
            if (
                option["key"] not in expected
                or option["default"] != expected[option["key"]]
                or option["required"]
            ):
                raise ValueError("API seeds must remain optional and blank")


def export_patches(bundle, provenance, download_patcher):
    tools = Path(os.environ.get("MORPHE_TOOLS", ROOT / ".deps/tools"))
    item = next(
        item
        for item in provenance["downloads"]
        if item["file"].startswith("morphe-desktop-")
    )
    jar = tools / item["file"]
    if not jar.exists() and download_patcher:
        tools.mkdir(parents=True, exist_ok=True)
        temporary = jar.with_suffix(".download")
        try:
            download(item["url"], temporary)
            if hashlib.sha256(temporary.read_bytes()).hexdigest() != item["sha256"]:
                raise ValueError("Morphe tool hash mismatch")
            temporary.replace(jar)
        finally:
            temporary.unlink(missing_ok=True)
    if (
        not jar.exists()
        or hashlib.sha256(jar.read_bytes()).hexdigest() != item["sha256"]
    ):
        raise ValueError(
            "Missing/mismatched pinned Morphe JAR. Supply MORPHE_TOOLS or --download-patcher."
        )
    java_home = os.environ.get("JAVA_HOME")
    if not java_home:
        java_home = next(iter(sorted(tools.glob("jdk-21*"))), None)
    java = str(Path(java_home) / "bin/java") if java_home else "java"
    javac = str(Path(java_home) / "bin/javac") if java_home else "javac"
    with tempfile.TemporaryDirectory(prefix="bitchord-mobile-metadata-") as temporary:
        output = Path(temporary) / "patches-list.json"
        subprocess.run(
            [
                javac,
                "--release",
                "21",
                "-cp",
                str(jar),
                "-d",
                temporary,
                str(ROOT / "tools/ExportPatchList.java"),
            ],
            check=True,
        )
        subprocess.run(
            [
                java,
                "-cp",
                temporary + os.pathsep + str(jar),
                "ExportPatchList",
                str(bundle.resolve()),
                str(output),
            ],
            check=True,
        )
        return json.loads(output.read_text())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    inputs = parser.add_mutually_exclusive_group(required=True)
    inputs.add_argument(
        "--bundle", type=Path, help="Existing exact MPP, e.g. ../release-assets/...mpp"
    )
    inputs.add_argument(
        "--fetch-bundle",
        action="store_true",
        help="Download the pinned MPP from its public versioned GitHub release",
    )
    parser.add_argument(
        "--download-patcher",
        action="store_true",
        help="Download the hash-pinned Morphe desktop JAR if missing; requires JDK 21",
    )
    parser.add_argument(
        "--assets-dir", type=Path, default=ROOT.parent / "release-assets"
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Compare committed metadata without writing it or release assets",
    )
    args = parser.parse_args()
    source, provenance = load_config()
    if args.fetch_bundle:
        name, _, url = release_urls(source, provenance)
        bundle = ROOT / "build/mobile-input" / name
        bundle.parent.mkdir(parents=True, exist_ok=True)
        download(url, bundle)
    else:
        bundle = args.bundle
    verify_bundle(bundle, provenance)  # Verify before loading any patch classes.
    manifest = manifest_for(bundle, source, provenance)
    patches = export_patches(bundle, provenance, args.download_patcher)
    validate_metadata(manifest, patches, source, provenance)
    for name, data in [
        ("patches-bundle.json", manifest),
        ("patches-list.json", patches),
    ]:
        target = ROOT / name
        rendered = json.dumps(data, indent=2, ensure_ascii=False) + "\n"
        if args.check:
            if not target.exists() or target.read_text() != rendered:
                raise ValueError("Stale/missing generated metadata: " + name)
        else:
            target.write_text(rendered)
    if not args.check:
        assets = args.assets_dir
        assets.mkdir(parents=True, exist_ok=True)
        asset_name, _, _ = release_urls(source, provenance)
        target = assets / asset_name
        if target.resolve() != bundle.resolve():
            shutil.copy2(bundle, target)
        for name in ["patches-bundle.json", "patches-list.json"]:
            shutil.copy2(ROOT / name, assets / name)
        (assets / "SHA256SUMS").write_text(
            "".join(
                hashlib.sha256((assets / name).read_bytes()).hexdigest()
                + "  "
                + name
                + "\n"
                for name in [asset_name, "patches-bundle.json", "patches-list.json"]
            )
        )
    print(
        "PASS: verified MPP; exported both real patches, compatibility, experimental target and blank API options; mobile metadata "
        + ("matches." if args.check else "prepared.")
    )


if __name__ == "__main__":
    main()
