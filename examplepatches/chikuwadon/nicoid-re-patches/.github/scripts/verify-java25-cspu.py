#!/usr/bin/env python3
"""Fail closed if GitHub Actions selects an unpatched Java 25 runtime.

CVE-2026-114938 (Java4Shell) is fixed in Eclipse Temurin 25.0.5.1+2.
The build metadata (+2) identifies the Temurin release; the runtime's
java -version output contains the four-component feature version.
"""
from __future__ import annotations

import re
import subprocess
import sys

MINIMUM = (25, 0, 5, 1)
process = subprocess.run(
    ["java", "-version"], capture_output=True, text=True, check=True
)
output = process.stdout + process.stderr
match = re.search(r'\bversion\s+"(\d+(?:\.\d+){3})', output)
if match is None:
    sys.exit("FAIL: cannot determine the installed Java feature version: " + output)
version = tuple(int(part) for part in match.group(1).split("."))
if version[0] != 25 or version < MINIMUM:
    sys.exit(
        f"FAIL: Java {'.'.join(map(str, version))} is not an approved "
        "Temurin 25 runtime for CVE-2026-114938; require >= 25.0.5.1"
    )
print("PASS: Java " + ".".join(map(str, version)) + " meets the Java4Shell security floor")
