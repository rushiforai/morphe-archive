#!/usr/bin/env python3
"""v11 patch entry point.

Applies every registered patch to the disassembled trees, then (in
--verify mode) re-checks a freshly disassembled output tree.

Usage:
  python3 patches/apply.py apply  <c1-root> <c3-root> <version>
  python3 patches/apply.py verify <c1-root> <c3-root> <version>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from common import patch_file, verify_tree, write_manifest, finish, RESULTS, FAILURES  # noqa: E402

import core.core_patches           # noqa: E402
import privacy.defaults            # noqa: E402
import vpn.vpn_patches             # noqa: E402
import ntp.ntp_patches             # noqa: E402
import appearance.appearance_patches  # noqa: E402
import adblock.updater_redirect    # noqa: E402


def build_registry(version):
    reg = []
    core.core_patches.register(reg, version)
    privacy.defaults.register(reg, version)
    vpn.vpn_patches.register(reg, version)
    ntp.ntp_patches.register(reg, version)
    appearance.appearance_patches.register(reg, version)
    adblock.updater_redirect.register(reg, version)
    # future modules register here:
    # strip.strip_patches.register(reg, version)  (optional, flag-gated)
    return reg


def main():
    mode = sys.argv[1]
    c1_root, c3_root = sys.argv[2], sys.argv[3]
    version = sys.argv[4] if len(sys.argv) > 4 else "v11"

    reg = build_registry(version)
    trees = {"c1": c1_root, "c3": c3_root}

    if mode == "apply":
        for p in reg:
            if not p.enabled:
                print(f"SKIP {p.pid:8s} {p.title} (disabled)")
                continue
            tree, rel = p.target.split("/", 1)
            p.target = rel
            patch_file(trees[tree], p)
        write_manifest(
            os.path.join(os.path.dirname(os.path.abspath(__file__)),
                         "manifest.json"),
            reg, version)
        finish()
    elif mode == "verify":
        bad = 0
        for p in reg:
            if not p.enabled:
                continue
            tree, rel = p.target.split("/", 1)
            p.target = rel
            ok = verify_tree(trees[tree], p)
            if ok:
                print(f"VERIFY OK   {p.pid:8s} {p.title}")
            else:
                bad += 1
        if FAILURES or bad:
            print(f"\n{bad} patch(es) FAILED verification")
            for f_ in FAILURES:
                print("  -", f_)
            sys.exit(1)
        print(f"\nall {len([p for p in reg if p.enabled])} patches verified in output")
    else:
        print("modes: apply | verify", file=sys.stderr)
        sys.exit(2)


if __name__ == "__main__":
    main()
