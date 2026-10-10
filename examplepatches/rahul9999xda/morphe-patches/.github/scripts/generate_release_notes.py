#!/usr/bin/env python3
import re
import subprocess
import sys
from collections import OrderedDict

CATEGORIES = OrderedDict([
    ("✨ New Features", {"feat", "feature", "add", "added"}),
    ("🐛 Fixes", {"fix", "fixed", "bug", "hotfix"}),
    ("🚀 Updated App Support", {"bump", "update", "updated", "support", "compat"}),
    ("🔧 Improvements", {"perf", "improve", "improved", "enhance", "enhanced", "change", "changes"}),
    ("🏗️ Build / Compatibility", {"build", "ci", "chore", "gradle", "workflow"}),
    ("📚 Documentation", {"docs", "doc", "readme"}),
    ("♻️ Refactoring", {"refactor", "cleanup"}),
])


def git(*args):
    return subprocess.check_output(["git", *args], text=True).strip()


def conventional_type(subject):
    m = re.match(r"^([a-zA-Z]+)(?:\([^)]*\))?!?:\s*(.+)$", subject)
    if m:
        return m.group(1).lower(), m.group(2).strip()
    return "", subject.strip()


def main():
    if len(sys.argv) != 4:
        raise SystemExit("Usage: generate_release_notes.py VERSION PREVIOUS_TAG OUTPUT")

    version, previous, output = sys.argv[1:]
    if previous:
        raw = git("log", "--format=%s%x1f%b%x1e", f"{previous}..HEAD")
    else:
        raw = git("log", "--format=%s%x1f%b%x1e")

    commits = []
    for record in raw.split("\x1e"):
        record = record.strip()
        if not record:
            continue
        subject, _, body = record.partition("\x1f")
        if re.match(r"^chore:\s*Release\s+v", subject, re.I):
            continue
        commits.append((subject, body.strip()))

    buckets = OrderedDict((name, []) for name in CATEGORIES)
    buckets["📌 Other Changes"] = []

    for subject, body in commits:
        typ, text = conventional_type(subject)
        placed = False
        for category, types in CATEGORIES.items():
            if typ in types:
                buckets[category].append(text or subject)
                placed = True
                break
        if not placed:
            buckets["📌 Other Changes"].append(text or subject)

    lines = [f"## Release {version}", "", "### Changes / Fixes", ""]
    if not commits:
        lines.append("- No code or patch commits were found since the previous release.")
    else:
        for category, items in buckets.items():
            if not items:
                continue
            lines += [f"### {category}", ""]
            seen = set()
            for item in items:
                item = re.sub(r"\s+", " ", item).strip()
                if not item or item in seen:
                    continue
                seen.add(item)
                lines.append(f"- {item}")
            lines.append("")

    lines += ["### Release information", "", f"- **Version:** `{version}`"]
    if previous:
        lines.append(f"- **Changes since:** `{previous}`")
    lines.append("")
    lines.append("This release was built automatically by the repository release workflow.")
    lines.append("")

    with open(output, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))


if __name__ == "__main__":
    main()
