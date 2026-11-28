#!/usr/bin/env python3
"""Verify already staged v2.2.0 release inputs; never rebuild or publish."""
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VERSION = "2.2.0"

def require(ok, message):
    if not ok:
        raise SystemExit("FAIL: " + message)

def main():
    require(sys.argv[1:] == [VERSION], "This check is specific to v2.2.0")
    import re
    properties = (ROOT / "gradle.properties").read_text(encoding="utf-8")
    require(re.findall(r"(?m)^version\s*=\s*([^\s#]+)", properties) == [VERSION],
            "Gradle version mismatch")
    metadata = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
    require(metadata.get("version") == VERSION, "Wrong patch metadata version")
    patches = metadata.get("patches", [])
    require(len(patches) == 1 and patches[0].get("name") == "nicoid Re", "Wrong patch inventory")
    require(any(c.get("packageName") == "com.sauzask.nicoid" and c.get("apkFileType") == "APK"
                and any(t.get("version") == "6.49" for t in c.get("targets", []))
                for c in patches[0].get("compatiblePackages", [])), "Missing stock APK compatibility")
    require((ROOT / ".github/release-notes/v2.2.0.md").is_file(), "Release notes missing")
    # The preflight must already have frozen the exact approved archive in RUNNER_TEMP.
    # Never re-record the hash here; that would reset the preflight lock.
    subprocess.run([sys.executable, str(ROOT / ".github/scripts/verify-release-mpp.py"),
                    "check", VERSION], cwd=ROOT, check=True)
    print("PASS pre-staged v2.2.0 release payload and metadata; no rebuild")

if __name__ == "__main__":
    main()
