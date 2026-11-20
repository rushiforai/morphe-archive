#!/usr/bin/env python3
"""Validate the canonical MetaConfig payload without modifying it.

The repository JSON is the source of truth. This validator deliberately reads
only that file; the payload is embedded into the extension at build time as a
BuildConfig string (see extensions/extension/build.gradle.kts).
"""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONFIG = ROOT / "config" / "mc_overrides.json"

# Keep these assertions explicit so a future edit cannot silently drop or
# invert the Employee Options candidate flag.
EMPLOYEE_UNIVERSAL_ID = "28538:"
EMPLOYEE_SUBFLAG = "0: : true"


def main() -> int:
    try:
        raw = CONFIG.read_bytes()
        text = raw.decode("utf-8")
        data = json.loads(text)
    except (OSError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        print(f"FAIL: cannot read valid UTF-8 JSON: {exc}")
        return 1

    if "\n" in text.strip() or "\r" in text:
        print("FAIL: payload must be a single line (Instagram's loader only "
              "reliably parses compact single-line JSON)")
        return 1

    if not isinstance(data, dict):
        print("FAIL: root JSON value must be an object")
        return 1

    employee_values = data.get(EMPLOYEE_UNIVERSAL_ID)
    if not isinstance(employee_values, list) or EMPLOYEE_SUBFLAG not in employee_values:
        print("FAIL: Employee Options candidate 28538::0=true is missing")
        return 1

    if data.get("_qe_overrides_") != []:
        print("FAIL: _qe_overrides_ must remain an empty list")
        return 1

    for key, values in data.items():
        if not isinstance(key, str) or not isinstance(values, list):
            print(f"FAIL: invalid MetaConfig entry shape for {key!r}")
            return 1
        if not all(isinstance(value, str) for value in values):
            print(f"FAIL: values for {key!r} must all be strings")
            return 1

    print(f"OK: valid UTF-8 JSON ({len(raw)} bytes), single line")
    print("OK: Employee Options candidate 28538::0 is set to true")
    print("NOTE: this validates the payload only, not app-side loading or UI unlock.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
