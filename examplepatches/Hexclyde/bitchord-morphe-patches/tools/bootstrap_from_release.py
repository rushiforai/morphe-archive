#!/usr/bin/env python3
"""Verify a pinned release MPP and stage its unchanged native dependencies.

This rebuilds Java/Kotlin tooling inputs; it does not rebuild native TDLib.
No credentials or account/session data are read.
"""

from pathlib import Path
import argparse
import hashlib
import json
import shutil
import tarfile
import time
import urllib.error
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]


def digest(data):
    return hashlib.sha256(data).hexdigest()


def download(url, target, attempts=5):
    """Download url to target, retrying rate limits, server errors and dropped connections."""
    for attempt in range(1, attempts + 1):
        try:
            with urllib.request.urlopen(url, timeout=120) as response, open(
                target, "wb"
            ) as out:
                shutil.copyfileobj(response, out)
            return
        except urllib.error.HTTPError as error:
            if error.code != 429 and error.code < 500 or attempt == attempts:
                raise
            delay = int(error.headers.get("Retry-After", "0") or 0) or 5 * 2**attempt
        except (urllib.error.URLError, TimeoutError, ConnectionError):
            if attempt == attempts:
                raise
            delay = 5 * 2**attempt
        print(f"Download failed, retrying in {delay}s: {url}", flush=True)
        time.sleep(min(delay, 120))


def verify_bundle(path, metadata):
    if digest(path.read_bytes()) != metadata["patch_bundle_sha256"]:
        raise ValueError("Release bundle SHA-256 does not match PROVENANCE.json")
    with zipfile.ZipFile(path) as archive:
        if archive.testzip() is not None:
            raise ValueError("Corrupt release bundle")
        for name, expected in metadata["native_sha256"].items():
            if digest(archive.read(name)) != expected:
                raise ValueError("Native dependency hash mismatch: " + name)
    api = ROOT / "vendor/tdlib-api/TdApi.java"
    if digest(api.read_bytes()) != metadata["generated_tdapi_sha256"]:
        raise ValueError("Generated TDLib Java API hash mismatch")


def stage_native(path, tools):
    td = ROOT / ".deps/tdlib"
    with zipfile.ZipFile(path) as archive:
        for abi in ("arm64-v8a", "armeabi-v7a", "x86_64"):
            for name in (
                "libtdjni.so",
                "libsslx.so",
                "libcryptox.so",
                "libc++_shared.so",
            ):
                if name == "libtdjni.so":
                    target = td / f"src/main/libs/30.0.16248370/android-24/{abi}" / name
                elif name == "libc++_shared.so":
                    target = tools / "libcxx" / abi / name
                else:
                    target = td / f"openssl/30.0.16248370/android-24/{abi}/lib" / name
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(archive.read(f"lib/{abi}/{name}"))
    target = td / "src/main/java/org/drinkless/tdlib"
    target.mkdir(parents=True, exist_ok=True)
    for name in ("Client.java", "TdApi.java"):
        shutil.copy2(ROOT / "vendor/tdlib-api" / name, target / name)


def download_tools(tools, metadata):
    tools.mkdir(parents=True, exist_ok=True)
    for item in metadata["downloads"]:
        if item["file"] == "ndk.zip":
            continue  # exact libc++ runtime is staged from the verified release
        target = tools / item["file"]
        if not target.exists() or digest(target.read_bytes()) != item["sha256"]:
            temporary = target.with_suffix(target.suffix + ".download")
            print("Downloading pinned tool:", item["file"], flush=True)
            download(item["url"], temporary)
            if digest(temporary.read_bytes()) != item["sha256"]:
                temporary.unlink()
                raise ValueError("Build tool hash mismatch: " + item["file"])
            temporary.replace(target)
    with tarfile.open(tools / "jdk21.tar.gz") as archive:
        archive.extractall(tools, filter="data")
    with zipfile.ZipFile(tools / "kotlin.zip") as archive:
        # Hash-pinned upstream archive; reject absolute/traversal names too.
        for name in archive.namelist():
            if name.startswith("/") or ".." in Path(name).parts:
                raise ValueError("Unsafe compiler archive path")
        archive.extractall(tools)
    for path in (tools / "kotlinc/bin").iterdir():
        path.chmod(path.stat().st_mode | 0o111)
    with zipfile.ZipFile(tools / "platform35.zip") as archive:
        name = next(n for n in archive.namelist() if n.endswith("/android.jar"))
        (tools / "android.jar").write_bytes(archive.read(name))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--bundle",
        type=Path,
        required=True,
        help="Release MPP whose hash matches PROVENANCE.json",
    )
    parser.add_argument(
        "--verify-only",
        action="store_true",
        help="Validate without writing/downloading",
    )
    parser.add_argument(
        "--download-tools",
        action="store_true",
        help="Fetch and unpack hash-pinned Java/Kotlin tools",
    )
    args = parser.parse_args()
    if args.verify_only and args.download_tools:
        parser.error("--verify-only cannot download tools")
    metadata = json.loads((ROOT / "PROVENANCE.json").read_text())
    verify_bundle(args.bundle, metadata)
    if not args.verify_only:
        tools = ROOT / ".deps/tools"
        stage_native(args.bundle, tools)
        if args.download_tools:
            download_tools(tools, metadata)
    print(
        "PASS: release MPP, 12 pinned native files and generated Java API hashes verified."
    )
    if not args.verify_only:
        print(
            "Native dependencies staged in .deps; supply matching tools or use --download-tools."
        )


if __name__ == "__main__":
    main()
