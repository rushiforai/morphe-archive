#!/usr/bin/env python3
"""Fail on a fingerprint string that isn't a whole string of the app it targets.

Morphe Patcher 2.0 compares the raw strings of `strings = listOf(...)` with equals instead of contains
whenever a bundle built for 2.0 is in the same run (Morphe Manager 2.x with Morphe Patches selected), so a
fingerprint written against a prefix ("PlayerOverlayOptions(isInfoOptionVisible=" for a longer label)
matches under Morphe Desktop and fails on those phones. This reads each app's `strings = listOf(...)`
blocks under patches/src and checks every literal (or literals joined with +) against the dex strings of
the stored APK of each version in the app's shared/Constants.kt. Entries with templates are left out.
Apps whose target version isn't stored in apks/ are skipped, as in CI.

    python3 tests/verify_fingerprint_strings.py [app ...]
"""
from __future__ import annotations

import io
import re
import subprocess
import sys
import zipfile
from pathlib import Path

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "bin/lib"))
import apk  # noqa: E402

PATCHES = ROOT / "patches/src/main/kotlin/io/github/jordanwoodson/patches"
LITERAL = re.compile(r'"((?:[^"\\]|\\.)*)"')
JOINED = re.compile(r'"(?:[^"\\]|\\.)*"(?:\s*\+\s*"(?:[^"\\]|\\.)*")*')
TEMPLATE = re.compile(r"(?<!\\)\$[{A-Za-z_]")
ESCAPES = {"t": "\t", "b": "\b", "n": "\n", "r": "\r", "'": "'", '"': '"', "\\": "\\", "$": "$"}


def unescape(raw: str) -> str:
    return re.sub(r"\\(u[0-9a-fA-F]{4}|.)",
                  lambda m: chr(int(m.group(1)[1:], 16)) if len(m.group(1)) == 5 else ESCAPES[m.group(1)], raw)


def elements(text: str, start: int) -> list[tuple[int, str]]:
    """The top-level arguments of the call whose parenthesis opens just before [start], as (offset, text)."""
    found, depth, begin, i = [], 0, start, start
    while i < len(text):
        c = text[i]
        if text.startswith("//", i):
            i = text.find("\n", i)
            continue
        if c == '"':
            i += 1
            while text[i] != '"':
                i += 2 if text[i] == "\\" else 1
        elif c in "([{":
            depth += 1
        elif c in ")]}" and depth:
            depth -= 1
        elif c == ")" or (c == "," and not depth):
            found.append((begin, text[begin:i]))
            if c == ")":
                return found
            begin = i + 1
        i += 1
    return found


def fingerprint_strings(path: Path) -> list[tuple[int, str]]:
    """(line, value) for each literal entry of the file's `strings = listOf(...)` blocks."""
    text, found = path.read_text(encoding="utf-8"), []
    for block in re.finditer(r"\bstrings\s*=\s*listOf\(", text):
        for offset, element in elements(text, block.end()):
            element = element.strip()
            if not JOINED.fullmatch(element):
                continue
            parts = LITERAL.findall(element)
            if any(TEMPLATE.search(part) for part in parts):
                continue
            found.append((text.count("\n", 0, offset) + 1, unescape("".join(parts))))
    return found


def targets(app: str) -> list[str]:
    return re.findall(r'AppTarget\(version = "([^"]+)"', (PATCHES / app / "shared/Constants.kt").read_text(encoding="utf-8"))


def apks_dir() -> Path:
    """apks/ of this checkout, or of the main checkout from a git worktree (as bin/lib/common.sh does)."""
    if (ROOT / "apks").is_dir():
        return ROOT / "apks"
    common = subprocess.run(["git", "-C", str(ROOT), "rev-parse", "--path-format=absolute", "--git-common-dir"],
                            capture_output=True, text=True).stdout.strip()
    return Path(common).parent / "apks" if common else ROOT / "apks"


def stored(app: str, version: str) -> Path | None:
    files = sorted(p for p in (apks_dir() / app / version).glob("*") if p.suffix in (".apk", ".apkm", ".apks", ".xapk"))
    return files[0] if files else None


def dex_strings(path: Path) -> set[str]:
    strings = set()
    for _, data in apk.all_apks(str(path)):
        with zipfile.ZipFile(io.BytesIO(data)) as zf:
            for entry in zf.namelist():
                if re.fullmatch(r"classes\d*\.dex", entry):
                    strings.update(s.decode("utf-8", "replace") for s in apk.dex_strings(zf.read(entry)))
    return strings


def main() -> int:
    apps = sys.argv[1:] or sorted(p.parent.parent.name for p in PATCHES.glob("*/shared/Constants.kt"))
    failing = checked = 0
    for app in apps:
        entries = [(path.relative_to(ROOT).as_posix(), line, value)
                   for path in sorted((PATCHES / app).rglob("*.kt")) for line, value in fingerprint_strings(path)]
        for version in targets(app):
            file = stored(app, version)
            if file is None:
                print(f"skipped {app} {version}: not stored in apks/")
                continue
            pool = dex_strings(file)
            checked += 1
            for path, line, value in entries:
                if value in pool:
                    continue
                failing += 1
                within = sum(1 for s in pool if value in s)
                how = f"only part of {within} string{'s' if within != 1 else ''}" if within else "in no string"
                print(f"  {app} {version}: {path}:{line}: {value!r} is {how}")
    if failing:
        print(f"FAIL: {failing} fingerprint strings aren't whole strings of the app (Morphe Patcher 2.0 "
              "compares them exactly): give the whole string")
        return 1
    print(f"PASS: every fingerprint string is a whole string of its app ({checked} stored versions checked)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
