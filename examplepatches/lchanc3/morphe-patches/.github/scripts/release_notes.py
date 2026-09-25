#!/usr/bin/env python3
"""Write what changed in a release, from the commits since the previous one.

Usage:
    release_notes.py > notes.md             the notes for the GitHub release
    release_notes.py --changelog VERSION    add the same to CHANGELOG.md

The commits are the ones since the newest tag, which is the previous release:
this runs before the new tag exists. Their subjects follow Conventional Commits,
so `feat:` goes under 新功能, `fix:` under 修正, and anything else a user would
notice under 其他. The release commits the workflow itself makes, and changes to
the build or CI, are left out.

CHANGELOG.md is only there for Morphe Manager, which reads a changelog from the
repository and never from a release. It is written in the one format Manager
parses: a dated `# [VERSION](compare url) (YYYY-MM-DD)` heading per release and
`* **App:** text` bullets. The app in front of a bullet is what makes Manager
mark that app as updated, so 新功能 and 修正 bullets carry one -- the commit's
scope when it has one, JPTT otherwise -- and 其他 bullets do not.
"""

import datetime
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
CHANGELOG = ROOT / "CHANGELOG.md"
REPOSITORY = "lchanc3/morphe-patches"

SECTIONS = [
    ("feat", "新功能"),
    ("fix", "修正"),
    ("other", "其他"),
]

# Types that change nothing a user of the bundle can see.
SKIPPED = {"chore", "ci", "build", "test", "style"}

# The app a feat or fix belongs to when its commit names none.
DEFAULT_APP = "JPTT"

SUBJECT = re.compile(r"^(?P<type>[a-z]+)(?:\((?P<scope>[^)]*)\))?(?P<breaking>!)?:\s*(?P<text>.+)$")

FOOTER = "在 Morphe Manager 加入這個 patch 來源，或下載下面的 `.mpp` 手動匯入。"


def git(*args):
    return subprocess.run(
        ["git", *args], check=True, capture_output=True, text=True, encoding="utf-8"
    ).stdout.strip()


def previous_tag():
    try:
        return git("describe", "--tags", "--abbrev=0", "HEAD")
    except subprocess.CalledProcessError:
        return None  # The first release: every commit is new.


def subjects(since):
    revision = f"{since}..HEAD" if since else "HEAD"
    log = git("log", "--no-merges", "--reverse", "--format=%s", revision)
    return [line for line in log.splitlines() if line.strip()]


def grouped(lines):
    """The commits by section, as (app or None, text) pairs."""
    groups = {key: [] for key, _ in SECTIONS}
    for line in lines:
        match = SUBJECT.match(line)
        if not match:
            groups["other"].append((None, line))
            continue
        kind = match["type"]
        if kind in SKIPPED:
            continue
        text = match["text"]
        if match["breaking"]:
            text = "**不相容：** " + text
        if kind in ("feat", "fix"):
            groups[kind].append((match["scope"] or DEFAULT_APP, text))
        else:
            groups["other"].append((None, text))
    return groups


def release_notes(groups):
    out = []
    for key, title in SECTIONS:
        if groups[key]:
            out.append(f"## {title}\n")
            out += [f"- {text}" for _, text in groups[key]]
            out.append("")
    if not out:
        out = ["這一版沒有使用者看得到的變更。", ""]
    out.append(FOOTER)
    return "\n".join(out) + "\n"


def changelog_entry(version, since, groups, date):
    if since:
        compare = f"https://github.com/{REPOSITORY}/compare/{since}...v{version}"
        out = [f"# [{version}]({compare}) ({date})", ""]
    else:
        out = [f"# {version} ({date})", ""]
    for key, title in SECTIONS:
        if groups[key]:
            out.append(f"### {title}\n")
            out += [
                f"* **{app}:** {text}" if app else f"* {text}"
                for app, text in groups[key]
            ]
            out.append("")
    return "\n".join(out) + "\n"


def main():
    since = previous_tag()
    groups = grouped(subjects(since))

    if len(sys.argv) == 3 and sys.argv[1] == "--changelog":
        date = datetime.datetime.now(datetime.timezone.utc).date().isoformat()
        entry = changelog_entry(sys.argv[2], since, groups, date)
        existing = CHANGELOG.read_text(encoding="utf-8") if CHANGELOG.is_file() else ""
        CHANGELOG.write_text(entry + "\n" + existing if existing else entry, encoding="utf-8", newline="\n")
        print(f"CHANGELOG.md: added {sys.argv[2]}")
    elif len(sys.argv) == 1:
        sys.stdout.write(release_notes(groups))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
