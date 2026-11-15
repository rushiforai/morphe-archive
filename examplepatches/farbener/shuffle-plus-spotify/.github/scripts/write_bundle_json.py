"""Writes patches-bundle.json, the release metadata Morphe Manager reads: write_bundle_json.py VERSION OWNER/REPO NOTES OUT."""
import json
import sys
from datetime import datetime, timezone

version, repo, notes_path, out = sys.argv[1:5]
with open(notes_path, encoding="utf-8") as f:
    notes = f.read()
bundle = {
    "created_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
    "description": notes,
    "download_url": f"https://github.com/{repo}/releases/download/v{version}/patches-{version}.mpp",
    "signature_download_url": "",
    "version": version,
}
with open(out, "w", encoding="utf-8") as f:
    json.dump(bundle, f, indent=2)
    f.write("\n")
