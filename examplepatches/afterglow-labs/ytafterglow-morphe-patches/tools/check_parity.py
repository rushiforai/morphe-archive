#!/usr/bin/env python3
"""Parity ratchet: every iOS registry key must have a status in tools/parity.json.

Statuses: "todo" (not ported yet), "done" (ported; give the patch/extension
file in "where"), "n/a" (iOS-only; give the reason in "why"). Fails when a
key is missing, unknown, or a done/n/a entry lacks its where/why.
Run after tools/generate_from_ios.py so ios-registry.json is current.
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
registry = json.loads((ROOT / "tools/ios-registry.json").read_text(encoding="utf-8"))
parity = json.loads((ROOT / "tools/parity.json").read_text(encoding="utf-8"))
keys = [e["key"] for e in registry["entries"]]
errors = []
for key in keys:
    entry = parity.get(key)
    if entry is None:
        errors.append(f"missing parity entry: {key}")
    elif entry.get("status") not in ("todo", "done", "n/a"):
        errors.append(f"bad status for {key}: {entry.get('status')!r}")
    elif entry["status"] == "done" and not entry.get("where"):
        errors.append(f"done without 'where': {key}")
    elif entry["status"] == "n/a" and not entry.get("why"):
        errors.append(f"n/a without 'why': {key}")
for key in parity:
    if key not in keys:
        errors.append(f"parity entry for unknown key: {key}")
counts = {}
for key in keys:
    status = parity.get(key, {}).get("status", "missing")
    counts[status] = counts.get(status, 0) + 1
print("parity:", ", ".join(f"{k}={v}" for k, v in sorted(counts.items())), f"(of {len(keys)})")
for error in errors:
    print("FAIL:", error, file=sys.stderr)
sys.exit(1 if errors else 0)
