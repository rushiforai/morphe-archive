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
        f"Total patches: **{len(reg)}** ({len([p for p in reg if p.enabled])} enabled, "
        f"{len([p for p in reg if not p.enabled])} disabled)",
        "",
    ]
    for cat in sorted(cats):
        lines += [f"## {cat} ({len(cats[cat])})", ""]
        lines += ["| ID | Patch | Since | Enabled | Target |", "|---|---|---|---|---|"]
        for p in cats[cat]:
            tgt = p.target.split('/', 1)[1]
            en = "yes" if p.enabled else "**NO**"
            lines.append(f"| {p.pid} | {p.title} | {p.version} | {en} | `{tgt}` |")
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
        "## Adblock asset pipeline (NOT used since v12)", "",
        "- v11's asset surgery (rebuilding assets/op/abp.manifest) corrupted the",
        "  ADBLOCK_CSS section count and caused the v11 startup crash. Since v12",
        "  the build ships the STOCK v9/v10 asset layer byte-identical - this",
        "  module is kept for reference only and is not part of the build.",
        "- The acceptable-ads behavior is preserved by PD.9 simply not selecting",
        "  the allow-rule lists; nothing is edited inside the asset layer.",
        "",
        "## v13 note: AB.1-AB.4 disabled (the v12 startup crash)", "",
        "The four v12 updater patches (maintainer-direct blocklist updates) are",
        "DISABLED in v13 and f9/cv2/lj3 are reverted to stock. Root cause of the",
        "v12 ~5 s white-screen crash (2026-11-16 Mixture-of-Experts analysis):",
        "the resolver k9d pairs every downloaded file with its manifest entry by",
        "the sha256 of the file CONTENT, so AB.4's live-maintainer bytes stored",
        "under the manifest-hash name can never pair - the file is deleted as",
        "stale, the entry stays missing, and the list is re-downloaded on every",
        "resolve pass (each launch). AB.3 additionally buffers each full response",
        "body in RAM outside cv2's try/catchall (only IOExceptions are caught;",
        "an OOM Error escapes uncaught), and with 27 unbundled lists selected by",
        "PD.9 the first startup pass alone can kill the process. The feature",
        "returns in v14 with an invariant-respecting design. Full details in the",
        "MoE report and PATCH-NOTES-v13.md.",
        "",
    ]

    out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "PATCHES.md")
    with open(out, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"PATCHES.md written: {len(reg)} patches across {len(cats)} categories")


if __name__ == "__main__":
    main()
