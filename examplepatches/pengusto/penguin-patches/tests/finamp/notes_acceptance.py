#!/usr/bin/env python3
"""Capture Finamp notes on the guarded disposable API 35 fixture."""
import argparse
import hashlib
from pathlib import Path
import re
import subprocess
import time

import android_acceptance as base
from artist_review_acceptance import download_file_hashes
from next_fixes_acceptance import offline

TEST_SIGNER = "5bcbdaac2aebee68090aa00926622ccb5439ad0bec86d3d219ad0b74036d3628"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--apk", type=Path, required=True)
    parser.add_argument("--sha256", required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--adb", type=Path, required=True)
    parser.add_argument("--apksigner", type=Path, required=True)
    parser.add_argument("--package", choices=("com.unicornsonlsd.finamp", "com.unicornsonlsd.finamp.debug"),
                        default="com.unicornsonlsd.finamp")
    parser.add_argument("--signer-sha256", default=TEST_SIGNER,
                        help="Pinned signer of the explicitly supplied APK")
    parser.add_argument("--stage", choices=("before", "after", "offline"), required=True)
    parser.add_argument("--require-preserved", action="store_true", help="Fail if the synthetic login was not preserved")
    args = parser.parse_args()

    apk = args.apk.resolve()
    if hashlib.sha256(apk.read_bytes()).hexdigest() != args.sha256:
        raise ValueError("APK does not match the requested hash")
    if not re.fullmatch(r"[0-9a-f]{64}", args.signer_sha256):
        raise ValueError("A lowercase SHA-256 signer is required")
    signature = subprocess.check_output([str(args.apksigner), "verify", "--print-certs", str(apk)], text=True)
    signers = re.findall(r"(?im)^(?:Signer #\d+|V\d+(?:\.\d+)? Signer):? certificate SHA-256 digest: ([0-9a-f]{64})$", signature)
    if not signers or set(signers) != {args.signer_sha256}:
        raise ValueError("APK signer does not match the requested disposable signer")
    base.PACKAGE = args.package
    ui = base.Android(args.out, adb=args.adb)
    ui.install(apk, args.sha256)
    acceptance = base.Acceptance(ui)
    if acceptance.fixture.manifest.get("profile") != "notes":
        raise ValueError("The notes fixture profile is required")
    acceptance.login(require_preserved=args.require_preserved or args.stage != "before")
    acceptance.album()
    if args.stage == "offline":
        hashes = download_file_hashes(ui)
        songs = [name for name in hashes if name.startswith('songs/')]
        if not songs:
            root, _ = ui.dump()
            controls = []
            for node in root.iter('node'):
                if node.get('class') != 'android.widget.Button' or node.get('text') or node.get('content-desc'):
                    continue
                try:
                    bounds = ui.tap_bounds(node)
                except ValueError:
                    continue
                if 800 < bounds[0] < bounds[2] <= 1080 and 50 <= bounds[1] < bounds[3] <= 210:
                    controls.append(bounds)
            controls.sort()
            if len(controls) != 2:
                raise RuntimeError('Album download control is not uniquely identified')
            x, y, right, bottom = controls[0]
            ui.adb('shell', 'input', 'tap', (x + right) // 2, (y + bottom) // 2)
            root, _ = ui.dump()
            if acceptance.has(root, 'Transcode?'):
                ui.tap('Transcode?')
                ui.tap('Download original', contains=True)
            else:
                transcode = ui.find(root, 'Transcode files?', class_name='android.widget.CheckBox')
                if transcode.get('checked') != 'false':
                    raise RuntimeError('Expected an unchecked original-quality download')
            ui.tap('Add')
            deadline = time.monotonic() + 90
            while time.monotonic() < deadline:
                hashes = download_file_hashes(ui)
                songs = [name for name in hashes if name.startswith('songs/')]
                if len(songs) == 8:
                    break
                time.sleep(1)
        if len(songs) != 8:
            raise AssertionError('Expected eight downloaded synthetic songs')
        acceptance.home()
        offline(ui, True)
        ui.adb('reverse', '--remove', 'tcp:18961')
        try:
            acceptance.album()
            ui.tap('Album information')
            root = ui.capture('offline-album-information-no-network')
            if not acceptance.has(root, 'Album background: a synthetic release note.', contains=True):
                raise AssertionError('Downloaded album information missing without network')
            ui.back()
            ui.tap('01 - Credit Order', contains=True, hold=True)
            ui.scroll_to('Track information')
            ui.tap('Track information')
            root = ui.capture('offline-track-information-no-network')
            if not acceptance.has(root, 'Track background: synthetic beat and sample credits.', contains=True):
                raise AssertionError('Downloaded track information missing without network')
        finally:
            ui.adb('reverse', 'tcp:18961', 'tcp:18961')
            acceptance.home()
            offline(ui, False)
        print('PASS: downloaded album and track information without the fixture connection')
        return
    root = ui.capture(args.stage + "-album")
    present = acceptance.has(root, "Album information")
    if present != (args.stage == "after"):
        raise AssertionError("Unexpected album information action")
    if present:
        ui.tap("Album information")
        root = ui.capture("after-album-information")
        if not acceptance.has(root, "Album background: a synthetic release note.", contains=True):
            raise AssertionError("Album information did not display the fixture text")
        ui.back()
    ui.tap("01 - Credit Order", contains=True, hold=True)
    root = ui.capture(args.stage + "-track-menu")
    present = acceptance.has(root, "Track information")
    if args.stage == 'after' and not present:
        ui.scroll_to('Track information')
        root = ui.capture('after-track-menu-information')
        present = acceptance.has(root, 'Track information')
    if present != (args.stage == "after"):
        raise AssertionError("Unexpected track information action")
    if present:
        labels = [node.get('content-desc') or node.get('text') for node in root.iter('node')]
        if 'Add to Playlist' in labels and labels.index('Track information') < labels.index('Add to Playlist'):
            raise AssertionError('Track information precedes the primary playlist action')
        ui.tap("Track information")
        root = ui.capture("after-track-information")
        if not acceptance.has(root, "Track background: synthetic beat and sample credits.", contains=True):
            raise AssertionError("Track information did not display the fixture text")
    print("PASS:", args.stage, "album and track screens")


if __name__ == "__main__":
    main()
