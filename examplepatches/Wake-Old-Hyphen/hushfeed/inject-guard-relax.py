#!/usr/bin/env python3
"""
inject-guard-relax.py
Neutralizes the Device privacy guard's hard failure when no
NetworkCapabilities.hasTransport call site exists in the target APK.
Clipboard interception stays fully active; only the local-network half is
skipped when it has zero targets. Self-healing: becomes a no-op with a
warning if the author changes this check upstream.

Usage: python3 inject-guard-relax.py   (run from repository root)
"""
import sys

FILE_PATH = "patches/src/main/kotlin/app/morphe/patches/tiktok/privacy/DevicePrivacyGuardPatch.kt"

MSG = "Device privacy guard: no NetworkCapabilities.hasTransport call site was found."

WARN = ('println("[Device privacy guard] WARNING: no NetworkCapabilities.hasTransport '
        'call site on this build; local-network block skipped, clipboard guard still active.")')


def main():
    try:
        with open(FILE_PATH, "r") as f:
            content = f.read()
    except FileNotFoundError:
        print(f"ERROR: Could not find {FILE_PATH}")
        sys.exit(1)

    lines = content.splitlines(keepends=True)
    count = 0

    for idx, line in enumerate(lines):
        if MSG in line:
            indent = line[:len(line) - len(line.lstrip())]
            nl = "\n" if line.endswith("\n") else ""
            lines[idx] = indent + WARN + nl
            count += 1

    if count == 0:
        print("WARNING: hasTransport throw line not found — author may have changed it.")
        print("Context lines mentioning hasTransport:")
        for idx, line in enumerate(lines):
            if "hasTransport" in line:
                print(f"  {idx + 1}: {line.rstrip()}")
        print("Continuing without relaxation; the patch step will fail loudly if still incompatible.")
    else:
        print(f"Relaxed {count} hasTransport throw site(s) in DevicePrivacyGuardPatch.kt")
        print("Clipboard interception remains active; local-network block skipped when empty.")

    with open(FILE_PATH, "w") as f:
        f.write("".join(lines))


if __name__ == "__main__":
    main()