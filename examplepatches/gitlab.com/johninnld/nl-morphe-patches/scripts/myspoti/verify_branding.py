#!/usr/bin/env python3
"""Rebuild the original Myspoti APK for every branding option and inspect results."""
import argparse
import concurrent.futures
import hashlib
import json
from pathlib import Path
import subprocess
import xml.etree.ElementTree as ET
import zipfile

ROOT = Path(__file__).resolve().parents[2]
ANDROID = "{http://schemas.android.com/apk/res/android}"
STYLES = ("classic_green", "elegant_dark", "emerald_black", "emerald_glass",
          "platinum_charcoal", "black_warm_white")


def run(command, log):
    result = subprocess.run([str(item) for item in command], text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    log.write_text(result.stdout)
    if result.returncode:
        raise RuntimeError(f"Command failed ({result.returncode}); see {log}")
    return result.stdout


def dex_hashes(apk):
    with zipfile.ZipFile(apk) as archive:
        return {name: hashlib.sha256(archive.read(name)).hexdigest()
                for name in archive.namelist() if name.endswith(".dex")}


def verify_case(args, case):
    key, icon, name, combined = case
    directory = args.output / key
    directory.mkdir(parents=True, exist_ok=True)
    apk = directory / "patched.apk"
    command = ["java", "-Xmx2g", "-jar", args.cli, "patch", args.apk,
               "-p", args.bundle, "--exclusive", "-e", "Custom branding",
               "-O", f"appIcon={icon}", "--unsigned", "--validate",
               "-o", apk, "-t", directory / "scratch", "-r", directory / "patch-result.json"]
    if name is not None:
        command += ["-O", f"customName={name}"]
    if combined:
        command += ["-e", "Allow any Android Auto host"]
    run(command, directory / "patch.log")
    decoded = directory / "decoded"
    run(["apktool", "d", "-f", "-s", apk, "-o", decoded], directory / "decode.log")
    manifest = ET.parse(decoded / "AndroidManifest.xml").getroot()
    application = manifest.find("application")
    assert application is not None
    assert manifest.get("package") == "app.myspoti.stable"
    badging = run([args.aapt2, "dump", "badging", apk], directory / "badging.txt")
    expected_name = name if name and name.strip() else "Myspoti"
    # aapt2 escapes quotes and backslashes in its textual badging output.
    displayed_name = expected_name.replace("\\", "\\\\").replace('"', '\\"')
    assert f"application-label:'{displayed_name}'" in badging, badging[:2000]
    if name and name.strip():
        assert application.get(ANDROID + "label") == "@string/morphe_myspoti_app_name"
        widget = next(node for node in application.findall("receiver")
                      if node.get(ANDROID + "name", "").endswith(".NowPlayingWidget"))
        assert widget.get(ANDROID + "label") == "@string/morphe_myspoti_app_name"
    if icon == "original":
        assert application.get(ANDROID + "icon") == "@mipmap/ic_launcher"
        assert application.get(ANDROID + "roundIcon") == "@mipmap/ic_launcher_round"
        assert not list((decoded / "res").glob("*/morphe_myspoti_launcher.*"))
    else:
        assert application.get(ANDROID + "icon") == "@mipmap/morphe_myspoti_launcher"
        assert application.get(ANDROID + "roundIcon") == "@mipmap/morphe_myspoti_launcher"
        resources = ROOT / "patches/src/main/resources/myspoti/branding" / icon
        # APKtool may append version qualifiers. Compare actual decoded image bytes.
        for filename in ("morphe_myspoti_artwork.png", "morphe_myspoti_launcher.png"):
            actual = list((decoded / "res").glob(f"*/{filename}"))
            source = next(resources.glob(f"*/{filename}"))
            assert len(actual) == 1 and actual[0].read_bytes() == source.read_bytes()
        adaptive = next((decoded / "res").glob("mipmap-anydpi*/morphe_myspoti_launcher.xml"))
        adaptive_root = ET.parse(adaptive).getroot()
        assert adaptive_root.tag == "adaptive-icon"
        assert adaptive_root.find("foreground").get(ANDROID + "drawable") == "@drawable/morphe_myspoti_foreground"
        assert adaptive_root.find("background").get(ANDROID + "drawable") == "@drawable/morphe_myspoti_background"
    original_dex = dex_hashes(args.apk)
    patched_dex = dex_hashes(apk)
    if combined:
        assert original_dex != patched_dex
        queries = manifest.find("queries")
        assert queries is not None
        assert any(node.get(ANDROID + "name") == "app.johninnl.drivedeck"
                   for node in queries.findall("package"))
    else:
        assert original_dex == patched_dex, "Resource-only branding changed DEX"
    return {"case": key, "icon": icon, "name": expected_name, "combined": combined,
            "apk_sha256": hashlib.sha256(apk.read_bytes()).hexdigest(), "passed": True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for flag in ("bundle", "apk", "cli", "aapt2", "output"):
        parser.add_argument(f"--{flag}", required=True, type=Path)
    parser.add_argument("--case", help="Run only the named verification case")
    args = parser.parse_args()
    for flag in ("bundle", "apk", "cli", "aapt2", "output"):
        setattr(args, flag, getattr(args, flag).resolve())
    args.output.mkdir(parents=True, exist_ok=True)
    cases = [(style, style, "Spoti & Friends", False) for style in STYLES]
    cases += [("original", "original", None, False),
              ("name_only", "original", "@Spoti's \"Mix\" \\ 100%", False),
              ("question_name", "original", "?Spoti café 🎵", False),
              ("reference_name", "original", "@string/app_name", False),
              ("attribute_name", "original", "?attr/colorAccent", False),
              ("color_name", "original", "#123456", False),
              ("icon_only", "classic_green", "", False),
              ("combined", "emerald_glass", "Spoti", True)]
    if args.case:
        cases = [case for case in cases if case[0] == args.case]
        if not cases:
            parser.error("Unknown case")
    with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
        results = list(executor.map(lambda case: verify_case(args, case), cases))
    (args.output / "verification.json").write_text(json.dumps(results, indent=2) + "\n")
    print(f"Verified {len(results)} real APK rebuilds; see verification.json for cases.")


if __name__ == "__main__":
    main()
