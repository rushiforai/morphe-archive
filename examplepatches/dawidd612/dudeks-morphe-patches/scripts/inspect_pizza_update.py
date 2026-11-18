"""Audit and compare clean Pizza inputs against the bundle's bootstrap profiles.

Requires Java 21 and --morphe-cli pointing to the locally verified Morphe CLI jar.
All input ZIP entries are checked; temporary extraction is removed on completion.
This reports compatibility work, not runtime success or permission to publish.
"""
import argparse
import gzip
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile

from verify_apkm import audit, apk_inputs

ROOT = Path(__file__).resolve().parents[1]
RESOURCES = ROOT / "patches/src/main/resources/pizzabusiness"


def properties(path):
    return dict(line.split("=", 1) for line in path.read_text().splitlines()
                if line and not line.startswith("#"))


def inspect(path, cli):
    archive = audit(path)
    with tempfile.TemporaryDirectory() as temp:
        folder = Path(temp)
        subprocess.run(["javac", "-cp", str(cli), "-d", str(folder),
                        str(ROOT / "scripts/InspectPizzaUpdate.java")], check=True, capture_output=True)
        base = None
        libraries = {}
        for _, split in apk_inputs(path):
            split_path = folder / "split.apk"
            split.fp.seek(0)
            with split_path.open("wb") as target:
                shutil.copyfileobj(split.fp, target)
            with zipfile.ZipFile(split_path) as split:
                if "classes.dex" in split.namelist():
                    output = subprocess.run(["java", "-cp", f"{folder}{os.pathsep}{cli}",
                                             "InspectPizzaUpdate", str(split_path)], check=True, capture_output=True, text=True)
                    current = json.loads(output.stdout)
                    # The real game Activity identifies base inputs with or without PairIP.
                    if "gameActivity" in current["roles"]:
                        if base is not None:
                            raise ValueError("Multiple base splits with the game Activity")
                        base = current
                for item in split.infolist():
                    if item.filename.startswith("lib/"):
                        with split.open(item) as source:
                            value = hashlib.file_digest(source, "sha256").hexdigest()
                        if item.filename in libraries and libraries[item.filename] != value:
                            raise ValueError(f"Conflicting input library: {item.filename}")
                        libraries[item.filename] = value
        if base is None:
            raise ValueError("Pizza base APK/game Activity missing")
        base["native_sha256"] = libraries.get("lib/arm64-v8a/libcocos2dcpp.so")
        matches = []
        for directory in (RESOURCES / "profiles.txt").read_text().splitlines():
            if not directory or directory.startswith("#"):
                continue
            profile = properties(RESOURCES / directory / "profile.properties")
            protected = profile.get("protectedInitialization", "true") == "true"
            if protected:
                with gzip.open(RESOURCES / directory / "arm64-init.delta.gz", "rb") as source:
                    header = source.read(68)
                if len(header) != 68 or header[:4] != b"PZB2":
                    raise ValueError(f"Invalid bootstrap profile: {directory}")
                native_match = base["native_sha256"] == header[4:36].hex()
                startup_match = base["roles"].get("startupProgram") == profile["startupProgram"]
            else:
                native_match = base["native_sha256"] == profile["nativeSha256"]
                startup_match = not base["protected_methods"] and not base["uninitialized_strings"]
            matches.append({"profile": directory, "version_matches": (base["version"], str(base["version_code"])) ==
                            (profile["version"], profile["versionCode"]), "native_matches": native_match,
                            "startup_matches": startup_match})
        return {"archive": archive, "input": base, "libraries": libraries, "profiles": matches,
                "decision": "Run DEX/asset and runtime checks" if any(all(p[k] for k in
                    ("version_matches", "native_matches", "startup_matches")) for p in matches) else
                    "Capture new initialization; never reuse a delta for a different native hash" if
                    base["protected_methods"] or base["uninitialized_strings"] else
                    "Unprotected input: preserve original SDK/native startup and review version-specific native edits"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--previous", type=Path)
    parser.add_argument("--morphe-cli", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    report = inspect(args.input, args.morphe_cli.resolve())
    if args.previous:
        before = inspect(args.previous, args.morphe_cli.resolve())
        a, b = before["input"], report["input"]
        report["comparison"] = {"previous_version": a["version"], "native_changed": a["native_sha256"] != b["native_sha256"],
                                "new_protected_methods": sorted(set(b["protected_method_signatures"]) - set(a["protected_method_signatures"])),
                                "removed_protected_methods": sorted(set(a["protected_method_signatures"]) - set(b["protected_method_signatures"])),
                                "uninitialized_strings": [a["uninitialized_strings"], b["uninitialized_strings"]],
                                "changed_roles": {k: [a["roles"].get(k), b["roles"].get(k)] for k in a["roles"].keys() | b["roles"].keys()
                                                  if a["roles"].get(k) != b["roles"].get(k)},
                                "changed_sdk_versions": {k: [a["sdk_versions"].get(k), b["sdk_versions"].get(k)]
                                    for k in a["sdk_versions"].keys() | b["sdk_versions"].keys()
                                    if a["sdk_versions"].get(k) != b["sdk_versions"].get(k)}}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, ensure_ascii=False), encoding="utf-8")
    print(json.dumps({"report": str(args.output), "version": report["input"]["version"], "decision": report["decision"]}))


if __name__ == "__main__":
    main()
