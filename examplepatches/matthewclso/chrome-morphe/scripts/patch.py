#!/usr/bin/env python3
"""Patch the locally acquired APK bundle; retain the expensive unmodified merge."""
import argparse
from pathlib import Path
import shutil
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument("name", help="Output basename, without .apk")
parser.add_argument("features", nargs="*")
args = parser.parse_args()
project = Path(__file__).resolve().parents[1]
workspace = project.parents[1]
tools = workspace / "work/tools"
cache = Path.home() / ".cache/morphe-chrome"
merged = cache / "chrome-153.0.8010.53-original-merged.apk"
source = merged if merged.exists() else workspace / "work/inputs/chrome-153.0.8010.53/chrome.apks"
output = workspace / "outputs" / args.name
java = sorted((tools / "jdk").glob("jdk-*/bin/java"))[-1]
version = next(line.split("=", 1)[1].strip() for line in
               (project / "gradle.properties").read_text().splitlines()
               if line.startswith("version="))
bundle = project / f"patches/build/libs/patches-{version}.mpp"
if not bundle.is_file():
    raise SystemExit(f"Build the project first; expected {bundle.name}.")
cmd = [str(java), "-Xmx3g", "-XX:ActiveProcessorCount=4", "-jar", str(tools / "morphe-desktop-1.17.0-all.jar"),
       "patch", str(source), "-p", str(bundle),
       "--exclusive", "-e", "Separate Chrome Morphe installation"]
for feature in args.features:
    cmd += ["-e", feature]
cmd += ["--bytecode-mode", "FULL", "--keystore", str(workspace / "work/keys/chrome-test.bks"),
        "--disable-purge", "-t", str(cache / "patch-session"),
        "-o", str(output.with_suffix(".apk")), "-r", str(output.with_suffix(".json"))]
with output.with_suffix(".log").open("w") as log:
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    for line in process.stdout:
        log.write(line)
        log.flush()
        if "Saved to:" in line and "merged.apk" in line and not merged.exists():
            temporary = Path(line.split("Saved to:", 1)[1].strip())
            shutil.copyfile(temporary, merged)
            print("Cached original merged APK", flush=True)
        if any(word in line for word in ("Applied:", "ERROR", "Exception", "Saved to ", "switch:", "mappings.", "Rewrote")):
            print(line.rstrip(), flush=True)
    raise SystemExit(process.wait())
