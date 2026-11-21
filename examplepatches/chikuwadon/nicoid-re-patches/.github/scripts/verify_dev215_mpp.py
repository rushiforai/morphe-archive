#!/usr/bin/env python3
"""Fail closed if a v2.1.5-dev MPP has raw Gradle payloads instead of staged runtime DEX.

In dev.10, Bash's unsupported (?:...) regex group skipped stage_candidate.py while
the generic fallback silently published an MPP with the old v2.1.4 helpers.
Checking only MANIFEST.MF or classes.dex cannot detect this.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path
from zipfile import ZipFile


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError("Unstaged or incomplete v2.1.5 MPP: " + message)


def inspect(bundle: Path, version: str) -> None:
    match = re.fullmatch(r"2\.1\.5-dev\.(\d+)", version)
    require(match is not None, "invalid target version")
    level = int(match.group(1))
    require(1 <= level <= 17, "unsupported version; update this verification first")
    with ZipFile(bundle) as z:
        require(z.testzip() is None, "corrupt ZIP")
        manifest = z.read("META-INF/MANIFEST.MF")
        helper = z.read("nicoid/helpers.mpe")
        extension = z.read("extensions/extension.mpe")
        require(("Version: " + version + "\r\n").encode() in manifest,
                "manifest does not match requested version")
        require(helper.startswith(b"dex\n"), "invalid helper DEX")
        require(extension.startswith(b"dex\n"), "invalid extension DEX")
        # These version owners are in the actual DEX loaded by nicoid, and
        # must be consistent with both the UI and the MPP manifest.
        banner = ("v" + version + " @chikuwadon").encode()
        require(version.encode() in helper, "PatchVersion237 is stale")
        require(banner in helper, "helper ModernShorts still has the old banner")
        require(banner in extension, "extension ModernShorts still has the old banner")
        require(b"v2.1.4 @chikuwadon" not in helper,
                "v2.1.4 helper UI banner remains")
        if level >= 7:
            require(b"nicoid-comment-perf" in helper, "comment FPS diagnostics missing")
        if level >= 8:
            require(b"Le/e/a/CommentFrames;" in helper and b"Choreographer" in helper,
                    "VSYNC frame scheduler missing")
        if level >= 9:
            require(b"nicoid-frame-total" in helper, "Whole draw timing missing")
        if level in (9, 10):
            require(b"rasterHits" in helper and b"Bitmap" in helper,
                    "bounded raster cache missing")
        if level == 10:
            for marker in (b"CommentRasterControls210", b"nicoid_comment_raster_ab",
                           b"rasterMode=", b"directDraws=", b"%s"):
                require(marker in helper,
                        "development A/B controls or FPS value prefix missing: "
                        + marker.decode())
        if level == 11:
            require(b"Le/e/a/CommentFpsSummary211;" in helper,
                    "FPS summary prefix helper missing")
            for marker in (b"Le/e/a/CommentRasterControls210;", b"nicoid_comment_raster_ab",
                           b"rasterMode=", b"rasterHits"):
                require(marker not in helper, "Bitmap experiment remains: " + marker.decode())
        if level >= 12:
            for marker in (b"BulkVideoActions215", b"nicoid_multi_select_sort",
                           b"deflist", b"BulkSelection", b"playlistDeleteMessage",
                           b"onSelectionChanged"):
                require(marker in helper,
                        "batch selection bridge missing: " + marker.decode())
        if level >= 16:
            for marker in (b"LocalePatch215", b"Playback queue", b"Select multiple",
                           b"Deselect all", b"shouldSkipTabRefresh"):
                require(marker in helper, "missing English/Chinese locale bridge: "+marker.decode())
        if level >= 17:
            require(b"isActivePlaylist" in helper,
                    "current-page playlist menu guard missing")
    print("PASS: verified staged helper/extension runtime and UI version " + version)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("usage: verify_dev215_mpp.py <mpp> <version>")
    inspect(Path(sys.argv[1]), sys.argv[2])
