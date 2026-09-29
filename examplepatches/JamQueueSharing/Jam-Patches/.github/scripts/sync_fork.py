#!/usr/bin/env python3
"""Sync tracked implementation bytes from an exact fork commit; retain source metadata."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import subprocess
import tarfile

ROOT = Path(__file__).resolve().parents[2]
PATHS = ["extensions", "patches/src", "patches/stub", "gradle/libs.versions.toml"]


def git(repo, *args):
    return subprocess.check_output(["git", "-C", str(repo), *args])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("repository", type=Path)
    parser.add_argument("commit", help="Full 40-character tested fork SHA")
    args = parser.parse_args()
    sha = git(args.repository, "rev-parse", args.commit + "^{commit}").decode().strip()
    if sha != args.commit:
        parser.error("Use the full immutable commit SHA")
    archive = git(args.repository, "archive", sha, *PATHS)
    files = {}
    with tarfile.open(fileobj=io.BytesIO(archive)) as tar:
        for entry in tar:
            if not entry.isfile():
                continue
            target = (ROOT / entry.name).resolve()
            if not target.is_relative_to(ROOT):
                raise ValueError("Archive path escapes source root")
            files[entry.name] = tar.extractfile(entry).read()
    tracked = git(ROOT, "ls-files", "-z", "--", *PATHS).decode().split("\0")
    for name in filter(None, tracked):
        target = (ROOT / name).resolve()
        if not target.is_relative_to(ROOT):
            raise ValueError("Tracked path escapes source root")
        if name not in files and target.is_file():
            target.unlink()
    for name, content in files.items():
        target = ROOT / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(content)

    # Keep custom-source identity while importing the tested build/test tasks.
    source = git(args.repository, "show", sha + ":patches/build.gradle.kts").decode()
    current = (ROOT / "patches/build.gradle.kts").read_text()
    start, end = current.index("patches {"), current.index("// Separate configuration")
    source = source[:source.index("patches {")] + current[start:end] + source[source.index("// Separate configuration"):]
    source = source.replace('group = "app.morphe"', 'group = "app.agentkosticka"')
    (ROOT / "patches/build.gradle.kts").write_text(source, encoding="utf-8", newline="\n")
    manifest = {
        "repository": "https://github.com/AgentKosticka/morphe-patches",
        "commit": sha,
        "paths": PATHS,
        "files": {name: hashlib.sha256(data).hexdigest() for name, data in sorted(files.items())},
        "buildOverlay": "patches/build.gradle.kts retains Jam-Patches source identity; all other tasks come from fork",
        "dependencyOverlays": {"morphe-patches-gradle-plugin": "SettingsPlugin.kt defaults absent GitHub credentials to empty strings for public composite builds"},
        "dependencies": {
            "morphe-patcher": "5eacde46237f2fe657eb9bfbe90d2528d248a336",
            "morphe-patches-library": "e930e2eea34437fbdc4836a4daa8213f0ca8abcf",
            "morphe-patches-gradle-plugin": "9e6220d8ac3c0092c233af4e216f3bab6bb22e0d"
        }
    }
    (ROOT / "source-revision.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(f"Synced {len(files)} files from {sha}")


if __name__ == "__main__":
    main()
