#!/usr/bin/env python3
"""Fail if any English text shown by tr() is missing from a language file.

    python3 scripts/i18n_check.py

The build already refuses to ship a bundle with a missing key, but only for the keys it happens to look
at, and only after a long Gradle run. This runs in a second, so a missing translation is caught while the
English text is still fresh in mind. It also reports keys that no longer appear in the runtime, which is
how stale rows pile up.
"""
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
I18N = ROOT / "patches" / "src" / "main" / "resources" / "japatch" / "i18n"


def main():
    out = subprocess.run(["node", "scripts/i18n_strings.cjs"], cwd=ROOT, capture_output=True, text=True)
    if out.returncode != 0:
        raise SystemExit("scripts/i18n_strings.cjs failed:\n" + out.stderr.strip())
    wanted = set(json.loads(out.stdout))

    codes = [line.strip() for line in (I18N / "index.txt").read_text(encoding="utf-8").splitlines() if line.strip()]
    if not codes:
        raise SystemExit("i18n/index.txt is empty")

    bad = False
    stale_total = 0
    for code in codes:
        path = I18N / f"{code}.json"
        if not path.exists():
            print(f"{code}: file missing")
            bad = True
            continue
        strings = json.loads(path.read_text(encoding="utf-8")).get("strings", {})
        missing = sorted(wanted - set(strings))
        stale = sorted(set(strings) - wanted)
        stale_total += len(stale)
        if missing:
            bad = True
            print(f"{code}: {len(missing)} missing, e.g. {missing[0]!r}")
        if stale and "--verbose" in sys.argv:
            print(f"{code}: {len(stale)} unused, e.g. {stale[0]!r}")

    if bad:
        raise SystemExit("i18n_check: translations are incomplete")
    print(f"i18n_check: {len(wanted)} texts present in all {len(codes)} languages"
          + (f" ({stale_total} unused rows, see --verbose)" if stale_total else ""))


if __name__ == "__main__":
    main()
