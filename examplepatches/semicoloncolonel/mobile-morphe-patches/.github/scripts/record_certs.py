#!/usr/bin/env python3
"""Records the signing certificate of trusted APKs in .github/app-certs.json.

Run it on APKs from a trusted source, such as Google Play or the developer's
own site. The daily app update check accepts an APKPure download only when
its certificate is one recorded here.

    python3 .github/scripts/record_certs.py --aapt2 aapt2 --apksigner apksigner app.apk other.apks
"""

import argparse
import json
import re
import subprocess
import tempfile
import zipfile
from pathlib import Path


def base_apk(path, tmp):
    if path.suffix not in (".apks", ".apkm", ".xapk"):
        return path
    with zipfile.ZipFile(path) as bundle:
        names = [n for n in bundle.namelist() if "config." not in n and n.endswith(".apk")]
        base = Path(tmp, "base.apk")
        base.write_bytes(bundle.read(names[0]))
        return base


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("apks", nargs="+", type=Path)
    parser.add_argument("--aapt2", required=True)
    parser.add_argument("--apksigner", required=True)
    parser.add_argument("--certs", default=".github/app-certs.json", type=Path)
    args = parser.parse_args()

    certs = json.loads(args.certs.read_text()) if args.certs.exists() else {}
    for path in args.apks:
        with tempfile.TemporaryDirectory() as tmp:
            base = base_apk(path, tmp)
            badging = subprocess.run([args.aapt2, "dump", "badging", str(base)], capture_output=True, text=True).stdout
            package = re.search(r"package: name='([^']+)'", badging)
            out = subprocess.run([args.apksigner, "verify", "--print-certs", str(base)],
                                 capture_output=True, text=True).stdout
            # Every signer's digest, whatever apksigner's wording, except Google Play's
            # source stamp. Apps that rotated their key list a signer per Android version range.
            digests = re.findall(r"^(?!Source Stamp)[^\n]*certificate SHA-256 digest: ([0-9a-f]{64})", out, re.M)
            if not package or not digests:
                print(f"{path}: could not read the package or certificate")
                continue
            known = certs.setdefault(package.group(1), [])
            for digest in digests:
                if digest not in known:
                    known.append(digest)
            print(f"{package.group(1)}: {', '.join(digests)}")
    args.certs.write_text(json.dumps(dict(sorted(certs.items())), indent=2) + "\n")


if __name__ == "__main__":
    main()
