#!/usr/bin/env python3
"""
Generates the patches section of README.md from patches-list.json
and injects it between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.
"""
import json, re, sys
from pathlib import Path

if len(sys.argv) < 3:
    print("Usage: generate_patches_readme.py <owner/repo> <branch> [json] [readme]")
    sys.exit(1)

repo_full, branch = sys.argv[1], sys.argv[2]
json_path = Path(sys.argv[3]) if len(sys.argv) > 3 else Path("patches-list.json")
readme_path = Path(sys.argv[4]) if len(sys.argv) > 4 else Path("README.md")
if "/" not in repo_full:
    raise ValueError(f"Invalid repo format: {repo_full}")
owner, repo = repo_full.split("/", 1)

with open(json_path, encoding="utf-8") as f:
    data = json.load(f)

def anchor(name):
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", name.lower())).strip("-")

def table(patches):
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"]):
        opts = p.get("options") or []
        opt_text = "<br>".join(f"• {o.get('title') or o.get('key') or ''}" for o in opts)
        desc = (p.get("description") or "").replace("\n", "<br>")
        rows.append(f"| [{p['name']}](#{anchor(p['name'])}) | {desc} | {opt_text} |")
    return "\n".join(rows)

by_pkg, universal = {}, {}
for patch in data["patches"]:
    cp = patch.get("compatiblePackages")
    if not cp:
        universal.setdefault(patch["name"], patch)
        continue
    for item in cp:
        pkg = item["packageName"]
        by_pkg.setdefault(pkg, {
            "name": item.get("name") or pkg,
            "patches": {},
            "targets": item.get("targets", []),
        })
        by_pkg[pkg]["patches"].setdefault(patch["name"], patch)

ver = str(data["version"]).lstrip("v")
total = sum(len(v["patches"]) for v in by_pkg.values()) + len(universal)
parts = [f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})** • `{branch}` • {total} patches total"]

for item in by_pkg.values():
    ps = list(item["patches"].values())
    parts += [f"<details open>\n<summary>📦 {item['name']} • {len(ps)} {'patch' if len(ps)==1 else 'patches'}</summary>\n<br>\n{table(ps)}\n</details>", ""]

if universal:
    ps = list(universal.values())
    parts += [f"<details open>\n<summary>🌐 Universal • {len(ps)} {'patch' if len(ps)==1 else 'patches'}</summary>\n<br>\n{table(ps)}\n</details>", ""]

generated = "\n".join(parts)
readme = readme_path.read_text(encoding="utf-8")
start_re = r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->"
end = "<!-- PATCHES_END -->"
m = re.search(start_re, readme)
if not m or end not in readme:
    sys.stderr.write(f"Markers {start_re} / {end} not found in {readme_path}\n")
    sys.exit(1)

actual_start = m.group(0)
readme = readme.replace(
    "https://morphe.software/add-source?github=xyz-user/xyz-patches",
    f"https://morphe.software/add-source?github={repo_full}",
)
readme = readme.replace(
    "https://github.com/xyz-user/xyz-patches",
    f"https://github.com/{repo_full}",
)
new_readme = re.sub(
    rf"{start_re}.*?{re.escape(end)}",
    f"{actual_start}\n{generated}\n{end}",
    readme,
    flags=re.DOTALL,
)
readme_path.write_text(new_readme, encoding="utf-8")
print(f"Injected patches section into {readme_path}")
