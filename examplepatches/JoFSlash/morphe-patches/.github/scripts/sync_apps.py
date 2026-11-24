#!/usr/bin/env python3
"""
Writes everything that lists the apps from their settings in .github/apps/*.json, so adding an app
only adds files and two pull requests that add apps don't both edit the same lines:

- each app's docs/<app>/README.md, through generate_readme.py (patch table, versions);
- the app table in README.md, between <!-- APPS_START --> and <!-- APPS_END -->;
- the license line in README.md that names every app's owner ("owners"), between <!-- OWNERS_START -->
  and <!-- OWNERS_END -->;
- the app dropdowns in .github/ISSUE_TEMPLATE/*.yml, between "# APPS_START" and "# APPS_END".

The release runs it (see .releaserc), so these files are brought up to date with every release.

python3 sync_apps.py <owner/repo> <branch> [patches-list.json]
python3 sync_apps.py --lists-only     (just the README table and the dropdowns)
"""

import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
APPS = ROOT / ".github" / "apps"


def apps():
    found = []
    for path in sorted(APPS.glob("*.json")):
        app = json.loads(path.read_text(encoding="utf-8"))
        app["key"] = path.stem
        found.append(app)
    return sorted(found, key=lambda a: a["name"].casefold())


def replace_between(text, start, end, body, path):
    pattern = re.compile(r"(^[ \t]*" + re.escape(start) + r"[^\n]*\n)(.*?)(^[ \t]*" + re.escape(end) + r")",
                         re.S | re.M)
    if not pattern.search(text):
        sys.exit(f"{path}: no {start} ... {end} markers")
    return pattern.sub(lambda m: m.group(1) + body + m.group(3), text, count=1)


def write(path, text):
    old = path.read_text(encoding="utf-8")
    if old != text:
        path.write_text(text, encoding="utf-8", newline="\n")
        print(f"Updated {path.relative_to(ROOT)}")


def label(app):
    note = app.get("store_note", "")
    return f"{app['name']} {note}".strip()


def readme_table(all_apps):
    path = ROOT / "README.md"
    rows = ["| App | What the patches do | Details |", "| --- | --- | --- |"]
    for app in all_apps:
        note = f" {app['store_note']}" if app.get("store_note") else ""
        rows.append(f"| [{app['name']}]({app['store']}){note} | {app['summary']} | "
                    f"[{app['name']} patches]({app['docs']}) |")
    text = path.read_text(encoding="utf-8").replace("\r\n", "\n")
    write(path, replace_between(text, "<!-- APPS_START -->", "<!-- APPS_END -->", "\n".join(rows) + "\n", path))


def readme_owners(all_apps):
    path = ROOT / "README.md"
    owners = []
    for app in all_apps:
        if not app.get("owners"):
            sys.exit(f"{app['key']}: no \"owners\" in .github/apps/{app['key']}.json")
        owners += [owner for owner in app["owners"] if owner not in owners]
    owners.sort(key=str.casefold)
    names = owners[0] if len(owners) == 1 else ", ".join(owners[:-1]) + " or " + owners[-1]
    line = (f"[GPL-3.0](LICENSE), see also [NOTICE](NOTICE). Not affiliated with {names}, "
            "or with the Morphe project.\n")
    text = path.read_text(encoding="utf-8").replace("\r\n", "\n")
    write(path, replace_between(text, "<!-- OWNERS_START -->", "<!-- OWNERS_END -->", line, path))


def dropdowns(all_apps):
    for path in sorted((ROOT / ".github" / "ISSUE_TEMPLATE").glob("*.yml")):
        text = path.read_text(encoding="utf-8").replace("\r\n", "\n")
        if "# APPS_START" not in text:
            continue
        indent = re.search(r"^([ \t]*)# APPS_START", text, re.M).group(1)
        body = "".join(f"{indent}- {label(app)}\n" for app in all_apps)
        write(path, replace_between(text, "# APPS_START", "# APPS_END", body, path))


def app_readmes(all_apps, repo, branch, patches_list):
    for app in all_apps:
        script = ROOT / ".github" / "scripts" / "generate_readme.py"
        subprocess.run([sys.executable, str(script), app["key"], repo, branch, patches_list, app["docs"]],
                       cwd=ROOT, check=True)


def main():
    all_apps = apps()
    if not all_apps:
        sys.exit("No apps in .github/apps")
    if sys.argv[1:] == ["--lists-only"]:
        pass
    elif len(sys.argv) >= 3:
        patches_list = sys.argv[3] if len(sys.argv) > 3 else "patches-list.json"
        app_readmes(all_apps, sys.argv[1], sys.argv[2], patches_list)
    else:
        sys.exit(__doc__)
    readme_table(all_apps)
    readme_owners(all_apps)
    dropdowns(all_apps)


if __name__ == "__main__":
    main()
