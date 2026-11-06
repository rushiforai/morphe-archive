#!/usr/bin/env python3
import json
import pathlib

ROOT = pathlib.Path(__file__).resolve().parents[1]
matrix = json.loads((ROOT / "compatibility/matrix.json").read_text(encoding="utf-8"))
candidate = matrix["candidateVersion"]
record = json.loads((ROOT / f"compatibility/{candidate}.json").read_text(encoding="utf-8"))

order = [
    "bundleBuild",
    "dexPresent",
    "patchMetadata",
    "patchTime",
    "launch",
    "loginSession",
    "sendReceive",
    "restart",
]
passed = [k for k in order if record["tests"].get(k) is True]
pending = [k for k in order if record["tests"].get(k) is not True]

gradle_text = (ROOT / "gradle.properties").read_text(encoding="utf-8")
patch_version = next(
    line.split("=", 1)[1].strip()
    for line in gradle_text.splitlines()
    if line.strip().startswith("version =")
)

report = {
    "patchVersion": patch_version,
    "packageName": record["packageName"],
    "version": candidate,
    "status": record["status"],
    "scope": record["scope"],
    "patchBehaviorChanged": record["patchBehaviorChanged"],
    "passed": passed,
    "pending": pending,
    "readyForPatchValidation": all(record["tests"].get(k) is True for k in ("bundleBuild","dexPresent","patchMetadata")),
    "readyForStable": all(record["tests"].get(k) is True for k in order),
}

out = ROOT / "build/compatibility-report.json"
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
print(out.read_text())
