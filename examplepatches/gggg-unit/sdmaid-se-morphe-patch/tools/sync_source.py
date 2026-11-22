"""Generate Morphe's stable source manifest from a GitHub release response."""

import argparse
from datetime import datetime, timezone
import json
from pathlib import Path


def source_manifest(release, repository):
    if release.get("draft") or release.get("prerelease"):
        raise ValueError("The stable source must point to a published stable release")
    tag = release["tag_name"]
    version = tag.removeprefix("v")
    if not version:
        raise ValueError("Release tag has no version")
    page_url = f"https://github.com/{repository}/releases/tag/{tag}"
    if release["html_url"] != page_url:
        raise ValueError("Release belongs to a different repository or tag")
    assets = [
        asset for asset in release["assets"]
        if asset["name"].endswith(".mpp") and asset.get("state") == "uploaded"
    ]
    if len(assets) != 1:
        raise ValueError("Expected exactly one uploaded .mpp asset")
    asset = assets[0]
    if asset["name"] != f"patches-{version}.mpp":
        raise ValueError("Bundle filename must match the release version; bump gradle.properties")
    download_url = f"https://github.com/{repository}/releases/download/{tag}/{asset['name']}"
    if asset["browser_download_url"] != download_url or asset["size"] < 8:
        raise ValueError("Invalid bundle URL or empty asset")
    # Morphe expects a UTC LocalDateTime without a zone suffix. Asset updates
    # also invalidate an installed copy when the same release is rebuilt.
    created_at = datetime.fromisoformat(asset["updated_at"].replace("Z", "+00:00"))
    created_at = created_at.astimezone(timezone.utc).replace(tzinfo=None)
    return {
        "created_at": created_at.isoformat(timespec="seconds"),
        "description": release.get("body") or release.get("name") or f"Release {tag}",
        "download_url": download_url,
        "signature_download_url": "",
        "page_url": page_url,
        "version": version,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("release_json", type=Path, help="GitHub releases/latest API response")
    parser.add_argument("--repository", default="gggg-unit/sdmaid-se-morphe-patch")
    parser.add_argument("--output", type=Path, default=Path("patches-bundle.json"))
    parser.add_argument("--check", action="store_true", help="Check the existing manifest instead of writing it")
    args = parser.parse_args()
    release = json.loads(args.release_json.read_text(encoding="utf-8-sig"))
    manifest = source_manifest(release, args.repository)
    if args.check:
        if json.loads(args.output.read_text(encoding="utf-8")) != manifest:
            parser.error("Source metadata does not match the latest stable release")
        print(f"PASS: {args.output} points to {manifest['version']}")
    else:
        args.output.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print(f"Updated {args.output} to {manifest['version']}")


if __name__ == "__main__":
    main()
