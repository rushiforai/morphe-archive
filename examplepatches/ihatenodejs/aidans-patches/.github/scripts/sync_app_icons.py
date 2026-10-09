#!/usr/bin/env python3
"""
Automated synchronization and verification of application icons from Google Play.
Caches icons locally in site/public/icons/ as optimized 128x128 PNGs to avoid Google rate limits.

Modes:
  --check-only         Quick non-destructive check. Checks if any packages lack a local icon.
  --download-missing   Downloads and generates icons only for missing packages.
  --sync-all           Checks all packages against Google Play, updating if icon changed.
"""

from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/120.0.0.0 Safari/537.36"
)

OG_IMAGE_PATTERN = re.compile(
    r'<meta\s+[^>]*property=["\']og:image["\']\s+content=["\']([^"\']+)["\']',
    re.IGNORECASE,
)
OG_IMAGE_ALT_PATTERN = re.compile(
    r'<meta\s+[^>]*content=["\']([^"\']+)["\']\s+property=["\']og:image["\']',
    re.IGNORECASE,
)


def set_github_output(key: str, value: str):
    """Write key-value pair to GITHUB_OUTPUT environment file if present."""
    output_path = os.environ.get("GITHUB_OUTPUT")
    if not output_path:
        return
    with open(output_path, "a", encoding="utf-8") as f:
        if "\n" in value:
            delimiter = f"ghadelim_{hashlib.md5(key.encode()).hexdigest()}"
            f.write(f"{key}<<{delimiter}\n{value}\n{delimiter}\n")
        else:
            f.write(f"{key}={value}\n")


def load_unique_packages(patches_list_path: Path) -> dict[str, str]:
    """Extract mapping of packageName -> appName from patches-list.json."""
    if not patches_list_path.exists():
        raise FileNotFoundError(f"Patches list not found: {patches_list_path}")

    with open(patches_list_path, encoding="utf-8") as f:
        data = json.load(f)

    packages: dict[str, str] = {}
    for patch in data.get("patches", []):
        for cp in patch.get("compatiblePackages", []) or []:
            pkg = cp.get("packageName")
            name = cp.get("name") or pkg
            if pkg and pkg not in packages:
                packages[pkg] = name

    return dict(sorted(packages.items()))


def fetch_google_play_icon_url(package_name: str) -> str | None:
    """Scrape Google Play web store HTML for the app's og:image icon URL."""
    url = f"https://play.google.com/store/apps/details?id={urllib.parse.quote(package_name)}&hl=en&gl=US"
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})

    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            if resp.status != 200:
                print(
                    f"[WARN] Non-200 response for {package_name}: {resp.status}",
                    file=sys.stderr,
                )
                return None
            html = resp.read().decode("utf-8", errors="replace")
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as err:
        print(
            f"[WARN] Failed to scrape Google Play for {package_name}: {err}",
            file=sys.stderr,
        )
        return None

    match = OG_IMAGE_PATTERN.search(html) or OG_IMAGE_ALT_PATTERN.search(html)
    if not match:
        print(f"[WARN] og:image meta tag not found for {package_name}", file=sys.stderr)
        return None

    raw_url = match.group(1).replace("&amp;", "&")
    return raw_url


def download_and_process_icon(image_url: str) -> bytes | None:
    """Download image and convert/resize to 128x128 RGBA PNG using Pillow."""
    try:
        from PIL import Image, UnidentifiedImageError
    except ImportError:
        raise RuntimeError(
            "Pillow is required for image processing. Run 'pip install Pillow'."
        )

    req = urllib.request.Request(image_url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = resp.read()
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as err:
        print(
            f"[WARN] Failed to download icon image {image_url}: {err}", file=sys.stderr
        )
        return None

    try:
        img = Image.open(io.BytesIO(data))
        img = img.convert("RGBA")
        img = img.resize((128, 128), Image.Resampling.LANCZOS)
        out_buf = io.BytesIO()
        img.save(out_buf, format="PNG", optimize=True)
        return out_buf.getvalue()
    except (UnidentifiedImageError, OSError, ValueError) as err:
        print(
            f"[WARN] Failed to process image from {image_url}: {err}", file=sys.stderr
        )
        return None


def update_icons_ts(icons_ts_path: Path, packages: dict[str, str]):
    """Ensure site/src/data/icons.ts contains all package mappings."""
    if not icons_ts_path.exists():
        return

    content = icons_ts_path.read_text(encoding="utf-8")
    lines = [
        "// Local cached application icons (avoids Google rate limiting and removes external network dependency)",
        "export const APP_ICONS: Record<string, string> = {",
    ]
    for pkg in sorted(packages.keys()):
        lines.append(f"  '{pkg}': '/icons/{pkg}.png',")
    lines.append("};")
    lines.append("")
    lines.append("export function getAppIconUrl(packageName: string): string | null {")
    lines.append("  return APP_ICONS[packageName] || null;")
    lines.append("}")
    lines.append("")

    new_content = "\n".join(lines)
    if content != new_content:
        icons_ts_path.write_text(new_content, encoding="utf-8")
        print(f"Updated icon registry: {icons_ts_path}")


def main():
    parser = argparse.ArgumentParser(
        description="Synchronize application icons from Google Play."
    )
    mode_group = parser.add_mutually_exclusive_group(required=True)
    mode_group.add_argument(
        "--check-only", action="store_true", help="Quick check for missing icons."
    )
    mode_group.add_argument(
        "--download-missing", action="store_true", help="Download only missing icons."
    )
    mode_group.add_argument(
        "--sync-all", action="store_true", help="Sync and refresh all icons."
    )

    repo_root = Path(__file__).resolve().parent.parent.parent
    parser.add_argument(
        "--patches-list", type=Path, default=repo_root / "patches-list.json"
    )
    parser.add_argument(
        "--icons-dir", type=Path, default=repo_root / "site" / "public" / "icons"
    )
    parser.add_argument(
        "--icons-ts",
        type=Path,
        default=repo_root / "site" / "src" / "data" / "icons.ts",
    )

    args = parser.parse_args()

    packages = load_unique_packages(args.patches_list)
    args.icons_dir.mkdir(parents=True, exist_ok=True)

    missing = []
    for pkg in packages:
        icon_file = args.icons_dir / f"{pkg}.png"
        if not icon_file.exists() or icon_file.stat().st_size == 0:
            missing.append(pkg)

    if args.check_only:
        has_missing = len(missing) > 0
        set_github_output("has_missing", "true" if has_missing else "false")
        set_github_output("missing_packages", ",".join(missing))
        if has_missing:
            print(f"Missing icons for {len(missing)} package(s): {', '.join(missing)}")
        else:
            print(f"All {len(packages)} application icons are present.")
        sys.exit(0)

    # In download-missing or sync-all mode, process packages
    packages_to_process = missing if args.download_missing else list(packages.keys())
    if not packages_to_process:
        print("No packages need icon updates.")
        set_github_output("changes_detected", "false")
        set_github_output("summary", "No changes detected.")
        sys.exit(0)

    updated_packages: list[str] = []
    new_packages: list[str] = []

    for pkg in packages_to_process:
        name = packages[pkg]
        icon_path = args.icons_dir / f"{pkg}.png"
        is_new = not icon_path.exists() or icon_path.stat().st_size == 0

        print(f"Fetching Google Play icon for {name} ({pkg})...")
        image_url = fetch_google_play_icon_url(pkg)
        if not image_url:
            print(f"  Skipping {pkg}: could not obtain icon URL.")
            continue

        png_bytes = download_and_process_icon(image_url)
        if not png_bytes:
            print(f"  Skipping {pkg}: image processing failed.")
            continue

        if not is_new:
            current_bytes = icon_path.read_bytes()
            if (
                hashlib.sha256(current_bytes).digest()
                == hashlib.sha256(png_bytes).digest()
            ):
                print(f"  {pkg}: icon unchanged.")
                continue

        icon_path.write_bytes(png_bytes)
        if is_new:
            new_packages.append(f"{name} (`{pkg}`)")
            print(f"  Added new icon for {pkg} ({len(png_bytes)} bytes)")
        else:
            updated_packages.append(f"{name} (`{pkg}`)")
            print(f"  Updated icon for {pkg} ({len(png_bytes)} bytes)")

    # Keep icons.ts up to date with all packages
    update_icons_ts(args.icons_ts, packages)

    changes_detected = len(new_packages) > 0 or len(updated_packages) > 0
    set_github_output("changes_detected", "true" if changes_detected else "false")

    summary_lines = []
    if new_packages:
        summary_lines.append("### New Icons Added")
        for item in new_packages:
            summary_lines.append(f"- {item}")
    if updated_packages:
        summary_lines.append("### Icons Refreshed from Google Play")
        for item in updated_packages:
            summary_lines.append(f"- {item}")

    summary_text = "\n".join(summary_lines) if summary_lines else "No icons modified."
    set_github_output("summary", summary_text)
    print(f"\nCompleted. Changes detected: {changes_detected}")
    if summary_lines:
        print("\n" + summary_text)


if __name__ == "__main__":
    main()
