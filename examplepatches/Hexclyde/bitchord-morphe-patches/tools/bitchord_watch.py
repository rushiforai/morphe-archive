#!/usr/bin/env python3
"""Find new BitChord versions to test, and report the results as issues.

    bitchord_watch.py targets [--force]        JSON list of builds to test
    bitchord_watch.py report RESULTS_DIR       open or update one issue per version

BitChord develops each version on a vX.Y.Z branch and tags it when released.
A published release is tested from its APKs; an unreleased version branch is
tested from a build of its latest commit. Versions up to the one this patch
already supports (PROVENANCE.json app_version) are skipped.

Uses GITHUB_TOKEN when set; report also needs GITHUB_REPOSITORY.
"""

import argparse
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
UPSTREAM = "kushagrasinghx/BitChord"
ABIS = ["arm64-v8a", "armeabi-v7a", "x86_64"]
LABEL = "bitchord-compat"
MARKER = re.compile(r"<!-- bitchord-compat (\{.*?\}) -->")
VERSION = re.compile(r"^v(\d+(?:\.\d+)*)$")


def api(path, method="GET", body=None):
    request = urllib.request.Request(
        "https://api.github.com/" + path.lstrip("/"),
        data=None if body is None else json.dumps(body).encode(),
        method=method,
        headers={
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    if os.environ.get("GITHUB_TOKEN"):
        request.add_header("Authorization", "Bearer " + os.environ["GITHUB_TOKEN"])
    with urllib.request.urlopen(request, timeout=60) as response:
        data = response.read()
        return json.loads(data) if data else None


def paged(path):
    page = 1
    while True:
        items = api(f"{path}{'&' if '?' in path else '?'}per_page=100&page={page}")
        yield from items
        if len(items) < 100:
            return
        page += 1


def version_key(text):
    return tuple(int(part) for part in text.split("."))


def supported_version():
    return json.loads((ROOT / "PROVENANCE.json").read_text())["app_version"]


def compat_issues(repo):
    """Existing compatibility issues by version, with the state recorded in each."""
    issues = {}
    for issue in paged(f"repos/{repo}/issues?state=all&labels={LABEL}"):
        found = MARKER.search(issue.get("body") or "")
        if found:
            state = json.loads(found.group(1))
            issues[state["version"]] = {"issue": issue, "state": state}
    return issues


def targets(force):
    supported = version_key(supported_version())
    releases = {}
    for release in paged(f"repos/{UPSTREAM}/releases"):
        match = VERSION.match(release["tag_name"])
        if release["draft"] or not match or version_key(match.group(1)) <= supported:
            continue
        assets = {}
        for asset in release["assets"]:
            for abi in ABIS:
                if asset["name"].endswith(f"_{abi}.apk"):
                    assets[abi] = asset["browser_download_url"]
        if assets:
            releases[match.group(1)] = {
                "kind": "release",
                "ref": release["tag_name"],
                "id": str(release["id"]) + ":" + ",".join(sorted(assets.values())),
                "apks": assets,
            }
    branches = {}
    for branch in paged(f"repos/{UPSTREAM}/branches"):
        match = VERSION.match(branch["name"])
        if match and version_key(match.group(1)) > supported:
            branches[match.group(1)] = {
                "kind": "branch",
                "ref": branch["name"],
                "id": branch["commit"]["sha"],
            }
    # A release supersedes the branch it was built from.
    found = {**branches, **releases}
    repo = os.environ.get("GITHUB_REPOSITORY")
    tested = {} if force or not repo else compat_issues(repo)
    result = []
    for version in sorted(found, key=version_key, reverse=True)[:3]:
        target = dict(found[version], version=version)
        last = tested.get(version, {}).get("state", {})
        if last.get("kind") == target["kind"] and last.get("id") == target["id"]:
            continue
        result.append(target)
    return result


def render(target, result, run_url):
    state = {
        "version": target["version"],
        "kind": target["kind"],
        "ref": target["ref"],
        "id": target["id"],
        "passed": result["passed"],
    }
    source = (
        f"release [{target['ref']}](https://github.com/{UPSTREAM}/releases/tag/{target['ref']})"
        if target["kind"] == "release"
        else f"branch [{target['ref']}](https://github.com/{UPSTREAM}/tree/{target['ref']}) "
        f"at [`{target['id'][:7]}`](https://github.com/{UPSTREAM}/commit/{target['id']})"
    )
    if result["passed"]:
        next_step = (
            "The patch applies and every check passes. To support this version, add it to the "
            "patch's compatible versions, test it on a phone and publish a release."
        )
    else:
        next_step = (
            "At least one hook no longer matches this build. The reason below names the hook "
            "(file and line in `TelegramPatch.kt`). Update it before this version is released, "
            "or add support once it is."
        )
    body = (
        f"Automatic check of BitChord **{target['version']}** ({source}) against this patch.\n\n"
        f"{next_step}\n\n{result['summary']}\n"
        f"[Workflow run]({run_url})\n\n<!-- bitchord-compat {json.dumps(state)} -->\n"
    )
    return state, body


def report(results_dir):
    repo = os.environ["GITHUB_REPOSITORY"]
    run_url = (
        f"{os.environ.get('GITHUB_SERVER_URL', 'https://github.com')}/{repo}/actions/runs/"
        f"{os.environ.get('GITHUB_RUN_ID', '')}"
    )
    try:
        api(
            f"repos/{repo}/labels",
            "POST",
            {
                "name": LABEL,
                "color": "5319e7",
                "description": "Automatic BitChord compatibility check",
            },
        )
    except urllib.error.HTTPError as error:
        if error.code != 422:  # already exists
            raise
    existing = compat_issues(repo)
    for folder in sorted(Path(results_dir).iterdir()):
        target_file, result_file = folder / "target.json", folder / "result.json"
        if not target_file.exists():
            continue
        target = json.loads(target_file.read_text())
        if result_file.exists():
            result = json.loads(result_file.read_text())
            result["summary"] = (folder / "summary.md").read_text()
        else:
            result = {
                "passed": False,
                "summary": "The BitChord build or download failed before the patch could be "
                "tried. See the workflow run for details.\n",
            }
        state, body = render(target, result, run_url)
        verdict = "passes" if state["passed"] else "fails"
        current = existing.get(target["version"])
        if current is None:
            title = f"BitChord {target['version']} compatibility"
            issue = api(
                f"repos/{repo}/issues",
                "POST",
                {"title": title, "body": body, "labels": [LABEL]},
            )
            print(f"{target['version']}: opened #{issue['number']} ({verdict})")
            continue
        issue, last = current["issue"], current["state"]
        api(f"repos/{repo}/issues/{issue['number']}", "PATCH", {"body": body})
        if last.get("passed") != state["passed"]:
            what = "now passes" if state["passed"] else "fails"
            api(
                f"repos/{repo}/issues/{issue['number']}/comments",
                "POST",
                {
                    "body": f"{target['kind'].capitalize()} `{target['ref']}` "
                    f"({target['id'][:12]}) {what}. [Workflow run]({run_url})"
                },
            )
        if issue["state"] == "closed" and not state["passed"]:
            api(f"repos/{repo}/issues/{issue['number']}", "PATCH", {"state": "open"})
        print(f"{target['version']}: updated #{issue['number']} ({verdict})")


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    commands = parser.add_subparsers(dest="command", required=True)
    find = commands.add_parser("targets")
    find.add_argument(
        "--force", action="store_true", help="Test even builds already reported"
    )
    send = commands.add_parser("report")
    send.add_argument("results", type=Path)
    args = parser.parse_args()
    if args.command == "targets":
        print(json.dumps(targets(args.force)))
    else:
        report(args.results)


if __name__ == "__main__":
    sys.exit(main())
