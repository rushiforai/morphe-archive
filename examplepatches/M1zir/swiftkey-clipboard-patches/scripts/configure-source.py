#!/usr/bin/env python3
"""Configure a GitHub owner/repository before publishing."""
import argparse
import datetime
import json
from pathlib import Path
import re

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("repository", help="GitHub owner/repository")
args = parser.parse_args()
if not re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9-]*/[A-Za-z0-9_.-]+", args.repository):
    parser.error("Expected GitHub owner/repository")
if "YOUR_USERNAME" in args.repository or args.repository == "murilosimao/swiftkey-patch":
    parser.error("Use your own repository, not the placeholder or upstream")
root = Path(__file__).resolve().parent.parent
properties = root / "gradle.properties"
lines = properties.read_text().splitlines()
version = next(line.split("=", 1)[1].strip() for line in lines if line.startswith("version="))
url = f"https://github.com/{args.repository}"
lines = [line for line in lines if not line.startswith("patchRepository=")]
properties.write_text("\n".join(lines + [f"patchRepository={url}"]) + "\n")
metadata = {
    "created_at": datetime.datetime.now(datetime.timezone.utc).replace(tzinfo=None, microsecond=0).isoformat(),
    "page_url": f"{url}/releases/tag/v{version}",
    "description": "Persistent clipboard history and Arabic 123 legacy layout for SwiftKey 9.13.19.3. Experimental; Android device validation pending.",
    "download_url": f"{url}/releases/download/v{version}/swiftkey-clipboard-patches-{version}.mpp",
    "signature_download_url": "",
    "version": version,
}
(root / "patches-bundle.json").write_text(json.dumps(metadata, indent=2) + "\n")
print(f"Configured {url} for v{version}. Rebuild before uploading.")
