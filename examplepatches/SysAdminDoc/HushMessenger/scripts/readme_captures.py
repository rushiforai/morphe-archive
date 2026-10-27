"""Bind README's settings captures to the settings they show, and README anchors to the app's help links.

Export: run SettingsScreenshotTest with HUSH_SCREENSHOTS=<dir>, then
    py -3 scripts/readme_captures.py --export <dir>
copies the four renders into assets/ and writes assets/settings-captures.json.
Check: py -3 scripts/readme_captures.py --check (check_release.verify runs the same check).
"""

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

# README asset -> the SettingsScreenshotTest render it is copied from.
CAPTURES = {
    "assets/settings-dark.png": "settings-controls-dark.png",
    "assets/settings-light.png": "settings-controls-light.png",
    "assets/settings-app-dark.png": "settings-app-dark.png",
    "assets/settings-app-light.png": "settings-app-light.png",
}
RECEIPT = "assets/settings-captures.json"
SETTINGS = "extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsActivity.java"
SOURCES = "extensions/messenger/src/main/java"
README_LINK = re.compile(r"https://github\.com/SysAdminDoc/HushMessenger#([A-Za-z0-9_-]+)")


class CaptureError(ValueError):
    """A check_release.require failure, so a release check stops on it the same way."""


def require(condition, message):
    if not condition:
        raise CaptureError(message)


def sha256(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def controls(root):
    """The settings catalog the captures show: each control's key, title and section, in order."""
    source = (root / SETTINGS).read_text(encoding="utf-8")
    block = re.search(r"static final String\[\]\[\] CONTROLS = \{(.*?)\n    \};", source, re.DOTALL)
    require(block, f"{SETTINGS} has no CONTROLS table")
    rows = re.findall(r'^\s*\{"([a-z0-9_]+)", "((?:[^"\\]|\\.)*)", .*"([a-z_]+)"\},?\s*$', block.group(1), re.MULTILINE)
    require(rows, "CONTROLS table has no rows")
    return [list(row) for row in rows]


def catalog_sha256(rows):
    return hashlib.sha256(json.dumps(rows, ensure_ascii=False, separators=(",", ":")).encode("utf-8")).hexdigest()


def slug(heading):
    """GitHub's heading anchor: lower case, punctuation dropped, spaces to hyphens."""
    text = re.sub(r"[`*_\[\]()]", "", heading).strip().lower()
    return re.sub(r"\s", "-", re.sub(r"[^\w\s-]", "", text))


def readme_anchors(readme):
    return {slug(heading) for heading in re.findall(r"^#{1,6} (.+?)\s*#*\s*$", readme, re.MULTILINE)}


def check_links(root):
    """Every README anchor the app links to still exists."""
    anchors = readme_anchors((root / "README.md").read_text(encoding="utf-8"))
    for java in sorted((root / SOURCES).rglob("*.java")):
        for anchor in README_LINK.findall(java.read_text(encoding="utf-8")):
            require(anchor in anchors, f"{java.relative_to(root).as_posix()} links to README#{anchor}, which has no heading")


def check(root):
    """Refuse README captures that no longer show the source's settings, or app links to a missing heading."""
    check_links(root)
    receipt_path = root / RECEIPT
    require(receipt_path.is_file(), f"{RECEIPT} is missing; export the captures again")
    receipt = json.loads(receipt_path.read_text(encoding="utf-8"))
    require(receipt.get("schema") == 1, f"{RECEIPT} has an unknown schema")
    rows = controls(root)
    require(
        receipt.get("catalog_sha256") == catalog_sha256(rows) and receipt.get("controls") == len(rows),
        f"README captures show {receipt.get('controls')} controls from an older catalog, not the {len(rows)} in source; "
        "export the captures again",
    )
    images = receipt.get("images")
    require(isinstance(images, dict) and set(images) == set(CAPTURES), f"{RECEIPT} doesn't list the four captures")
    for asset, digest in images.items():
        path = root / asset
        require(path.is_file() and sha256(path) == digest, f"{asset} differs from the exported capture")
    readme = (root / "README.md").read_text(encoding="utf-8")
    for shown in re.findall(r'<img src="(assets/settings[^"]*\.png)"', readme):
        require(shown in images, f"README shows {shown}, which the capture receipt doesn't cover")
    return f"README captures match {len(rows)} controls"


def head(root):
    try:
        result = subprocess.run(["git", "-C", str(root), "rev-parse", "HEAD"], capture_output=True, text=True, timeout=30)
    except (OSError, subprocess.TimeoutExpired):
        return ""
    return result.stdout.strip() if result.returncode == 0 else ""


def export(root, renders):
    for asset, render in CAPTURES.items():
        require((renders / render).is_file(), f"{render} is missing from {renders}")
    images = {}
    for asset, render in CAPTURES.items():
        shutil.copyfile(renders / render, root / asset)
        images[asset] = sha256(root / asset)
    rows = controls(root)
    receipt = {
        "schema": 1,
        # HEAD when rendered; the renders also carry any uncommitted work.
        "rendered_on": head(root),
        "producer": "SettingsScreenshotTest.captureProductionPagesAndDialogsInBothThemes",
        "controls": len(rows),
        "catalog_sha256": catalog_sha256(rows),
        "images": images,
    }
    (root / RECEIPT).write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
    return f"Exported {len(images)} captures for {len(rows)} controls"


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument("--export", type=Path, metavar="RENDERS", help="folder SettingsScreenshotTest wrote to")
    action.add_argument("--check", action="store_true")
    args = parser.parse_args(argv)
    try:
        print(export(args.root, args.export) if args.export else check(args.root))
    except (OSError, ValueError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
