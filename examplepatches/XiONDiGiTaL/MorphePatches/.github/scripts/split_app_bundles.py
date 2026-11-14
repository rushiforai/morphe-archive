#!/usr/bin/env python3
"""
Splits the built patch bundle into one bundle per app folder.

The release artifact is the combined bundle that Morphe reads, and each app folder also keeps its own
bundle for a direct single-app import. Those per-app files used to be copied by hand, which is how a
folder could keep shipping an older build than the release it sat next to. This script derives them
from the released bundle instead, so they are always the same build.

Which apps exist is declared in .github/apps.json — adding an app means adding a folder, its patch
package and an entry there; nothing else in the release path needs editing.

Output is byte-for-byte deterministic: entries are sorted and stamped with a fixed timestamp, so a
release that changes nothing in an app's package rewrites the same file.

Usage:
  python3 .github/scripts/split_app_bundles.py <bundle.mpp> [--check]

  --check exits 1 when a file on disk differs from what the bundle would produce, which is a
  non-destructive way to ask whether the committed per-app bundles are stale.
"""

import hashlib
import io
import json
import sys
import zipfile
from pathlib import Path

APPS_FILE = Path(__file__).resolve().parent.parent / "apps.json"
REPO_ROOT = APPS_FILE.parent.parent

# Entries every bundle gets, regardless of app.
SHARED_PREFIXES = ("META-INF/",)

# The attributes the Gradle plugin writes, in the order it writes them. Anything else in the source
# manifest is carried over afterwards so a new attribute is not silently dropped.
MANIFEST_ORDER = (
    "Manifest-Version",
    "Name",
    "Description",
    "Source",
    "Author",
    "Contact",
    "Website",
    "License",
    "Version",
    "Patcher-Version",
)

# A fixed timestamp keeps the output reproducible; this is the one the Gradle plugin uses.
ZIP_DATE = (1980, 2, 1, 0, 0, 0)


def read_manifest(archive: zipfile.ZipFile) -> dict:
    """Parse META-INF/MANIFEST.MF, joining continuation lines."""
    try:
        raw = archive.read("META-INF/MANIFEST.MF").decode("utf-8")
    except KeyError:
        sys.exit("The bundle has no META-INF/MANIFEST.MF; it is not a Morphe patch bundle.")

    attributes, last_key = {}, None
    for line in raw.splitlines():
        if line.startswith(" "):
            if last_key is None:
                sys.exit("Malformed manifest: continuation line without a preceding attribute.")
            attributes[last_key] += line[1:]
            continue
        if not line.strip():
            last_key = None
            continue
        if ":" not in line:
            sys.exit(f"Malformed manifest line: {line!r}")
        key, value = line.split(":", 1)
        last_key = key.strip()
        attributes[last_key] = value.strip()
    return attributes


def write_manifest(attributes: dict) -> bytes:
    """Serialise a manifest, wrapping at 72 bytes per line as java.util.jar.Manifest does."""
    ordered = [key for key in MANIFEST_ORDER if key in attributes]
    ordered += [key for key in attributes if key not in MANIFEST_ORDER]

    out = b""
    for key in ordered:
        remaining = f"{key}: {attributes[key]}".encode("utf-8")
        out += remaining[:72] + b"\r\n"
        remaining = remaining[72:]
        while remaining:
            out += b" " + remaining[:71] + b"\r\n"
            remaining = remaining[71:]
    return out + b"\r\n"


def entry_info(name: str) -> zipfile.ZipInfo:
    info = zipfile.ZipInfo(name, date_time=ZIP_DATE)
    info.compress_type = zipfile.ZIP_DEFLATED
    info.external_attr = 0o644 << 16
    return info


def build_app_bundle(bundle: Path, app: dict, attributes: dict) -> bytes:
    """Return the bytes of a bundle containing only one app's patches."""
    prefix = f"app/xiondigital/patches/{app['package']}/"

    with zipfile.ZipFile(bundle) as source:
        names = sorted(
            name
            for name in source.namelist()
            if (name.startswith(prefix) or name.startswith(SHARED_PREFIXES))
            and not name.endswith("/")
        )
        if not any(name.startswith(prefix) for name in names):
            sys.exit(
                f"The bundle has no classes under {prefix}, so '{app['folder']}' would be empty. "
                "Check the 'package' value in .github/apps.json."
            )

        rewritten = dict(attributes)
        rewritten["Description"] = app["description"]

        buffer = io.BytesIO()
        with zipfile.ZipFile(buffer, "w", zipfile.ZIP_DEFLATED) as target:
            target.writestr(entry_info("META-INF/MANIFEST.MF"), write_manifest(rewritten))
            for name in names:
                if name == "META-INF/MANIFEST.MF":
                    continue
                target.writestr(entry_info(name), source.read(name))
        return buffer.getvalue()


def main() -> int:
    args = [arg for arg in sys.argv[1:] if arg != "--check"]
    check_only = "--check" in sys.argv[1:]

    if len(args) != 1:
        sys.exit("usage: split_app_bundles.py <bundle.mpp> [--check]")

    bundle = Path(args[0]).resolve()
    if not bundle.is_file():
        sys.exit(f"No bundle at {bundle}")

    apps = json.loads(APPS_FILE.read_text(encoding="utf-8"))

    with zipfile.ZipFile(bundle) as source:
        attributes = read_manifest(source)

    stale = []
    for app in apps:
        content = build_app_bundle(bundle, app, attributes)
        destination = REPO_ROOT / app["folder"] / "patches.mpp"
        checksum_file = destination.with_suffix(".mpp.sha256")
        # The checksum is generated with the bundle, so a folder can publish a hash it does not have
        # to be corrected by hand every release.
        checksum = f"{hashlib.sha256(content).hexdigest()}  patches.mpp\n"

        if check_only:
            if not destination.is_file() or destination.read_bytes() != content:
                stale.append(str(destination.relative_to(REPO_ROOT)))
            elif not checksum_file.is_file() or checksum_file.read_text(encoding="utf-8") != checksum:
                stale.append(str(checksum_file.relative_to(REPO_ROOT)))
            continue

        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(content)
        # newline="\n" keeps the file verifiable with sha256sum -c on Windows as well as Linux.
        checksum_file.write_text(checksum, encoding="utf-8", newline="\n")
        print(f"{destination.relative_to(REPO_ROOT)}: {len(content):,} bytes")

    if check_only:
        if stale:
            print("Per-app bundles are out of date: " + ", ".join(stale), file=sys.stderr)
            return 1
        print("Per-app bundles match the bundle.")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
