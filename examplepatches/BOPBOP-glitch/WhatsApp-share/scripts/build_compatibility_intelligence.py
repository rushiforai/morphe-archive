#!/usr/bin/env python3
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
PATCH_DIR = ROOT / "patches/src/main/kotlin/app/whatsappmorphe/patches/whatsapp"
OUT = ROOT / "compatibility/fingerprint-inventory.json"
SUMMARY = ROOT / "compatibility/compatibility-intelligence.json"

def score_anchor(value: str) -> int:
    score = 0
    if "/" in value or "_" in value:
        score += 2
    if len(value) >= 24:
        score += 2
    elif len(value) >= 12:
        score += 1
    generic = {"receipt", "cyanogen", "expire_timestamp"}
    if value.lower() in generic:
        score -= 2
    if "sql" in value.lower() or "manager/" in value.lower() or "presencestate" in value.lower():
        score += 2
    return score

patches = []
for path in sorted(PATCH_DIR.glob("*.kt")):
    text = path.read_text(encoding="utf-8")
    name_match = re.search(r'name\s*=\s*"([^"]+)"', text)
    name = name_match.group(1) if name_match else path.stem

    anchors = re.findall(r'string\("([^"]+)"\)', text)
    return_types = re.findall(r'returnType\s*=\s*"([^"]+)"', text)
    parameter_blocks = re.findall(r'parameters\s*=\s*([^,\n\)]+)', text)

    broad_scans = text.count("classDefForEach")
    direct_type_refs = len(re.findall(r'def\.type\s*==\s*"L[^"]+"', text))
    structural_checks = (
        text.count("parameters.size")
        + text.count("returnType ==")
        + text.count("def.interfaces.contains")
        + text.count("ReferenceInstruction")
    )

    anchor_scores = [score_anchor(x) for x in anchors]
    avg_anchor = round(sum(anchor_scores) / len(anchor_scores), 2) if anchor_scores else 0.0

    risk = "low"
    reasons = []
    if broad_scans >= 2:
        risk = "high"
        reasons.append("multiple global class scans")
    elif broad_scans == 1:
        risk = "medium"
        reasons.append("global class scan")
    if anchors and avg_anchor <= 0:
        risk = "high" if risk != "high" else risk
        reasons.append("weak/generic string anchor")
    elif anchors and avg_anchor < 2 and risk == "low":
        risk = "medium"
        reasons.append("moderately specific string anchor")
    if not anchors and direct_type_refs == 0:
        risk = "high"
        reasons.append("no stable string/type anchor detected")

    patches.append({
        "file": str(path.relative_to(ROOT)).replace("\\","/"),
        "name": name,
        "anchors": anchors,
        "returnTypes": sorted(set(return_types)),
        "parameterHints": parameter_blocks,
        "broadClassScans": broad_scans,
        "directTypeRefs": direct_type_refs,
        "structuralChecks": structural_checks,
        "anchorScoreAverage": avg_anchor,
        "compatibilityRisk": risk,
        "reasons": reasons,
    })

inventory = {
    "schema": 1,
    "purpose": "compatibility-observability-only",
    "patchBehaviorChanged": False,
    "patches": patches,
}
OUT.write_text(json.dumps(inventory, indent=2) + "\n", encoding="utf-8")

summary = {
    "schema": 1,
    "patchBehaviorChanged": False,
    "totalPatches": len(patches),
    "riskCounts": {
        level: sum(1 for p in patches if p["compatibilityRisk"] == level)
        for level in ("low","medium","high")
    },
    "principles": [
        "prefer multiple independent signals over one obfuscated symbol",
        "treat generic string anchors as fragile",
        "separate discovery/compatibility analysis from patch behavior",
        "fail closed when a target is ambiguous",
        "promote a WhatsApp version only after build, patch-time, and device evidence",
    ],
    "highestRisk": [p["name"] for p in patches if p["compatibilityRisk"] == "high"],
}
SUMMARY.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")

print(OUT)
print(SUMMARY)
