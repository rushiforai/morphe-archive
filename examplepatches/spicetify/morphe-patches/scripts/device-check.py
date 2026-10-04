#!/usr/bin/env python3
"""Verify a signed Spotify APK and optionally update one explicitly selected device."""

import argparse
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import time
import xml.etree.ElementTree as ET


PACKAGE = "com.spotify.music"


def run(command, timeout=60):
    result = subprocess.run(command, capture_output=True, text=True, timeout=timeout)
    if result.returncode:
        # Tool output can contain device/account information. Keep it out of reports.
        raise RuntimeError(f"{Path(command[0]).name} failed with exit {result.returncode}")
    return result.stdout


def digest(path):
    checksum = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            checksum.update(block)
    return checksum.hexdigest()


def certificate(apksigner, apk):
    output = run([apksigner, "verify", "--print-certs", str(apk)])
    values = re.findall(r"^Signer #\d+ certificate SHA-256 digest: ([a-fA-F0-9]{64})$", output, re.M)
    if len(values) != 1:
        raise RuntimeError("Expected one verified APK signer")
    return values[0].lower()


def require_match(actual, expected, label):
    if actual != expected:
        raise RuntimeError(f"{label} mismatch; stopping without clearing app data")


def album_state(xml):
    nodes = [node for node in ET.fromstring(xml).iter("node")
             if node.get("package") == PACKAGE]
    labels = {node.get("text", "") for node in nodes}
    if "The tracks on this release are not available." in labels:
        return "tracks-unavailable"
    if "Something went wrong" in labels:
        return "loading-error"
    return "spotify-visible-unconfirmed" if nodes else "spotify-not-visible"


def check(args, report):
    adb = [args.adb, "-s", args.serial]
    require_match(run(adb + ["get-state"]).strip(), "device", "Device state")
    report["androidVersion"] = run(adb + ["shell", "getprop", "ro.build.version.release"]).strip()
    with tempfile.TemporaryDirectory(prefix="morphe-device-check-") as folder:
        candidate = Path(folder) / "candidate.apk"
        # Use the checked copy for installation, even if the supplied file changes.
        with args.apk.open("rb") as source, candidate.open("wb") as target:
            shutil.copyfileobj(source, target)
        report["candidateSha256"] = digest(candidate)
        require_match(report["candidateSha256"], args.sha256.lower(), "Candidate SHA-256")
        badging = run([args.aapt2, "dump", "badging", str(candidate)])
        match = re.search(r"^package: name='([^']+)' versionCode='(\d+)' versionName='([^']+)'", badging, re.M)
        if not match:
            raise RuntimeError("Cannot identify candidate package")
        require_match(match[1], PACKAGE, "Package")
        require_match(match[3], args.version, "Spotify version")
        report["version"] = match[3]
        report["versionCode"] = match[2]
        report["signerSha256"] = certificate(args.apksigner, candidate)
        paths = run(adb + ["shell", "pm", "path", PACKAGE]).splitlines()
        if len(paths) != 1 or not re.fullmatch(r"package:/data/app/[A-Za-z0-9_=/+.~\-]+/base\.apk", paths[0]):
            raise RuntimeError("Expected an existing single-APK Spotify install; split or absent installs need Manager")
        installed = Path(folder) / "installed.apk"
        run(adb + ["pull", paths[0][8:], str(installed)])
        report["previousSha256"] = digest(installed)
        require_match(certificate(args.apksigner, installed), report["signerSha256"], "Signing certificate")
        report["preflight"] = "passed"
        if args.install and report["previousSha256"] != report["candidateSha256"]:
            started = time.monotonic()
            result = run(adb + ["install", "-r", str(candidate)], timeout=180)
            if "Success" not in result.splitlines():
                raise RuntimeError("Android did not confirm installation")
            report["installSeconds"] = round(time.monotonic() - started, 2)
        paths = run(adb + ["shell", "pm", "path", PACKAGE]).splitlines()
        if len(paths) != 1 or not re.fullmatch(r"package:/data/app/[A-Za-z0-9_=/+.~\-]+/base\.apk", paths[0]):
            raise RuntimeError("Installed APK path changed unexpectedly")
        checksum = run(adb + ["shell", "sha256sum", paths[0][8:]]).split()[0]
        report["installedSha256"] = checksum
        report["candidateInstalled"] = checksum == report["candidateSha256"]
        if args.install or args.album_id:
            require_match(checksum, report["candidateSha256"], "Installed SHA-256")
        if args.album_id:
            run(adb + ["shell", "am", "start", "-W", "-a", "android.intent.action.VIEW",
                       "-d", "https://open.spotify.com/album/" + args.album_id, "-p", PACKAGE])
            time.sleep(3)
            remote_xml = "/data/local/tmp/morphe-device-check.xml"
            try:
                run(adb + ["shell", "rm", "-f", remote_xml])
                dumped = run(adb + ["shell", "uiautomator", "dump", remote_xml])
                if "UI hierchary dumped to:" not in dumped:
                    raise RuntimeError("Android did not produce a fresh UI snapshot")
                xml = run(adb + ["shell", "cat", remote_xml])
                report["albumObservation"] = album_state(xml)
            finally:
                run(adb + ["shell", "rm", "-f", remote_xml])
            report["playbackVerified"] = False


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--serial", required=True, help="Explicit ADB target; never auto-selected")
    parser.add_argument("--apk", required=True, type=Path)
    parser.add_argument("--sha256", required=True, help="Expected digest from artifact verification")
    parser.add_argument("--apksigner", required=True)
    parser.add_argument("--aapt2", required=True)
    parser.add_argument("--adb", default="adb")
    parser.add_argument("--version", default="9.1.80.2221")
    parser.add_argument("--report", required=True, type=Path)
    parser.add_argument("--install", action="store_true", help="Update with install -r, preserving data")
    parser.add_argument("--album-id", help="Open a public album and report its visible error state")
    args = parser.parse_args()
    if not re.fullmatch(r"[0-9a-fA-F]{64}", args.sha256):
        parser.error("--sha256 must have 64 hexadecimal characters")
    if args.album_id and not re.fullmatch(r"[A-Za-z0-9]{22}", args.album_id):
        parser.error("--album-id must be a 22-character Spotify ID")
    if args.report.resolve() == args.apk.resolve():
        parser.error("--report must differ from --apk")
    report = {"status": "failed", "installRequested": args.install}
    started = time.monotonic()
    try:
        check(args, report)
        report["status"] = "passed"
    except (RuntimeError, OSError, subprocess.SubprocessError, ET.ParseError) as error:
        report["error"] = str(error) if isinstance(error, RuntimeError) else type(error).__name__
    report["totalSeconds"] = round(time.monotonic() - started, 2)
    args.report.write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps(report, indent=2))
    return 0 if report["status"] == "passed" else 1


if __name__ == "__main__":
    raise SystemExit(main())
