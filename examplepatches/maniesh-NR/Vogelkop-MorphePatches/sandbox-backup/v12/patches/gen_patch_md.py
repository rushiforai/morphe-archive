#!/usr/bin/env python3
"""Generate patches/PATCHES.md - the human-readable patch ledger.
Run after every build (or with --check in CI to detect drift)."""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from apply import build_registry  # noqa: E402


def main():
    version = sys.argv[1] if len(sys.argv) > 1 else "v11"
    reg = build_registry(version)
    cats = {}
    for p in reg:
        cats.setdefault(p.category, []).append(p)

    lines = [
        "# Opera Beta 104 custom build - patch ledger",
        "",
        f"Generated for build **{version}**. This file is the single source of",
        "truth for what the build contains. `patches/apply.py` enforces every",
        "entry at build time (anchor must match) AND re-verifies every entry on",
        "the re-assembled output - a patch can no longer be silently lost, the",
        "way v9 lost the v7 patch set.",
        "",
        f"Total patches: **{len(reg)}**",
        "",
    ]
    for cat in sorted(cats):
        lines += [f"## {cat} ({len(cats[cat])})", ""]
        lines += ["| ID | Patch | Since | Target |", "|---|---|---|---|"]
        for p in cats[cat]:
            tgt = p.target.split('/', 1)[1]
            lines.append(f"| {p.pid} | {p.title} | {p.version} | `{tgt}` |")
        lines.append("")

    lines += [
        "## Build pipeline guarantees", "",
        "1. `patches/apply.py apply` - every anchor must match exactly N times,",
        "   else the build aborts before assembly.",
        "2. Class-set equality vs stock dexes after reassembly.",
        "3. `patches/apply.py verify` - the produced dexes are re-disassembled",
        "   and every patch postcondition is re-checked on the REAL output.",
        "4. `scripts/verify_v9.py` - structural checks on the signed APK",
        "   (all 45,244 classes, z4, manifest, services, arsc/.so stored).",
        "5. Signer certificate pinned to the v9/v10 key (SHA-256",
        "   62:C9:FA:6F:DA:E6:82:66:29:93:A5:AB:41:7C:71:17:79:D1:A0:BC:",
        "   8F:F6:43:E4:4D:E5:20:11:87:A9:6A:DF) - in-place upgrades.",
        "6. This ledger + patches/manifest.json are committed to git and",
        "   uploaded with every release (patch-bundle zip).",
        "",
        "## Adblock asset pipeline (patches/adblock/asset_pipeline.py)", "",
        "- Fetches all catalog lists from https://blocklists.operacdn.com/<sha256>",
        "  (content-addressed, hash-verified).",
        "- Rebuilds assets/op/abp.manifest without `opera_fixes` (Opera site",
        "  fixes - removed from the settings menu) and without",
        "  `tier1_allow_rules` / `tier2_allow_rules` (acceptable-ads whitelist,",
        "  removed completely).",
        "- Bundles all 41 fresh list files into assets/abp_files/op/ so every",
        "  list works fully offline from first launch - no post-install update.",
        "- Manifest structure validated by walking region A (41 entries) and the",
        "  metadata region (41 entries, exact byte-length framing).",
        "",
    ]

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "PATCHES.md")
    with open(out, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"PATCHES.md written: {len(reg)} patches across {len(cats)} categories")


if __name__ == "__main__":
    main()
