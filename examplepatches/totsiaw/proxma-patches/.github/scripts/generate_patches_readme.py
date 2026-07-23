"""Regenerate the patches table in README.md from patches-list.json.

Patches are grouped by the app they apply to (from each patch's compatiblePackages),
so a bundle covering several apps reads as one clear per-app section instead of a flat
list where same-named patches (e.g. "Remove ads & tracking" for two apps) collide.
"""

from __future__ import annotations

import json
import re
import sys
from collections import OrderedDict


def main() -> None:
    if len(sys.argv) < 4:
        print(f"Usage: {sys.argv[0]} <repo> <branch> <patches-json> [readme]")
        sys.exit(1)

    patches_json_path = sys.argv[3]
    readme_path = sys.argv[4] if len(sys.argv) > 4 else "README.md"

    with open(patches_json_path, encoding="utf-8") as f:
        data = json.load(f)

    patches = data.get("patches", [])
    if not patches:
        print("  [i] No patches found, skipping README regeneration.")
        return

    # Group patches by app (a patch can apply to more than one app).
    apps: "OrderedDict[str, dict]" = OrderedDict()
    unscoped: list = []
    for p in patches:
        name, desc = p["name"], p.get("description", "")
        pkgs = p.get("compatiblePackages") or []
        if not pkgs:
            unscoped.append((name, desc))
            continue
        for c in pkgs:
            pkg = c.get("packageName") or "unknown"
            app = apps.setdefault(
                pkg, {"name": c.get("name") or pkg, "package": pkg, "versions": [], "patches": []}
            )
            for t in c.get("targets") or []:
                v = t.get("version")
                if v and v not in app["versions"]:
                    app["versions"].append(v)
            app["patches"].append((name, desc))

    def render_table(rows: list) -> str:
        body = "\n".join(f"| **{n}** | {d} |" for n, d in rows)
        return "| Patch | Description |\n|-------|-------------|\n" + body

    sections: list = []
    for app in apps.values():
        vers = ", ".join(app["versions"]) if app["versions"] else "any"
        sections.append(
            f"### {app['name']} (`{app['package']}`)\n\n"
            f"_Supported version(s): {vers}_\n\n" + render_table(app["patches"])
        )
    if unscoped:
        sections.append("### Other\n\n" + render_table(unscoped))

    new_section = "## Patches\n\n" + "\n\n".join(sections) + "\n"

    with open(readme_path, encoding="utf-8") as f:
        readme = f.read()

    start = readme.find("## Patches")
    if start == -1:
        print("  [i] No '## Patches' section found, appending.")
        readme = readme.rstrip() + "\n\n" + new_section
    else:
        rest = readme[start + len("## Patches"):]
        end = re.search(r"\n## ", rest)
        end_pos = (start + len("## Patches") + end.start()) if end else len(readme)
        readme = readme[:start] + new_section + readme[end_pos:]

    with open(readme_path, "w", encoding="utf-8", newline="") as f:
        f.write(readme)

    print(f"  Updated {readme_path}: {len(patches)} patches across {len(apps)} app(s).")


if __name__ == "__main__":
    main()
