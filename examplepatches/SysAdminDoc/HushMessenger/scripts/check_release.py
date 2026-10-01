"""Check locally built release evidence before publishing a patch bundle."""

import argparse
import base64
import hashlib
import json
import re
import shutil
import subprocess
import sys
import zipfile
import zlib
from datetime import datetime, timezone
from pathlib import Path

PATCH_COUNT = 31
RELEASE_SIGNERS = Path("scripts/release_signers")
RELEASE_SIGNER = "SysAdminDoc"
SIGNATURE_NAMESPACE = "hushmessenger-release"
KEY_TYPES = ("ssh-ed25519", "ssh-rsa", "ecdsa-sha2-")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def read_json(path):
    def unique_pairs(pairs):
        result = {}
        for key, value in pairs:
            require(key not in result, f"Duplicate JSON key: {key}")
            result[key] = value
        return result

    return json.loads(path.read_text(encoding="utf-8"), object_pairs_hook=unique_pairs)


def verify(root, bundle=None, evidence=None, release_tag=None, checksums=None):
    properties = dict(
        re.findall(
            r"^([A-Za-z][A-Za-z0-9.]*)=(.+)$",
            (root / "gradle.properties").read_text(encoding="utf-8"),
            re.MULTILINE,
        )
    )
    version = properties.get("version", "")
    require(
        re.fullmatch(r"\d+\.\d+\.\d+", version), "Missing or invalid project version"
    )
    filename = f"patches-{version}.mpp"
    bundle = bundle or root / "patches/build/libs" / filename
    evidence = evidence or root / "patches/build/reports/catalog-evidence.json"
    require(bundle.name == filename, "Bundle filename differs from project version")
    require(
        release_tag is None or release_tag == f"v{version}",
        "Release tag differs from project version",
    )
    digest = hashlib.sha256(bundle.read_bytes()).hexdigest()
    with zipfile.ZipFile(bundle) as archive:
        require(
            {"classes.dex", "extensions/messenger.mpe"}.issubset(archive.namelist()),
            "Incomplete Android bundle",
        )
        manifest = (
            archive.read("META-INF/MANIFEST.MF")
            .decode("utf-8")
            .replace("\r\n ", "")
            .replace("\n ", "")
        )
        attributes = dict(
            line.split(": ", 1) for line in manifest.splitlines() if ": " in line
        )
    require(
        attributes.get("Version") == version,
        "Bundle manifest version differs from source",
    )
    require(
        attributes.get("Timestamp") == properties.get("bundleTimestampMillis"),
        "Bundle timestamp differs from source",
    )

    index = read_json(root / "patches-bundle.json")
    require(index.get("version") == version, "Source index version differs from source")
    require(
        index.get("download_url")
        == f"https://github.com/SysAdminDoc/HushMessenger/releases/download/v{version}/{filename}",
        "Source download URL differs from release version or artifact name",
    )
    timestamp = index.get("created_at", "")
    require(
        re.fullmatch(r"\d{4}-\d\d-\d\dT\d\d:\d\d:\d\d(?:\.\d{1,3})?", timestamp),
        "Source timestamp must be a local date-time without Z",
    )
    millis = round(
        datetime.fromisoformat(timestamp).replace(tzinfo=timezone.utc).timestamp()
        * 1000
    )
    require(
        str(millis) == properties.get("bundleTimestampMillis"),
        "Source and bundle timestamps differ",
    )

    public = read_json(root / "patches-list.json")
    fresh = read_json(evidence)
    require(
        fresh.get("bundle") == filename and fresh.get("sha256") == digest,
        "Catalog evidence is stale for this bundle; run :patches:checkPatchCatalog",
    )
    require(
        public == fresh.get("catalog"),
        "Public catalog differs from loaded bundle metadata",
    )
    require(public.get("version") == version, "Catalog version differs from source")
    entries = public.get("patches")
    require(
        isinstance(entries, list) and len(entries) == PATCH_COUNT,
        f"Expected {PATCH_COUNT} catalog patches",
    )
    require(
        all(
            isinstance(entry, dict) and isinstance(entry.get("name"), str)
            for entry in entries
        ),
        "Invalid catalog patch entry",
    )
    require(
        len({entry["name"] for entry in entries}) == PATCH_COUNT,
        "Duplicate catalog patch names",
    )

    readme = (root / "README.md").read_text(encoding="utf-8")
    badges = re.findall(r"shields\.io/badge/version-([^-/\s]+)-", readme)
    require(badges == [version], "README version badge differs from source")
    hashes = re.findall(
        r"^([a-f0-9]{64})\s+(patches-[\d.]+\.mpp)\s*$", readme, re.MULTILINE
    )
    require(
        hashes == [(digest, filename)],
        "README artifact checksum differs from built bundle",
    )
    # Only this repository's release links (absolute in any case, or relative) and
    # its own bundle names; another project's release or bundle is not ours to pin.
    release_links = re.compile(
        r"(?i)(?:SysAdminDoc/HushMessenger/|\.\./)releases/(?:tag|download)/v"
        r"(\d+\.\d+\.\d+)(?!\.?\d)"
        r"|(?<![\w.-])patches-(\d+\.\d+\.\d+)(?!\.?\d)"
    )
    for link in release_links.finditer(readme):
        advertised = link.group(1) or link.group(2)
        require(advertised == version, "README download link differs from source")
    headings = re.findall(
        r"^## (.+)$", (root / "CHANGELOG.md").read_text(encoding="utf-8"), re.MULTILINE
    )
    require(
        bool(headings) and headings[0].startswith(version + " ("),
        "First changelog entry must be the release version",
    )
    extension_build = (root / "extensions/messenger/build.gradle.kts").read_text(
        encoding="utf-8"
    )
    require(
        re.findall(r"versionName\s*=\s*([^\n]+)", extension_build)
        == ["project.version.toString()"],
        "Extension version name must follow the project",
    )
    if checksums is not None:
        require(
            checksums.read_text(encoding="utf-8").strip() == f"{digest}  {filename}",
            "Release checksum file differs from built bundle",
        )
    return (
        f"Release metadata passed: v{version}, {PATCH_COUNT} patches, SHA-256 {digest}"
    )


def signer_fingerprints(path):
    """SHA256 fingerprints, as ssh-keygen -l prints them, of the keys an allowed_signers file lists."""
    prints = []
    for line in path.read_text(encoding="utf-8").splitlines():
        fields = line.split()
        if not fields or fields[0].startswith("#"):
            continue
        at = next(i for i, f in enumerate(fields) if f.startswith(KEY_TYPES))
        digest = hashlib.sha256(base64.b64decode(fields[at + 1])).digest()
        prints.append("SHA256:" + base64.b64encode(digest).decode().rstrip("="))
    return prints


def verify_signature(root, checksums):
    """Check <checksums>.sig with ssh-keygen against the committed release_signers file."""
    signature = checksums.with_name(checksums.name + ".sig")
    require(signature.is_file(), f"Missing signature file {signature.name}")
    ssh_keygen = shutil.which("ssh-keygen")
    require(
        ssh_keygen is not None,
        "ssh-keygen (OpenSSH 8.1 or newer) is needed to check the signature",
    )
    with checksums.open("rb") as data:
        result = subprocess.run(
            [
                ssh_keygen,
                "-Y",
                "verify",
                "-f",
                str(root / RELEASE_SIGNERS),
                "-I",
                RELEASE_SIGNER,
                "-n",
                SIGNATURE_NAMESPACE,
                "-s",
                str(signature),
            ],
            stdin=data,
            capture_output=True,
            timeout=60,
            check=False,
        )
    output = (result.stdout + result.stderr).decode("utf-8", "replace").strip()
    require(
        result.returncode == 0,
        f"{checksums.name} isn't signed by the key in {RELEASE_SIGNERS.as_posix()}: {output}",
    )
    return output


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--bundle", type=Path)
    parser.add_argument("--evidence", type=Path)
    parser.add_argument("--release-tag")
    parser.add_argument("--checksums", type=Path)
    parser.add_argument(
        "--verify-signature",
        action="store_true",
        help="also check <checksums>.sig against scripts/release_signers",
    )
    args = parser.parse_args(argv)
    if args.verify_signature and args.checksums is None:
        parser.error("--verify-signature needs --checksums")
    try:
        print(
            verify(
                args.root, args.bundle, args.evidence, args.release_tag, args.checksums
            )
        )
        if args.verify_signature:
            print(verify_signature(args.root, args.checksums))
        return 0
    except (
        OSError,
        ValueError,
        TypeError,
        AttributeError,
        KeyError,
        zipfile.BadZipFile,
        zlib.error,
        subprocess.SubprocessError,
    ) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
