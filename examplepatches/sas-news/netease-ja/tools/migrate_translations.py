#!/usr/bin/env python3
"""Migrate translations to a new app version.

Usage:
    python3 tools/migrate_translations.py <new.apk> <old_translations.json> <old_defaults.json> \\
        -o <new_translations.json> --report <report.json> --defaults-out <new_defaults.json>

Strategy (resource names are obfuscated and may shift between builds):
  1. Carry over entries whose resource NAME still exists AND whose default
     Chinese text is unchanged.
  2. For removed names, re-attach the translation to a new name holding the
     IDENTICAL default text (flagged in the report for review).
  3. Changed defaults and brand-new names go to the report; only those need
     translation work, so updates stay cheap.
"""
import argparse
import json
import sys
import xml.etree.ElementTree as ET

from loguru import logger

logger.remove()


def load_strings(apk_path: str, pkg: str, locale: str) -> dict:
    from androguard.core.apk import APK

    arsc = APK(apk_path).get_android_resources()
    root = ET.fromstring(arsc.get_string_resources(pkg, locale))
    return {s.get("name"): "".join(s.itertext()) for s in root.findall("string")}


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("apk")
    ap.add_argument("old_translations")
    ap.add_argument("old_defaults")
    ap.add_argument("-o", "--output", required=True)
    ap.add_argument("--report", required=True)
    ap.add_argument("--defaults-out", required=True)
    ap.add_argument("--package", default="com.netease.cloudmusic")
    args = ap.parse_args()

    old = json.load(open(args.old_translations, encoding="utf-8"))
    old_zh = json.load(open(args.old_defaults, encoding="utf-8"))
    new_zh = load_strings(args.apk, args.package, "\x00\x00")
    json.dump(new_zh, open(args.defaults_out, "w", encoding="utf-8"),
              ensure_ascii=False, indent=2)

    by_value: dict[str, list[str]] = {}
    for name, text in new_zh.items():
        by_value.setdefault(text, []).append(name)

    carried, reattached, changed, unmapped = {}, {}, {}, {}
    for name, ja in old.items():
        if name in new_zh:
            if new_zh[name] == old_zh.get(name):
                carried[name] = ja
            else:
                changed[name] = {"old": old_zh.get(name),
                                 "new": new_zh[name], "ja": ja}
        else:
            old_text = old_zh.get(name)
            cands = [n for n in by_value.get(old_text, []) if n not in old]
            if old_text and cands:
                reattached[cands[0]] = ja
            else:
                unmapped[name] = {"zh": old_text, "ja": ja}

    new_names = sorted(set(new_zh) - set(old))
    json.dump({**carried, **reattached},
              open(args.output, "w", encoding="utf-8"),
              ensure_ascii=False, indent=2)
    json.dump({
        "carried_over": len(carried),
        "reattached_by_value_for_review": reattached,
        "changed_defaults_for_review": changed,
        "removed_names_for_review": unmapped,
        "new_names": new_names,
    }, open(args.report, "w", encoding="utf-8"), ensure_ascii=False, indent=2)
    print(f"carried={len(carried)} reattached={len(reattached)} "
          f"changed={len(changed)} unmapped={len(unmapped)} new={len(new_names)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
