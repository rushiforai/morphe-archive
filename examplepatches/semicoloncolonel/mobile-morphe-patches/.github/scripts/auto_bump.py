#!/usr/bin/env python3
"""Moves app versions that passed every check onto the dev branch.

Runs after app_updates.py and launch_check.py, in the bump job of the App
updates workflow, which runs only when the repository variable AUTO_BUMP is
"true". An app is bumped when all of these hold:

  - APKPure has a newer version, and its signing certificate matches the
    known-good one in .github/app-certs.json. A staged rollout that Google
    Play has not released to everyone counts, because dev is for testing;
    the commit message says it is a rollout.
  - Every one of the app's patches applies to it.
  - The launch check ran on the emulator. Its result does not block the bump:
    dev is for testing, so a crash, a quick exit, or a failed install still
    ships to dev, where it can be debugged. The result is recorded on the
    issue and in the dev commit, and a build that did not open cleanly keeps
    its "experimental" or "needs review" label. The certificate must still
    match and every patch must still apply, so an untrusted or unbuildable
    download is never shipped.
  - The app has one version pin in one Compatibility. Apps whose phone and
    Android TV builds share a package (HBO Max, NewsNation, JustWatch, Apple
    TV) keep their "ready to bump" issue for a person to handle.

The pin becomes devTarget(new version, versionCode = ...), so dev builds mark
it experimental, and the tested version and date in docs/apps.md are updated. The
workflow then commits to dev and starts the Release workflow, which publishes
the next dev pre-release. semantic-release numbers it from the git tags, so it
follows any dev pre-release published by hand.

    python3 .github/scripts/auto_bump.py app-updates --repo .
    python3 .github/scripts/auto_bump.py app-updates --comment <commit sha> [--release <tag>]

The workflow waits for the Release run. When it succeeds, each bumped app's
issue is labeled "testing on dev" and gets a comment that links the
pre-release and asks people to report how it works. The update check closes
the issue once a main release targets the version.
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
READY_LABEL = "ready to bump"
TESTING_LABEL = "testing on dev"
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
    """Updates the app's row in docs/apps.md. Returns False when no row matched."""
    readme = Path(repo, "docs", "apps.md")
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
    """Why the app is not bumped, or None when it is. Dev is for testing, so the
    launch result does not block the bump; only an untrusted download, a patch
    that did not apply, or an ambiguous pin does."""
    if record.get("status") != "update":
        return "no update"
    if record.get("cert") != "matches":
        return f"certificate {record.get('cert')}"
    if not record.get("patched_apk"):
        return "not every patch applied"
    launch = launches.get(record["package"])
    if not launch or launch.get("version") != record.get("latest"):
        return "no launch check"
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
                       "launch": launches[record["package"]]["result"], "readme": readme,
                       "rollout": record.get("rollout", False), "play": record.get("play")})
        print(f"{record['name']}: {record['pinned']} -> {record['latest']}")
    (report / "bumped.json").write_text(json.dumps(bumped, indent=2))
    if bumped:
        # "testing", not "support": nobody has checked the bump on a device yet.
        subject = "fix: testing " + ", ".join(f"{b['name']} {b['to']}" for b in bumped)
        body = "\n".join(
            f"- {b['name']} {b['from']} -> {b['to']}: every patch applied, and the launch check said "
            f"{b['launch']}."
            + (f" Staged rollout: Google Play still serves {b['play']} to an ordinary phone." if b["rollout"] else "")
            for b in bumped)
        (report / "bump-message.txt").write_text(f"{subject}\n\nAutomatic bump on dev.\n\n{body}\n")


def comment(report, sha, release=None):
    """Comments on each bumped app's issue. With the tag of the dev pre-release
    that includes the bump, the issue is labeled "testing on dev" and asks for
    reports. It stays open until a main release targets the version."""
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
        if release:
            text = (f"Bumped to `{b['to']}` on dev in {repo}@{sha[:7]}. It is in the pre-release "
                    f"[{release}](https://github.com/{repo}/releases/tag/{release}), marked experimental, "
                    f"and it has not been tested on a device yet.\n\n"
                    f"If you try it, please comment here with what works and what does not, along with your "
                    f"device and Android version. This issue closes when a main release includes this version.\n")
            # Colors and descriptions come from .github/labels.json; this only fills in a missing label.
            subprocess.run(["gh", "label", "create", TESTING_LABEL], capture_output=True, text=True)
            subprocess.run(["gh", "issue", "edit", str(match["number"]), "--add-label", TESTING_LABEL,
                            "--remove-label", READY_LABEL], capture_output=True, text=True)
            subprocess.run(["gh", "issue", "comment", str(match["number"]), "--body-file", "-"],
                           input=text, capture_output=True, text=True)
        else:
            text = (f"Bumped to `{b['to']}` on dev in {repo}@{sha[:7]}. The dev pre-release did not finish, "
                    f"so this stays open until a dev pre-release includes it.\n")
            subprocess.run(["gh", "issue", "comment", str(match["number"]), "--body-file", "-"],
                           input=text, capture_output=True, text=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("report", type=Path, help="the app-updates output folder")
    parser.add_argument("--repo", type=Path, default=Path("."))
    parser.add_argument("--comment", metavar="SHA", help="comment on the bumped apps' issues instead")
    parser.add_argument("--release", metavar="TAG", help="with --comment: the dev pre-release that includes "
                        "the bump; closes the issues")
    args = parser.parse_args()
    if args.comment:
        comment(args.report, args.comment, args.release)
    else:
        bump(args.report, args.repo)


if __name__ == "__main__":
    main()
