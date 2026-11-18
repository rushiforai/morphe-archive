"""Checks that the issue forms' App dropdowns list every app the patches support,
and that docs/apps.md and the README's app count match those apps.

The dropdowns in the bug report and enhancement forms are kept by hand. This
compares them with the Compatibility names in the patches, and with each other.

Run from the repository root: python3 .github/scripts/check_issue_forms.py
"""

import re
import sys
from pathlib import Path

FORMS = [Path(".github/ISSUE_TEMPLATE/0-version-or-build.yml"), Path(".github/ISSUE_TEMPLATE/1-bug-report.yml"),
         Path(".github/ISSUE_TEMPLATE/2-enhancement.yml")]


def patched_apps():
    names = set()
    for path in Path("patches/src/main/kotlin").rglob("*.kt"):
        names.update(re.findall(r'Compatibility\(\s*name\s*=\s*"([^"]+)"', path.read_text()))
    return names


def form_apps(form):
    text = form.read_text()
    block = re.search(r"id: app\n(.*?)(?=\n  - type:)", text, re.S)
    if not block:
        return None
    return [o for o in re.findall(r'^\s+- "([^"]+)"', block.group(1), re.M) if not o.startswith("Other")]


def doc_problems(apps):
    """docs/apps.md has a row for every app, and the README's count matches it."""
    problems = []
    table = Path("docs/apps.md").read_text().split("\n## ", 1)[0]
    rows = [row for row in re.findall(r"^\| ([^|]+?) \|", table, re.M) if row not in ("App",) and not row.startswith("-")]
    for name in sorted(apps - set(rows), key=str.lower):
        problems.append(f"docs/apps.md: no row for \"{name}\"")
    for name in sorted(set(rows) - apps, key=str.lower):
        problems.append(f"docs/apps.md: a row for \"{name}\", which no patch supports")
    count = re.search(r"supports (\d+) Android TV apps", Path("README.md").read_text())
    if not count or int(count.group(1)) != len(apps):
        problems.append(f"README.md: the app count should say {len(apps)}")
    return problems


def main():
    apps = patched_apps()
    problems = doc_problems(apps)
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
    print(f"The issue forms, docs/apps.md, and the README list all {len(apps)} apps.")


if __name__ == "__main__":
    main()
