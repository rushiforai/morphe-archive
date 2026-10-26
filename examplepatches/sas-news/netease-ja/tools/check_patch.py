#!/usr/bin/env python3
"""Pre-build integrity check for the NeteaseJA patch set.

Usage:
    python3 tools/check_patch.py <app.apk>

Checks (all offline, no PAT/build required):
  1. values-ja XML parses and its names are a subset of the APK defaults,
     with no duplicates.
  2. Every translation placeholder set matches the default text.
  3. Bytecode-patch fingerprint targets (unobfuscated Activity classes)
     still exist in the APK DEX (guards version updates).
  4. Constants.kt target version matches the APK version.

Exit code 0 = all green, 1 = problems found (details printed).
"""
import re
import sys
import xml.etree.ElementTree as ET
import zipfile
import glob

from loguru import logger

logger.remove()


def fail(msg: str, problems: list) -> None:
    problems.append(msg)
    print("FAIL:", msg)


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: check_patch.py <app.apk>")
        return 2
    apk_path = sys.argv[1]
    problems: list[str] = []

    from androguard.core.apk import APK

    a = APK(apk_path)
    pkg = a.get_package()
    print(f"APK: {pkg} {a.get_androidversion_name()} ({a.get_androidversion_code()})")

    # 1. values-ja XML vs defaults.
    import json

    xml_path = "patch/patches/src/main/resources/translations/values-ja-strings.xml"
    root = ET.parse(xml_path).getroot()
    names = [s.get("name") for s in root.findall("string")]
    if len(names) != len(set(names)):
        fail("duplicate names in values-ja XML", problems)
    arsc = a.get_android_resources()
    d0root = ET.fromstring(arsc.get_string_resources(pkg, "\x00\x00"))
    defaults = {s.get("name"): "".join(s.itertext()) for s in d0root.findall("string")}
    ja = {s.get("name"): "".join(s.itertext()) for s in root.findall("string")}
    missing = [n for n in ja if n not in defaults]
    if missing:
        fail(f"{len(missing)} translated names absent from APK defaults: {missing[:10]}", problems)

    # 2. Placeholders.
    ph = re.compile(r"%(?:\d+\$)?[sdf]|\\n")
    bad = [n for n, v in ja.items()
           if n in defaults and sorted(ph.findall(defaults[n])) != sorted(ph.findall(v))]
    if bad:
        fail(f"placeholder mismatch: {bad[:10]}", problems)
    risky = [n for n, v in ja.items() if v.endswith("%") or re.search(r"%(?![0-9]*\$?[sdfn]|%)", v)]
    if risky:
        fail(f"risky lone percent: {risky[:10]}", problems)

    # 1b. ja_all.json must equal the merge of chunk files (catches lost fixes).
    merged: dict = {}
    for path in sorted(glob.glob("analysis/ja_chunk*.json")):
        merged.update(json.load(open(path, encoding="utf-8")))
    disk = json.load(open("analysis/ja_all.json", encoding="utf-8"))
    if merged != disk:
        diff = [k for k in set(merged) | set(disk) if merged.get(k) != disk.get(k)]
        fail(f"ja_all.json out of sync with chunks: {diff[:10]}", problems)

    # 3. Fingerprint targets present in DEX.
    z = zipfile.ZipFile(apk_path)
    dex = b"".join(z.read(n) for n in z.namelist() if n.endswith(".dex"))
    targets = ["CommentActivity", "FoldCommentActivity", "ArtistIntroActivity",
               "RcmdAlbumIntroActivity", "RcmdPlaylistIntroActivity"]
    for t in targets:
        if "L" + t + ";" not in str(dex) and t.encode() not in dex:
            fail(f"activity {t} not found in DEX", problems)

    # 4. Constants.kt version matches APK.
    const = open("patch/patches/src/main/kotlin/app/neteaseja/patches/shared/Constants.kt",
                 encoding="utf-8").read()
    ver = a.get_androidversion_name()
    code = str(a.get_androidversion_code())
    if f'version = "{ver}"' not in const:
        fail(f"Constants.kt missing version {ver}", problems)
    if code not in const:
        fail(f"Constants.kt missing versionCode {code}", problems)

    print(f"strings: {len(ja)} xml-ok, placeholders-ok; "
          f"activities: {len(targets)} found; version pins ok")
    if problems:
        print(f"{len(problems)} problem(s)")
        return 1
    print("ALL CHECKS PASSED")
    return 0


if __name__ == "__main__":
    sys.exit(main())
