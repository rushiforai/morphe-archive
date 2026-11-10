"""Checks that the issue forms' App dropdowns list every app the patches support.

The dropdowns in the bug report and enhancement forms are kept by hand. This
compares them with the Compatibility names in the patches, leaving out the
apps build.gradle.kts excludes from the bundle, and with each other.

Run from the repository root: python3 .github/scripts/check_issue_forms.py
"""

import fnmatch
import re
import sys
from pathlib import Path

FORMS = [Path(".github/ISSUE_TEMPLATE/1-bug-report.yml"), Path(".github/ISSUE_TEMPLATE/2-enhancement.yml")]


def excluded_globs():
    text = Path("patches/build.gradle.kts").read_text()
    block = re.search(r"kotlin\.exclude\((.*?)\)", text, re.S)
    return re.findall(r'"([^"]+)"', block.group(1)) if block else []


def patched_apps():
    globs = excluded_globs()
    names = set()
    for path in Path("patches/src/main/kotlin").rglob("*.kt"):
        if any(fnmatch.fnmatch(path.as_posix(), glob) for glob in globs):
            continue
        names.update(re.findall(r'Compatibility\(\s*name\s*=\s*"([^"]+)"', path.read_text()))
    return names


def form_apps(form):
    text = form.read_text()
    block = re.search(r"id: app\n(.*?)(?=\n  - type:)", text, re.S)
    if not block:
        return None
    return [o for o in re.findall(r'^\s+- "([^"]+)"', block.group(1), re.M) if not o.startswith("Other")]


def main():
    apps = patched_apps()
    problems = []
    for form in FORMS:
        options = form_apps(form)
        if options is None:
            problems.append(f"{form}: no App dropdown found")
            continue
        for name in sorted(apps - set(options), key=str.lower):
            problems.append(f"{form}: missing \"{name}\"")
        for name in sorted(set(options) - apps, key=str.lower):
            problems.append(f"{form}: lists \"{name}\", which no patch supports")
        if options != sorted(options, key=str.lower):
            problems.append(f"{form}: the App options are not in alphabetical order")
    for problem in problems:
        print(problem)
    if problems:
        sys.exit(1)
    print(f"The issue forms list all {len(apps)} apps.")


if __name__ == "__main__":
    main()
