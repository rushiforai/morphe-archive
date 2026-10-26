#!/usr/bin/env python3
"""Verify live-template references against bundled My Taobao templates.

Static APK-only evidence, not a runtime template download/dispatch trace.
No proprietary app bytes are written or uploaded.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from zipfile import ZipFile

EXPECTED_SHA256 = "3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd"


def inspect(apk: Path) -> dict:
    with ZipFile(apk) as archive:
        live = json.loads(archive.read("assets/mytaobao/mtb_2025.json"))
        bundled = json.loads(archive.read(
            "assets/template/mytaobao/presetTemplateInfos.json"
        ))
        template_rows = []
        for group in live["data"]["hierarchy"]:
            for item in group:
                if item.get("containerType") != "dinamicx":
                    continue
                name = item["name"]
                bundled_version = bundled.get(name, {}).get("version")
                template_rows.append({
                    "name": name,
                    "module": item.get("moduleName"),
                    "delivery_url": item.get("url"),
                    "referenced_version": str(item["version"]),
                    "bundled_version": (
                        str(bundled_version) if bundled_version is not None
                        else None
                    ),
                    "version_mismatch": str(item["version"]) != str(bundled_version),
                })
    digest = hashlib.sha256()
    with apk.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            digest.update(chunk)
    return {
        "apk_sha256": digest.hexdigest(),
        "matches_studied_apk": digest.hexdigest() == EXPECTED_SHA256,
        "api": live.get("api"),
        "referenced_dinamicx_templates": len(template_rows),
        "version_mismatches": sum(row["version_mismatch"] for row in template_rows),
        "templates": template_rows,
        "limitation": (
            "The referenced version differs from the built-in fallback version; "
            "this does not prove which template a live Taobao session loads."
        ),
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--strict-original", action="store_true")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    output = inspect(args.apk)
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(output, ensure_ascii=False, indent=2) + "\n",
                            encoding="utf-8")
    else:
        print(json.dumps(output, ensure_ascii=False, indent=2))
    if args.strict_original and not output["matches_studied_apk"]:
        parser.error("Supplied APK is not the pinned original 10.66.30 build")


if __name__ == "__main__":
    main()
