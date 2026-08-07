#!/usr/bin/env python3
"""Fetch and prepare Opera Software's GX Icon Pack for the Morphe patch bundle."""
from __future__ import annotations

import hashlib
import io
import json
import os
import re
import struct
import sys
import urllib.request
import zipfile
from pathlib import Path

STORE_PAGE = "https://store.gx.me/mods/cbljk8/gx-icon-pack/"
EXPECTED_NAME = "GX Icon Pack"
EXPECTED_AUTHOR = "Opera Software"
EXPECTED_VERSION = "1.7"
GROUPS = {
    "basic": "Basic",
    "holo": "Holo",
    "holo_gx": "Holo GX",
    "neon": "Neon",
}
USER_AGENT = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/150 Safari/537.36"


def request_bytes(url: str) -> bytes:
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=60) as response:
        return response.read()


def resolve_crx_url(page: bytes) -> str:
    text = page.decode("utf-8", errors="replace")
    text = (text.replace("\\u002F", "/").replace("\\u002f", "/")
            .replace("\\u003A", ":").replace("\\u003a", ":")
            .replace("\\u0026", "&").replace("\\/", "/")
            .replace("&amp;", "&"))
    hosts = r"(?:mods\.store\.gx\.me|play\.gxc\.gg|play\.gx\.games)"
    direct = re.search(rf"https://{hosts}/mods/[^\s\"'<>]+?/mod\.crx(?:\?[^\s\"'<>]*)?", text, re.I)
    if direct:
        return direct.group(0)
    content = re.search(rf"https://{hosts}/mods/[^\s\"'<>]+?/contents/[^\s\"'<>]+", text, re.I)
    if content:
        return content.group(0).split("/contents/", 1)[0] + "/mod.crx"
    raise RuntimeError("GX Store page did not expose the official mod.crx URL")


def crx_zip_bytes(data: bytes) -> bytes:
    if data.startswith(b"PK\x03\x04"):
        return data
    if len(data) < 12 or data[:4] != b"Cr24":
        raise RuntimeError("Downloaded GX package is neither ZIP nor CRX")
    version = struct.unpack_from("<I", data, 4)[0]
    if version == 2:
        if len(data) < 16:
            raise RuntimeError("Truncated CRX2 header")
        public_key_size, signature_size = struct.unpack_from("<II", data, 8)
        offset = 16 + public_key_size + signature_size
    elif version == 3:
        header_size = struct.unpack_from("<I", data, 8)[0]
        offset = 12 + header_size
    else:
        raise RuntimeError(f"Unsupported CRX version: {version}")
    if data[offset:offset + 4] != b"PK\x03\x04":
        raise RuntimeError("CRX payload does not begin with a ZIP archive")
    return data[offset:]


def resource_name(path: str) -> str:
    stem = Path(path).stem.lower().replace("-", "_")
    stem = re.sub(r"[^a-z0-9_]+", "_", stem).strip("_")
    return f"gxip_{stem}"


def main() -> int:
    repo = Path(__file__).resolve().parents[1]
    output = repo / "patches/src/main/resources/gx-icon-pack"
    output.mkdir(parents=True, exist_ok=True)

    source = os.environ.get("GX_ICON_PACK_SOURCE")
    if source:
        crx = Path(source).read_bytes()
        source_label = str(Path(source))
    else:
        page = request_bytes(STORE_PAGE)
        crx_url = resolve_crx_url(page)
        print(f"GX icon pack: downloading {crx_url}")
        crx = request_bytes(crx_url)
        source_label = crx_url

    package_sha256 = hashlib.sha256(crx).hexdigest()
    archive = crx_zip_bytes(crx)
    rows: list[tuple[str, str, str, str]] = []

    with zipfile.ZipFile(io.BytesIO(archive)) as source_zip:
        manifest = json.loads(source_zip.read("manifest.json"))
        author = manifest.get("author") or manifest.get("developer", {}).get("name")
        if manifest.get("name") != EXPECTED_NAME:
            raise RuntimeError(f"Unexpected GX pack name: {manifest.get('name')!r}")
        if author != EXPECTED_AUTHOR:
            raise RuntimeError(f"Unexpected GX pack author: {author!r}")
        if manifest.get("version") != EXPECTED_VERSION:
            raise RuntimeError(
                f"Expected GX Icon Pack {EXPECTED_VERSION}, got {manifest.get('version')!r}. "
                "Review the upstream update before changing the pinned version."
            )

        entries = manifest.get("mod", {}).get("payload", {}).get("app_icon", [])
        if len(entries) != 56:
            raise RuntimeError(f"Expected 56 app icons, got {len(entries)}")

        seen: set[str] = set()
        grouped: dict[str, list[tuple[str, bytes]]] = {key: [] for key in GROUPS}
        for item in entries:
            name = str(item.get("name", "")).strip()
            path = str(item.get("path", ""))
            match = re.fullmatch(r"app_icon/(basic|holo|holo_gx|neon)/([^/]+\.png)", path)
            if not name or not match:
                raise RuntimeError(f"Invalid app_icon entry: {item!r}")
            group_key = match.group(1)
            resource = resource_name(path)
            if resource in seen:
                raise RuntimeError(f"Duplicate Android resource name: {resource}")
            seen.add(resource)
            data = source_zip.read(path)
            if not data.startswith(b"\x89PNG\r\n\x1a\n"):
                raise RuntimeError(f"Icon is not a PNG: {path}")
            file_name = resource + ".png"
            grouped[group_key].append((file_name, data))
            rows.append((name, resource, GROUPS[group_key], path))

    for group_key, files in grouped.items():
        archive_path = output / f"gx-icon-pack-{group_key.replace('_', '-')}.zip"
        with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as target:
            for file_name, data in files:
                info = zipfile.ZipInfo(file_name, date_time=(2026, 1, 1, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                target.writestr(info, data)

    index = "".join(f"{name}|{resource}|{group}\n" for name, resource, group, _ in rows)
    (output / "index.txt").write_text(index, encoding="utf-8")
    metadata = {
        "name": EXPECTED_NAME,
        "author": EXPECTED_AUTHOR,
        "version": EXPECTED_VERSION,
        "store_page": STORE_PAGE,
        "source": source_label,
        "source_sha256": package_sha256,
        "icon_count": len(rows),
        "groups": {GROUPS[key]: len(grouped[key]) for key in GROUPS},
    }
    (output / "source.json").write_text(
        json.dumps(metadata, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        "GX icon pack: prepared 56 icons "
        f"({', '.join(f'{GROUPS[k]}={len(grouped[k])}' for k in GROUPS)})"
    )
    print(f"GX icon pack: source SHA-256 {package_sha256}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        print(f"GX icon pack preparation failed: {error}", file=sys.stderr)
        raise SystemExit(1)
