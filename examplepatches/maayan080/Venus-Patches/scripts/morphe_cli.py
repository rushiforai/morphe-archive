#!/usr/bin/env python3
"""Download the newest Morphe CLI (morphe-desktop), prerelease or stable, and print its path.

    python3 scripts/morphe_cli.py            # -> work/tools/morphe-cli/morphe-desktop-<version>-all.jar
    python3 scripts/morphe_cli.py --tag      # print the release tag instead

The newest release is the most recently published one, whether it's a dev prerelease or a stable release, so patching
always tests against what Morphe ships next. The jar is checked against the SHA-256 digest GitHub publishes for the
asset. Offline, the newest jar downloaded before is used. This is only the CLI that patches the APK: the patches still
compile against the pinned morphe.jar in scripts/build.py, so a prerelease API change can't break the build.
"""
import hashlib, json, os, pathlib, sys, urllib.request

ROOT = pathlib.Path(__file__).resolve().parents[1]
FOLDER = ROOT / "work" / "tools" / "morphe-cli"
API = "https://api.github.com/repos/MorpheApp/morphe-desktop/releases?per_page=30"


def newest():
    headers = {"Accept": "application/vnd.github+json", "User-Agent": "venus-patches"}
    if os.environ.get("GITHUB_TOKEN"):
        headers["Authorization"] = "Bearer " + os.environ["GITHUB_TOKEN"]
    with urllib.request.urlopen(urllib.request.Request(API, headers=headers), timeout=30) as response:
        releases = json.load(response)
    for release in sorted((r for r in releases if not r.get("draft")), key=lambda r: r["published_at"], reverse=True):
        for asset in release["assets"]:
            if asset["name"].endswith("-all.jar"):
                return release["tag_name"], asset
    raise SystemExit("No morphe-desktop release has an -all.jar")


def main():
    FOLDER.mkdir(parents=True, exist_ok=True)
    try:
        tag, asset = newest()
    except (OSError, ValueError) as error:
        cached = sorted(FOLDER.glob("*-all.jar"), key=lambda p: p.stat().st_mtime)
        if not cached:
            raise SystemExit(f"Can't reach GitHub ({error}) and no Morphe CLI was downloaded before")
        print(f"Offline ({error}); using {cached[-1].name}", file=sys.stderr)
        print(cached[-1]); return
    if "--tag" in sys.argv:
        print(tag); return
    target = FOLDER / asset["name"]
    digest = (asset.get("digest") or "").removeprefix("sha256:")
    if not target.exists():
        print(f"Downloading Morphe CLI {tag}", file=sys.stderr)
        temporary = target.with_suffix(".download")
        urllib.request.urlretrieve(asset["browser_download_url"], temporary)
        temporary.replace(target)
    if digest:
        with target.open("rb") as stream:
            actual = hashlib.file_digest(stream, "sha256").hexdigest()
        if actual != digest:
            target.unlink()
            raise SystemExit(f"Checksum mismatch for {asset['name']}: {actual} != {digest}")
    print(target)


if __name__ == "__main__":
    main()
