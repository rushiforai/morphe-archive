"""Capture bounded Pizza diagnostics without clearing logcat or app data.

Usage: python scripts/capture_pizza_runtime.py --serial emulator-5554 --label launch
Raw evidence stays in ignored artifacts/pizza-runtime/. No screenshots are taken.
This captures evidence, not a gameplay/authentication/save-success verdict.
"""
import argparse
import datetime
import json
from pathlib import Path
import re
import subprocess

PACKAGE = "com.tapblaze.pizzabusiness"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--serial", required=True)
    parser.add_argument("--label", required=True)
    parser.add_argument("--output", type=Path, default=Path("artifacts/pizza-runtime"))
    args = parser.parse_args()
    label = re.sub(r"[^a-zA-Z0-9_-]", "_", args.label)
    stamp = datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")
    folder = args.output / f"{stamp}-{label}"
    folder.mkdir(parents=True, exist_ok=False)
    results = {}

    def capture(name, command, timeout=30):
        try:
            result = subprocess.run(["adb", "-s", args.serial, *command],
                                    capture_output=True, timeout=timeout)
            output = result.stdout.decode("utf-8", errors="replace")
            error = result.stderr.decode("utf-8", errors="replace")
            results[name] = {"exit_code": result.returncode, "command": command}
        except subprocess.TimeoutExpired as exc:
            output = (exc.stdout or b"").decode("utf-8", errors="replace")
            error = "Command timed out"
            results[name] = {"exit_code": None, "timeout": True, "command": command}
        (folder / f"{name}.txt").write_text(output + "\n" + error, encoding="utf-8")
        return output

    capture("device", ["shell", "getprop"])
    capture("pid-before", ["shell", "pidof", PACKAGE])
    capture("activities-before", ["shell", "dumpsys", "activity", "activities"])
    capture("package", ["shell", "dumpsys", "package", PACKAGE])
    capture("exit-info", ["shell", "dumpsys", "activity", "exit-info", PACKAGE])
    capture("window", ["shell", "dumpsys", "window", "windows"])
    capture("power", ["shell", "dumpsys", "power"])
    log = capture("logcat", ["logcat", "-d", "-v", "threadtime", "-t", "12000"])
    capture("crash-buffer", ["logcat", "-d", "-b", "crash", "-v", "threadtime"])
    remote_xml = f"/data/local/tmp/pizza-ui-{stamp}.xml"
    capture("uiautomator", ["shell", "uiautomator", "dump", remote_xml])
    if results["uiautomator"]["exit_code"] == 0:
        capture("ui", ["shell", "cat", remote_xml])
        capture("ui-cleanup", ["shell", "rm", remote_xml])

    # Capture final state too: a process can crash while UIAutomator is dumping.
    pid = capture("pid", ["shell", "pidof", PACKAGE]).strip()
    activities = capture("activities", ["shell", "dumpsys", "activity", "activities"])
    capture("exit-info-final", ["shell", "dumpsys", "activity", "exit-info", PACKAGE])
    capture("crash-buffer-final", ["logcat", "-d", "-b", "crash", "-v", "threadtime"])

    pattern = re.compile(r"FATAL EXCEPTION|Fatal signal|ANR in " + re.escape(PACKAGE)
                         + r"|UnsatisfiedLinkError|VerifyError|NoClassDefFoundError"
                         + r"|GamesConnectService|GamesService|PlayGames|pairip", re.I)
    lines = log.splitlines()
    selected = set()
    for index, line in enumerate(lines):
        if pattern.search(line):
            selected.update(range(max(0, index - 2), min(len(lines), index + 9)))
    excerpt = "\n".join(lines[index] for index in sorted(selected))
    # Raw account/auth data must stay local; also redact common values in excerpts.
    excerpt = re.sub(r"[\w.+-]+@[\w.-]+\.[A-Za-z]{2,}", "<email>", excerpt)
    excerpt = re.sub(r"(?i)((?:access_token|id_token|auth_code|authorization|password)"
                     r"\s*[:=]\s*)\S+", r"\1<redacted>", excerpt)
    (folder / "exceptions-filtered.txt").write_text(excerpt, encoding="utf-8")
    summary = {"serial": args.serial, "package": PACKAGE, "label": args.label,
               "utc": stamp, "pid": pid,
               "resumed_activity": [line.strip() for line in activities.splitlines()
                                    if "ResumedActivity" in line or "topResumedActivity" in line],
               "commands": results,
               "limitation": "Process/activity status does not prove sign-in, gameplay or saved progress."}
    (folder / "summary.json").write_text(json.dumps(summary, indent=2), encoding="utf-8")
    print(json.dumps({"evidence": str(folder.resolve()), "pid": pid,
                      "resumed_activity": summary["resumed_activity"]}, indent=2))


if __name__ == "__main__":
    main()
