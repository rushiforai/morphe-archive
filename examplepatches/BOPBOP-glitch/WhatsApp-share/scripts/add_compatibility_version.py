#!/usr/bin/env python3
import argparse
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
MATRIX_PATH = ROOT / "compatibility/matrix.json"
CONSTANTS_PATH = ROOT / "patches/src/main/kotlin/app/whatsappmorphe/patches/shared/Constants.kt"

parser = argparse.ArgumentParser(
    description="Register a WhatsApp version for compatibility probing without changing patch behavior."
)
parser.add_argument("version", help="WhatsApp version in four-part form, e.g. 2.26.28.3")
args = parser.parse_args()

version = args.version.strip()
if not re.fullmatch(r"\d+\.\d+\.\d+\.\d+", version):
    raise SystemExit("ERROR: version must use four numeric components, e.g. 2.26.28.3")

matrix = json.loads(MATRIX_PATH.read_text(encoding="utf-8"))
entries = matrix.get("versions") or []
existing = {item["version"] for item in entries}

if version not in existing:
    entries.append({
        "version": version,
        "apkFileType": "APK",
        "declaredExperimental": True,
        "status": "untested",
        "stages": {
            "bundleBuild": "pending",
            "dexPresent": "pending",
            "patchMetadata": "pending",
            "patchTimeAgainstWhatsAppApk": "pending",
            "install": "pending",
            "launch": "pending",
            "loginSession": "pending",
            "sendReceive": "pending",
            "restart": "pending",
        },
        "evidence": {},
    })

def version_key(value):
    return tuple(int(part) for part in value.split("."))

entries.sort(key=lambda item: version_key(item["version"]))
matrix["versions"] = entries
matrix["candidateVersion"] = version
MATRIX_PATH.write_text(json.dumps(matrix, indent=2) + "\n", encoding="utf-8")

record_path = ROOT / f"compatibility/{version}.json"
if not record_path.exists():
    record = {
        "schema": 1,
        "packageName": "com.whatsapp",
        "version": version,
        "status": "untested",
        "scope": "compatibility-only",
        "patchBehaviorChanged": False,
        "declaredExperimental": True,
        "patchCount": 8,
        "tests": {
            "bundleBuild": False,
            "dexPresent": False,
            "patchMetadata": False,
            "patchTime": False,
            "launch": False,
            "loginSession": False,
            "sendReceive": False,
            "restart": False,
        },
        "evidence": {},
    }
    record_path.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")

constants = CONSTANTS_PATH.read_text(encoding="utf-8")
target_block = """        targets = listOf(
%s
        )""" % ",\n".join(
    """            AppTarget(
                version = "%s",
                versionCodes = null,
                isExperimental = true
            )""" % item["version"]
    for item in entries
)

pattern = re.compile(
    r"        targets = listOf\(\n.*?\n        \)(?=\n    \))",
    re.DOTALL,
)
updated, count = pattern.subn(target_block, constants, count=1)
if count != 1:
    raise SystemExit("ERROR: unable to locate the WhatsApp targets list in Constants.kt")
CONSTANTS_PATH.write_text(updated, encoding="utf-8")

print(f"Registered compatibility candidate {version}.")
print("No WhatsApp patch source file was changed.")
print(f"Created/updated: compatibility/{version}.json, compatibility/matrix.json, Constants.kt")
