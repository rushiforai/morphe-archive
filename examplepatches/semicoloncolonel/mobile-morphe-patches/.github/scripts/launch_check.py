#!/usr/bin/env python3
"""Installs each fully patched app on an emulator and checks that it opens.

Runs after app_updates.py, inside the emulator job. For every patched APK
the daily check kept, it installs the app, opens it, waits, and reports
whether the app is still running or crashed (a "FATAL EXCEPTION" in the
log). With --issues it adds the result as a comment on the app's "App
update" issue.

This shows that the patched app starts. It cannot show that each patch
still does its job, because most apps need a sign-in or a real device for
that.

    python3 .github/scripts/launch_check.py app-updates --issues
"""

import argparse
import json
import os
import subprocess
import time
from pathlib import Path

TITLE_PREFIX = "App update: "
ISSUE_LABEL = "type: app update"
REVIEW_LABEL = "status: needs review"
READY_LABEL = "status: ready to bump"


def adb(*args, timeout=120):
    return subprocess.run(["adb", *args], capture_output=True, text=True, timeout=timeout)


# The emulator reports boot_completed a few seconds before the package service
# answers, and an install then fails with "Failure calling service package:
# Broken pipe" (run 43661824151). These errors mean "not ready yet", not a
# problem with the app.
NOT_READY = ("Broken pipe", "Can't find service: package", "device offline", "Is the system running?")


def wait_for_package_service(timeout=180):
    """Waits until the package service lists the framework package."""
    deadline = time.time() + timeout
    while time.time() < deadline:
        if "package:" in adb("shell", "pm", "path", "android").stdout:
            return True
        time.sleep(5)
    return False


def system_server():
    """The process ID of the Android framework, or "" while it is down."""
    return adb("shell", "pidof", "system_server").stdout.strip()


def framework():
    """Identifies one run of the Android framework: its start count and process ID."""
    starts = adb("shell", "getprop", "sys.system_server.start_count").stdout.strip()
    return starts, system_server()


def restarted_since(before):
    """Whether the framework was down at `before`, is down now, or restarted in between."""
    now = framework()
    return not before[1] or not now[1] or now != before


# The Android 17 image (api-level 37.0) restarted its framework every 15 to 30
# seconds, for as long as the job ran (run 45488152905). Every restart kills
# every app, so each app "closed soon after launch", and an install that landed
# mid-restart failed with "Can't find service: package". A restart during a
# launch says nothing about the app.
def wait_for_stable_system(settle=60, timeout=600):
    """Waits until system_server has kept one process ID for `settle` seconds."""
    deadline = time.time() + timeout
    pid, since = system_server(), time.time()
    while time.time() < deadline:
        if pid and time.time() - since >= settle and "package:" in adb("shell", "pm", "path", "android").stdout:
            return True
        time.sleep(5)
        now = system_server()
        if now != pid:
            pid, since = now, time.time()
    return False


def android_version():
    """The emulator's Android version, such as "15"."""
    return adb("shell", "getprop", "ro.build.version.release").stdout.strip() or "unknown"


def install(apk):
    """adb install, retried while the package service is not ready."""
    for attempt in range(4):
        result = adb("install", "-r", "-g", str(apk), timeout=600)
        output = result.stdout + result.stderr
        if result.returncode == 0 and "Success" in result.stdout:
            return result
        if attempt == 3 or not any(sign in output for sign in NOT_READY):
            return result
        wait_for_package_service()
        time.sleep(15)
    return result


RESTARTED = "not tested: the emulator's Android system restarted during the check"


def launch(apk, package, wait):
    before = framework()
    installed = install(apk)
    if installed.returncode != 0 or "Success" not in installed.stdout:
        if restarted_since(before):
            return RESTARTED
        reason = (installed.stdout + installed.stderr).strip().splitlines()[-1:] or ["unknown"]
        if "NO_MATCHING_ABIS" in reason[0]:
            return "not tested: the app has no code for the emulator's processor"
        return f"did not install ({reason[0]})"
    adb("logcat", "-c")
    adb("shell", "monkey", "-p", package, "-c", "android.intent.category.LAUNCHER", "1")
    time.sleep(wait)
    running = adb("shell", "pidof", package).stdout.strip()
    log = adb("logcat", "-d", "-b", "crash").stdout
    restarted = restarted_since(before)
    adb("uninstall", package)
    return verdict(package, wait, running, log, restarted)


def verdict(package, wait, running, log, restarted):
    """Reads one launch: the app's process, the crash log, and whether Android restarted."""
    if restarted:
        return RESTARTED
    if "FATAL EXCEPTION" in log and package in log:
        lines = [l for l in log.splitlines() if "Exception" in l or "Error" in l][:6]
        return "crashed on launch:\n\n```\n" + "\n".join(lines) + "\n```"
    if not running:
        return "closed soon after launch, without a crash in the log"
    return f"opened and was still running after {wait} seconds"


def comment(name, version, text, needs_review):
    title = f"{TITLE_PREFIX}{name} {version}"
    issues = json.loads(subprocess.run(
        ["gh", "issue", "list", "--label", ISSUE_LABEL, "--state", "open", "--search", f'in:title "{title}"',
         "--json", "number,title"], capture_output=True, text=True).stdout or "[]")
    match = next((i for i in issues if i["title"] == title), None)
    if match:
        subprocess.run(["gh", "issue", "comment", str(match["number"]), "--body-file", "-"],
                       input=text, capture_output=True, text=True)
        if needs_review:
            owner = os.environ.get("GITHUB_REPOSITORY_OWNER")
            subprocess.run(["gh", "issue", "edit", str(match["number"]), "--add-label", REVIEW_LABEL,
                            "--remove-label", READY_LABEL, *(["--add-assignee", owner] if owner else [])],
                           capture_output=True, text=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("report", type=Path, help="the app-updates output folder")
    parser.add_argument("--wait", type=int, default=20)
    parser.add_argument("--issues", action="store_true")
    args = parser.parse_args()

    results = json.loads((args.report / "app-updates.json").read_text())
    launches = {}
    lines = ["", "## Launch check", "", "| App | Version | Result |", "|-----|---------|--------|"]
    if not wait_for_stable_system():
        print("The emulator's Android system did not stay up for a minute; the results may say so.", flush=True)
    version = android_version()
    for r in results:
        apk = args.report / "patched" / str(r.get("patched_apk", ""))
        if not r.get("patched_apk") or not apk.exists():
            continue
        result = launch(apk, r["package"], args.wait)
        launches[r["package"]] = {"version": r["latest"], "result": result.splitlines()[0],
                                  "ok": not result.startswith(("crashed", "closed", "did not install"))}
        print(f"{r['name']} {r['latest']}: {result.splitlines()[0]}", flush=True)
        lines.append(f"| {r['name']} | `{r['latest']}` | {result.splitlines()[0]} |")
        if args.issues:
            needs_review = result.startswith(("crashed", "closed", "did not install"))
            note = "\n\nThis needs a manual check: open the patched app on a device." if needs_review else ""
            comment(r["name"], r["latest"],
                    f"Launch check on an Android {version} emulator: the patched {r['name']} `{r['latest']}` {result}{note}\n",
                    needs_review)
    (args.report / "launch.json").write_text(json.dumps(launches, indent=2))
    if len(lines) > 5:
        with open(args.report / "app-updates.md", "a") as summary:
            summary.write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
