#!/usr/bin/env python3
"""
Runs an app's check commands on the emulator (emulator-app.yml). The commands are the "check" list in
.github/apps/<app>.json, with $APK, $CLI and $DEXDUMP from the environment.

Before each command it waits until Android has really started: the emulator runner returns once the
device is listed, and an install right then can fail with "Can't find service: package". A command
that still fails on the emulator itself (adb lost, a system service missing) is run once more after
waiting again. A failure of the patches or the app is not retried: the command's own output decides.

python3 emulator_run.py <app>
"""

import json
import re
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ADB = "adb"

# What the emulator says when it, not the app, is the problem.
EMULATOR_TROUBLE = re.compile(
    r"Can't find service|Failure calling service|Broken pipe|device offline|device not found"
    r"|no devices/emulators found|Unable to connect to adb daemon|cannot connect to daemon"
    r"|error: closed|Is the system running\?|DeadSystemException|INSTALL_FAILED_INSUFFICIENT_STORAGE"
    # The check tried the original app too and it failed the same way: the emulator is at fault
    # (for example "Pixel Launcher isn't responding" covering the screen).
    r"|The original app fails here too",
    re.I,
)


def adb(*args, timeout=30):
    try:
        return subprocess.run([ADB, *args], capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return None


def wait_until_ready(limit=300):
    """Waits until the device has booted and its package manager answers. Returns whether it did."""
    adb("wait-for-device", timeout=limit)
    start = time.time()
    while time.time() - start < limit:
        booted = adb("shell", "getprop", "sys.boot_completed")
        packages = adb("shell", "pm", "path", "android")
        if (booted and booted.stdout.strip() == "1"
                and packages and packages.returncode == 0 and "package:" in packages.stdout):
            # The launcher and the settings provider come up a little after the package manager.
            time.sleep(5)
            print(f"The emulator is ready ({int(time.time() - start)} s).", flush=True)
            return True
        time.sleep(3)
    print(f"::warning::The emulator wasn't ready after {limit} seconds; trying anyway.", flush=True)
    return False


def no_install_checks():
    """Turns off Play Protect's check of apps installed over adb. On a Google APIs image it can stop
    an install with a dialog nobody answers (for example an app with a Google package name and our
    signature), and adb install then waits until the job's time limit."""
    for setting in ("verifier_verify_adb_installs", "package_verifier_enable"):
        adb("shell", "settings", "put", "global", setting, "0")
    # The one-time "Viewing full screen ... Got it" hint over an app that hides the system bars (YouTube
    # Kids does) would cover the screen the check looks for.
    adb("shell", "settings", "put", "secure", "immersive_mode_confirmations", "confirmed")


def why_emulator_failed():
    """What the runner says about an emulator that went away: its memory, and the kernel's lines
    about killed processes (an emulator the out-of-memory killer stops leaves no message itself)."""
    for command in ("free -m", "sudo dmesg | grep -iE 'killed process|out of memory|oom|qemu|emulator' | tail -20",
                    "ps -eo pid,rss,etime,comm --sort=-rss | head -8"):
        print(f"$ {command}", flush=True)
        try:
            print(subprocess.run(command, shell=True, capture_output=True, text=True, timeout=30).stdout, flush=True)
        except subprocess.TimeoutExpired:
            print("(no answer)", flush=True)


def run(command):
    """Runs one check command, shows its output as it comes, and returns (code, output)."""
    process = subprocess.Popen(command, shell=True, cwd=ROOT, stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT, text=True, errors="replace")
    lines = []
    for line in process.stdout:
        print(line, end="", flush=True)
        lines.append(line)
    return process.wait(), "".join(lines)


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    settings = json.loads((ROOT / ".github" / "apps" / f"{sys.argv[1]}.json").read_text(encoding="utf-8"))
    for command in settings["check"]:
        wait_until_ready()
        no_install_checks()
        print(f"$ {command}", flush=True)
        code, output = run(command)
        if code != 0 and EMULATOR_TROUBLE.search(output):
            print("::warning::The emulator failed, not the app: waiting for it and trying once more.", flush=True)
            why_emulator_failed()
            adb("reconnect")
            wait_until_ready()
            code, output = run(command)
        if code != 0:
            sys.exit(code)


if __name__ == "__main__":
    main()
