#!/usr/bin/env python3
"""Stage one signed release locally; never publish or change source metadata.

Use --source-metadata patches-bundle.json to enforce the reviewed release metadata.
Signing format: https://github.com/MorpheApp/morphe-patches-gradle-plugin/blob/v2.1.0/src/main/kotlin/app/morphe/patches/gradle/BundleSigning.kt
Manager schema: https://github.com/MorpheApp/morphe-manager/blob/6bd844d99ef9a13fcae08b68742662ff5bd19f83/app/src/main/java/app/morphe/manager/network/dto/ReleaseAsset.kt
"""

import argparse
import base64
import binascii
import hashlib
import json
import re
import shutil
import zipfile
from datetime import datetime, timezone
from pathlib import Path
from urllib.parse import urlsplit


RELEASE_TAG = re.compile(r"v((?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*)\.(?:0|[1-9][0-9]*))")
PACKAGE_NAME = "solo-patches"


def version_from_tag(tag):
    match = RELEASE_TAG.fullmatch(tag)
    if not match or len(tag) > 100:
        raise ValueError("Tag must be vMAJOR.MINOR.PATCH with no leading zeroes")
    return match[1]


def https_url(value):
    parts = urlsplit(value)
    if (value != value.strip() or any(ord(char) < 33 for char in value) or "%" in value
            or parts.scheme != "https" or not parts.hostname or parts.username is not None
            or parts.password is not None or parts.query or parts.fragment or "\\" in value or "//" in parts.path):
        raise ValueError("URLs must be plain HTTPS without credentials, query, fragment or escapes")
    if parts.port is not None and not 1 <= parts.port <= 65535:
        raise ValueError("Invalid HTTPS port")
    if any(segment in ("", ".", "..") for segment in parts.path.strip("/").split("/")):
        raise ValueError("URL path must not contain empty or relative segments")
    return parts


def project_url(value):
    parts = https_url(value)
    segments = parts.path.strip("/").split("/")
    if len(segments) < 2 or any(not re.fullmatch(r"[A-Za-z0-9_][A-Za-z0-9_.-]*", part) for part in segments):
        raise ValueError("Project URL must name a GitLab namespace and repository")
    if "-" in segments or segments[-1].endswith(".git"):
        raise ValueError("Use the GitLab project page URL, not a clone, raw or release URL")
    return value.rstrip("/")


def package_url(api_url, project_id, project, version):
    api = https_url(api_url)
    page = https_url(project_url(project))
    if api.netloc != page.netloc or api.path.rstrip("/") != "/api/v4":
        raise ValueError("API URL must be /api/v4 on the project HTTPS origin")
    if not re.fullmatch(r"[1-9][0-9]*", project_id):
        raise ValueError("Project ID must be a positive decimal integer")
    return f"{api_url.rstrip('/')}/projects/{project_id}/packages/generic/{PACKAGE_NAME}/{version}"


def read_json(path):
    with path.open(encoding="utf-8") as stream:
        value = json.load(stream)
    if not isinstance(value, dict):
        raise ValueError(f"Expected JSON object in {path.name}")
    return value


def validate_patch_list(path, version):
    data = read_json(path)
    patches = data.get("patches")
    if data.get("version") != version or not isinstance(patches, list) or not patches:
        raise ValueError("Patch list must contain patches and match the exact tag version")
    names = set()
    for patch in patches:
        if not isinstance(patch, dict) or not isinstance(patch.get("name"), str) or not patch["name"].strip():
            raise ValueError("Every patch must have a nonempty name")
        if patch["name"] in names:
            raise ValueError("Patch list contains duplicate names")
        names.add(patch["name"])
    return data


def decode_base64(value, size):
    try:
        decoded = base64.b64decode(value, validate=True)
    except (ValueError, binascii.Error) as error:
        raise ValueError("Invalid embedded signature or public verification key") from error
    if len(decoded) != size or base64.b64encode(decoded).decode("ascii") != value:
        raise ValueError("Invalid embedded signature or public verification key length")


def bundle_details(path):
    if path.suffix != ".mpp":
        raise ValueError("Only an Android .mpp patch bundle may be distributed")
    with zipfile.ZipFile(path) as archive:
        names = archive.namelist()
        if names.count("META-INF/MANIFEST.MF") != 1 or names.count("classes.dex") != 1:
            raise ValueError("Bundle must have exactly one manifest and Android classes.dex")
        manifest = archive.read("META-INF/MANIFEST.MF").decode("utf-8").replace("\r\n", "\n")
        # Unfold JAR manifest continuation lines before reading the main attributes.
        main = re.sub(r"\n ", "", manifest).split("\n\n", 1)[0]
        versions = [line.partition(": ")[2].strip() for line in main.splitlines() if line.lower().startswith("version: ")]
        if len(versions) != 1 or not versions[0]:
            raise ValueError("Bundle manifest must contain exactly one Version attribute")
        try:
            magic, public_key, signature = archive.comment.decode("ascii").split(" ")
        except (ValueError, UnicodeError) as error:
            raise ValueError("Bundle has no valid embedded MorpheSig1 signature") from error
        if magic != "MorpheSig1":
            raise ValueError("Bundle has no valid embedded MorpheSig1 signature")
        decode_base64(public_key, 32)
        decode_base64(signature, 64)
        # Structural/key-match check only. CI runs the real Patcher verifier before staging.
        return versions[0], public_key


def sha256(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def release_files(version):
    return {f"patches-{version}.mpp", "patches-list.json", "patches-bundle.json", "morphe-signing.pub", "SHA256SUMS", "release-notes.md"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tag", required=True)
    parser.add_argument("--project-url", required=True)
    parser.add_argument("--bundle", required=True, type=Path)
    parser.add_argument("--patch-list", required=True, type=Path)
    parser.add_argument("--public-key", required=True, type=Path)
    parser.add_argument("--notes", required=True, type=Path)
    parser.add_argument("--source-metadata", type=Path)
    parser.add_argument("--output", type=Path, default=Path("dist"))
    args = parser.parse_args()
    try:
        version = version_from_tag(args.tag)
        project = project_url(args.project_url)
        bundle_version, signing_key = bundle_details(args.bundle)
        if bundle_version != version:
            raise ValueError("Bundle manifest version does not match the exact tag version")
        public_key = args.public_key.read_text(encoding="ascii").strip()
        decode_base64(public_key, 32)
        if public_key != signing_key:
            raise ValueError("Bundle signer does not match the public verification key")
        validate_patch_list(args.patch_list, version)
        notes = args.notes.read_text(encoding="utf-8").strip()
        if not notes:
            raise ValueError("Release notes must not be empty")
        description = (
            f"# Solo Patches {args.tag}\n\n"
            "WebNovel com.qidian.Int.reader 8.24.2 APKM only. Patch bundles and source only; no app APKs.\n\n"
            "Required signature, original-certificate and GmsCore patches from rushiranpise v1.23.1 "
            "are included in this bundle. Select WebNovel GmsCore compatibility to include its dependencies. "
            "An installed trusted app.revanced.android.gms provider remains required. Manager installation "
            "and fresh integrated-build Google sign-in remain unverified; see README before patching. "
            "No paywall bypass, anti-ban guarantee or fabricated rewards. Enabling the timer-disable "
            "switch stops timer-based rewards; independent reading statistics remain.\n\n"
            + notes + "\n"
        )
        source = read_json(args.source_metadata) if args.source_metadata else None
        created_at = source.get("created_at") if source is not None else datetime.now(timezone.utc).replace(tzinfo=None).isoformat(timespec="seconds")
        if not isinstance(created_at, str) or not re.fullmatch(r"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}", created_at):
            raise ValueError("Metadata created_at must be UTC YYYY-MM-DDTHH:MM:SS without an offset")
        datetime.fromisoformat(created_at)
        page = f"{project}/-/releases/{args.tag}"
        metadata = {"version": version, "download_url": f"{page}/downloads/patches-{version}.mpp", "created_at": created_at,
                    "description": description, "public_key": public_key, "page_url": page}
        if source is not None and source != metadata:
            raise ValueError("Reviewed source metadata does not match this tag, bundle, public key, project or release notes")
        if args.output.is_symlink() or (args.output.exists() and (not args.output.is_dir() or any(args.output.iterdir()))):
            raise ValueError("Output must be a new or empty directory; existing releases are never overwritten")
        args.output.mkdir(parents=True, exist_ok=True)
        for source_path, name in ((args.bundle, f"patches-{version}.mpp"), (args.patch_list, "patches-list.json")):
            with source_path.open("rb") as source_stream, (args.output / name).open("xb") as target_stream:
                shutil.copyfileobj(source_stream, target_stream)
        texts = {"morphe-signing.pub": public_key + "\n", "patches-bundle.json": json.dumps(metadata, ensure_ascii=False, indent=2) + "\n",
                 "release-notes.md": description}
        for name, content in texts.items():
            with (args.output / name).open("x", encoding="utf-8", newline="\n") as stream:
                stream.write(content)
        checksums = "".join(f"{sha256(args.output / name)}  {name}\n" for name in sorted(release_files(version) - {"SHA256SUMS"}))
        with (args.output / "SHA256SUMS").open("x", encoding="ascii", newline="\n") as stream:
            stream.write(checksums)
    except (ValueError, OSError, zipfile.BadZipFile, UnicodeError) as error:
        parser.exit(1, f"Release preparation refused: {error}\n")
    print(f"Staged Solo Patches {args.tag} in {args.output}; no files published")


if __name__ == "__main__":
    main()
