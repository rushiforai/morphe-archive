#!/usr/bin/env python3
"""Check that installed WebNovel starts and keeps a foreground activity on a USB phone.

Run after installing a build: python3 scripts/check_launch.py --adb /path/to/adb
The check restarts WebNovel. It does not uninstall the app or erase its data.
"""

import argparse
import os
import subprocess
from pathlib import Path

PACKAGE = "com.qidian.Int.reader"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sdk = Path(os.environ.get("ANDROID_HOME", Path.home() / "Android/Sdk"))
    parser.add_argument("--adb", default=str(sdk / "platform-tools/adb"))
    args = parser.parse_args()

    def adb(*command):
        result = subprocess.run(
            [args.adb, *command], capture_output=True, text=True, timeout=45
        )
        if result.returncode:
            raise RuntimeError(f"adb {command[0]} failed (exit {result.returncode})")
        return result.stdout

    adb("get-state")
    adb("shell", "am", "force-stop", PACKAGE)
    start = adb("shell", "date '+%m-%d %H:%M:%S.000'").strip()
    adb("shell", "am", "start", "-W", "-n", f"{PACKAGE}/.SplashActivity")
    # Wait for UI idle without retaining screen text in a hierarchy file.
    adb("shell", "uiautomator", "dump", "/dev/null")
    processes = adb("shell", f"pidof {PACKAGE} || true").strip()
    crashes = adb("logcat", "-b", "crash", "-d", "-T", start, "-v", "brief")
    if not processes or f"Process: {PACKAGE}," in crashes:
        raise AssertionError("WebNovel exited or crashed during startup; inspect its crash log")
    activity = adb("shell", "dumpsys", "activity", "activities")
    resumed = [line for line in activity.splitlines() if "ResumedActivity" in line]
    if not any(PACKAGE in line for line in resumed):
        raise AssertionError("WebNovel has no resumed foreground activity")
    print("PASS: WebNovel stayed alive and has a resumed foreground activity")


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, RuntimeError, OSError, subprocess.TimeoutExpired) as error:
        raise SystemExit(f"FAIL: {error}")
