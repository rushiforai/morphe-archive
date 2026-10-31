"""Paths and versions shared by build.py, test.py and validate_apks.py."""

import json
import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
PROVENANCE = json.loads((ROOT / "PROVENANCE.json").read_text())

VERSION = PROVENANCE["patch_bundle_version"]
PATCHER_VERSION = PROVENANCE["patcher_version"]
APP_VERSION = PROVENANCE["app_version"]
BUNDLE_NAME = f"bitchord-patches-{VERSION}.mpp"
PATCHES = ["Unofficial Telegram music", "Install as Bitchord+"]

TOOLS = Path(os.environ.get("MORPHE_TOOLS", ROOT / ".deps/tools"))
TDLIB = Path(os.environ.get("TDLIB_ANDROID", ROOT / ".deps/tdlib"))

MORPHE_JAR = TOOLS / next(
    item["file"]
    for item in PROVENANCE["downloads"]
    if item["file"].startswith("morphe-desktop-")
)


def jdk():
    try:
        return next(TOOLS.glob("jdk-21*"))
    except StopIteration:
        sys.exit(
            f"No JDK 21 found in {TOOLS}. Run tools/bootstrap_from_release.py "
            "or bootstrap.py first, or set MORPHE_TOOLS."
        )
