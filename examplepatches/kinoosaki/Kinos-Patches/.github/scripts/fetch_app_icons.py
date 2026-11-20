#!/usr/bin/env python3
"""
Fetches app icons for the README app list into assets/icons/<packageName>.png (96x96 PNG).

Usage: python -I .github/scripts/fetch_app_icons.py [--missing | <package> ...] [--force]

The icon comes from the app's Google Play listing (the og:image on play-lh.googleusercontent.com),
with the F-Droid listing as a fallback for apps that are not on Play. Plain stdlib; Pillow, when
installed, scales the icon down and shrinks the PNG. No credentials are needed. Downloads go to a
fresh temporary directory first and only checked PNG/JPEG/WebP images are written to assets/icons.
"""

import argparse
import html
import io
import json
import re
import sys
import tempfile
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
ICONS_DIR = ROOT / "assets" / "icons"
CONSTANTS = ROOT / "patches/src/main/kotlin/app/template/patches/shared/Constants.kt"
PATCHES_LIST = ROOT / "patches-list.json"

SIZE = 96
TARGET_BYTES = 12 * 1024
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0 Safari/537.36"
# Region-locked apps (e.g. Flashscore, DRTV) only have a listing in some countries.
PLAY_COUNTRIES = ["US", "GB", "DE", "DK", "IN"]

PLAY_ICON = re.compile(
    r'(?:property="og:image"|itemprop="image")\s+content="(https://play-lh\.googleusercontent\.com/[^"]+)"'
)
FDROID_ICON = re.compile(r'class="package-icon"\s+src="([^"]+)"')


def known_packages():
    """Every package the bundle supports: Constants.kt plus the generated patches-list.json."""
    packages = set()
    if CONSTANTS.is_file():
        packages.update(re.findall(r'packageName\s*=\s*"([^"]+)"', CONSTANTS.read_text(encoding="utf-8")))
    if PATCHES_LIST.is_file():
        data = json.loads(PATCHES_LIST.read_text(encoding="utf-8"))
        for patch in data.get("patches", []):
            for entry in patch.get("compatiblePackages") or []:
                packages.add(entry["packageName"])
    return sorted(packages)


def get(url, limit=4 * 1024 * 1024):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept-Language": "en"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read(limit + 1)[:limit]


def play_icon_url(pkg):
    for country in PLAY_COUNTRIES:
        query = urllib.parse.urlencode({"id": pkg, "hl": "en", "gl": country})
        try:
            page = get(f"https://play.google.com/store/apps/details?{query}").decode("utf-8", "replace")
        except urllib.error.HTTPError as error:
            if error.code == 404:
                continue
            raise
        match = PLAY_ICON.search(page)
        if match:
            # Drop Play's size/rounding suffix (e.g. "=s0-br30") and ask for a plain square.
            base = html.unescape(match.group(1)).split("=", 1)[0]
            return f"{base}=s{SIZE * 2}", f"Google Play ({country})"
    return None, None


def fdroid_icon_url(pkg):
    try:
        page = get(f"https://f-droid.org/en/packages/{pkg}/").decode("utf-8", "replace")
    except urllib.error.HTTPError:
        return None, None
    match = FDROID_ICON.search(page)
    if not match:
        return None, None
    return urllib.parse.urljoin("https://f-droid.org/", html.unescape(match.group(1))), "F-Droid"


def image_kind(data):
    if data.startswith(b"\x89PNG\r\n\x1a\n"):
        return "png"
    if data.startswith(b"\xff\xd8\xff"):
        return "jpeg"
    if data[:4] == b"RIFF" and data[8:12] == b"WEBP":
        return "webp"
    return None


def to_png(data):
    """Square SIZE x SIZE PNG, shrunk to a palette when the full-colour file is too big."""
    try:
        from PIL import Image
    except ImportError:
        if image_kind(data) != "png":
            raise RuntimeError("Pillow is needed to convert a non-PNG icon")
        return data  # Play already served a SIZE*2 square; the README scales it with width/height.
    with Image.open(io.BytesIO(data)) as image:
        image = image.convert("RGBA")
        if image.width != image.height:
            side = min(image.size)
            left, top = (image.width - side) // 2, (image.height - side) // 2
            image = image.crop((left, top, left + side, top + side))
        image = image.resize((SIZE, SIZE), Image.Resampling.LANCZOS)
        out = io.BytesIO()
        image.save(out, "PNG", optimize=True)
        if out.tell() > TARGET_BYTES:
            out = io.BytesIO()
            image.quantize(colors=256, method=Image.Quantize.FASTOCTREE).save(out, "PNG", optimize=True)
        return out.getvalue()


def fetch(pkg, download_dir, out_dir):
    url, source = play_icon_url(pkg)
    if not url:
        url, source = fdroid_icon_url(pkg)
    if not url:
        return None, "no Google Play or F-Droid listing found"
    data = get(url)
    if not image_kind(data):
        return None, f"{source} returned something that is not an image"
    (download_dir / f"{pkg}.download").write_bytes(data)
    png = to_png(data)
    target = out_dir / f"{pkg}.png"
    target.write_bytes(png)
    return target, f"{source}, {len(png)} bytes"


def main():
    parser = argparse.ArgumentParser(description=__doc__.strip().splitlines()[0])
    parser.add_argument("packages", nargs="*", help="package names to fetch")
    parser.add_argument("--missing", action="store_true",
                        help="fetch every supported package that has no icon yet")
    parser.add_argument("--skip", action="append", default=[], help="package to leave out (repeatable)")
    parser.add_argument("--force", action="store_true", help="replace icons that already exist")
    parser.add_argument("--out", type=Path, default=ICONS_DIR, help=f"output directory (default {ICONS_DIR})")
    parser.add_argument("--download-dir", type=Path, help="empty directory for raw downloads (default: a new temp dir)")
    args = parser.parse_args()

    packages = list(args.packages)
    if args.missing:
        packages += [p for p in known_packages() if not (args.out / f"{p}.png").exists()]
    packages = [p for p in dict.fromkeys(packages) if p not in args.skip]
    if not packages:
        print("Nothing to fetch.")
        return 0

    args.out.mkdir(parents=True, exist_ok=True)
    download_dir = args.download_dir or Path(tempfile.mkdtemp(prefix="app-icons-"))
    download_dir.mkdir(parents=True, exist_ok=True)

    failed = []
    for pkg in packages:
        if (args.out / f"{pkg}.png").exists() and not args.force:
            print(f"skip   {pkg}: icon exists (use --force to replace)")
            continue
        try:
            target, note = fetch(pkg, download_dir, args.out)
        except Exception as error:  # network or image errors: report and go on with the rest
            target, note = None, f"{type(error).__name__}: {error}"
        if target:
            print(f"ok     {pkg}: {note}")
        else:
            failed.append(pkg)
            print(f"MISSED {pkg}: {note}")
        time.sleep(0.5)  # be gentle with Play

    print(f"Raw downloads are in {download_dir}; delete it when done.")
    if failed:
        print(f"No icon for {len(failed)} package(s): {', '.join(failed)} (the README keeps the colour swatch)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
