#!/usr/bin/env python3
"""Generate the GitHub release body for a Morphe bundle release, in the
changelog style used by hxreborn/morphe-patches:

    ## [0.0.3](https://github.com/OWNER/REPO/releases/tag/v0.0.3) (2026-11-17)

    ### Bug Fixes

    * App - Patch name: what changed (abc1234), closes #12

    ### New Features

    * App - Patch name: what changed (abc1234)

    ### Updated App Support

    * App: add support for 6.63 (abc1234)

Sources, combined:
- Conventional commits since the previous release. fix(<app>): goes to
  Bug Fixes, feat(<app>): to New Features, and any commit whose subject
  says "add support for X" goes to Updated App Support. The line text is
  the commit subject after the prefix; the trailing hash is the commit's
  short SHA; "closes #N" is picked up from the subject or body.
  Commits whose scope is not an app folder (checker, release, docs, ci)
  are ignored.
- The patches-list.json diff vs the previous release covers promote
  syncs, whose commit subjects are the generic "update patches": a patch
  that is new (or whose description changed) becomes a New Features line
  using the patch's own name + description, attributed to the sync commit
  for that app (falling back to the triggering commit). Target versions
  added for an app become Updated App Support lines.

The commits file is produced by:
  git log --pretty=format:'%H%x1f%s%x1f%b%x1e' <prev-tag>..<head>
"""

import argparse
import json
import re
import sys
from pathlib import Path


def load_patches(path):
    """{(package, patch_name): (app_name, description, [target versions])}"""
    if not path or not Path(path).exists():
        return {}
    data = json.loads(Path(path).read_text())
    out = {}
    for patch in data.get("patches", []):
        for cp in patch.get("compatiblePackages") or []:
            versions = [t.get("version") for t in cp.get("targets") or []]
            out[(cp["packageName"], patch["name"])] = (
                cp.get("name") or cp["packageName"],
                patch.get("description") or "",
                versions,
            )
        if not patch.get("compatiblePackages"):
            out[("", patch["name"])] = ("Universal", patch.get("description") or "", [])
    return out


def norm(s):
    return re.sub(r"[^a-z0-9]", "", s.lower())


def parse_commits(path):
    records = []
    if not path or not Path(path).exists():
        return records
    raw = Path(path).read_text(errors="replace")
    for rec in raw.split("\x1e"):
        rec = rec.strip("\n")
        if not rec.strip():
            continue
        parts = rec.split("\x1f")
        if len(parts) < 2:
            continue
        sha, subject = parts[0].strip(), parts[1].strip()
        body = parts[2] if len(parts) > 2 else ""
        records.append((sha, subject, body))
    return records


def closes_ref(subject, body):
    m = re.search(r"(?:closes|fixes|resolves)\s+#(\d+)", subject + "\n" + body, re.I)
    return f", closes #{m.group(1)}" if m else ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--new-list", required=True)
    ap.add_argument("--old-list")
    ap.add_argument("--commits")
    ap.add_argument("--patches-dir")
    ap.add_argument("--version", required=True)
    ap.add_argument("--repo", required=True)
    ap.add_argument("--date", required=True)
    ap.add_argument("--head-sha", default="")
    args = ap.parse_args()

    new = load_patches(args.new_list)
    old = load_patches(args.old_list)
    commits = parse_commits(args.commits)

    folders = set()
    if args.patches_dir and Path(args.patches_dir).exists():
        folders = {p.name for p in Path(args.patches_dir).iterdir() if p.is_dir()}

    app_names = {app for app, _, _ in new.values()} | {app for app, _, _ in old.values()}

    def display_for(scope):
        """Resolve a commit scope (folder name) to the app's display name."""
        if scope in folders:
            for name in app_names:
                n = norm(name)
                if n == scope or scope in n or n in scope:
                    return name
            return scope[:1].upper() + scope[1:]
        for name in app_names:
            if norm(name) == scope:
                return name
        return None

    bug_fixes, new_features, app_support = [], [], []
    sync_sha = {}  # folder -> sha of its promote sync commit

    for sha, subject, body in commits:
        m = re.match(r"^(fix|feat)(?:\(([a-z0-9_-]+)\))?:\s*(.+)$", subject)
        if not m:
            continue
        kind, scope, text = m.group(1), m.group(2), m.group(3).strip()
        if scope is None:
            # Unscoped promote "all" title: fix: update <apps> patches
            m2 = re.match(r"^update (.+) patches$", text)
            if m2:
                for folder in re.split(r",\s*", m2.group(1)):
                    sync_sha.setdefault(folder.strip(), sha)
            continue
        app = display_for(scope)
        if app is None:
            continue  # not an app (checker, release, bundle, ...)
        if text.lower() == "update patches":
            sync_sha.setdefault(scope, sha)
            continue
        short = sha[:7]
        sup = re.search(r"add support for\s+(\S+)", text, re.I)
        if sup:
            app_support.append((app, f"* {app}: add support for {sup.group(1)} ({short}){closes_ref(subject, body)}"))
            continue
        line = f"* {app} - {text} ({short}){closes_ref(subject, body)}"
        (bug_fixes if kind == "fix" else new_features).append((app, line))

    def attribution_sha(app):
        for folder, sha in sync_sha.items():
            if display_for(folder) == app:
                return sha[:7]
        return args.head_sha[:7] if args.head_sha else ""

    # ---- list diff: new/changed patches -> New Features --------------------
    seen_lines = {line for _, line in new_features}
    for key, (app, desc, versions) in sorted(new.items()):
        if key not in old or old[key][1] != desc:
            sha = attribution_sha(app)
            line = f"* {app} - {key[1]}: {desc}" + (f" ({sha})" if sha else "")
            if line not in seen_lines:
                seen_lines.add(line)
                new_features.append((app, line))

    # ---- list diff: added target versions -> Updated App Support -----------
    old_versions = {}
    for (pkg, _), (_, _, versions) in old.items():
        old_versions.setdefault(pkg, set()).update(v for v in versions if v)
    seen_support = {line for _, line in app_support}
    for (pkg, _), (app, _, versions) in sorted(new.items()):
        for v in versions:
            if v and v not in old_versions.get(pkg, set()):
                sha = attribution_sha(app)
                line = f"* {app}: add support for {v}" + (f" ({sha})" if sha else "")
                if line not in seen_support:
                    seen_support.add(line)
                    app_support.append((app, line))

    # ---- render --------------------------------------------------------------
    out = [f"## [{args.version}](https://github.com/{args.repo}/releases/tag/v{args.version}) ({args.date})", ""]
    sections = [("Bug Fixes", bug_fixes), ("New Features", new_features), ("Updated App Support", app_support)]
    wrote = False
    for title, items in sections:
        if not items:
            continue
        wrote = True
        out.append(f"### {title}")
        out.append("")
        for _, line in sorted(items, key=lambda t: (t[0].lower(), t[1].lower())):
            out.append(line)
        out.append("")
    if not wrote:
        out.append("No patch changes in this release.")
    sys.stdout.write("\n".join(out).rstrip() + "\n")


if __name__ == "__main__":
    main()
