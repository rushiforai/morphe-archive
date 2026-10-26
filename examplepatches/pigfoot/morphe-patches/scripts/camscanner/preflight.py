#!/usr/bin/env python3
"""Read-only target triage for independently merged APKs; never updates acceptance pins."""
import argparse
import base64
import hashlib
import json
from pathlib import Path
import re
import struct
import subprocess
import tempfile
import zipfile


def digest(data):
    return hashlib.sha256(data).hexdigest()


def archive(path):
    with zipfile.ZipFile(path) as z:
        bad = z.testzip()
        if bad:
            raise ValueError(f"ZIP CRC failure: {bad}")
        classes = []
        dex_files = []
        for name in z.namelist():
            if not re.fullmatch(r"classes[0-9]*\.dex", name):
                continue
            data = z.read(name)
            if data[:4] != b"dex\n" or struct.unpack_from("<I", data, 32)[0] != len(data):
                raise ValueError("Invalid DEX header")
            count = struct.unpack_from("<I", data, 96)[0]
            classes.append(count)
            dex_files.append(name)
        return {
            "sha256": digest(path.read_bytes()), "bytes": path.stat().st_size, "zip_crc_ok": True,
            "dex_files": dex_files, "class_count": sum(classes),
            "shell_indicators": sorted(n for n in z.namelist() if n.startswith("assets/ijiami.")),
            "native": {n: digest(z.read(n)) for n in z.namelist() if n.startswith("lib/") and n.endswith(".so")},
        }


def targets(repo):
    root = repo / "patches/src/main/kotlin/app/pigfoot/patches/camscanner"
    return sorted(set(re.findall(r'"(L[^"\n]+;)" to "[0-9a-f]{64}"',
        (root / "CamScannerTargets.kt").read_text())) | {
        "Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel;",
        "Lcom/intsig/tsapp/account/viewmodel/EmailLoginViewModel$fetchAndLoadApisByEmail$2;",
    })


def parse(text):
    result = {"classes": {}, "methods": {}, "missing": []}
    for line in text.splitlines():
        parts = line.split("\t")
        if parts[0] == "CLASS":
            result["classes"][parts[1]] = parts[2]
        elif parts[0] == "METHOD":
            result["methods"][parts[1] + "->" + parts[2]] = {
                "pin": parts[3], "graph": base64.b64decode(parts[4]).decode("utf-8")}
        elif parts[0] == "MISSING":
            result["missing"].append(parts[1])
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--baseline", type=Path, required=True)
    p.add_argument("--candidate", type=Path, required=True)
    p.add_argument("--desktop-jar", type=Path, required=True)
    p.add_argument("--java", default="java")
    p.add_argument("--javac", default="javac")
    p.add_argument("--output", type=Path, required=True)
    a = p.parse_args()
    here = Path(__file__).resolve().parent
    report = {"schema": 1, "analysis_only": True, "auto_acceptance": False,
        "desktop_jar_sha256": digest(a.desktop_jar.read_bytes()),
        "baseline": archive(a.baseline), "candidate": archive(a.candidate)}
    wanted = [t.replace("\\$", "$") for t in targets(here.parents[1])]
    with tempfile.TemporaryDirectory(prefix="camscanner-preflight-") as temp:
        temp = Path(temp)
        (temp / "types.txt").write_text("\n".join(wanted) + "\n")
        subprocess.run([a.javac, "-cp", str(a.desktop_jar), "-d", str(temp), str(here / "TargetReport.java")], check=True)
        for label, apk in [("baseline", a.baseline), ("candidate", a.candidate)]:
            completed = subprocess.run([a.java, "-Xmx2g", "-cp", str(a.desktop_jar) + ":" + str(temp),
                "TargetReport", str(apk), str(temp / "types.txt")], check=True, capture_output=True, text=True)
            report[label]["targets"] = parse(completed.stdout)
    old, new = report["baseline"]["targets"], report["candidate"]["targets"]
    report["class_changes"] = {t: {"old": old["classes"].get(t), "new": new["classes"].get(t)}
        for t in sorted(set(old["classes"]) | set(new["classes"])) if old["classes"].get(t) != new["classes"].get(t)}
    report["method_changes"] = {}
    for key in sorted(set(old["methods"]) | set(new["methods"])):
        before, after = old["methods"].get(key), new["methods"].get(key)
        if before != after:
            report["method_changes"][key] = {
                "classification": "added" if before is None else "removed" if after is None else
                    "metadata_only" if before["graph"] == after["graph"] else "instructions",
                "old": before, "new": after}
    old_native, new_native = report["baseline"]["native"], report["candidate"]["native"]
    report["native_changes"] = {n: {"old": old_native.get(n), "new": new_native.get(n)}
        for n in sorted(set(old_native) | set(new_native)) if old_native.get(n) != new_native.get(n)}
    a.output.parent.mkdir(parents=True, exist_ok=True)
    a.output.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n")
    missing = new["missing"]
    print(json.dumps({"analysis_only": True, "candidate_classes": report["candidate"]["class_count"],
        "missing_targets": len(missing), "changed_classes": len(report["class_changes"]),
        "changed_methods": len(report["method_changes"]), "changed_native": len(report["native_changes"])}))
    return 2 if missing else 0


if __name__ == "__main__":
    raise SystemExit(main())
