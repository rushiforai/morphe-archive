#!/usr/bin/env python3
"""Checks where each phone app can be downloaded for patching, and in what shape.

For each phone app the patches support (Compatibility entries in
patches/src/main/kotlin, without the Android TV builds), this script:

1. Downloads what Google Play serves to an ordinary phone (apkeep, with the
   throwaway account in PLAY_EMAIL and PLAY_AAS_TOKEN, split APKs on), and
   notes the version, whether it arrives as one APK or as a base with splits,
   and which APK holds the native libraries (lib/<abi>/*.so).
2. Downloads APKPure's newest file (apkeep), which Helper for Morphe falls
   back to, and notes whether it is a single APK or an XAPK bundle, and
   whether it has the native libraries.
3. Writes source-audit.json and a Markdown table.

An app whose native libraries are only in a split works from Google Play
("Use installed app") or a full bundle, and crashes at launch when it is
patched from a single APK without them. That is the case the "Get it from"
column in docs/apps.md warns about.

Each download is deleted once it has been read, so the runner's disk does not
fill up. Nothing is installed or patched.

Run from the repository root:
    python3 .github/scripts/source_audit.py --out source-audit [--only pkg1,pkg2]
"""

import argparse
import fnmatch
import json
import os
import re
import shutil
import subprocess
import tempfile
import zipfile
from pathlib import Path

KOTLIN = Path("patches/src/main/kotlin")


def excluded_globs():
    text = Path("patches/build.gradle.kts").read_text()
    block = re.search(r"kotlin\.exclude\((.*?)\)", text, re.S)
    return re.findall(r'"([^"]+)"', block.group(1)) if block else []


def phone_apps():
    """(name, package) of every phone app, in name order, without the Android TV builds."""
    globs = excluded_globs()
    apps = {}
    for path in KOTLIN.rglob("*.kt"):
        if any(fnmatch.fnmatch(path.as_posix(), glob) for glob in globs):
            continue
        text = path.read_text()
        constants = dict(re.findall(r'const val (\w+)\s*=\s*"([^"]+)"', text))
        for block in re.findall(r"Compatibility\((.*?)\n\s*\)", text, re.S):
            name = re.search(r'name\s*=\s*"([^"]+)"', block)
            # The package is a string, or a constant such as PACKAGE_NAME in the same file.
            package = re.search(r'packageName\s*=\s*(?:"([^"]+)"|(\w+))', block)
            if not name or not package or "FormFactor.TV" in block or name.group(1).endswith("(Android TV)"):
                continue
            value = package.group(1) or constants.get(package.group(2))
            if value:
                apps.setdefault(value, name.group(1))
    return sorted(((name, package) for package, name in apps.items()), key=lambda app: app[0].lower())


def run(command, timeout=900):
    try:
        return subprocess.run(command, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired as e:
        return subprocess.CompletedProcess(command, 1, e.stdout or "", "timed out")


def libraries(apk):
    """Native libraries in an APK, as {abi: count}."""
    found = {}
    try:
        with zipfile.ZipFile(apk) as z:
            for name in z.namelist():
                match = re.match(r"lib/([^/]+)/[^/]+\.so$", name)
                if match:
                    found[match.group(1)] = found.get(match.group(1), 0) + 1
    except zipfile.BadZipFile:
        pass
    return found


def version_name(apk, aapt2):
    if not aapt2:
        return None
    out = run([aapt2, "dump", "badging", str(apk)], timeout=120).stdout
    match = re.search(r"versionName='([^']+)'", out)
    return match.group(1) if match else None


def describe(apks):
    """Shape of a set of APKs: count, and which ones hold native libraries."""
    holders = {apk.name: libraries(apk) for apk in apks}
    with_libs = sorted(name for name, libs in holders.items() if libs)
    abis = sorted({abi for libs in holders.values() for abi in libs})
    return {"apks": len(apks), "files": sorted(holders), "libraries_in": with_libs, "abis": abis}


def google_play(package, account, aapt2, workdir):
    folder = Path(tempfile.mkdtemp(dir=workdir, prefix="play-"))
    try:
        result = run(["apkeep", "-a", package, "-d", "google-play", *account,
                      "-o", "split_apk=true", str(folder)])
        apks = sorted(folder.rglob("*.apk"))
        if not apks:
            # apkeep's output never contains the token, only the package and its error.
            return {"error": (result.stdout + result.stderr).strip()[-200:] or "no download"}
        base = next((apk for apk in apks if apk.name == f"{package}.apk"), apks[0])
        shape = describe(apks)
        shape["version"] = version_name(base, aapt2)
        return shape
    finally:
        shutil.rmtree(folder, ignore_errors=True)


def apkpure(package, aapt2, workdir):
    folder = Path(tempfile.mkdtemp(dir=workdir, prefix="pure-"))
    try:
        # apkeep requires the APKPure warning to be acknowledged. The file is only
        # read here, never installed.
        result = run(["apkeep", "-a", package, "-d", "apk-pure", "-o", "acknowledge_dangers=true", str(folder)])
        files = [p for p in folder.iterdir() if p.suffix in (".apk", ".xapk")]
        if not files:
            return {"error": (result.stdout + result.stderr).strip()[-200:] or "no download"}
        path = files[0]
        if path.suffix == ".xapk":
            inner = folder / "xapk"
            with zipfile.ZipFile(path) as z:
                members = [m for m in z.namelist() if m.endswith(".apk")]
                z.extractall(inner, members)
            apks = sorted(inner.rglob("*.apk"))
            shape = describe(apks)
            shape["kind"] = "xapk"
            base = next((apk for apk in apks if apk.name == f"{package}.apk"), apks[0] if apks else None)
        else:
            shape = describe([path])
            shape["kind"] = "apk"
            base = path
        shape["version"] = version_name(base, aapt2) if base else None
        return shape
    finally:
        shutil.rmtree(folder, ignore_errors=True)


def verdict(play, pure):
    """What the docs should say about single APK files for this app."""
    if "error" in play:
        return "unknown"
    if not play["libraries_in"]:
        return "no native libraries"
    if any("config." not in name and "split_" not in name for name in play["libraries_in"]):
        if "arm64-v8a" in play.get("abis", []) and "error" not in pure and pure.get("abis") and "arm64-v8a" not in pure["abis"]:
            return "libraries in base; APKPure has no 64-bit libraries"
        return "libraries in base"
    if pure.get("kind") == "apk" and not pure.get("libraries_in"):
        return "libraries only in a split; APKPure's single APK lacks them"
    if "arm64-v8a" in play.get("abis", []) and "error" not in pure and "arm64-v8a" not in pure.get("abis", []):
        return "libraries only in a split; APKPure has no 64-bit libraries"
    return "libraries only in a split"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", default="source-audit")
    parser.add_argument("--only", default="", help="comma-separated packages")
    parser.add_argument("--aapt2", default=os.environ.get("AAPT2"))
    parser.add_argument("--ini", help="apkeep's ini file with the Google account, for local runs")
    args = parser.parse_args()

    # On GitHub, the throwaway account comes from the PLAY_EMAIL and PLAY_AAS_TOKEN
    # secrets. Locally, apkeep reads it from its own ini file, so this script never
    # handles the token.
    email, token = os.environ.get("PLAY_EMAIL"), os.environ.get("PLAY_AAS_TOKEN")
    if email and token:
        account = ["-e", email, "-t", token]
    elif args.ini:
        account = ["-i", args.ini]
    else:
        raise SystemExit("Set PLAY_EMAIL and PLAY_AAS_TOKEN, or pass --ini with apkeep's ini file")
    only = {p.strip() for p in args.only.split(",") if p.strip()}
    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    workdir = Path(tempfile.mkdtemp(prefix="source-audit-"))

    results = []
    for name, package in phone_apps():
        if only and package not in only:
            continue
        print(f"{name} ({package})", flush=True)
        play = google_play(package, account, args.aapt2, workdir)
        pure = apkpure(package, args.aapt2, workdir)
        row = {"name": name, "package": package, "play": play, "apkpure": pure, "verdict": verdict(play, pure)}
        print(f"  {json.dumps(row)}", flush=True)
        results.append(row)
        (out / "source-audit.json").write_text(json.dumps(results, indent=1))

    def cell(source):
        if "error" in source:
            return "error: " + source["error"].replace("|", "/").replace("\n", " ")[:80]
        kind = source.get("kind", "split set" if source["apks"] > 1 else "single APK")
        libs = ", ".join(source["libraries_in"]) or "none"
        abis = ", ".join(source.get("abis", [])) or "-"
        return f"`{source.get('version')}`, {kind} ({source['apks']} APK), libraries in: {libs} ({abis})"

    lines = ["# Source audit", "", "| App | Google Play | APKPure | Verdict |", "|---|---|---|---|"]
    for row in results:
        lines.append(f"| {row['name']} | {cell(row['play'])} | {cell(row['apkpure'])} | {row['verdict']} |")
    (out / "source-audit.md").write_text("\n".join(lines) + "\n")
    shutil.rmtree(workdir, ignore_errors=True)


if __name__ == "__main__":
    main()
