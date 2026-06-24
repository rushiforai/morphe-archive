#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import os
import shutil
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Sign the latest unsigned Morphe release asset.")
    parser.add_argument("--repo", default=os.getenv("REPO", "kareemlukitomo/morphe-patches"))
    parser.add_argument("--gpg-key", default=os.getenv("GPG_KEY", ""))
    parser.add_argument("--tag", default=os.getenv("TAG", ""))
    parser.add_argument("--keep", action="store_true", default=os.getenv("KEEP", "0") == "1")
    parser.add_argument("--dry-run", action="store_true", default=os.getenv("DRY_RUN", "0") == "1")
    return parser.parse_args()


def require_command(name: str) -> None:
    if shutil.which(name) is None:
        raise SystemExit(f"{name} is required")


def github_token() -> str:
    token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN") or ""
    if token:
        return token
    if shutil.which("gh") is None:
        return ""
    try:
        return subprocess.check_output(["gh", "auth", "token"], text=True).strip()
    except subprocess.CalledProcessError:
        return ""


def github_get(url: str) -> dict | list:
    request = urllib.request.Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "morphe-sign-release-helper",
        },
    )
    with urllib.request.urlopen(request) as response:
        return json.load(response)


def select_release(repo: str, tag: str) -> dict:
    if tag:
        release = github_get(f"https://api.github.com/repos/{repo}/releases/tags/{tag}")
        mpp_asset = find_asset(release["assets"], ".mpp")
        if mpp_asset is None:
            raise SystemExit(f"Release {tag} does not contain a .mpp asset")
        return build_release_payload(release, mpp_asset)

    releases = github_get(f"https://api.github.com/repos/{repo}/releases?per_page=20")
    assert isinstance(releases, list)
    for release in releases:
        if release.get("draft"):
            continue
        mpp_asset = find_asset(release.get("assets", []), ".mpp")
        if mpp_asset is None:
            continue
        asc_name = f'{mpp_asset["name"]}.asc'
        asc_asset = find_asset(release.get("assets", []), asc_name, exact=True)
        if asc_asset is not None:
            continue
        return build_release_payload(release, mpp_asset)
    raise SystemExit("Could not find an unsigned release with a .mpp asset")


def build_release_payload(release: dict, mpp_asset: dict) -> dict:
    asc_name = f'{mpp_asset["name"]}.asc'
    asc_asset = find_asset(release.get("assets", []), asc_name, exact=True)
    return {
        "tag": release["tag_name"],
        "release_name": release.get("name") or release["tag_name"],
        "upload_url": release["upload_url"].split("{", 1)[0],
        "mpp_name": mpp_asset["name"],
        "mpp_url": mpp_asset["browser_download_url"],
        "asc_name": asc_name,
        "asc_asset_id": None if asc_asset is None else asc_asset["id"],
    }


def find_asset(assets: list[dict], target: str, *, exact: bool = False) -> dict | None:
    for asset in assets:
        name = asset["name"]
        if exact and name == target:
            return asset
        if not exact and name.endswith(target):
            return asset
    return None


def run(command: list[str]) -> None:
    subprocess.run(command, check=True)


def github_delete_asset(repo: str, asset_id: int, token: str) -> None:
    request = urllib.request.Request(
        f"https://api.github.com/repos/{repo}/releases/assets/{asset_id}",
        method="DELETE",
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    with urllib.request.urlopen(request):
        return


def github_upload_asset(upload_url: str, asset_name: str, asset_path: Path, token: str) -> None:
    upload_target = f"{upload_url}?name={urllib.parse.quote(asset_name)}"
    request = urllib.request.Request(
        upload_target,
        method="POST",
        data=asset_path.read_bytes(),
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {token}",
            "Content-Type": "application/pgp-signature",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    with urllib.request.urlopen(request):
        return


def main() -> int:
    args = parse_args()

    if not args.gpg_key:
        raise SystemExit("GPG_KEY is required")

    if not args.dry_run:
        require_command("gpg")

    try:
        release = select_release(args.repo, args.tag.strip())
    except urllib.error.HTTPError as exc:
        raise SystemExit(f"GitHub API request failed: {exc.code}") from exc

    print(f'Selected tag   : {release["tag"]}')
    print(f'Downloading    : {release["mpp_name"]}')

    if args.dry_run:
        print(f'Asset URL      : {release["mpp_url"]}')
        print("Dry run only   : no download, signing, or upload")
        return 0

    keep_files = args.keep
    token = github_token()

    with tempfile.TemporaryDirectory() as temp_dir:
        workdir = Path(temp_dir)
        mpp_path = workdir / release["mpp_name"]
        asc_path = workdir / release["asc_name"]

        urllib.request.urlretrieve(release["mpp_url"], mpp_path)

        print(f'Signing        : {release["mpp_name"]} -> {release["asc_name"]}')
        run(
            [
                "gpg",
                "--armor",
                "--detach-sign",
                "--local-user",
                args.gpg_key,
                "--output",
                str(asc_path),
                str(mpp_path),
            ]
        )

        if not token:
            print("No GITHUB_TOKEN or GH_TOKEN found; skipping upload.")
            print(f'Manual upload  : {asc_path} -> release {release["tag"]}')
            keep_files = True
            if keep_files:
                keep_outputs(mpp_path, asc_path)
            return 0

        if release["asc_asset_id"] is not None:
            print(f'Deleting old   : existing asset id {release["asc_asset_id"]}')
            github_delete_asset(args.repo, int(release["asc_asset_id"]), token)

        print(f'Uploading      : {release["asc_name"]} -> release {release["tag"]}')
        github_upload_asset(release["upload_url"], release["asc_name"], asc_path, token)
        if keep_files:
            keep_outputs(mpp_path, asc_path)
        print("Done.")
        return 0


def keep_outputs(mpp_path: Path, asc_path: Path) -> None:
    kept_dir = Path(tempfile.mkdtemp(prefix="sign-latest-release-"))
    shutil.copy2(mpp_path, kept_dir / mpp_path.name)
    shutil.copy2(asc_path, kept_dir / asc_path.name)
    print(f"Kept files in: {kept_dir}")


if __name__ == "__main__":
    sys.exit(main())
