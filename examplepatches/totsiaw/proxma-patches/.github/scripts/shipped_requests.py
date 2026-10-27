#!/usr/bin/env python3
"""Match what a release newly supports against open requests.

Diffs patches-list.json of the previous release against this one and prints
one JSON line per action:
  {"kind": "discussion", "number": N, "app": ..., "comment": ..., "close": bool}
  {"kind": "issue", "number": N, "app": ..., "comment": ...}

New apps -> open app-request discussions (closed on stable only).
New versions of an existing app -> open app-update issues asking for that
version (comment only; the reporter closes the issue).

Usage: shipped_requests.py <previous.json> <current.json> <discussions.json> <issues.json> <tag>
"""

import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from replies import shipped_prerelease, shipped_stable, version_bump

PACKAGE = re.compile(r"\b[A-Za-z][A-Za-z0-9_]*(?:\.[A-Za-z0-9_]+){2,}\b")
NOT_PACKAGES = ("play.google.com", "www.", "github.com", "apkpure.", "apkmirror.")


def supported(data):
    """{packageName: {"name": display name, "versions": set of target versions}}"""
    apps = {}
    for patch in data.get("patches", []):
        for pkg in patch.get("compatiblePackages") or []:
            entry = apps.setdefault(
                pkg["packageName"].lower(),
                {"name": pkg.get("name") or pkg["packageName"], "versions": set()},
            )
            for target in pkg.get("targets") or []:
                if target.get("version"):
                    entry["versions"].add(target["version"])
    return apps


def packages_in(text):
    return {m.lower() for m in PACKAGE.findall(text) if not m.lower().startswith(NOT_PACKAGES)}


def normalize(text):
    return re.sub(r"[^a-z0-9]", "", text.lower())


def mentions(text, pkg, name):
    if pkg in packages_in(text):
        return True
    norm = normalize(name)
    return len(norm) >= 4 and norm in normalize(text)


def bot_said(comments, marker):
    return any(marker in (c.get("body") or "") for c in comments)


def form_field(body, label):
    """Value of a '### <label>' section in an issue-form body."""
    match = re.search(rf"^###\s+{re.escape(label)}\s*\n+(.+?)\s*(?:\n###|\Z)", body, re.M | re.S)
    return match.group(1).strip() if match else ""


def main():
    prev_path, cur_path, disc_path, issues_path, tag = sys.argv[1:6]
    previous = supported(json.loads(Path(prev_path).read_text()))
    current = supported(json.loads(Path(cur_path).read_text()))
    discussions = json.loads(Path(disc_path).read_text())
    issues = json.loads(Path(issues_path).read_text())

    prerelease = bool(re.search(r"-(dev|rc|beta|alpha)\.", tag))

    new_apps = {p: a for p, a in current.items() if p not in previous}
    new_versions = {
        p: (a["name"], a["versions"] - previous[p]["versions"])
        for p, a in current.items()
        if p in previous and a["versions"] - previous[p]["versions"]
    }

    marker = "proxma-prerelease" if prerelease else "proxma-shipped"
    for disc in discussions:
        if disc.get("state") != "OPEN":
            continue
        if bot_said(disc.get("comments", {}).get("nodes", []), marker):
            continue
        text = f"{disc.get('title') or ''}\n{disc.get('body') or ''}"
        for pkg, app in new_apps.items():
            if mentions(text, pkg, app["name"]):
                reply = shipped_prerelease if prerelease else shipped_stable
                print(json.dumps({
                    "kind": "discussion",
                    "number": disc["number"],
                    "app": app["name"],
                    "comment": reply(app["name"], tag),
                    "close": not prerelease,
                }))
                break

    for issue in issues:
        body = issue.get("body") or ""
        wanted = form_field(body, "New version available")
        selected = form_field(body, "App (current supported version)")
        if not wanted:
            continue
        for pkg, (name, versions) in new_versions.items():
            if wanted.lstrip("vV") in versions and re.match(rf"{re.escape(name)}\s+[\d(]", selected, re.I):
                marker_v = f"proxma-version-bump:{wanted.lstrip('vV')}:{'pre' if prerelease else 'stable'}"
                if bot_said(issue.get("comments") or [], marker_v):
                    break
                print(json.dumps({
                    "kind": "issue",
                    "number": issue["number"],
                    "app": name,
                    "comment": version_bump(name, wanted.lstrip("vV"), tag, prerelease),
                }))
                break


if __name__ == "__main__":
    main()
