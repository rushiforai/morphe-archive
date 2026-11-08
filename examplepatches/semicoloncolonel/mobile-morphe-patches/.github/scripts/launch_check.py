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
ISSUE_LABEL = "app update"
REVIEW_LABEL = "needs review"
READY_LABEL = "ready to bump"


def adb(*args, timeout=120):
    return subprocess.run(["adb", *args], capture_output=True, text=True, timeout=timeout)


def launch(apk, package, wait):
    install = adb("install", "-r", "-g", str(apk), timeout=600)
    if install.returncode != 0 or "Success" not in install.stdout:
        reason = (install.stdout + install.stderr).strip().splitlines()[-1:] or ["unknown"]
        if "NO_MATCHING_ABIS" in reason[0]:
            return "not tested: the app has no code for the emulator's processor"
        return f"did not install ({reason[0]})"
    adb("logcat", "-c")
    adb("shell", "monkey", "-p", package, "-c", "android.intent.category.LAUNCHER", "1")
    time.sleep(wait)
    running = adb("shell", "pidof", package).stdout.strip()
    log = adb("logcat", "-d", "-b", "crash").stdout
    crashed = "FATAL EXCEPTION" in log and package in log
    adb("uninstall", package)
    if crashed:
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
                    f"Launch check on an Android 14 emulator: the patched {r['name']} `{r['latest']}` {result}{note}\n",
                    needs_review)
    (args.report / "launch.json").write_text(json.dumps(launches, indent=2))
    if len(lines) > 5:
        with open(args.report / "app-updates.md", "a") as summary:
            summary.write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
