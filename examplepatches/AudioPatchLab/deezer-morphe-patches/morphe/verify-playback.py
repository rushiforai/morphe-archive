#!/usr/bin/env python3
"""Verify that rapid track changes start playback and preserve the session."""

import argparse
import os
from pathlib import Path
import re
import subprocess
import time


PACKAGE = "deezer.android.app.morphe"


def track_row(argument):
    x, separator, remainder = argument.partition(",")
    y, title_separator, title = remainder.partition(",")
    if not (separator and title_separator and x.isdecimal() and y.isdecimal() and title.strip()):
        raise argparse.ArgumentTypeError("Each row must use the X,Y,Title format")
    return x, y, title.strip()


def check_playback(adb, rows, rounds, timeout):
    def shell(*command):
        return subprocess.check_output([*adb, "shell", *command], text=True, timeout=8)

    def check_foreground(title):
        activities = shell("dumpsys", "activity", "activities")
        foreground = next(
            (line for line in activities.splitlines() if "topResumedActivity=" in line), "",
        )
        if re.search(r"deezer\..*\b[Aa]uth[Uu][Ii]", foreground):
            raise SystemExit(f"Signed out after selecting {title}")
        if f"{PACKAGE}/com.deezer.feature.ads.audio." in foreground:
            raise SystemExit(f"Ad shown when starting {title}")

    for _ in range(rounds):
        for x, y, title in rows:
            shell("input", "tap", x, y)
            deadline = time.monotonic() + timeout
            actual = None
            while time.monotonic() < deadline:
                check_foreground(title)
                dump = shell("dumpsys", "media_session")
                session = re.search(
                    rf"package={re.escape(PACKAGE)}(?=\s|$)(.*?)metadata:.*?description=([^\r\n]+)",
                    dump,
                    re.S,
                )
                if session:
                    actual = session[2]
                    if actual.startswith(title + ",") and "state=PLAYING(3)" in session[1]:
                        print(f"Playback confirmed · {title}", flush=True)
                        break
                time.sleep(0.5)
            else:
                raise SystemExit(f"Expected {title}, Android player: {actual or 'unavailable'}")
            # Let playback start before changing the row again.
            time.sleep(2)
            check_foreground(title)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("serial", help="Test emulator serial number")
    parser.add_argument("rows", nargs="+", type=track_row, metavar="X,Y,Title")
    parser.add_argument("--rounds", type=int, default=3)
    parser.add_argument("--timeout", type=float, default=8)
    args = parser.parse_args()
    if not args.serial.startswith("emulator-") or args.rounds < 1 or args.timeout <= 0:
        parser.error("Specify a test emulator, a positive round count, and a positive timeout")
    if len(args.rows) < 2 or any(a[2] == b[2] for a, b in zip(args.rows, args.rows[1:] + args.rows[:1])):
        parser.error("Specify at least two tracks, with a different track at each selection")
    sdk = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    adb = Path(sdk or Path.home() / "Android/Sdk") / "platform-tools/adb"
    if not adb.is_file():
        adb = Path("adb")
    check_playback([str(adb), "-s", args.serial], args.rows, args.rounds, args.timeout)
