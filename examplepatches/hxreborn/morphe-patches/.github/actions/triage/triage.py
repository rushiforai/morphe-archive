#!/usr/bin/env python3
"""python3 triage.py <issue-body-file> [patches-list.json]"""

import json
import os
import re
import sys
from collections import Counter
from pathlib import Path
from urllib.parse import urlparse

sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parents[2] / "scripts"))
from fields import code_span, field, has_any, normalize, normalize_version, parse_fields
from versions import prerelease_words, same_variant

MIN_CHARS = 60

REPO = os.environ.get("GITHUB_REPOSITORY", "")
NEW_ISSUE = f"https://github.com/{REPO}/issues/new"

APP_NAME_FIELDS = ("App and version", "App name", "App", "Target app", "App version patched")
APP_VERSION_FIELDS = ("Other version", "App version", "Broken app version", "App version patched",
                      "App and version")
DESCRIPTION_FIELDS = ("Bug description", "What happens", "Describe the bug", "Summary")
LOG_FIELDS = ("Debug log", "Error logs", "Morphe logs", "Logs")
SOURCE_FIELDS = ("APK source", "APK source and type", "APK source and architecture")

REPACKAGERS = ("softonic", "happymod", "apkmod", "apkmody", "modyolo", "moddroid", "an1.com", "rexdl",
               "apkdone", "liteapks", "apkmb", "apk4free", "androeed", "apkrabi")

MARKER = "<!-- triage-bot -->"

REPORT = re.compile(
    r"Exception|Error|INSTALL_FAILED|Failed to match|Manager:|manager=|\(API \d+\)|^[ \t]+at \S"
    r"|Fatal signal|SIG(?:SEGV|ABRT|BUS|ILL)|backtrace:|user-attachments/files/", re.I | re.M
)

OPTION_PATCHING_FAILED = "patchingfailed"
OPTION_STOCK_FAILS_TOO = "theunpatchedappfailsthesameway"
OPTION_NOT_TRIED = "ihavenottried"
OPTIONS_RUNTIME_FAILURE = ("theappwillnotopenatall", "theappopensthencrashes")
OPTIONS_PATCH_INEFFECTIVE = (
    "thepatchedfeatureisstilllocked",
    "thepatchhasnovisibleeffect",
    "apatchismissingfromthelistinmanager",
)

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


def host(url):
    try:
        return urlparse(url).hostname or ""
    except ValueError:
        return ""


def repackager_in(text):
    return next((h for h in REPACKAGERS if re.search(rf"(?:^|[/.@\s]){re.escape(h)}(?![a-z0-9])", text.lower())), "")


def version_cores(version):
    return {normalize(m.group(0)) for m in re.finditer(r"(?<![\d.])\d+(?:\.\d+)+", version)}


def matches_target(target):
    if prerelease_words(typed_version) != prerelease_words(target):
        return False
    if version_tokens & target_forms(target):
        return True
    cores = version_tokens | version_cores(app_version)
    return same_variant(typed_version, target) and bool(cores & (target_forms(target) | version_cores(target)))


data = json.loads(list_path.read_text(encoding="utf-8"))
apps = supported_apps(data)
patch_counts = Counter(
    (package["name"], package["packageName"])
    for patch in data["patches"]
    for package in patch.get("compatiblePackages") or []
)
fields = parse_fields(body_path.read_text(encoding="utf-8"))

description = field(fields, *DESCRIPTION_FIELDS)
if not has_any(fields, *DESCRIPTION_FIELDS):
    description = max(fields.values(), key=len, default="")

app_name = field(fields, *APP_NAME_FIELDS)
reported_versions = [v for v in (field(fields, n) for n in APP_VERSION_FIELDS) if v]
app_version = " ".join(reported_versions)
typed_version = reported_versions[0] if reported_versions else ""
another_version = "another version" in app_name.lower() and not field(fields, "Other version")
shown_name = re.sub(r"\(another version, type it below\)", "", app_name, flags=re.I).strip()
reported = " ".join(dict.fromkeys(filter(None, (shown_name, typed_version))))
app_haystack = reported or "\n".join(fields.values())
version_words = [t for t in re.split(r"[\s(),`]+", app_version) if t.strip()]
version_tokens = {normalize_version(t) for t in version_words} | {
    normalize(a) + normalize(b) for a, b in zip(version_words, version_words[1:])
}
version_haystack = normalize(app_haystack)
what_happened = field(fields, "What happened")
apk_source = field(fields, *SOURCE_FIELDS)
source_hosts = [host(url) for url in re.findall(r"https?://\S+", apk_source, re.I)]
repackager_host = repackager_in(" ".join(source_hosts)) if all(map(repackager_in, source_hosts)) else ""
repackager_named = repackager_in(apk_source)
debug_log = field(fields, *LOG_FIELDS)
report_attached = bool(REPORT.search(debug_log))


def target_forms(version):
    numbered = [w for w in version.split() if any(c.isdigit() for c in w)]
    return {normalize_version(version)} | {normalize_version(w) for w in numbered}


blockers = []
flags = []
labels = []

if not fields:
    flags.append(
        "The automated checks found no form fields in this issue."
    )
    labels.append("needs info")

if fields and not report_attached and len(description) < MIN_CHARS:
    flags.append(
        f"The description is {len(description)} characters, and at least {MIN_CHARS} are needed."
    )
    labels.append("needs info")

matched = None
matched_key = None
best = 0
normalized_app = normalize(app_haystack)
for (name, package), versions in apps.items():
    signals = [normalize(name), normalize(package)]
    signals += [normalize(word) for word in name.split() if len(word) > 3]
    score = max((len(sig) for sig in signals if sig and sig in normalized_app), default=0)
    if score > best:
        best, matched, matched_key = score, (name, versions), (name, package)

if repackager_host:
    blockers.append(
        f"The APK source `{repackager_host}` repackages apps, which may cause patching errors."
    )
elif repackager_named:
    flags.append(
        f"The APK source mentions `{repackager_named}`, which repackages apps and may cause patching errors."
    )
    labels.append("needs info")

if not fields:
    pass
elif not matched:
    supported = ", ".join(sorted(name for name, _ in apps))
    lead = (
        f"The reported app {code_span(reported)} was not recognized as supported."
        if reported
        else "No supported app was identified in the report."
    )
    flags.append(
        f"{lead} Bundle version {data['version']} supports these apps: {supported}."
    )
    labels.append("needs info")
elif another_version:
    flags.append(
        "\"Another version\" is selected, but the version is missing."
    )
    labels.append("needs info")
elif matched[1] and not (
    any(matches_target(v) for v in matched[1]) if version_tokens
    else any(form in version_haystack for v in matched[1] for form in target_forms(v))
):
    name, versions = matched
    flags.append(
        f"Bundle version {data['version']} supports {name} {', '.join(sorted(versions))}. The reported value "
        f"{code_span(typed_version or reported)} does not match a supported version. A newer version belongs in an [app update request]({NEW_ISSUE}?template=app_update.yml)."
    )
    labels.append("untargeted version")

if normalize(what_happened).startswith(OPTION_PATCHING_FAILED) and not report_attached:
    flags.append(
        "Patching failed, but no error report was found in the Error logs field."
    )
    labels.append("needs info")

failure = normalize(field(fields, "What does not work"))
log_text = re.sub(r"^[ \t]*(```|~~~)\w*[ \t]*$", "", debug_log, flags=re.M).strip()
if failure.startswith(OPTIONS_RUNTIME_FAILURE) and not log_text:
    flags.append(
        "The app crashes or won't open, but the Error logs field is empty."
    )
    labels.append("needs info")

patch_ineffective = failure.startswith(OPTIONS_PATCH_INEFFECTIVE)
stock = "" if patch_ineffective else normalize(field(fields, "Does the unpatched app do the same thing"))
single_patch = "" if patch_ineffective else normalize(field(fields, "Does it still happen with only one patch selected"))

if stock.startswith(OPTION_STOCK_FAILS_TOO):
    flags.append(
        "The same problem also occurs in the unpatched app."
    )
    labels.append("needs info")
elif stock.startswith(OPTION_NOT_TRIED):
    flags.append(
        "The unpatched app hasn't been tried."
    )
    labels.append("needs info")

if single_patch.startswith(OPTION_NOT_TRIED) and patch_counts[matched_key] != 1:
    flags.append(
        "It hasn't been tested with only one patch selected."
    )
    if "needs info" not in labels:
        labels.append("needs info")

if blockers:
    verdict = "close"
    labels = []
    lines = ["This issue is being closed automatically for the following reasons:", ""]
    lines += [f"- {b}" for b in blockers + flags]
elif flags:
    verdict = "flag"
    lines = [f"- {f}" for f in flags]
else:
    verdict = "pass"
    lines = []

print(json.dumps({
    "verdict": verdict,
    "labels": list(dict.fromkeys(labels)),
    "app": matched[0] if matched else "",
    "comment": MARKER + "\n" + "\n".join(lines) if lines else "",
}))
