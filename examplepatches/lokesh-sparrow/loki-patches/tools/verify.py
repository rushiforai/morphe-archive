#!/usr/bin/env python3
"""
Patches every app it is given with one bundle and reports whether each patch applied, so a change for one app is
proven not to break the others before a hand-over.

    python tools/verify.py <bundle.mpp> <dir-with-apks> [--patcher path/to/morphe.jar]

Inputs may be .apk or .apkm (the patcher takes both). Exit code is non-zero when any app reports a failed patch or
no patches at all, which is what a stale bundle or an unmatched version looks like.
"""

import json
import os
import subprocess
import sys
import tempfile

DEFAULT_PATCHER = os.path.join(os.path.dirname(os.getcwd()), "docscanner-work", "tools", "morphe.jar")


def inputs(folder):
    for name in sorted(os.listdir(folder)):
        if name.lower().endswith((".apk", ".apkm")):
            yield os.path.join(folder, name)


def patch(patcher, bundle, apk, work):
    result = os.path.join(work, "result.json")
    output = os.path.join(work, "out-" + os.path.basename(apk) + ".apk")
    command = ["java", "-jar", patcher, "patch", "--continue-on-error", "-r=" + result,
               "-p=" + bundle, "-o=" + output, "-t=" + os.path.join(work, "tmp"), apk]
    run = subprocess.run(command, capture_output=True, text=True, errors="replace")
    data = {}
    if os.path.exists(result):
        with open(result, encoding="utf-8", errors="replace") as handle:
            data = json.load(handle)
    return data, run.stdout + run.stderr


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    bundle, folder = sys.argv[1], sys.argv[2]
    patcher = DEFAULT_PATCHER
    if "--patcher" in sys.argv:
        patcher = sys.argv[sys.argv.index("--patcher") + 1]

    rows, bad = [], 0
    with tempfile.TemporaryDirectory() as work:
        for apk in inputs(folder):
            data, log = patch(patcher, bundle, apk, work)
            applied = [p.get("patchName") or p.get("name") for p in data.get("appliedPatches", [])]
            failed = [(p.get("patchName") or p.get("name"), str(p.get("error"))[:100])
                      for p in data.get("failedPatches", [])]
            name = os.path.basename(apk)
            if not applied and not failed:
                # Nothing matched: wrong bundle, wrong version, or a file the patcher could not read.
                rows.append((name, "NOTHING APPLIED", log.strip().splitlines()[-1][:90] if log.strip() else ""))
                bad += 1
                continue
            rows.append((name, f"{len(applied)} applied", f"{len(failed)} failed"))
            for patch_name, error in failed:
                rows.append(("  " + str(patch_name), "FAILED", error))
                bad += 1

    width = max(len(row[0]) for row in rows) if rows else 10
    for name, verdict, detail in rows:
        print(f"{name:<{width}}  {verdict:<16} {detail}")
    print(f"\n{bad} problem(s) across {len(rows)} line(s)")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
