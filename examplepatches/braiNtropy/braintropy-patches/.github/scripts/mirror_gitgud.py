#!/usr/bin/env python3
"""Mirror Git refs and releases from GitHub to a public GitGud project."""

import base64
import hashlib
import json
import os
import subprocess
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

GITHUB_REPOSITORY = os.environ["GITHUB_REPOSITORY"]
GITGUD_PROJECT = os.environ["GITGUD_PROJECT"].strip("/").removesuffix(".git")
GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
GITGUD_TOKEN = os.environ["GITGUD_TOKEN"]
GITGUD_API = "https://gitgud.io/api/v4/projects/" + urllib.parse.quote(GITGUD_PROJECT, safe="")


def request(url, *, token=None, private_token=None, method="GET", payload=None, data=None, allow_404=False):
    headers = {"User-Agent": "gitgud-release-mirror"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    if private_token:
        headers["PRIVATE-TOKEN"] = private_token
    if payload is not None:
        data = json.dumps(payload).encode()
        headers["Content-Type"] = "application/json"
    req = urllib.request.Request(url, data=data, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=120) as response:
            return response.status, response.read()
    except urllib.error.HTTPError as error:
        if allow_404 and error.code == 404:
            return 404, b""
        detail = error.read(500).decode(errors="replace")
        raise RuntimeError(f"{method} {url} failed: HTTP {error.code}: {detail}") from error


def get_json(url, *, token=None, private_token=None, allow_404=False):
    status, body = request(
        url, token=token, private_token=private_token, allow_404=allow_404
    )
    return None if status == 404 else json.loads(body)


def download(url, *, token=None, private_token=None, allow_404=False):
    status, body = request(
        url, token=token, private_token=private_token, allow_404=allow_404
    )
    return None if status == 404 else body


def sha256(data):
    return "sha256:" + hashlib.sha256(data).hexdigest()


def package_file_url(tag, filename):
    version = tag.removeprefix("v")
    return (
        f"{GITGUD_API}/packages/generic/morphe-patches/"
        f"{urllib.parse.quote(version, safe='')}/{urllib.parse.quote(filename, safe='')}"
    )


def gitgud_manifest(manifest, tag, mpp_filename, asset_names):
    """Return release metadata that downloads exclusively from GitGud."""
    result = dict(manifest)
    result["download_url"] = package_file_url(tag, mpp_filename)
    signature_url = result.get("signature_download_url")
    if signature_url:
        signature_filename = urllib.parse.unquote(
            Path(urllib.parse.urlsplit(signature_url).path).name
        )
        if signature_filename not in asset_names:
            raise RuntimeError(f"Signature asset {signature_filename!r} is missing from {tag}")
        result["signature_download_url"] = package_file_url(tag, signature_filename)
    return result


def ensure_package_file(tag, filename, data):
    """Upload a file once; never replace an existing asset with different bytes."""
    url = package_file_url(tag, filename)
    existing = download(url, private_token=GITGUD_TOKEN, allow_404=True)
    if existing is None:
        request(url, private_token=GITGUD_TOKEN, method="PUT", data=data)
        existing = download(url, private_token=GITGUD_TOKEN)
    if sha256(existing) != sha256(data):
        raise RuntimeError(f"GitGud asset differs from GitHub: {tag}/{filename}")


def release_link(tag, filename):
    return {
        "name": filename,
        "url": package_file_url(tag, filename),
        "direct_asset_path": "/" + filename,
        "link_type": "package" if filename.endswith(".mpp") else "other",
    }


def ensure_release(release, files):
    tag = release["tag_name"]
    url = f"{GITGUD_API}/releases/{urllib.parse.quote(tag, safe='')}"
    existing = get_json(url, private_token=GITGUD_TOKEN, allow_404=True)
    links = [release_link(tag, filename) for filename in files]
    if existing is None:
        request(
            f"{GITGUD_API}/releases",
            private_token=GITGUD_TOKEN,
            method="POST",
            payload={
                "name": release["name"] or tag,
                "tag_name": tag,
                "description": release.get("body") or "",
                "released_at": release.get("published_at") or release["created_at"],
                "assets": {"links": links},
            },
        )
        return

    existing_links = {
        link["name"]: link for link in existing.get("assets", {}).get("links", [])
    }
    for link in links:
        old = existing_links.get(link["name"])
        if old is None:
            request(
                url + "/assets/links",
                private_token=GITGUD_TOKEN,
                method="POST",
                payload=link,
            )
        elif old.get("url") != link["url"] or old.get("direct_asset_path") != link["direct_asset_path"]:
            request(
                url + f"/assets/links/{old['id']}",
                private_token=GITGUD_TOKEN,
                method="PUT",
                payload=link,
            )


def tracked_file(mirror, tag, filename):
    return subprocess.check_output(
        ["git", "-C", str(mirror), "show", f"refs/tags/{tag}:{filename}"]
    )


def sync_release(mirror, release):
    tag = release["tag_name"]
    files = {}
    for asset in release.get("assets", []):
        data = download(asset["browser_download_url"], token=GITHUB_TOKEN)
        if asset.get("digest") and sha256(data) != asset["digest"]:
            raise RuntimeError(f"GitHub digest mismatch: {tag}/{asset['name']}")
        files[asset["name"]] = data

    mpp_names = [name for name in files if name.endswith(".mpp")]
    if len(mpp_names) != 1:
        raise RuntimeError(f"Expected one .mpp asset for {tag}, found {len(mpp_names)}")
    if "patches-bundle.json" in files or "patches-list.json" in files:
        raise RuntimeError(f"Generated metadata would replace a GitHub asset for {tag}")

    manifest = json.loads(tracked_file(mirror, tag, "patches-bundle.json"))
    manifest = gitgud_manifest(manifest, tag, mpp_names[0], set(files))
    files["patches-bundle.json"] = (json.dumps(manifest, indent=2) + "\n").encode()
    files["patches-list.json"] = tracked_file(mirror, tag, "patches-list.json")

    print(f"Mirroring {tag}: {len(files)} files", flush=True)
    for filename, data in files.items():
        ensure_package_file(tag, filename, data)
    ensure_release(release, files)

    # Prove that Morphe users can retrieve every asset without GitHub or credentials.
    for filename, data in files.items():
        public = download(package_file_url(tag, filename))
        if sha256(public) != sha256(data):
            raise RuntimeError(f"Public GitGud verification failed: {tag}/{filename}")


def sync_releases(mirror):
    page = 1
    while True:
        releases = get_json(
            f"https://api.github.com/repos/{GITHUB_REPOSITORY}/releases?per_page=100&page={page}",
            token=GITHUB_TOKEN,
        )
        for release in releases:
            if not release.get("draft"):
                sync_release(mirror, release)
        if len(releases) < 100:
            return
        page += 1


def basic_header(username, token):
    credentials = base64.b64encode(f"{username}:{token}".encode()).decode()
    return f"Authorization: Basic {credentials}"


def main():
    if len(GITGUD_PROJECT.split("/")) < 2:
        raise RuntimeError("GITGUD_PROJECT must be a namespace/project path")
    with tempfile.TemporaryDirectory() as directory:
        mirror = Path(directory) / "mirror.git"
        subprocess.run(
            [
                "git", "-c", "http.https://github.com/.extraHeader=" + basic_header("x-access-token", GITHUB_TOKEN),
                "clone", "--mirror", f"https://github.com/{GITHUB_REPOSITORY}.git", str(mirror),
            ],
            check=True,
        )
        subprocess.run(
            [
                "git", "-C", str(mirror), "-c", "http.https://gitgud.io/.extraHeader=" + basic_header("oauth2", GITGUD_TOKEN),
                "push", "--mirror", f"https://gitgud.io/{GITGUD_PROJECT}.git",
            ],
            check=True,
        )
        sync_releases(mirror)


if __name__ == "__main__":
    main()
