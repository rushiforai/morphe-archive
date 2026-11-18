#!/usr/bin/env python3
"""Strict, offline patch-application check; supports external plumbing for older bundles."""
import argparse
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", type=Path)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--desktop-jar", type=Path, required=True)
    parser.add_argument("--java", default="/usr/lib/jvm/java-21-openjdk-amd64/bin/java")
    parser.add_argument("--gms-bundle", type=Path)
    parser.add_argument("--official-patch", action="append", default=[],
                        help="Additional playback/plumbing patch from --gms-bundle; repeat to combine")
    parser.add_argument("--patch", action="append", help="Select only these patches; repeat to combine (default: recommended selection)")
    parser.add_argument("--all", action="store_true", help="Select every named patch, including optional overlapping controls")
    parser.add_argument("--out", type=Path, required=True, help="New output directory; existing evidence is never overwritten")
    args = parser.parse_args()
    if args.all and args.patch:
        parser.error("--all and --patch are mutually exclusive")
    if args.official_patch and not args.gms_bundle:
        parser.error("--official-patch requires --gms-bundle")
    for path in (args.bundle, args.apk, args.desktop_jar, args.gms_bundle):
        if path is not None and not path.is_file():
            parser.error(f"Missing input: {path}")
    names = []
    for source in sorted((ROOT / "patches/src/main/kotlin").rglob("*.kt")):
        names += re.findall(r'\b(?:bytecodePatch|resourcePatch|rawResourcePatch)\(\s*name\s*=\s*"([^"\n]+)"', source.read_text())
    if not names or len(names) != len(set(names)):
        parser.error("Expected a nonempty, unique set of named patches")
    if args.patch:
        unknown = set(args.patch) - set(names)
        if unknown:
            parser.error(f"Unknown Afterglow patches: {sorted(unknown)}")
        names = [name for name in names if name in set(args.patch)]
    elif not args.all:
        catalog_path = ROOT / "tools/morphe-catalog.json"
        if catalog_path.exists():
            optional = {entry["export_name"] for entry in json.loads(catalog_path.read_text())["patches"]
                        if entry.get("export_name") and not entry["default"]}
            names = [name for name in names if name not in optional]
    if args.gms_bundle:
        duplicate = set(names) & {"GmsCore support", "Spoof video streams", *args.official_patch}
        if duplicate:
            parser.error("Compatibility patches selected from both bundles: " + ", ".join(sorted(duplicate))
                         + ". Use the Afterglow bundle alone, or select only its feature patches for a legacy comparison.")
    if args.out.exists():
        parser.error(f"Output directory already exists: {args.out}; choose a new run directory")
    args.out.mkdir(parents=True)
    command = [args.java, "-Xmx6g", "-jar", str(args.desktop_jar.resolve()), "patch",
               "--exclusive", "--validate", "--unsigned"]
    expected = set(names)
    if args.gms_bundle:
        command += ["-p", str(args.gms_bundle.resolve()), "-e", "GmsCore support"]
        expected.add("GmsCore support")
        for name in dict.fromkeys(args.official_patch):
            command += ["-e", name]
            expected.add(name)
    command += ["-p", str(args.bundle.resolve())]
    for name in names:
        command += ["-e", name]
    result_file = args.out.resolve() / "result.json"
    command += ["-o", str(args.out.resolve() / "patched-unsigned.apk"),
                "-t", str(args.out.resolve() / "scratch"), "-r", str(result_file), str(args.apk.resolve())]
    (args.out / "command.json").write_text(json.dumps(command, indent=2) + "\n")
    log_path = args.out / "patch.log"
    print(f"Validating {len(expected)} selected patches; log: {log_path}", flush=True)
    with log_path.open("w") as log:
        patched = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if patched.returncode != 0 or not result_file.exists():
        print(log_path.read_text()[-6000:])
        raise SystemExit(patched.returncode or 1)
    result = json.loads(result_file.read_text())
    missing = expected - set(result.get("appliedPatches", []))
    if not result.get("success") or result.get("failedPatches") or missing:
        raise SystemExit(f"Patch validation failed: missing={sorted(missing)}; see {result_file}")
    print(f"PASS {len(expected)} selected patches applied to YouTube {result.get('packageVersion')}")
    print(args.out / "patched-unsigned.apk")


if __name__ == "__main__":
    main()
