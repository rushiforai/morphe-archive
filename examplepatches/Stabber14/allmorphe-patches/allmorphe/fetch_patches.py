#!/usr/bin/env python3
"""Aggregate all Morphe patch bundle sources from morphe-patches.software.

AllMorphe is NOT a single Morphe patch source (Morphe requires one compiled
.mpp per source). Instead it is an index of every community bundle repo listed
on morphe-patches.software, so you can install them all at once by pasting the
generated sources.txt into Morphe's "Add source" dialog (or running the
generated install-all.sh with Morphe Desktop).
"""

import json
import os
import urllib.request
from datetime import datetime, timezone

CATALOG_URL = "https://morphe-patches.software/data/catalog.json"
OFFICIAL_BUNDLE_URL = "https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches-bundle.json"


def fetch_catalog():
    req = urllib.request.Request(CATALOG_URL, headers={"User-Agent": "Mozilla/5.0"})
    with urllib.request.urlopen(req, timeout=60) as resp:
        return json.load(resp)


def normalize_repo_url(repo, source):
    if source == "gitlab":
        return f"gitlab.com/{repo}"
    return f"github.com/{repo}"


def main():
    print("📡 Fetching morphe-patches.software catalog...", flush=True)
    catalog = fetch_catalog()
    bundles = catalog.get("bundles", [])
    print(f"   Found {len(bundles)} bundles", flush=True)

    # Deduplicate by repo
    seen = set()
    repos = []
    bundle_meta = []
    for b in bundles:
        repo = b.get("repo", "")
        if not repo or repo in seen:
            continue
        seen.add(repo)
        source = b.get("source", "github")
        url = normalize_repo_url(repo, source)
        repos.append(url)
        bundle_meta.append({
            "repo": repo,
            "source": source,
            "url": url,
            "name": b.get("name"),
            "author": b.get("author"),
            "patchCount": b.get("patchCount", 0),
            "targetApps": b.get("targetApps", []),
            "stars": b.get("stars", 0),
            "deepLink": b.get("deepLink"),
        })

    repos.sort()

    # Repo root is parent of this script's directory (allmorphe/)
    script_dir = os.path.dirname(os.path.abspath(__file__))
    repo_root = os.path.dirname(script_dir)

    # Write sources.txt
    sources_path = os.path.join(repo_root, "sources.txt")
    with open(sources_path, "w") as f:
        f.write("# AllMorphe: paste these lines into Morphe -> Sources -> + (Add source)\n")
        f.write("# Morphe accepts multiple URLs at once (space or newline separated).\n")
        f.write("# Auto-generated from morphe-patches.software catalog.\n")
        f.write("\n".join(repos) + "\n")
    print(f"📝 Wrote {len(repos)} sources -> {sources_path}")

    # Write bundles.json
    bundles_path = os.path.join(repo_root, "bundles.json")
    payload = {
        "name": "AllMorphe Bundle Index",
        "lastUpdated": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "source": "morphe-patches.software",
        "totalBundles": len(repos),
        "bundles": bundle_meta,
    }
    with open(bundles_path, "w") as f:
        json.dump(payload, f, indent=2)
    print(f"📝 Wrote bundle metadata -> {bundles_path}")

    # Write install-all.sh for Morphe Desktop CLI
    install_path = os.path.join(repo_root, "install-all.sh")
    flags = " ".join(f'-p="{r}"' for r in repos)
    with open(install_path, "w") as f:
        f.write("#!/bin/bash\n")
        f.write("# AllMorphe: patch an APK with ALL community bundles at once.\n")
        f.write("# Usage: ./install-all.sh <app.apk> [output.apk]\n")
        f.write("# Requires Morphe Desktop (morphe-desktop-*-all.jar) on PATH as 'morphe', or set MORPHE_JAR.\n")
        f.write('set -e\n')
        f.write('APK="${1:?usage: $0 <app.apk> [output.apk]}"\n')
        f.write('OUT="${2:-patched.apk}"\n')
        f.write('MORPHE="${MORPHE_JAR:-morphe}"\n')
        f.write(f'exec "$MORPHE" patch {flags} -o="$OUT" "$APK"\n')
    os.chmod(install_path, 0o755)
    print(f"📝 Wrote Morphe Desktop installer -> {install_path}")

    # Write Morphe Manager settings export (bulk-import file for Android).
    # Import via Morphe -> Settings -> System -> Morphe Settings -> Import -> Replace existing.
    import time as _time
    now_ms = int(_time.time() * 1000)
    custom_bundles = []
    for i, m in enumerate(bundle_meta):
        repo = m["repo"]
        source = m.get("source", "github")
        if source == "gitlab":
            src_url = f"https://gitlab.com/{repo}/-/raw/main/patches-bundle.json"
        else:
            src_url = f"https://raw.githubusercontent.com/{repo}/main/patches-bundle.json"
        custom_bundles.append({
            "name": m.get("name") or repo,
            "source": src_url,
            "autoUpdate": True,
            "enabled": True,
            "sortOrder": i + 1,
            "createdAt": now_ms,
            "updatedAt": now_ms,
        })
    settings_export = {"settings": {"customBundles": custom_bundles}}
    settings_path = os.path.join(repo_root, "allmorphe_settings.json")
    with open(settings_path, "w") as f:
        json.dump(settings_export, f, indent=2)
    print(f"📝 Wrote Morphe Manager settings export ({len(custom_bundles)} bundles) -> {settings_path}")

    # Also keep a copy inside allmorphe/ for backwards compat
    for name in ("sources.txt", "bundles.json", "allmorphe_settings.json"):
        src = os.path.join(repo_root, name)
        dst = os.path.join(script_dir, name)
        if os.path.exists(src):
            with open(src) as a, open(dst, "w") as b:
                b.write(a.read())
    # Mirror official Morphe patches-bundle.json at repo root so that
    # 'github.com/Stabber14/allmorphe-patches' works as a Morphe source
    # without download errors (Morphe requires a valid patches-bundle.json + .mpp).
    try:
        import base64
        req = urllib.request.Request(
            OFFICIAL_BUNDLE_URL,
            headers={"Accept": "application/vnd.github.v3+json", "User-Agent": "Mozilla/5.0"},
        )
        with urllib.request.urlopen(req, timeout=30) as resp:
            official = json.load(resp)
        mirror_path = os.path.join(repo_root, "patches-bundle.json")
        with open(mirror_path, "w") as f:
            json.dump(official, f, indent=2)
        print(f"📝 Mirrored official patches-bundle.json -> {mirror_path}")
    except Exception as e:
        print(f"⚠️ Could not mirror official bundle: {e}")

    print("✅ AllMorphe index update complete.")


if __name__ == "__main__":
    main()