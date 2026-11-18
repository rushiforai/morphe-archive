#!/usr/bin/env python3
"""Publish a staged, signed release to GitLab from a maintainer's machine.

Run after prepare_release.py and after pushing the release tag:
  GITLAB_TOKEN=... python3 scripts/publish_release.py --tag v1.0.0
GITLAB_TOKEN is a GitLab token with the `api` scope. It is never logged.
Generic packages: https://docs.gitlab.com/user/packages/generic_packages/
Release API and direct_asset_path: https://docs.gitlab.com/api/releases/#create-a-release
"""

import argparse
import hashlib
import json
import os
from pathlib import Path
import zipfile
from urllib.error import HTTPError, URLError
from urllib.parse import quote, urlsplit
from urllib.request import HTTPRedirectHandler, Request, build_opener

from prepare_release import bundle_details, package_url, project_url, read_json, release_files, sha256, validate_patch_list, version_from_tag


class NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, request, response, code, message, headers, new_url):
        raise ValueError("Authenticated API redirect refused")


class HTTPSRedirect(HTTPRedirectHandler):
    def redirect_request(self, request, response, code, message, headers, new_url):
        target = urlsplit(new_url)
        if target.scheme != "https" or not target.hostname or target.username is not None or target.password is not None:
            raise ValueError("Unsafe public download redirect refused")
        return super().redirect_request(request, response, code, message, headers, new_url)


def validate_distribution(directory, tag, project, source_metadata):
    version = version_from_tag(tag)
    project = project_url(project)
    names = release_files(version)
    if directory.is_symlink() or {path.name for path in directory.iterdir()} != names:
        raise ValueError("Release directory must contain exactly the six explicit distributables")
    if any(not (directory / name).is_file() or (directory / name).is_symlink() for name in names):
        raise ValueError("Distributables must be regular files, not symlinks")
    metadata = read_json(directory / "patches-bundle.json")
    page = f"{project}/-/releases/{tag}"
    bundle_version, public_key = bundle_details(directory / f"patches-{version}.mpp")
    if (bundle_version != version or metadata.get("version") != version or metadata.get("page_url") != page
            or metadata.get("download_url") != f"{page}/downloads/patches-{version}.mpp"
            or metadata.get("public_key") != public_key
            or (directory / "morphe-signing.pub").read_text(encoding="ascii").strip() != public_key):
        raise ValueError("Release tag, bundle, signer and metadata must agree")
    if metadata != read_json(source_metadata):
        raise ValueError("Staged metadata differs from the reviewed root metadata")
    if metadata.get("description") != (directory / "release-notes.md").read_text(encoding="utf-8"):
        raise ValueError("Staged release notes differ from metadata")
    validate_patch_list(directory / "patches-list.json", version)
    expected = "".join(f"{sha256(directory / name)}  {name}\n" for name in sorted(names - {"SHA256SUMS"}))
    if (directory / "SHA256SUMS").read_text(encoding="ascii") != expected:
        raise ValueError("Distributable checksums do not match")
    return version, metadata, sorted(names)


PROJECT = "https://gitlab.com/solo-patches/solo-patches"
API = "https://gitlab.com/api/v4"


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--tag", required=True)
    parser.add_argument("--directory", type=Path, default=Path("dist"))
    parser.add_argument("--source-metadata", type=Path, default=Path("patches-bundle.json"))
    args = parser.parse_args()
    try:
        token = os.environ.get("GITLAB_TOKEN")
        if not token:
            raise ValueError("GITLAB_TOKEN is required")
        tag = args.tag
        project = PROJECT
        version, metadata, names = validate_distribution(args.directory, tag, project, args.source_metadata)
        authenticated = build_opener(NoRedirect())
        anonymous = build_opener(HTTPSRedirect())
        path = quote(urlsplit(project).path.strip("/"), safe="")
        with anonymous.open(f"{API}/projects/{path}", timeout=120) as response:
            project_id = str(json.load(response)["id"])
        package = package_url(API, project_id, project, version)

        def api_request(method, url, data=None, content_type=None):
            headers = {"PRIVATE-TOKEN": token}
            if content_type:
                headers["Content-Type"] = content_type
            if hasattr(data, "fileno"):
                headers["Content-Length"] = str(os.fstat(data.fileno()).st_size)
            return authenticated.open(Request(url, data=data, headers=headers, method=method), timeout=120)

        release_url = f"{API}/projects/{project_id}/releases"
        try:
            with api_request("GET", f"{release_url}/{tag}"):
                raise ValueError("Release already exists; existing releases are never modified")
        except HTTPError as error:
            if error.code != 404:
                raise

        def public_digest(name, base=package):
            try:
                with anonymous.open(f"{base}/{name}", timeout=120) as response:
                    digest = hashlib.sha256()
                    for block in iter(lambda: response.read(1024 * 1024), b""):
                        digest.update(block)
                    return digest.hexdigest()
            except HTTPError as error:
                if error.code == 404:
                    return None
                raise

        # Byte-identical partial uploads can resume; never add a duplicate or replace an existing file.
        missing = []
        for name in names:
            remote = public_digest(name)
            if remote is None:
                missing.append(name)
            elif remote != sha256(args.directory / name):
                raise ValueError(f"Existing immutable package file differs: {name}")
        for name in missing:
            with (args.directory / name).open("rb") as stream:
                with api_request("PUT", f"{package}/{name}", stream, "application/octet-stream") as response:
                    if response.status != 201:
                        raise ValueError(f"Package upload did not return 201: {name}")
        # Manager has no GitLab job token. Fail closed before creating release links if public downloads fail.
        for name in names:
            if public_digest(name) != sha256(args.directory / name):
                raise ValueError(f"Anonymous package verification failed: {name}")
        release = {"name": f"Solo Patches {tag}", "tag_name": tag, "description": metadata["description"],
                   "assets": {"links": [{"name": name, "url": f"{package}/{name}", "direct_asset_path": f"/{name}", "link_type": "package"} for name in names]}}
        with api_request("POST", release_url, json.dumps(release).encode("utf-8"), "application/json") as response:
            if response.status != 201:
                raise ValueError("Release creation did not return 201")
        for name in names:
            if public_digest(name, f"{project}/-/releases/{tag}/downloads") != sha256(args.directory / name):
                raise ValueError(f"Release exists, but anonymous release-asset verification failed: {name}")
    except HTTPError as error:
        parser.exit(1, f"Publication refused: GitLab HTTP {error.code}; no credential or response body logged\n")
    except URLError:
        parser.exit(1, "Publication refused: GitLab connection failed; retry only with the same immutable artifacts\n")
    except (ValueError, OSError, UnicodeError, zipfile.BadZipFile) as error:
        parser.exit(1, f"Publication refused: {error}\n")
    print(f"Published Solo Patches {tag}; anonymous package and release-asset checksums verified")


if __name__ == "__main__":
    main()
