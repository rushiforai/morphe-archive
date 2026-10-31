#!/usr/bin/env python3
"""Prevent a stable release from silently dropping previously supported apps.

Runs after the bundle's patches-list.json has been regenerated from compiled code.
To intentionally retire/rename a stable patch, update EXPECTED_STABLE_PATCHES in
the same reviewed commit. The dev channel is not constrained by this inventory.
"""
import json
import os
import sys
from pathlib import Path

if os.environ.get("GITHUB_REF_NAME") != "main":
    print("Stable inventory check skipped (not main).")
    sys.exit(0)

EXPECTED_STABLE_PATCHES = {
    "DNS Changer - Force Pro test D2": "com.appplanex.dnschanger",
    "Flowx - Test stato Gold locale": "com.enzuredigital.weatherbomb",
    "Fonometro - Remove ads": "com.ktwapps.soundmeter",
    "Leghe FC - Avvio e nome 3 campo": "it.quadronica.leghe",
    "Leghe FC - Sblocca formazione suggerita e comparatore": "it.quadronica.leghe",
    "Leghe FC - Sblocca percentuali": "it.quadronica.leghe",
    "Outdooractive - Test getter abbonamento": "com.outdooractive.Outdooractive",
    "Twilight - Test stato trial": "com.urbandroid.lux",
    "Prezzi Benzina - Remove ads A1": "org.vernazza.androidfuel",
    "Prezzi Benzina - microG token routing F13": "org.vernazza.androidfuel",
}

path = Path(sys.argv[1] if len(sys.argv) > 1 else "patches-list.json")
data = json.loads(path.read_text(encoding="utf-8"))
actual = {}
for patch in data["patches"]:
    name = patch.get("name")
    for compat in patch.get("compatiblePackages") or []:
        actual.setdefault(name, set()).add(compat.get("packageName"))

missing = [
    f"{name} ({package})"
    for name, package in EXPECTED_STABLE_PATCHES.items()
    if package not in actual.get(name, set())
]
if any("spotify" in (pkg or "").lower() for pkgs in actual.values() for pkg in pkgs):
    missing.append("Spotify must remain absent from the stable bundle")

if missing:
    print("ERROR: stable app inventory regression detected:", file=sys.stderr)
    for item in missing:
        print(" - " + item, file=sys.stderr)
    sys.exit(1)

packages = {pkg for names in actual.values() for pkg in names}
print(f"Stable inventory OK: {len(EXPECTED_STABLE_PATCHES)} required patches across {len(packages)} apps.")
