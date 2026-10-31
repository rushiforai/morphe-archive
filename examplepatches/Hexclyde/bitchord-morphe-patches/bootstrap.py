#!/usr/bin/env python3
"""Download the pinned build dependencies (Linux x86-64)."""

from pathlib import Path
import hashlib, json, subprocess, sys, zipfile, tarfile

sys.path.insert(0, str(Path(__file__).resolve().parent / "tools"))
from bootstrap_from_release import download

ROOT = Path(__file__).resolve().parent
DEPS = ROOT / ".deps"
TOOLS = DEPS / "tools"
TOOLS.mkdir(parents=True, exist_ok=True)
metadata = json.loads((ROOT / "PROVENANCE.json").read_text())
for item in metadata["downloads"]:
    path = TOOLS / item["file"]
    if (
        not path.exists()
        or hashlib.sha256(path.read_bytes()).hexdigest() != item["sha256"]
    ):
        print("Downloading", item["file"], flush=True)
        download(item["url"], path)
    if hashlib.sha256(path.read_bytes()).hexdigest() != item["sha256"]:
        raise RuntimeError("Hash mismatch: " + str(path))
with tarfile.open(TOOLS / "jdk21.tar.gz") as archive:
    archive.extractall(TOOLS, filter="data")
with zipfile.ZipFile(TOOLS / "kotlin.zip") as archive:
    archive.extractall(TOOLS)
for file in (TOOLS / "kotlinc/bin").iterdir():
    file.chmod(file.stat().st_mode | 0o111)
with zipfile.ZipFile(TOOLS / "platform35.zip") as archive:
    member = next(n for n in archive.namelist() if n.endswith("/android.jar"))
    (TOOLS / "android.jar").write_bytes(archive.read(member))
with zipfile.ZipFile(TOOLS / "ndk.zip") as archive:
    for abi, target in {
        "arm64-v8a": "aarch64-linux-android",
        "armeabi-v7a": "arm-linux-androideabi",
        "x86_64": "x86_64-linux-android",
    }.items():
        member = next(
            n
            for n in archive.namelist()
            if n.endswith("/" + target + "/libc++_shared.so")
        )
        output = TOOLS / "libcxx" / abi / "libc++_shared.so"
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(archive.read(member))
td = DEPS / "tdlib"
if not td.exists():
    subprocess.run(
        [
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/TGX-Android/tdlib.git",
            str(td),
        ],
        check=True,
    )
subprocess.run(
    [
        "git",
        "-C",
        str(td),
        "fetch",
        "--depth",
        "1",
        "origin",
        metadata["tdlib_android_commit"],
    ],
    check=True,
)
subprocess.run(
    ["git", "-C", str(td), "checkout", "--detach", metadata["tdlib_android_commit"]],
    check=True,
)
print("Dependencies ready. Run python3 build.py, then python3 test.py.")
