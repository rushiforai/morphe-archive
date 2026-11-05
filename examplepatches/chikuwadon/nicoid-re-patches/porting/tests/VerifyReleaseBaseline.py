#!/usr/bin/env python3
"""Validate the published v1.10.1 source baseline and Morphe metadata.

This check does not publish, rewrite tags, or modify the release.
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASELINE = "v1.10.1"
SOURCE = ROOT / "porting" / "revisions" / BASELINE


def require(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit("FAIL: " + message)


properties = (ROOT / "gradle.properties").read_text(encoding="utf-8")
match = re.search(r"(?m)^version\s*=\s*([^\s#]+)", properties)
require(match is not None, "Gradle version missing")
version = match.group(1)

bundle = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
patches = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
require(bundle["version"] == patches["version"], "Morphe JSON versions disagree")
require(version == bundle["version"], "Gradle version and Morphe metadata disagree")
require(bundle["download_url"] ==
        f"https://github.com/chikuwadon/nicoid-re-patches/releases/download/v{version}/patches-{version}.mpp",
        "Morphe release URL mismatch")
require(any(pkg.get("packageName") == "com.sauzask.nicoid"
            and any(t.get("version") == "6.49" for t in pkg.get("targets", []))
            for patch in patches["patches"]
            for pkg in patch.get("compatiblePackages", [])),
        "nicoid 6.49 compatibility is missing")
for part in ("helpers", "method-delta"):
    files = list((SOURCE / part).rglob("*.smali"))
    require(len(files) > 100, f"{BASELINE} {part} source missing ({len(files)} smali files)")
for part in ("pom.xml", "build-payloads.sh", "VALIDATION.md"):
    require((SOURCE / part).is_file(), f"{BASELINE} source file missing: {part}")

# Preserve the frozen, already-published source tree when working on future versions.
result = subprocess.run(
    ["git", "diff", "--quiet", BASELINE, "HEAD", "--", f"porting/revisions/{BASELINE}"],
    cwd=ROOT, check=False,
)
require(result.returncode == 0, f"Published {BASELINE} source differs from its tag")
if version == "1.10.1":
    build = (ROOT / "patches" / "build.gradle.kts").read_text(encoding="utf-8")
    require('porting/revisions/v1.10.1' in build,
            "Build no longer uses the published v1.10.1 source")
print(f"PASS: {BASELINE} source baseline, nicoid 6.49 compatibility and v{version} metadata")
