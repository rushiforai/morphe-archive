"""Publish Morphe source metadata only for a complete, verified GitHub release."""
import base64
import hashlib
import io
import json
import os
import re
import subprocess
import zipfile
from datetime import datetime, timezone

OPTIONS = {"Selectable map themes", "Detailed report icons at normal sizes",
           "Rank badge selector", "Unlock driver moods", "Android Auto setup", "Selectable report icon packs", "Android Auto police alert distance", "Speed camera sound below speed limit"}
REQUIRED = {"build-info.json", "patch-report.json", "SHA256SUMS.txt"}


def api(path, method="GET", data=None, raw=False):
    args = ["gh", "api", path, "--method", method]
    if raw:
        args += ["--header", "Accept: application/octet-stream"]
    if data is not None:
        args += ["--input", "-"]
    result = subprocess.run(args, input=None if data is None else json.dumps(data).encode(),
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode:
        raise RuntimeError(result.stderr.decode(errors="replace"))
    return result.stdout if raw else json.loads(result.stdout)


def version_tuple(value):
    if not re.fullmatch(r"\d+\.\d+\.\d+", value):
        raise ValueError("Expected a numeric bundle version")
    return tuple(map(int, value.split(".")))


def make_manifest(release, files):
    if release["draft"] or release["prerelease"]:
        raise ValueError("Source must point to a published stable release")
    assets = {asset["name"]: asset for asset in release["assets"]}
    if not REQUIRED <= assets.keys() or not REQUIRED <= files.keys():
        raise ValueError("Release metadata is incomplete")
    checksums = {}
    for line in files["SHA256SUMS.txt"].decode().splitlines():
        digest, name = line.split("  ", 1)
        if not re.fullmatch(r"[a-f0-9]{64}", digest) or name in checksums:
            raise ValueError("Invalid release checksums")
        checksums[name] = digest
    for name, digest in checksums.items():
        asset = assets.get(name)
        if not asset or asset["state"] != "uploaded" or asset.get("digest") != "sha256:" + digest:
            raise ValueError(f"Missing or corrupted release asset: {name}")
        if name in files and hashlib.sha256(files[name]).hexdigest() != digest:
            raise ValueError(f"Downloaded asset checksum mismatch: {name}")
    if not {"build-info.json", "patch-report.json"} <= checksums.keys():
        raise ValueError("Release metadata is not covered by checksums")
    info = json.loads(files["build-info.json"])
    report = json.loads(files["patch-report.json"])
    version_tuple(info["bundle_version"])
    if (info["tag"] != release["tag_name"] or report.get("packageName") != "com.waze"
            or report.get("packageVersion") != info["version"] or report.get("failedPatches")
            or {p["name"] for p in report.get("appliedPatches", [])} != OPTIONS
            or not report.get("patchingSteps")
            or any(not step["success"] for step in report["patchingSteps"])):
        raise ValueError("Release does not contain all eight successful Waze patches")
    bundle = f"waze-theme-selector-{info['bundle_version']}.mpp"
    required = {bundle, f"waze-{info['version']}-original-arm64{info['extension']}",
                f"waze-{info['version']}-patched-arm64.apk"}
    if not required <= checksums.keys() or bundle not in files:
        raise ValueError("Release is missing a required download")
    with zipfile.ZipFile(io.BytesIO(files[bundle])) as archive:
        manifest = archive.read("META-INF/MANIFEST.MF").decode().replace("\r\n ", "")
        if not re.search(r"^Version: " + re.escape(info["bundle_version"]) + r"\s*$", manifest, re.MULTILINE):
            raise ValueError("Bundle manifest version differs from source version")
        for path in ["classes.dex", "extensions/theme-selector.dex", "extensions/badge-selector.dex", "extensions/aa-installer.dex", "extensions/icon-pack.dex", "extensions/alert-distance.dex", "extensions/camera-sound.dex"]:
            if not archive.read(path).startswith(b"dex\n"):
                raise ValueError(f"Bundle is missing Android DEX: {path}")
    # Morphe's third-party source DTO expects a UTC LocalDateTime without a zone suffix.
    timestamp = datetime.fromisoformat(release["published_at"].replace("Z", "+00:00"))
    created_at = timestamp.astimezone(timezone.utc).replace(tzinfo=None).isoformat(timespec="seconds")
    return {
        "version": info["bundle_version"],
        "created_at": created_at,
        "download_url": assets[bundle]["browser_download_url"],
        "page_url": release["html_url"],
        "description": (f"Waze {info['version']} (ARM64). Eight independent options: selectable map themes; selectable report icon packs; detailed report icons at normal sizes; local rank badge selector; unlock driver moods; Android Auto setup; adjustable Android Auto police alert distance; speed camera sound below the speed limit. " + info.get("changes", "")).strip(),
    }


def next_changelog(current, manifest):
    marker = f"## [{manifest['version']}]"
    if marker in current:
        return current
    entry = f"{marker}({manifest['page_url']}) ({manifest['created_at'][:10]})\n\n{manifest['description']}\n\n"
    return ("# Changelog\n\n" + entry + current.removeprefix("# Changelog").lstrip()).rstrip() + "\n"


def main():
    repository = os.environ["GITHUB_REPOSITORY"]
    tag = os.environ["RELEASE_TAG"]
    if not re.fullmatch(r"[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+", repository) or not re.fullmatch(r"waze-[0-9.]+-[0-9]+(?:-patches-[0-9]+\.[0-9]+)?", tag):
        raise ValueError("Invalid repository or release tag")
    base = f"repos/{repository}"
    release = api(base + "/releases/tags/" + tag)
    bundle_assets = [a for a in release["assets"] if a["name"].endswith(".mpp")]
    if len(bundle_assets) != 1:
        raise ValueError("Expected exactly one released Morphe bundle")
    names = REQUIRED | {bundle_assets[0]["name"]}
    files = {a["name"]: api(base + f"/releases/assets/{a['id']}", raw=True)
             for a in release["assets"] if a["name"] in names}
    manifest = make_manifest(release, files)
    content = json.dumps(manifest, indent=2, ensure_ascii=False) + "\n"
    for attempt in range(3):
        head = api(base + "/git/ref/heads/main")["object"]["sha"]
        commit = api(base + "/git/commits/" + head)
        tree = api(base + "/git/trees/" + commit["tree"]["sha"])
        entries = {item["path"]: item for item in tree["tree"]}

        def read(path):
            if path not in entries:
                return ""
            blob = api(base + "/git/blobs/" + entries[path]["sha"])
            return base64.b64decode(blob["content"]).decode()

        existing = read("patches-bundle.json")
        if existing and version_tuple(json.loads(existing)["version"]) > version_tuple(manifest["version"]):
            print("Keeping the newer source bundle already published on main")
            return
        changelog = read("CHANGELOG.md")
        updated_changelog = next_changelog(changelog, manifest)
        if existing == content and changelog == updated_changelog:
            print("Morphe source metadata is already current")
            return
        updated_tree = api(base + "/git/trees", "POST", {
            "base_tree": commit["tree"]["sha"],
            "tree": [{"path": path, "mode": "100644", "type": "blob", "content": text}
                     for path, text in [("patches-bundle.json", content), ("CHANGELOG.md", updated_changelog)]],
        })
        updated_commit = api(base + "/git/commits", "POST", {
            "message": f"Update Morphe source to {manifest['version']}",
            "tree": updated_tree["sha"], "parents": [head],
        })
        try:
            api(base + "/git/refs/heads/main", "PATCH", {"sha": updated_commit["sha"], "force": False})
            print(f"Published Morphe source {manifest['version']} at {updated_commit['sha']}")
            return
        except RuntimeError as error:
            if attempt == 2 or not any(code in str(error) for code in ["HTTP 409", "HTTP 422"]):
                raise
    raise RuntimeError("Could not publish source metadata")


if __name__ == "__main__":
    main()
