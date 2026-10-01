#!/usr/bin/env python3
"""Check patch refusal paths using disposable copies of a stock base APK."""

import argparse
import hashlib
import json
import struct
import subprocess
import tempfile
import zipfile
import zlib
from pathlib import Path


def altered_apk(source, target, kind):
    changes = 0
    with zipfile.ZipFile(source) as original, zipfile.ZipFile(target, "w") as altered:
        for entry in original.infolist():
            data = original.read(entry)
            if kind in ("sharing", "sharing-response", "settings", "home", "server", "navigation", "ads", "player-ads") and entry.filename.endswith(".dex"):
                old, new = {"sharing": (b"Invalid uri ", b"Invalid urj "),
                            "sharing-response": (b"fullUrl_", b"testUrl_"),
                            "settings": (b"aboutPage", b"aboutPagg"),
                            "home": (b"Lp/joz0;", b"Lp/jpz0;"),
                            "navigation": (b"premium_tab_enabled", b"premium_tab_enablex"),
                            "ads": (b"featureTypeCase_", b"featureTypeTest_"),
                            "player-ads": (b"sectionTypeCase_", b"sectionTypeTest_"),
                            "server": (b"Lcom/spotify/localfiles/mediastore/MediaStoreReader;",
                                       b"Lcom/spotify/localfiles/mediastore/MediaStoreReades;")}[kind]
                count = data.count(old)
                if count:
                    data = bytearray(data.replace(old, new))
                    data[12:32] = hashlib.sha1(data[32:]).digest()
                    struct.pack_into("<I", data, 8, zlib.adler32(data[12:]))
                    changes += count
            elif kind == "theme" and entry.filename == "resources.arsc":
                for encoding in ("utf-8", "utf-16le"):
                    old = "dark_base_background_base".encode(encoding)
                    new = "test_base_background_base".encode(encoding)
                    changes += data.count(old)
                    data = data.replace(old, new)
            altered.writestr(entry, data)
    if not changes:
        raise ValueError(f"Stock fixture has no {kind} marker to alter")
    return changes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stock", type=Path, required=True)
    parser.add_argument("--bundle", type=Path, required=True)
    parser.add_argument("--desktop", type=Path, required=True)
    parser.add_argument("--java", default="java")
    parser.add_argument("--case", action="append", help="Run only this named case; repeat to select several")
    args = parser.parse_args()
    stock, bundle, desktop = (path.resolve(strict=True) for path in
                              (args.stock, args.bundle, args.desktop))
    cases = [
        ("changed-settings-menu", "settings", "Clean sharing links", None,
         "Spotify settings ABI changed: Lp/xlt;"),
        ("missing-sharing-builder", "sharing", "Clean sharing links", None,
         "Spotify settings ABI changed: Lp/ion;"),
        ("changed-sharing-response", "sharing-response", "Clean sharing links", None,
         "Spotify sharing response getter for fullUrl_ changed."),
        ("missing-theme-resource", "theme", "Theme colors", None,
         "Unsupported Spotify color resources: missing dark_base_background_base"),
        ("changed-home-model", "home", "Pin shortcuts on Home", None,
         "Spotify Home ABI changed:"),
        ("changed-server-reader", "server", "Local files from a server", None,
         "Spotify local-files ABI changed:"),
        ("changed-premium-navigation", "navigation", "Hide Premium tab", None,
         "Spotify navigation ABI changed:"),
        ("changed-brand-ad-model", "ads", "Hide Home and Browse ads", None,
         "Spotify advertising ABI changed:"),
        ("changed-player-ad-model", "player-ads", "Hide player ad cards", None,
         "Spotify player advertising ABI changed:"),
    ]

    if args.case:
        unknown = set(args.case) - {case[0] for case in cases}
        if unknown:
            parser.error(f"Unknown refusal cases: {sorted(unknown)}")
        cases = [case for case in cases if case[0] in args.case]

    results = []
    with tempfile.TemporaryDirectory(prefix="morphe-failures-") as temporary:
        root = Path(temporary)
        for name, alteration, patch, option, reason in cases:
            case = root / name
            case.mkdir()
            source = stock
            changes = 0
            if alteration:
                source = case / "altered.apk"
                changes = altered_apk(stock, source, alteration)
            output, report = case / "output.apk", case / "result.json"
            command = [args.java, "-Xmx2g", "-jar", str(desktop), "patch",
                       str(source), "-p", str(bundle), "--exclusive", "-e", patch]
            if option:
                command += ["-O", f"{option}=invalid"]
            command += ["--unsigned", "--bytecode-mode", "FULL",
                        "-t", str(case / "work"), "-o", str(output), "-r", str(report)]
            print(f"Checking {name}...", flush=True)
            completed = subprocess.run(command, stdout=subprocess.PIPE,
                                       stderr=subprocess.STDOUT, text=True, timeout=300)
            result = json.loads(report.read_text()) if report.exists() else {}
            failures = result.get("failedPatches", [])
            matching = [failure for failure in failures
                        if failure.get("patch", {}).get("name") == patch
                        and reason in failure.get("reason", "")]
            if (completed.returncode != 1 or result.get("success") is not False
                    or len(failures) != 1 or len(matching) != 1
                    or result.get("appliedPatches") != [] or output.exists()):
                raise AssertionError(f"{name} did not refuse as expected:\n{completed.stdout}")
            results.append({"case": name, "alteredMarkers": changes,
                            "exitCode": completed.returncode, "reason": reason,
                            "outputAbsent": True})
    print(json.dumps({"stockSha256": hashlib.sha256(stock.read_bytes()).hexdigest(),
                      "bundleSha256": hashlib.sha256(bundle.read_bytes()).hexdigest(),
                      "cases": results}, indent=2))


if __name__ == "__main__":
    main()
