#!/usr/bin/env python3
"""Patch *only* the exact user-supplied 5.80 APK, inspect the output and avoid installs.

Usage:
  python scripts/patch_user_apk.py apk-inspection/Hatena_Bookmark__Save__share_5.80_APKPure.apk

This script never touches the installed app or its data.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parent.parent
EXPECTED_SHA256 = "f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b"
PATCH_NAMES = {"Hide native PR entries from article feeds", "Clone Hatena Bookmark for safe side-by-side testing"}
BUNDLE = ROOT / "patches/build/libs/patches-0.2.0.mpp"
DEFAULT_JAR = ROOT.parent / "pupil-morphe-patches/apk-inspection/morphe-desktop-1.18.1-all.jar"
EXPECTED_JAR_SHA256 = "1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b"


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def verify_infile(path: Path) -> None:
    if not path.is_file():
        raise FileNotFoundError(f"Put the user's uploaded APK here first: {path}")
    digest = sha256(path)
    if digest != EXPECTED_SHA256:
        raise ValueError(
            "Wrong APK hash. Refusing to patch another build or unsigned split: "
            f"expected {EXPECTED_SHA256}, found {digest}"
        )
    with zipfile.ZipFile(path) as z:
        if z.testzip() is not None:
            raise ValueError("User APK ZIP integrity verification failed")
        for filename in ("AndroidManifest.xml", "classes.dex", "classes2.dex"):
            if filename not in z.namelist():
                raise ValueError(f"Missing {filename}")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    args = parser.parse_args()
    verify_infile(args.apk)
    if not BUNDLE.is_file():
        raise FileNotFoundError("Build Morphe bundle with ./gradlew.bat :patches:generatePatchesList")
    jar = Path(os.getenv("MORPHE_DESKTOP_JAR", str(DEFAULT_JAR)))
    if not jar.is_file():
        raise FileNotFoundError(f"Morphe Desktop jar unavailable: {jar}")
    # Pin the known-good desktop test harness unless user intentionally overrides it.
    if "MORPHE_DESKTOP_JAR" not in os.environ and sha256(jar) != EXPECTED_JAR_SHA256:
        raise ValueError("Unexpected Morphe Desktop jar checksum")

    outdir = ROOT / "apk-inspection"
    outdir.mkdir(parents=True, exist_ok=True)
    output = outdir / "HatenaBookmark-5.80-PR-hidden-clone-test.apk"
    report = outdir / "hatena-58000-cli-patch-test.json"
    bundled_java = Path(r"C:\Program Files\Android\Android Studio\jbr\bin\java.exe")
    java = os.getenv("JAVA_BIN") or (str(bundled_java) if bundled_java.is_file() else "java")
    cmd = [
        java, "-jar", str(jar), "patch", f"--patches={BUNDLE}",
        f"--out={output}", f"--result-file={report}", str(args.apk),
    ]
    print("Starting Morphe Desktop on pinned 5.80 source; no install", flush=True)
    subprocess.run(cmd, check=True, cwd=ROOT)
    data = json.loads(report.read_text(encoding="utf-8"))
    if data.get("packageName") != "com.hatena.android.bookmark":
        raise AssertionError(f"Unexpected package: {data.get('packageName')}")
    if data.get("packageVersion") != "5.80":
        raise AssertionError(f"Unexpected version: {data.get('packageVersion')}")
    applied = [x["name"] for x in data.get("appliedPatches", [])]
    if set(applied) != PATCH_NAMES or len(applied) != 2 or data.get("failedPatches"):
        raise AssertionError(f"Patch application failed: {applied}, {data.get('failedPatches')}")
    if not all(step.get("success") for step in data.get("patchingSteps", [])):
        raise AssertionError("One or more patching stages failed")

    with zipfile.ZipFile(args.apk) as original, zipfile.ZipFile(output) as patched:
        original_files = set(original.namelist())
        patched_files = set(patched.namelist())
        if not {"classes.dex", "classes2.dex"} <= original_files & patched_files:
            raise AssertionError("Patched APK lost DEX entries")
        if original.read("classes.dex") == patched.read("classes.dex"):
            raise AssertionError("Target classes.dex did not change; bytecode patch ineffective")
        same_secondary_dex = original.read("classes2.dex") == patched.read("classes2.dex")
        print("SECONDARY_DEX_BYTE_IDENTICAL:", same_secondary_dex)
        if not same_secondary_dex:
            print("WARNING: Patcher re-serialized another DEX; inspect changed classes before installation.")
    print("MORPHE_APK_APPLY_PASS; PR filter + side-by-side clone applied, no failures")
    print("Output:", output)
    print("Output SHA256:", sha256(output))
    print("NOTE: No Pairip components seen in input, but sign-in, feed rendering and in-app ad removal remain UNVERIFIED.")


if __name__ == "__main__":
    try:
        main()
    except Exception as exc:
        print(f"VERIFY_OR_APPLY_FAILED: {exc}", file=sys.stderr)
        raise SystemExit(2)
