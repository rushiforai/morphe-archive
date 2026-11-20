"""Verify an extracted private recovery kit without displaying file contents."""
import argparse
import hashlib
import json
from pathlib import Path

p = argparse.ArgumentParser(description=__doc__)
p.add_argument("recovery_root", type=Path)
args = p.parse_args()
root = args.recovery_root.resolve()
manifest = json.loads((root / "MANIFEST.sha256.json").read_text(encoding="utf-8"))
bad = []
for name, expected in manifest.items():
    path = (root / name).resolve()
    if not path.is_relative_to(root):
        raise ValueError("Manifest path escapes recovery directory")
    if not path.is_file():
        bad.append(name)
        continue
    with path.open("rb") as stream:
        if hashlib.file_digest(stream, "sha256").hexdigest() != expected:
            bad.append(name)
if bad:
    raise SystemExit("Recovery files missing or changed: " + ", ".join(bad))
print("Verified", len(manifest), "recovery files.")
