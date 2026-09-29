#!/usr/bin/env python3
"""python3 triage.py <issue-body-file> [patches-list.json]"""

import json
import os
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from fields import field, has_any, normalize, normalize_version, parse_fields

MIN_CHARS = 60
MIN_WORDS = 10

REPO = os.environ.get("GITHUB_REPOSITORY", "")
NEW_ISSUE = f"https://github.com/{REPO}/issues/new/choose" if REPO else ""

APP_NAME_FIELDS = ("App and version", "App name", "App", "Target app", "App version patched")
APP_VERSION_FIELDS = ("Other version", "App version", "Broken app version", "App version patched",
                      "App and version")
DESCRIPTION_FIELDS = ("Bug description", "What happens", "What happened?", "Describe the bug",
                      "Summary")
LOG_FIELDS = ("Debug log", "Error logs", "Morphe logs", "Logs")
SOURCE_FIELDS = ("APK source", "APK source and type", "APK source and architecture")

REPACKAGERS = ("softonic", "happymod", "apkmody", "modyolo", "moddroid", "an1.com", "rexdl",
               "apkdone", "liteapks", "apkmb", "apk4free", "androeed", "apkrabi")

MARKER = "<!-- triage-bot -->"
NO_RESPONSE = "_no response_"

REPORT_MARKERS = ("PatchException", "Manager:", "manager=", "Failed to match")

OPTION_PATCHING_FAILED = "patchingfailed"
OPTION_STOCK_FAILS_TOO = "theunpatchedappfailsthesameway"
OPTION_NOT_TRIED = "ihavenottried"

body_path = Path(sys.argv[1])
list_path = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("patches-list.json")


def supported_apps(data):
    apps = {}
    for patch in data["patches"]:
        for package in patch.get("compatiblePackages") or []:
            key = (package["name"], package["packageName"])
            versions = apps.setdefault(key, set())
            for target in package.get("targets") or []:
                if target.get("version"):
                    versions.add(target["version"])
    return apps


data = json.loads(list_path.read_text(encoding="utf-8"))
apps = supported_apps(data)
fields = parse_fields(body_path.read_text(encoding="utf-8"))

description = field(fields, *DESCRIPTION_FIELDS)
if not has_any(fields, *DESCRIPTION_FIELDS):
    description = max(fields.values(), key=len, default="")

app_name = field(fields, *APP_NAME_FIELDS)
app_version = " ".join(filter(None, (field(fields, n) for n in APP_VERSION_FIELDS)))
another_version = "another version" in app_name.lower() and not field(fields, "Other version")
reported = " ".join(dict.fromkeys(filter(None, (app_name, app_version))))
app_haystack = reported or "\n".join(fields.values())
version_tokens = {normalize_version(t) for t in re.split(r"[\s(),`]+", app_version) if t.strip()}
version_haystack = normalize(app_haystack)
what_happened = field(fields, "What happened")
apk_source = field(fields, *SOURCE_FIELDS)
source_text = (apk_source + "\n" + "\n".join(fields.values())).lower()
repackager = next((h for h in REPACKAGERS if h in source_text), "")
debug_log = field(fields, *LOG_FIELDS)

blockers = []
flags = []
labels = []

if not fields:
    blockers.append(
        "Please use an issue form to include the details needed for review. "
        + (f"Open [a new issue]({NEW_ISSUE}) and choose the matching form." if NEW_ISSUE else "Open a new issue and choose the matching form.")
    )

words = len(description.split())
if fields and (len(description) < MIN_CHARS or words < MIN_WORDS):
    blockers.append(
        f"Please expand the description ({words} word{'s' if words != 1 else ''}; at least {MIN_WORDS} needed). Include "
        "what you did, what you expected, and what happened instead."
    )

matched = None
best = 0
normalized_app = normalize(app_haystack)
for (name, package), versions in apps.items():
    signals = [normalize(name), normalize(package)]
    signals += [normalize(word) for word in name.split() if len(word) > 3]
    score = max((len(sig) for sig in signals if sig and sig in normalized_app), default=0)
    if score > best:
        best, matched = score, (name, versions)

if repackager:
    blockers.append(
        f"`{repackager}` distributes modified APKs that may not patch correctly. Please try "
        "patching an unmodified APK from APKMirror, APKPure, Uptodown or APKCombo."
    )

if not fields:
    pass
elif not matched:
    supported = ", ".join(sorted(name for name, _ in apps))
    lead = (
        f"This bundle doesn't currently support `{reported}`."
        if reported
        else "The report doesn't identify a supported app."
    )
    blockers.append(
        f"{lead} Supported apps in {data['version']}: {supported}. "
        "To request support for another app, please open an app request."
    )
elif another_version:
    flags.append(
        "Please fill in the Other version field after choosing \"another version\". The version "
        "number is on the app's About screen."
    )
    labels.append("needs info")
elif matched[1] and not (
    any(normalize_version(v) in version_tokens for v in matched[1]) if version_tokens
    else any(normalize_version(v) in version_haystack for v in matched[1])
):
    name, versions = matched
    flags.append(
        f"Bundle {data['version']} supports {name} {', '.join(sorted(versions))}, but the report lists "
        f"`{app_version or reported}`. Please confirm whether the app updated or you used `-f` to "
        "patch an unsupported version."
    )
    labels.append("untargeted version")

if normalize(what_happened).startswith(OPTION_PATCHING_FAILED) and not any(
    marker in debug_log for marker in REPORT_MARKERS
):
    flags.append(
        "Please attach the patching error report. In Morphe Manager, tap **Copy** on the "
        "error dialog and paste it here. With morphe-cli, add `-r report.json` and attach the "
        "report."
    )
    labels.append("needs info")

stock = normalize(field(fields, "Does the unpatched app do the same thing"))
single_patch = normalize(field(fields, "Does it still happen with only one patch selected"))

if stock.startswith(OPTION_STOCK_FAILS_TOO):
    blockers.append(
        "The report says the unpatched app also fails, which suggests an app issue. If the patched "
        "app behaves differently, please update that answer and describe the difference."
    )
elif stock.startswith(OPTION_NOT_TRIED):
    flags.append(
        "Please try the unpatched app. Install the stock APK, repeat the same steps, and add the "
        "result to the report."
    )
    labels.append("needs info")

if single_patch.startswith(OPTION_NOT_TRIED):
    flags.append(
        "Please try patching with only the reported patch selected. If the problem stops, enable "
        "the other patches one at a time until it returns, then select the patch that caused it "
        "in the form."
    )
    if "needs info" not in labels:
        labels.append("needs info")

if blockers:
    verdict = "close"
    labels = []
    lines = ["Closing for now for the following reasons:", ""]
    lines += [f"- {b}" for b in blockers + flags]
    lines += ["", "Update the report to address the points above. It reopens automatically once the checks pass."]
elif flags:
    verdict = "flag"
    lines = ["Please add the following details:", ""]
    lines += [f"- {f}" for f in flags]
    lines += ["", "Add these details by editing the issue."]
else:
    verdict = "pass"
    lines = []

if lines:
    lines += ["", "_Posted automatically on behalf of the maintainer. If this seems wrong, please comment below for review._"]

print(json.dumps({
    "verdict": verdict,
    "labels": labels,
    "app": matched[0] if matched else "",
    "comment": MARKER + "\n" + "\n".join(lines) if lines else "",
}))
