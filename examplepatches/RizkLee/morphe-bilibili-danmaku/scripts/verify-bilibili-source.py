#!/usr/bin/env python3
"""Check fields needed by Morphe Manager's JSON patch-source loader."""
import base64
import json
import re
from datetime import datetime
from pathlib import Path
from urllib.parse import urlparse
from zipfile import ZipFile

root = Path(__file__).resolve().parent.parent
manifest = json.loads((root / "patches-bundle.json").read_text(encoding="utf-8"))
for field in ("version", "created_at", "description", "download_url", "public_key"):
    if not isinstance(manifest.get(field), str) or not manifest[field]:
        raise SystemExit(f"Missing or invalid manifest field: {field}")
created = manifest["created_at"]
if not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}", created):
    raise SystemExit("created_at must be UTC without a timezone suffix for Morphe LocalDateTime")
datetime.strptime(created, "%Y-%m-%dT%H:%M:%S")
version = manifest["version"]
url = urlparse(manifest["download_url"])
if url.scheme != "https" or not url.netloc or not url.path.endswith(f"/patches-{version}.mpp"):
    raise SystemExit("download_url must be HTTPS and point to this version's bundle")
file = root / "dist" / f"patches-{version}.mpp"
with ZipFile(file) as archive:
    parts = archive.comment.decode("ascii").split()
    if len(parts) != 3 or parts[0] != "MorpheSig1" or parts[1] != manifest["public_key"]:
        raise SystemExit("Bundle signer does not match the published key")
    if len(base64.b64decode(parts[2], validate=True)) != 64:
        raise SystemExit("Invalid Ed25519 signature length")
    if [n for n in archive.namelist() if n.endswith(".mpe")] != ["extensions/bilibili-danmaku.mpe"]:
        raise SystemExit("Expected one standalone Bilibili extension")
print(f"Morphe source manifest and signed standalone bundle {version} are structurally valid")
