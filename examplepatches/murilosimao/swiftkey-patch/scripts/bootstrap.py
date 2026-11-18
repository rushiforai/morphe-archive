#!/usr/bin/env python3
"""Fetch public, pinned build tools. No GitHub authentication is needed."""
import hashlib
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parent.parent
TOOLS = {
    "morphe-desktop-2.1.1-all.jar": (
        "https://github.com/MorpheApp/morphe-desktop/releases/download/v2.1.1/morphe-desktop-2.1.1-all.jar",
        "3a2efefd567b44dde15971a58d5aa649a32aba30781d3400dc08d688c720168f",
    ),
    "r8-9.5.29.jar": (
        "https://dl.google.com/dl/android/maven2/com/android/tools/r8/9.5.29/r8-9.5.29.jar",
        "f8c762ff84640b10083b934a47278758a7665977e618fab0c927fff00521dea3",
    ),
}


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def main():
    tools = ROOT / "tools"
    tools.mkdir(exist_ok=True)
    for name, (url, expected) in TOOLS.items():
        target = tools / name
        if target.exists() and sha256(target) == expected:
            continue
        temporary = target.with_suffix(".part")
        print(f"Downloading {name}", flush=True)
        subprocess.run(["curl", "--fail", "--location", "--silent", "--show-error", "--retry", "2",
                        "--output", str(temporary), url], check=True)
        if sha256(temporary) != expected:
            temporary.unlink()
            raise SystemExit(f"Checksum mismatch: {name}")
        temporary.replace(target)
    print("Build tool checksums verified.")


if __name__ == "__main__":
    main()
