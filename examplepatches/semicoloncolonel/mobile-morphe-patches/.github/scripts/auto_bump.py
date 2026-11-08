#!/usr/bin/env python3
"""Moves app versions that passed every check onto the dev branch.

Runs after app_updates.py and launch_check.py, in the bump job of the App
updates workflow, which runs only when the repository variable AUTO_BUMP is
"true". An app is bumped when all of these hold:

  - APKPure has a newer version, and its signing certificate matches the
    known-good one in .github/app-certs.json.
  - Every one of the app's patches applies to it.
  - The patched app opened on the emulator (or could not be tested there
    because it has no x86 code). A crash, a quick exit, or a failed install
    blocks the bump.
  - The app has one version pin in one Compatibility. Apps whose phone and
    Android TV builds share a package (HBO Max, NewsNation, JustWatch, Apple
    TV) keep their "ready to bump" issue for a person to handle.

The pin becomes devTarget(new version, versionCode = ...), so dev builds mark
it experimental, and the README's tested version and date are updated. The
workflow then commits to dev and starts the Release workflow, which publishes
the next dev pre-release. semantic-release numbers it from the git tags, so it
follows any dev pre-release published by hand.

    python3 .github/scripts/auto_bump.py app-updates --repo .
    python3 .github/scripts/auto_bump.py app-updates --comment <commit sha>
"""

import argparse
import datetime
import json
import os
import re
import subprocess
from pathlib import Path

TITLE_PREFIX = "App update: "
ISSUE_LABEL = "app update"
DEV_TARGET_IMPORT = "import semicoloncolonel.mobilestream.patches.shared.misc.devTarget"


def call_end(text, open_paren):
    """Index just past the parenthesis that closes the one at open_paren."""
    depth, i, quote = 0, open_paren, None
    while i < len(text):
        c = text[i]
        if quote:
            if c == "\\":
                i += 1
            elif c == quote:
                quote = None
        elif c == '"':
            quote = c
        elif c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                return i + 1
        i += 1
    return None


def compatibilities(repo, package):
    """[(path, start, end)] of every Compatibility(...) block for package."""
    found = []
    for path in sorted(Path(repo, "patches/src/main/kotlin").rglob("Constants.kt")):
        text = path.read_text()
        constants = dict(re.findall(r'val\s+([A-Z_]+)\s*=\s*"([^"]+)"', text))
        for match in re.finditer(r"\bCompatibility\(", text):
            end = call_end(text, match.end() - 1)
            if end is None:
                continue
            block = text[match.start():end]
            pkg = re.search(r'packageName\s*=\s*(?:"([^"]+)"|([A-Z_]+))', block)
            if pkg and (pkg.group(1) or constants.get(pkg.group(2))) == package:
                found.append((path, match.start(), end))
    return found


def bump_constants(repo, package, old, new, code):
    """Rewrites the single pin. Returns a reason when it cannot, else None."""
    blocks = compatibilities(repo, package)
    if len(blocks) != 1:
        return f"{len(blocks)} Compatibility entries for the package"
    path, start, end = blocks[0]
    text = path.read_text()
    block = text[start:end]
    targets = list(re.finditer(r"\b(?:AppTarget|devTarget)\(", block))
    if len(targets) != 1:
        return f"{len(targets)} version pins"
    call_start = targets[0].start()
    call_stop = call_end(block, targets[0].end() - 1)
    call = block[call_start:call_stop]
    pinned = re.search(r'(?:version\s*=\s*)?"([^"]+)"', call)
    if not pinned or pinned.group(1) != old:
        return f"the pin is not {old}"
    description = re.search(r'description\s*=\s*("(?:[^"\\]|\\.)*")', call)
    args = [f'"{new}"']
    if code:
        args.append(f"versionCode = {code}")
    if description:
        args.append(f"description = {description.group(1)}")
    new_block = block[:call_start] + f"devTarget({', '.join(args)})" + block[call_stop:]
    text = text[:start] + new_block + text[end:]
    if DEV_TARGET_IMPORT not in text:
        imports = list(re.finditer(r"^import .+$", text, re.M))
        at = imports[-1].end() if imports else text.index("\n", text.index("package ")) + 1
        text = text[:at] + "\n" + DEV_TARGET_IMPORT + text[at:]
    if "AppTarget(" not in text:
        text = re.sub(r"^import app\.morphe\.patcher\.patch\.AppTarget\n", "", text, flags=re.M)
    path.write_text(text)
    return None


def bump_readme(repo, name, old, new):
    """Updates the app's row in the README. Returns False when no row matched."""
    readme = Path(repo, "README.md")
    lines = readme.read_text().split("\n")
    today = datetime.date.today().strftime("%m/%d/%y")
    for i, line in enumerate(lines):
        if re.match(rf"\| {re.escape(name)}( [^|]*)? \|", line) and f"`{old}`" in line:
            cells = line.split("|")
            cells[-2] = f" {today} "
            lines[i] = "|".join(cells).replace(f"`{old}`", f"`{new}`", 1)
            readme.write_text("\n".join(lines))
            return True
    return False


def qualifies(record, launches):
    """Why the app is not bumped, or None when it is."""
    if record.get("status") != "update":
        return "no update"
    if record.get("cert") != "matches":
        return f"certificate {record.get('cert')}"
    if not record.get("patched_apk"):
        return "not every patch applied"
    launch = launches.get(record["package"])
    if not launch or launch.get("version") != record.get("latest"):
        return "no launch check"
    if not launch.get("ok"):
        return f"launch check: {launch.get('result')}"
    if len(record.get("targets") or []) != 1:
        return "more than one version pin"
    return None


def bump(report, repo):
    results = json.loads((report / "app-updates.json").read_text())
    launch_file = report / "launch.json"
    launches = json.loads(launch_file.read_text()) if launch_file.exists() else {}
    bumped = []
    for record in results:
        reason = qualifies(record, launches)
        if reason is None:
            reason = bump_constants(repo, record["package"], record["pinned"], record["latest"],
                                    record.get("version_code"))
        if reason:
            if record.get("status") == "update":
                print(f"{record['name']} {record.get('latest')}: not bumped ({reason})")
            continue
        readme = bump_readme(repo, record["name"], record["pinned"], record["latest"])
        bumped.append({"package": record["package"], "name": record["name"], "from": record["pinned"],
                       "to": record["latest"], "version_code": record.get("version_code"),
                       "launch": launches[record["package"]]["result"], "readme": readme})
        print(f"{record['name']}: {record['pinned']} -> {record['latest']}")
    (report / "bumped.json").write_text(json.dumps(bumped, indent=2))
    if bumped:
        subject = "fix: support " + ", ".join(f"{b['name']} {b['to']}" for b in bumped)
        body = "\n".join(
            f"- {b['name']} {b['from']} -> {b['to']}: every patch applied, and the launch check said "
            f"{b['launch']}." for b in bumped)
        (report / "bump-message.txt").write_text(f"{subject}\n\nAutomatic bump on dev.\n\n{body}\n")


def comment(report, sha):
    bumped = json.loads((report / "bumped.json").read_text())
    repo = os.environ.get("GITHUB_REPOSITORY", "")
    for b in bumped:
        title = f"{TITLE_PREFIX}{b['name']} {b['to']}"
        issues = json.loads(subprocess.run(
            ["gh", "issue", "list", "--label", ISSUE_LABEL, "--state", "open", "--search", f'in:title "{title}"',
             "--json", "number,title"], capture_output=True, text=True).stdout or "[]")
        match = next((i for i in issues if i["title"] == title), None)
        if not match:
            continue
        text = (f"Bumped to `{b['to']}` on dev in {repo}@{sha[:7]}. The next dev pre-release includes it, "
                f"marked experimental. Check it on a device before it goes to main.\n")
        subprocess.run(["gh", "issue", "comment", str(match["number"]), "--body-file", "-"],
                       input=text, capture_output=True, text=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("report", type=Path, help="the app-updates output folder")
    parser.add_argument("--repo", type=Path, default=Path("."))
    parser.add_argument("--comment", metavar="SHA", help="comment on the bumped apps' issues instead")
    args = parser.parse_args()
    if args.comment:
        comment(args.report, args.comment)
    else:
        bump(args.report, args.repo)


if __name__ == "__main__":
    main()
