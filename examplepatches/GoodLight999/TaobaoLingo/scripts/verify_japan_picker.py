#!/usr/bin/env python3
"""Verify the JP English picker asset delta and Morphe patch report.

The full DEX instruction diff and APK signature verification are performed by
tests/VerifyJapanPicker.java (requires the Morphe Desktop all-in-one JAR).
No proprietary APK files are stored in the repository.
"""
import argparse
import hashlib
import json
from pathlib import Path
import zipfile

ORIGINAL_SHA256 = "3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd"
PATH = "assets/boarding/data.json"
PATCHES = {
    "TaobaoLingo: Show English in Japan locale picker (fallback)",
    "TaobaoLingo: Enable English for Japan picker (experimental)",
}

def main():
    p = argparse.ArgumentParser()
    p.add_argument("original", type=Path)
    p.add_argument("candidate", type=Path)
    p.add_argument("--report", type=Path)
    args = p.parse_args()
    sha = hashlib.sha256(args.original.read_bytes()).hexdigest()
    if sha != ORIGINAL_SHA256:
        p.error(f"Unrecognized source APK; SHA-256={sha}")
    with zipfile.ZipFile(args.original) as before, zipfile.ZipFile(args.candidate) as after:
        assert before.testzip() is None and after.testzip() is None
        assert set(before.namelist()) - set(after.namelist()) <= {
            n for n in before.namelist() if n.startswith("META-INF/")
        }, "Non-signature APK entries missing"
        raw = before.read(PATH).decode("utf-8")
        modified = after.read(PATH).decode("utf-8")
        old = json.loads(raw)
        new = json.loads(modified)
        countries = old["countryInfo"]
        jp = [x for x in countries if x["site"] == "JP"]
        assert len(jp) == 1, "Expected exactly one JP region"
        assert len([x for x in new["countryInfo"] if x["site"] == "JP"]) == 1
        old_jp = jp[0]
        new_jp = next(x for x in new["countryInfo"] if x["site"] == "JP")
        expected = dict(old_jp)
        expected["langs"] = list(old_jp["langs"]) + [
            {"defaultLang": "false", "lang": "en_US", "langName": "English"}
        ]
        assert new_jp == expected, "JP region differs from expected"
        old_without_jp = [x for x in countries if x["site"] != "JP"]
        new_without_jp = [x for x in new["countryInfo"] if x["site"] != "JP"]
        assert old_without_jp == new_without_jp, "Other regions were modified"
        assert len(countries) == len(new["countryInfo"]) == 23
        prior = '"langs":[{"defaultLang":"true","lang":"zh_CN","langName":"中文"}],"site":"JP"'
        expanded = '"langs":[{"defaultLang":"true","lang":"zh_CN","langName":"中文"},{"defaultLang":"false","lang":"en_US","langName":"English"}],"site":"JP"'
        assert raw.count(prior) == 1
        assert modified == raw.replace(prior, expanded), "Unexpected JSON bytes changed"
        changed = []
        for name in before.namelist():
            if name.startswith("META-INF/") or name.startswith("classes") and name.endswith(".dex"):
                continue
            if before.getinfo(name).CRC != after.getinfo(name).CRC or before.getinfo(name).file_size != after.getinfo(name).file_size:
                changed.append(name)
        assert changed == [PATH], f"Unexpected non-DEX payload changes: {changed}"
    if args.report:
        report = json.loads(args.report.read_text(encoding="utf-8"))
        actual = {p["name"] for p in report["appliedPatches"]}
        assert actual == PATCHES, f"Expected two patches, got {actual}"
        assert not report["failedPatches"]
        assert all(item["success"] for item in report["patchingSteps"])
    print("PASS: JP gained nondefault en_US, other 22 regions unchanged")
    print("PASS: only JP JSON changed among non-DEX, non-signature payloads")
    if args.report:
        print("PASS: both Morphe patches explicitly enabled and applied")

if __name__ == "__main__":
    main()
