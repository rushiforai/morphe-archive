#!/usr/bin/env python3
"""Rebuild Maps for every launcher variant and inspect compiled Android resources."""
import argparse
import gzip
import hashlib
import json
from pathlib import Path
import re
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[2]
STYLES = ("classic_pin", "outlined_pin", "classic_map_tile", "raised_map_pin",
          "gradient_pin", "folded_map")


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def run(command, log):
    result = subprocess.run([str(x) for x in command], text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    log.write_text(result.stdout)
    if result.returncode:
        raise RuntimeError(f"Command failed ({result.returncode}); see {log}")
    return result.stdout


def dex_hashes(path):
    with zipfile.ZipFile(path) as archive:
        return {name: hashlib.sha256(archive.read(name)).hexdigest()
                for name in archive.namelist() if name.endswith(".dex")}


def resource_table(text):
    resources = {}
    current = None
    for line in text.splitlines():
        match = re.match(r"\s+resource (0x[0-9a-f]+) (\S+)", line)
        if match:
            current = match[2]
            resources[current] = {"id": match[1], "lines": []}
        elif current:
            resources[current]["lines"].append(line)
    return resources


def attribute(text, name):
    match = re.search(r":" + name + r"\(0x[0-9a-f]+\)=@(0x[0-9a-f]+)", text)
    if not match:
        raise AssertionError(f"Manifest has no {name} resource")
    return match[1]


def inspect(args, apk, directory, style, legacy, expected_name, original_dex=None):
    badging = run([args.aapt2, "dump", "badging", apk], directory / "badging.txt")
    displayed_name = expected_name.replace("\\", "\\\\").replace('"', '\\"')
    assert f"application-label:'{displayed_name}'" in badging
    manifest = run([args.aapt2, "dump", "xmltree", apk, "--file", "AndroidManifest.xml"],
                   directory / "manifest.txt")
    resource_dump = run([args.aapt2, "dump", "resources", apk], directory / "resources.txt")
    table = resource_table(resource_dump)
    # Maps has a large localized table; keep evidence without accumulating gigabytes.
    with gzip.open(directory / "resources.txt.gz", "wt") as archive:
        archive.write(resource_dump)
    (directory / "resources.txt").unlink()
    expected = ("mipmap/ungoogled_legacy_icon" if legacy else "mipmap/maps_2025") if style == "automatic" else \
               "mipmap/maps_2025" if style == "original" else "mipmap/morphe_maps_launcher"
    assert attribute(manifest, "icon") == table[expected]["id"]
    round_name = "mipmap/maps_2025_round" if expected == "mipmap/maps_2025" else expected
    assert attribute(manifest, "roundIcon") == table[round_name]["id"]
    if style not in ("automatic", "original"):
        assert "mipmap/ungoogled_legacy_icon" not in table, "Legacy icon overrode explicit artwork"
        png_lines = table["drawable/morphe_maps_artwork"]["lines"]
        image_path = re.search(r"\(file\) (\S+)", "\n".join(png_lines))[1]
        source = ROOT / "patches/src/main/resources/googlemaps/branding" / (style.rsplit("_", 1)[0] + ".png")
        with zipfile.ZipFile(apk) as archive:
            assert archive.read(image_path) == source.read_bytes()
        adaptive = run([args.aapt2, "dump", "xmltree", apk, "--file",
                        "res/mipmap-anydpi/morphe_maps_launcher.xml"], directory / "adaptive.txt")
        assert "E: adaptive-icon" in adaptive
        assert "@" + table["drawable/morphe_maps_background"]["id"] in adaptive
        assert "@" + table["drawable/morphe_maps_foreground"]["id"] in adaptive
        background = run([args.aapt2, "dump", "xmltree", apk, "--file",
                          "res/drawable/morphe_maps_background.xml"], directory / "background.txt")
        assert ("#ff171a21" if style.endswith("_dark") else "#fffafafa") in background.lower()
        foreground = run([args.aapt2, "dump", "xmltree", apk, "--file",
                          "res/drawable/morphe_maps_foreground.xml"], directory / "foreground.txt")
        inset = re.search(r":inset\(0x[0-9a-f]+\)=([0-9.]+)%", foreground)
        assert inset and abs(float(inset[1]) - 28 / 108) < 0.0001, foreground
        assert "@" + table["drawable/morphe_maps_artwork"]["id"] in foreground
    elif style == "original":
        assert "mipmap/ungoogled_legacy_icon" not in table
        assert "mipmap/morphe_maps_launcher" not in table
    if original_dex is not None:
        assert dex_hashes(apk) == original_dex, "Resource branding changed DEX"
    return {"style": style, "legacy_selected": legacy, "resolved_name": expected_name,
            "apk_sha256": sha256(apk), "passed": True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for option in ("bundle", "apk", "cli", "aapt2", "output"):
        parser.add_argument("--" + option, required=True, type=Path)
    parser.add_argument("--keep-apks", action="store_true")
    parser.add_argument("--inspect-apk", type=Path, help="Inspect a separately built full Maps profile")
    parser.add_argument("--style", help="Style expected with --inspect-apk")
    parser.add_argument("--name", default="Field Maps & Routes")
    args = parser.parse_args()
    for option in ("bundle", "apk", "cli", "aapt2", "output"):
        setattr(args, option, getattr(args, option).resolve())
    args.output.mkdir(parents=True, exist_ok=True)
    digest = sha256(args.bundle)
    if args.inspect_apk:
        if not args.style:
            parser.error("--style is required with --inspect-apk")
        results = [inspect(args, args.inspect_apk.resolve(), args.output, args.style, True, args.name)]
    else:
        original_dex = dex_hashes(args.apk)
        cases = [(style + "_" + background, True) for style in STYLES for background in ("light", "dark")]
        cases += [("original", True), ("automatic", True), ("automatic", False)]
        results = []
        for style, legacy in cases:
            case = style + ("_legacy_off" if not legacy else "")
            directory = args.output / case
            directory.mkdir(parents=True, exist_ok=True)
            apk = directory / "patched.apk"
            command = ["java", "-Xmx3g", "-jar", args.cli, "patch", args.apk, "-p", args.bundle,
                       "--exclusive", "-e", "Change app name", "-O", "appName=" + args.name,
                       "-O", "appIcon=" + style, "--unsigned", "--validate", "-o", apk,
                       "-t", directory / "scratch", "-r", directory / "patch-result.json"]
            if legacy:
                command += ["-e", "Legacy icon"]
            run(command, directory / "patch.log")
            results.append(inspect(args, apk, directory, style, legacy, args.name, original_dex))
            if not args.keep_apks:
                apk.unlink()
            print("PASS: " + case, flush=True)
    if sha256(args.bundle) != digest:
        raise AssertionError("Bundle changed during verification")
    (args.output / "verification.json").write_text(json.dumps({
        "bundle_sha256": digest, "input_sha256": sha256(args.apk), "cases": results,
    }, indent=2) + "\n")
    print(f"Verified {len(results)} rebuilt Maps APKs")


if __name__ == "__main__":
    main()
