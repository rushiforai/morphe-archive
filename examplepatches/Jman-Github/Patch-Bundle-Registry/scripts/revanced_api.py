"""Adapt the official ReVanced API inventory to the shared release pipeline."""

import re
from urllib.parse import urlsplit

OFFICIAL_SOURCE = "https://github.com/ReVanced/revanced-patches"
GIT_RELEASES_URL = "https://api.github.com/repos/ReVanced/revanced-patches/releases"
HISTORY_URL = "https://api.revanced.app/v5/patches/history/prerelease"
LATEST_URL = "https://api.revanced.app/v5/patches"


def release_inventory(document):
    """The prerelease history includes both stable and prerelease releases."""
    if isinstance(document, list):
        rows = document
    elif isinstance(document, dict):
        if isinstance(document.get("releases"), list):
            rows = document["releases"]
        elif "version" in document:
            rows = [document]
        else:
            raise ValueError("Invalid ReVanced release metadata")
    else:
        raise ValueError("ReVanced API response must be a list or release object")

    releases = []
    tags = set()
    for row in rows:
        if not isinstance(row, dict):
            raise ValueError("Invalid ReVanced release")
        version = row.get("version")
        if not isinstance(version, str) or not version.strip():
            raise ValueError("ReVanced release has no version")
        tag = "v" + version.removeprefix("v")
        if tag in tags or any(char in tag for char in "/?#"):
            raise ValueError("Invalid or duplicate ReVanced release version")
        tags.add(tag)
        created_at = row.get("created_at")
        if not isinstance(created_at, str) or not created_at.strip():
            raise ValueError("Invalid ReVanced release created_at")
        description = row.get("description")
        if description is None:
            description = row.get("body", "")
        if not isinstance(description, str):
            raise ValueError("Invalid ReVanced release description")
        download = row.get("download_url")
        if not isinstance(download, str) or not download.strip():
            raise ValueError("Invalid ReVanced release download_url")
        parsed = urlsplit(download)
        if (
            parsed.scheme != "https"
            or not parsed.netloc
            or parsed.username
            or parsed.password
            or not parsed.path.lower().endswith((".rvp", ".jar"))
        ):
            raise ValueError("Invalid ReVanced bundle download URL")
        assets = [{
            "name": parsed.path.rsplit("/", 1)[-1],
            "browser_download_url": download,
        }]
        sig_download = row.get("signature_download_url")
        if sig_download is not None:
            if not isinstance(sig_download, str) or not sig_download.strip():
                raise ValueError("Invalid ReVanced release signature_download_url")
            sig_parsed = urlsplit(sig_download)
            if (
                sig_parsed.scheme != "https"
                or not sig_parsed.netloc
                or sig_parsed.username
                or sig_parsed.password
                or not sig_parsed.path.lower().endswith(".asc")
            ):
                raise ValueError("Invalid ReVanced release signature download URL")
            assets.append({
                "name": sig_parsed.path.rsplit("/", 1)[-1],
                "browser_download_url": sig_download,
            })
        if "prerelease" in row:
            if not isinstance(row["prerelease"], bool):
                raise ValueError("Invalid ReVanced release prerelease channel")
            prerelease = row["prerelease"]
        else:
            prerelease = bool(
                re.search(r"(^|[-._])(dev|alpha|beta|rc|pre)([-._\d]|$)", tag.lower())
            )
        releases.append({
            "tag_name": tag,
            "name": tag,
            "created_at": created_at,
            "published_at": created_at,
            "body": description,
            "prerelease": prerelease,
            "html_url": f"{OFFICIAL_SOURCE}/releases/tag/{tag}",
            "assets": assets,
        })
    return releases
