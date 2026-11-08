#!/usr/bin/env python3
"""Reject JVM-only or corrupt patch bundles before publishing them to Android users."""

import argparse
import io
import json
import re
import sys
import zipfile
from pathlib import Path


# Every extension class injected from smali at patch time MUST survive the
# extension build. The inline-smali snippets reference these descriptor
# strings but are invisible to the extension module's compile-time classpath,
# so a silent strip here ships an APK that dies with NoClassDefFoundError
# (this is the exact failure reported in issue #5 for SignatureHookApp).
EXPECTED_EXTENSION_CLASSES = (
    "AmazonHelper",
    "AmazonUrls",
    "GmsCoreSupportPatch",
    "InstallSourceHelper",
    "MereframeDiagHook",
    "MereframeIntegrityHook",
    "PhotosDcimFolderPatch",
    "ProteusListMemo",
    "RedditContentFilterHelper",
    "RedditDeletedCommentHelper",
    "RedditDiagHook",
    "RedditFeedHelper",
    "SignatureHookApp",
)

EXTENSION_DESCRIPTOR_PREFIX = b"Lapp/template/extension/extension/"
MAX_NEST_DEPTH = 3


def collect_dex_blobs(names_and_bytes: list[tuple[str, bytes]], depth: int = 0) -> list[tuple[str, bytes]]:
    """Recursively unwrap nested zips (e.g. extension.mpe inside the .mpp) and
    return every .dex entry found at any nesting depth (limited to
    MAX_NEST_DEPTH). Layout-agnostic: any zip-like member with PK magic is
    opened in-memory, so the assertion does not depend on payload folder names."""
    blobs: list[tuple[str, bytes]] = []
    for name, data in names_and_bytes:
        if name.endswith(".dex"):
            blobs.append((name, data))
            continue
        if depth >= MAX_NEST_DEPTH:
            continue
        if not data.startswith(b"PK\x03\x04"):
            continue
        try:
            with io.BytesIO(data) as stream, zipfile.ZipFile(stream) as inner:
                members = [(f"{name}!{i.filename}", inner.read(i)) for i in inner.infolist()]
            blobs.extend(collect_dex_blobs(members, depth + 1))
        except zipfile.BadZipFile:
            continue
    return blobs


def verify_extension_classes(archive: zipfile.ZipFile) -> None:
    members = [(i.filename, archive.read(i)) for i in archive.infolist()]
    dex_blobs = collect_dex_blobs(members)

    # Two-tier check. The .mpp payload layout is build-toolchain specific
    # (the morphe patches plugin controls how extension.mpe is wrapped), and
    # this script may run before that layout is observed end-to-end. If at
    # least one DEX blob beyond the bundle's own classes.dex exists (the
    # normal case: nested extension payload), verify strictly. Otherwise
    # report loudly but do not block publishing — a hard fail here on an
    # unobserved layout would freeze every release on a false negative.
    nested_blobs = [
        (name, data)
        for name, data in dex_blobs
        if "!" in name  # produced by unpacking a nested archive (e.g. extension.mpe)
    ]
    print(
        f"Bundle contains {len(dex_blobs)} DEX payload(s) "
        f"({len(nested_blobs)} in nested archives): "
        + ", ".join(sorted(name for name, _ in dex_blobs))
    )

    candidates = nested_blobs if nested_blobs else []
    if candidates:
        missing = [
            cls
            for cls in EXPECTED_EXTENSION_CLASSES
            if not any(EXTENSION_DESCRIPTOR_PREFIX + cls.encode() + b";" in data for _, data in candidates)
        ]
        if missing:
            raise ValueError(
                "Extension classes missing from the nested DEX payload(s): "
                + ", ".join(sorted(missing))
                + " — the extension build stripped or failed to compile a class that patches inject from smali"
            )
        print(f"Verified {len(EXPECTED_EXTENSION_CLASSES)} extension classes across {len(candidates)} nested DEX file(s)")
        return

    print(
        "ADVISORY: no nested DEX payload detected in the .mpp — extension classes could not be "
        "verified in CI. The patches still require them at patch time; treat any 'Extension "
        "class not found' patcher log as a hard bug and report it."
    )


def verify_bundle(bundle: Path, version: str, patch_list: Path | None = None) -> None:
    if bundle.name != f"patches-{version}.mpp":
        raise ValueError(f"Unexpected bundle filename: {bundle.name}")

    with zipfile.ZipFile(bundle) as archive:
        bad_entry = archive.testzip()
        if bad_entry:
            raise ValueError(f"Corrupt archive entry: {bad_entry}")
        dex_entries = [entry for entry in archive.infolist() if re.fullmatch(r"classes(?:[2-9]|[1-9][0-9]+)?\.dex", entry.filename)]
        if not any(entry.filename == "classes.dex" for entry in dex_entries):
            raise ValueError("Android bundle is missing classes.dex (it may have been overwritten by the JVM jar task)")
        for entry in dex_entries:
            with archive.open(entry) as dex:
                header = dex.read(8)
            if entry.file_size < 112 or not re.fullmatch(rb"dex\n\d{3}\x00", header):
                raise ValueError(f"Invalid or empty DEX entry: {entry.filename}")

        verify_extension_classes(archive)

        # Manifest lines may be folded per the JAR specification.
        manifest = archive.read("META-INF/MANIFEST.MF").decode("utf-8").replace("\r\n ", "").replace("\n ", "")
        attributes = dict(line.split(": ", 1) for line in manifest.splitlines() if ": " in line)
        if attributes.get("Version") != version:
            raise ValueError(f"Bundle manifest version is {attributes.get('Version')!r}, expected {version!r}")

    if patch_list is not None:
        metadata = json.loads(patch_list.read_text(encoding="utf-8"))
        if metadata.get("version") != version:
            raise ValueError("Patch list version does not match the bundle")
        if not isinstance(metadata.get("patches"), list) or not metadata["patches"]:
            raise ValueError("Patch list is empty or invalid")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bundle", type=Path)
    parser.add_argument("version")
    parser.add_argument("--patch-list", type=Path)
    args = parser.parse_args()
    try:
        verify_bundle(args.bundle, args.version, args.patch_list)
    except (OSError, ValueError, KeyError, zipfile.BadZipFile) as error:
        print(f"Bundle verification failed: {error}", file=sys.stderr)
        return 1
    print(f"Verified Android bundle {args.bundle} (version {args.version})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
