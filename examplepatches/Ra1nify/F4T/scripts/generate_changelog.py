#!/usr/bin/env python3
"""Build a release changelog from the conventional commits in a git range.

Groups commits the way the other Morphe bundles do:

    feat     -> New Features
    fix      -> Bug Fixes
    improve  -> Improvements
    perf     -> Performance
    bump     -> Updated App Support

Everything else (`chore`, `ci`, `build`, `docs`, `refactor`, `test`, and any
message that is not a conventional commit) is dropped from the grouped
sections. When the range contains no conventional commit at all, the plain
subjects are listed under "Other Changes" so the section is never empty.
"""
import argparse
import datetime
import re
import subprocess
import sys

SECTIONS = [
    ("feat", "New Features"),
    ("fix", "Bug Fixes"),
    ("improve", "Improvements"),
    ("perf", "Performance"),
    ("bump", "Updated App Support"),
]

HEADING = {
    "New Features": "\u2728 New Features",
    "Bug Fixes": "\U0001f41b Bug Fixes",
    "Improvements": "\U0001f527 Improvements",
    "Performance": "\u26a1 Performance",
    "Updated App Support": "\U0001f680 Updated App Support",
    "Other Changes": "Other Changes",
}

# `type(scope)!: subject` or `type: subject`
CONVENTIONAL = re.compile(
    r"^(?P<type>[a-zA-Z]+)(?:\((?P<scope>[^)]*)\))?(?P<breaking>!)?:\s*(?P<subject>.+)$"
)

HIDDEN_TYPES = {"chore", "ci", "build", "docs", "refactor", "test", "style", "revert"}

# Only these tags mark a release. `dev` is the rolling dev pre-release container and must not be
# treated as a release boundary.
RELEASE_TAG_GLOB = "v*"


def git(*args):
    result = subprocess.run(
        ["git", *args], capture_output=True, text=True, encoding="utf-8", errors="replace"
    )
    if result.returncode != 0:
        sys.exit(f"git {' '.join(args)} failed:\n{result.stderr.strip()}")
    return result.stdout


def previous_release():
    """The ref the next release should be compared against.

    Only `v*` tags count as releases. The `dev` tag is the rolling container of the dev pre-release,
    and counting it here would truncate the range of every changelog to "since the last dev build".

    The closest reachable tag is used first. When the history was rewritten (the tags then point at
    commits that are no longer ancestors), the newest tag by creation date is used instead, and only
    when there is no tag at all does the comparison fall back to the root commit.
    """
    described = subprocess.run(
        ["git", "describe", "--tags", "--abbrev=0", "--match", RELEASE_TAG_GLOB],
        capture_output=True, text=True, encoding="utf-8", errors="replace",
    )
    if described.returncode == 0 and described.stdout.strip():
        return described.stdout.strip()

    tags = subprocess.run(
        ["git", "tag", "--sort=-creatordate", "--list", RELEASE_TAG_GLOB],
        capture_output=True, text=True, encoding="utf-8", errors="replace",
    )
    if tags.returncode == 0:
        newest = next((line.strip() for line in tags.stdout.splitlines() if line.strip()), None)
        if newest:
            print(
                f"generate_changelog: no reachable tag, using the newest tag {newest}",
                file=sys.stderr,
            )
            return newest

    return git("rev-list", "--max-parents=0", "HEAD").split()[0]


def collect(from_ref, to_ref):
    raw = git("log", "--no-merges", "--pretty=%s", f"{from_ref}..{to_ref}")
    return [line.strip() for line in raw.splitlines() if line.strip()]


def classify(subjects):
    grouped = {name: [] for _, name in SECTIONS}
    other = []

    for subject in subjects:
        match = CONVENTIONAL.match(subject)
        if not match:
            other.append(subject)
            continue

        kind = match.group("type").lower()
        scope = (match.group("scope") or "").strip()
        text = match.group("subject").strip()
        if match.group("breaking"):
            text = f"{text} (breaking)"

        section = next((name for key, name in SECTIONS if key == kind), None)
        if section is None:
            # Hidden types are dropped; unknown types are kept so nothing is lost silently.
            if kind in HIDDEN_TYPES:
                continue
            other.append(subject)
            continue

        grouped[section].append(f"**{scope}:** {text}" if scope else text)

    return grouped, other


def render(grouped, other, version, date, from_ref=None, to_ref=None, note=None):
    lines = [f"## {version} ({date})", ""]

    if note:
        lines.extend([f"> {note}", ""])

    if from_ref:
        commit_count = len(git("log", "--no-merges", "--pretty=%s", f"{from_ref}..{to_ref}").splitlines())
        lines.extend([f"Range: `{from_ref}`..`{to_ref}` ({commit_count} commit(s))", ""])

    for _, name in SECTIONS:
        entries = grouped[name]
        if not entries:
            continue
        lines.append(f"### {HEADING[name]}")
        lines.append("")
        lines.extend(f"- {entry}" for entry in entries)
        lines.append("")

    # Conventional commits produced nothing usable, so fall back to the raw subjects. Otherwise the
    # non-conventional commits are dropped, the way the grouped changelogs of other bundles behave.
    if other and not any(grouped.values()):
        lines.append(f"### {HEADING['Other Changes']}")
        lines.append("")
        lines.extend(f"- {entry}" for entry in other)
        lines.append("")

    if len(lines) <= 2:
        lines.extend(["- Maintenance release.", ""])

    return "\n".join(lines).rstrip() + "\n"


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("from_ref", nargs="?", default=None,
                        help="start of the range; defaults to the previous release tag")
    parser.add_argument("to_ref", nargs="?", default="HEAD")
    parser.add_argument("--version", required=True)
    parser.add_argument("--date", default=None)
    parser.add_argument("--append", default=None, help="prepend the section to this markdown file")
    parser.add_argument("--output", default=None, help="write the section here instead of stdout")
    parser.add_argument("--note", default=None,
                        help="one-line banner under the version heading, e.g. 'Automated dev build'")
    args = parser.parse_args()

    date = args.date or datetime.date.today().isoformat()
    from_ref = args.from_ref or previous_release()
    subjects = collect(from_ref, args.to_ref)
    grouped, other = classify(subjects)
    section = render(grouped, other, args.version, date,
                     from_ref=from_ref, to_ref=args.to_ref, note=args.note)

    if args.output:
        with open(args.output, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(section)
    elif not args.append:
        sys.stdout.write(section)

    if args.append:
        try:
            with open(args.append, encoding="utf-8") as handle:
                existing = handle.read()
        except FileNotFoundError:
            existing = "# Changelog\n"

        marker = "\n## "
        index = existing.find(marker)
        if index == -1:
            updated = existing.rstrip() + "\n\n" + section
        else:
            head = existing[:index].rstrip()
            rest = existing[index:].lstrip("\n")
            updated = f"{head}\n\n{section}\n{rest}"

        with open(args.append, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(updated)

    print(f"generate_changelog: {from_ref}..{args.to_ref} -> {args.version}", file=sys.stderr)


if __name__ == "__main__":
    main()
