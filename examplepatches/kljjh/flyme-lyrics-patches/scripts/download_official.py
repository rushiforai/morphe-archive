"""Download an exact, checksummed test fixture. It is never bundled into the add-on."""
import hashlib
import json
from pathlib import Path
import urllib.request

ROOT = Path(__file__).resolve().parents[1]
config = json.loads((ROOT / "compatibility.json").read_text())
version = config["official_version"]
target = ROOT / "work/official" / f"patches-{version}.mpp"
target.parent.mkdir(parents=True, exist_ok=True)
if not target.exists():
    urllib.request.urlretrieve(f"https://github.com/{config['official_repository']}/releases/download/v{version}/patches-{version}.mpp", target)
if hashlib.sha256(target.read_bytes()).hexdigest() != config["official_sha256"]:
    raise RuntimeError("Official fixture checksum mismatch")
print(f"Verified official Morphe {version} fixture")
