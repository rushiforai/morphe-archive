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
metadata_version = bundle["version"]

# Generated Morphe metadata is owned by semantic-release, not edited by hand.
# Immediately before the explicitly approved manual release, the Gradle
# version may be the next patch or next minor release after published metadata.
if version != metadata_version:
    require(re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+", version) is not None,
            "Only a stable patch release candidate may be staged")
    require(re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+", metadata_version) is not None,
            "Published metadata must be a stable version")
    new = tuple(int(x) for x in version.split("."))
    old = tuple(int(x) for x in metadata_version.split("."))
    require((new[:2] == old[:2] and new[2] == old[2] + 1)
            or (new[0] == old[0] and new[1] == old[1] + 1 and new[2] == 0)
            or (new[0] == old[0] + 1 and new[1] == 0 and new[2] == 0),
            "Release candidate must be the next patch, minor, or major version")
    require((ROOT / ".github" / "release-notes" / f"v{version}.md").is_file(),
            "Approved release notes missing")
    exists = subprocess.run(
        ["git", "show-ref", "--verify", "--quiet", f"refs/tags/v{version}"],
        cwd=ROOT, check=False,
    ).returncode == 0
    require(not exists, "Published release tag must not be staged again")

require(bundle["download_url"] ==
        f"https://github.com/chikuwadon/nicoid-re-patches/releases/download/v{metadata_version}/patches-{metadata_version}.mpp",
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
