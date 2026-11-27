#!/usr/bin/env python3
"""Scan built .mpp (and nested .mpe) archives for unexpected local/personal metadata."""

import io
import os
import re
import socket
import sys
import zipfile


def main() -> int:
    targets = sys.argv[1:]
    if not targets:
        print("Usage: audit-mpp.py <file.mpp> [...]", file=sys.stderr)
        return 2

    raw_needles = {
        os.environ.get("USER", ""),
        socket.gethostname(),
        "/home/",
        "/Users/",
    }
    needles = {n.lower() for n in raw_needles if n and n.lower() not in {"runner", "root"}}
    email_re = re.compile(rb"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")

    def scan_bytes(label: str, data: bytes) -> None:
        low = data.lower()
        for n in sorted(needles):
            if n.encode() in low:
                print(f"[NOTICE] matched '{n}' in {label}")
        for m in email_re.findall(data):
            addr = m.decode(errors="ignore")
            if "morphe" not in addr.lower() and "example" not in addr.lower():
                print(f"[NOTICE] email '{addr}' in {label}")

    for mpp in targets:
        print(f"=== Auditing {mpp} ===")
        with zipfile.ZipFile(mpp) as zf:
            for info in zf.infolist():
                raw = zf.read(info.filename)
                if info.filename.upper().endswith("MANIFEST.MF"):
                    print("--- MANIFEST.MF ---")
                    print(raw.decode(errors="replace").strip())
                    print("-------------------")
                scan_bytes(info.filename, raw)
                if info.filename.endswith((".mpe", ".zip", ".jar")):
                    try:
                        with zipfile.ZipFile(io.BytesIO(raw)) as inner:
                            for i2 in inner.infolist():
                                scan_bytes(f"{info.filename}!/{i2.filename}", inner.read(i2.filename))
                    except zipfile.BadZipFile:
                        pass
    print("Audit finished.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
