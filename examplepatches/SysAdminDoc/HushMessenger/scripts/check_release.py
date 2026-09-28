"""Check locally built release evidence before publishing a patch bundle."""

import argparse
import hashlib
import json
import re
import sys
import zipfile
import zlib
from datetime import datetime, timezone
from pathlib import Path


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
        isinstance(entries, list) and len(entries) == 21, "Expected 21 catalog patches"
    )
    require(
        all(
            isinstance(entry, dict) and isinstance(entry.get("name"), str)
            for entry in entries
        ),
        "Invalid catalog patch entry",
    )
    require(
        len({entry["name"] for entry in entries}) == 21, "Duplicate catalog patch names"
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
    for advertised in re.findall(
        r"(?:releases/(?:tag|download)/v|patches-)(\d+\.\d+\.\d+)(?=[/).\s])", readme
    ):
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
    return f"Release metadata passed: v{version}, 21 patches, SHA-256 {digest}"


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--bundle", type=Path)
    parser.add_argument("--evidence", type=Path)
    parser.add_argument("--release-tag")
    parser.add_argument("--checksums", type=Path)
    args = parser.parse_args(argv)
    try:
        print(
            verify(
                args.root, args.bundle, args.evidence, args.release_tag, args.checksums
            )
        )
        return 0
    except (
        OSError,
        ValueError,
        TypeError,
        AttributeError,
        KeyError,
        zipfile.BadZipFile,
        zlib.error,
    ) as error:
        print(f"CHECK FAILED: {error}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
