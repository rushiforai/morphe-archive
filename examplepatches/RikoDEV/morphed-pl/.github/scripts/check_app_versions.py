#!/usr/bin/env python3
"""Compares the app versions the patches support with the latest on Google Play.

Reads the supported versions from Constants.kt, asks Google Play for the current version of each app
and keeps one open GitHub issue (a todo checklist) per app. A newer version is added to that app's open issue
as another checklist section, and a new issue is opened only when none is open. A version is never tracked
twice, even when its issue was closed.

Needs the `gh` CLI with GH_TOKEN set, and `google-play-scraper` installed.
"""
import json
import os
import re
import subprocess
import sys
from pathlib import Path

CONSTANTS = Path("patches/src/main/kotlin/app/polishapps/patches/shared/Constants.kt")
LABEL = "app-update"
DRY_RUN = os.environ.get("DRY_RUN") == "1"


def supported_apps():
    """Returns {packageName: (display name, set of supported versions)}."""
    source = CONSTANTS.read_text(encoding="utf-8")
    consts = dict(re.findall(r'const val (\w+)\s*=\s*"([^"]+)"', source))
    apps = {}
    for block in source.split("Compatibility(")[1:]:
        package = re.search(r'packageName\s*=\s*"([^"]+)"', block)
        if not package:
            continue
        name = re.search(r'name\s*=\s*"([^"]+)"', block)
        versions = set()
        # Every `version = X` up to the next top level declaration belongs to this app.
        for raw in re.findall(r'version\s*=\s*("[^"]+"|\w+)', block):
            value = raw.strip('"') if raw.startswith('"') else consts.get(raw)
            if value:
                versions.add(value)
        # The Yanosik targets are declared above the Compatibility(...) call, so resolve them by package.
        apps.setdefault(package.group(1), (name.group(1) if name else package.group(1), set()))[1].update(versions)
    # Targets declared outside the block (Yanosik): any 26.x constants not claimed by another app.
    yanosik = "pl.neptis.yanosik.mobi.android"
    if yanosik in apps:
        for key, value in consts.items():
            if key.startswith("YANOSIK_"):
                apps[yanosik][1].add(value)
    return apps


def key(version):
    return tuple(int(part) for part in re.findall(r"\d+", version))


def latest_version(package):
    from google_play_scraper import app
    for country in ("pl", "us"):
        try:
            version = app(package, lang="pl", country=country).get("version")
        except Exception as error:  # noqa: BLE001 - one failing app must not stop the others
            print(f"  {package} ({country}): {error}")
            continue
        if version and key(version):
            return version
    return None


def gh(*args):
    return subprocess.run(["gh", *args], check=True, capture_output=True, text=True).stdout


MARKER = re.compile(r"<!-- app-update (\{.*?\}) -->")


def tracked_issues():
    """Returns {package: [(number, state, versions, body)]} from the issues this workflow opened."""
    found = json.loads(gh("issue", "list", "--state", "all", "--label", LABEL,
                          "--json", "number,state,body", "--limit", "200"))
    issues = {}
    for issue in found:
        match = MARKER.search(issue["body"] or "")
        if not match:
            continue
        data = json.loads(match.group(1))
        issues.setdefault(data["package"], []).append(
            (issue["number"], issue["state"], data["versions"], issue["body"]))
    return issues


def marker(package, versions):
    return f"<!-- app-update {json.dumps({'package': package, 'versions': versions}, ensure_ascii=False)} -->"


def title(name, versions):
    return f"Support {name} {', '.join(versions)}"


def section(name, latest):
    return f"- [ ] {name} {latest}" + chr(10)


NL = chr(10)
HEADER = (
    "**{name}** has a newer version on Google Play than the patches support ({supported}). "
    "New versions are added to this list until the issue is closed." + NL + NL
)
FOOTER = NL + '_Maintained by the "Check app versions" workflow._' + NL


def create_issue(name, package, latest, supported):
    versions = [latest]
    text = (
        HEADER.format(name=name, package=package, supported=", ".join(sorted(supported, key=key)))
        + section(name, latest) + FOOTER + marker(package, versions)
    )
    gh("issue", "create", "--title", title(name, versions), "--label", LABEL, "--body", text)


def stack_version(number, name, package, latest, versions, text):
    """Adds a version to the open issue: new section, title and marker, plus a comment so it notifies."""
    versions = versions + [latest]
    text = MARKER.sub("", text).rstrip()
    footer = FOOTER.strip()
    if text.endswith(footer):
        text = text[: -len(footer)].rstrip()
    text = text + NL + section(name, latest) + FOOTER + marker(package, versions)
    gh("issue", "edit", str(number), "--title", title(name, versions), "--body", text)
    gh("issue", "comment", str(number), "--body", f"{name} {latest} is out on Google Play, added to the list above.")


def main():
    apps = supported_apps()
    print(f"Tracking {len(apps)} apps")
    if not DRY_RUN:
        subprocess.run(["gh", "label", "create", LABEL, "--color", "0E8A16",
                        "--description", "A new version of a patched app appeared"], capture_output=True)

    issues = {} if DRY_RUN and not os.environ.get("GH_TOKEN") else tracked_issues()
    checked = 0
    for package, (name, supported) in sorted(apps.items(), key=lambda item: item[1][0]):
        latest = latest_version(package)
        if not latest:
            print(f"{name}: could not read the Google Play version")
            continue
        checked += 1
        newest = max(supported, key=key)
        print(f"{name}: supported {sorted(supported, key=key)}, Google Play {latest}")
        if latest in supported or key(latest) <= key(newest):
            continue
        history = issues.get(package, [])
        if any(latest in versions for _, _, versions, _ in history):
            print("  already tracked")
            continue
        open_issue = next((issue for issue in history if issue[1] == "OPEN"), None)
        if DRY_RUN:
            print(f"  would {'stack onto #%d' % open_issue[0] if open_issue else 'open an issue for'} {latest}")
        elif open_issue:
            stack_version(open_issue[0], name, package, latest, open_issue[2], open_issue[3])
            print(f"  added to #{open_issue[0]}")
        else:
            create_issue(name, package, latest, supported)
            print(f"  opened an issue for {latest}")

    if checked == 0:
        sys.exit("Could not read any version from Google Play")


if __name__ == "__main__":
    main()
