"""Checks that the issue forms' App dropdowns list every app the patches support,
and that docs/apps.md and the README's app counts match those apps.

The dropdowns in the bug report and enhancement forms are kept by hand. This
compares them with the Compatibility names in the patches, leaving out the
apps build.gradle.kts excludes from the bundle, and with each other.

Run from the repository root: python3 .github/scripts/check_issue_forms.py
"""

import fnmatch
import re
import sys
from pathlib import Path

FORMS = [Path(".github/ISSUE_TEMPLATE/0-version-or-build.yml"), Path(".github/ISSUE_TEMPLATE/1-bug-report.yml"),
         Path(".github/ISSUE_TEMPLATE/2-enhancement.yml")]


def excluded_globs():
    text = Path("patches/build.gradle.kts").read_text()
    block = re.search(r"kotlin\.exclude\((.*?)\)", text, re.S)
    return re.findall(r'"([^"]+)"', block.group(1)) if block else []


def patched_apps():
    """The apps this source patches. Android TV apps, named "... (Android TV)",
    are in tv-morphe-patches."""
    globs = excluded_globs()
    names = set()
    for path in Path("patches/src/main/kotlin").rglob("*.kt"):
        if any(fnmatch.fnmatch(path.as_posix(), glob) for glob in globs):
            continue
        names.update(re.findall(r'Compatibility\(\s*name\s*=\s*"([^"]+)"', path.read_text()))
    return {name for name in names if not name.endswith("(Android TV)")}


def form_apps(form):
    text = form.read_text()
    block = re.search(r"id: app\n(.*?)(?=\n  - type:)", text, re.S)
    if not block:
        return None
    return [o for o in re.findall(r'^\s+- "([^"]+)"', block.group(1), re.M) if not o.startswith("Other")]


def apps_md_rows():
    """{section: [app names]} from the tables in docs/apps.md."""
    sections, section = {}, None
    for line in Path("docs/apps.md").read_text().splitlines():
        heading = re.match(r"## (\S.*)$", line)
        if heading:
            section = heading.group(1)
            sections[section] = []
            continue
        row = re.match(r"\| ([^|]+?) \|", line)
        if section and row and not line.startswith(("| App |", "|---")):
            # "Disney+ (also on Android TV)" is the Disney+ app.
            sections[section].append(re.sub(r" \(also on Android TV\)$", "", row.group(1)))
    return sections


def doc_problems(apps):
    """docs/apps.md has a row for every app, and the README's counts match it."""
    problems = []
    sections = apps_md_rows()
    rows = [name for names in sections.values() for name in names]
    for name in sorted(apps - set(rows), key=str.lower):
        problems.append(f"docs/apps.md: no row for \"{name}\"")
    readme = Path("README.md").read_text()
    badge = re.search(r"badge/apps-(\d+)-", readme)
    if not badge or int(badge.group(1)) != len(apps):
        problems.append(f"README.md: the apps badge should say {len(apps)}")
    for section, names in sections.items():
        count = re.search(rf"\| \[{re.escape(section)}\]\(docs/apps\.md#[^)]+\) \| (\d+) \|", readme)
        if not count:
            problems.append(f"README.md: the Apps table has no {section} row")
        elif int(count.group(1)) != len(names):
            problems.append(f"README.md: {section} should say {len(names)}, as docs/apps.md lists")
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
