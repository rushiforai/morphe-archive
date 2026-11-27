"""Generate and validate Morphe source metadata without shell date conversions."""
import argparse
import datetime
import hashlib
import io
import json
import pathlib
import re
import urllib.request
import zipfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
METADATA = ROOT / "patches-bundle.json"


def fetch(url):
    request = urllib.request.Request(url, headers={"User-Agent": "Morphe-source-check",
                                                  "Cache-Control": "no-cache"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read()


def project(metadata):
    match = re.fullmatch(r"https://github\.com/([^/]+/[^/]+)/releases/download/[^/]+/[^/]+",
                         metadata["download_url"])
    if not match:
        raise ValueError("Expected a GitHub release asset URL")
    return match[1]


def validate(metadata):
    timestamp = metadata.get("created_at")
    if not isinstance(timestamp, str) or not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}", timestamp):
        raise ValueError("created_at must be YYYY-MM-DDTHH:mm:ss, without Z or locale formatting")
    datetime.datetime.strptime(timestamp, "%Y-%m-%dT%H:%M:%S")
    version = metadata["version"]
    repo = project(metadata)
    release = json.loads(fetch(f"https://api.github.com/repos/{repo}/releases/tags/v{version}"))
    asset = next(a for a in release["assets"] if a["browser_download_url"] == metadata["download_url"])
    if release["draft"]:
        raise ValueError("Release must be published")
    data = fetch(metadata["download_url"])
    digest = hashlib.sha256(data).hexdigest()
    if len(data) != asset["size"] or asset.get("digest", "sha256:" + digest) != "sha256:" + digest:
        raise ValueError("Released bundle size or digest mismatch")
    with zipfile.ZipFile(io.BytesIO(data)) as bundle:
        manifest = bundle.read("META-INF/MANIFEST.MF").decode().replace("\r", "")
        if not re.search(r"^Version: " + re.escape(version) + r"$", manifest, re.MULTILINE):
            raise ValueError("Source version differs from bundle manifest")
        if "classes.dex" not in bundle.namelist():
            raise ValueError("Bundle has no Android patches")
    local = ROOT / "patches" / "build" / "libs" / f"patches-{version}.mpp"
    if local.exists() and hashlib.sha256(local.read_bytes()).hexdigest() != digest:
        raise ValueError("Local bundle differs from released asset")
    print(f"OK v{version}: ISO timestamp, public bundle, manifest, {len(data)} bytes, SHA256 {digest}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--release", help="Generate metadata from an already published tag, e.g. v0.3.8")
    parser.add_argument("--remote", action="store_true", help="Also check canonical main/dev source endpoints")
    args = parser.parse_args()
    metadata = json.loads(METADATA.read_text(encoding="utf-8"))
    repo = project(metadata)
    if args.release:
        release = json.loads(fetch(f"https://api.github.com/repos/{repo}/releases/tags/{args.release}"))
        version = args.release.removeprefix("v")
        asset = next(a for a in release["assets"] if a["name"] == f"patches-{version}.mpp")
        metadata.update(created_at=release["created_at"].removesuffix("Z"), version=version,
                        download_url=asset["browser_download_url"])
        validate(metadata)
        METADATA.write_text(json.dumps(metadata, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    else:
        validate(metadata)
    if args.remote:
        for branch in ("main", "dev"):
            url = f"https://raw.githubusercontent.com/{repo}/{branch}/patches-bundle.json"
            remote = json.loads(fetch(url))
            if remote != metadata:
                raise ValueError(f"{branch} endpoint differs from local metadata: refresh/CDN sync required")
            validate(remote)
            print(f"OK canonical {branch} source")


if __name__ == "__main__":
    main()
