#!/usr/bin/env python3
"""
Generate the patches section of README.md from patches-list.json and inject it
between <!-- PATCHES_START --> / <!-- PATCHES_END --> markers.

Spoilers are expanded (open by default) if:
  1. Total patch count <= --expand-threshold (default 20), or
  2. The README marker says <!-- PATCHES_START EXPANDED -->, or
  3. --expand is passed.

Usage:
  generate_patches_readme.py <owner/repo> <branch> [patches-list.json] [README.md]
  generate_patches_readme.py owner/repo main --check   # exit 1 if README is stale
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

START_PATTERN = re.compile(r"<!-- PATCHES_START(?:\s+EXPANDED)?\s*-->")
END_MARKER = "<!-- PATCHES_END -->"
PKG_EMOJI = "📦"
TEMPLATE_SLUG = "xyz-user/xyz-patches"


# --------------------------------------------------------------------------- #
# Helpers
# --------------------------------------------------------------------------- #

def esc(text) -> str:
    """Make text safe for a markdown table cell."""
    text = str(text or "").strip()
    return text.replace("|", "\\|").replace("\r\n", "\n").replace("\n", "<br>")


def anchor(name: str) -> str:
    """GitHub-compatible anchor slug."""
    return re.sub(r"[^a-z0-9]+", "-", name.lower()).strip("-")


def noun(count: int) -> str:
    return "patch" if count == 1 else "patches"


def die(msg: str, code: int = 1):
    sys.stderr.write(f"❌ {msg}\n")
    sys.exit(code)


# --------------------------------------------------------------------------- #
# Data loading / grouping
# --------------------------------------------------------------------------- #

def load_data(path: Path) -> dict:
    try:
        with open(path, encoding="utf-8") as f:
            data = json.load(f)
    except FileNotFoundError:
        die(f"JSON file not found: {path}")
    except json.JSONDecodeError as e:
        die(f"Invalid JSON in {path}: {e}")
    if not isinstance(data, dict) or not isinstance(data.get("patches"), list):
        die(f"{path} must contain an object with a 'patches' list")
    return data


def group_patches(patches: list[dict]):
    """Return (by_pkg, universal).

    by_pkg:    packageName -> {name, patches{name: patch}, targets[list]}
    universal: {name: patch}  (patches without compatiblePackages)
    Patches are deduplicated by name; targets are merged across all entries.
    """
    by_pkg: dict[str, dict] = {}
    universal: dict[str, dict] = {}

    for patch in patches:
        pname = patch.get("name")
        if not pname:
            continue

        compat = patch.get("compatiblePackages")
        if not compat:
            universal.setdefault(pname, patch)
            continue

        for pkg_entry in compat:
            pkg = pkg_entry.get("packageName")
            if not pkg:
                continue
            entry = by_pkg.setdefault(pkg, {
                "name": pkg_entry.get("name") or pkg,
                "patches": {},
                "targets": [],
            })
            # Merge targets by version (first description/flags win)
            known = {t.get("version") for t in entry["targets"]}
            for t in pkg_entry.get("targets") or []:
                if t.get("version") not in known:
                    entry["targets"].append(t)
                    known.add(t.get("version"))
            entry["patches"].setdefault(pname, patch)

    return by_pkg, universal


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def patches_table(patches) -> str:
    rows = [
        "| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |",
        "|----------|----------------|-----------|",
    ]
    for p in sorted(patches, key=lambda x: x["name"].lower()):
        options = p.get("options") or []
        titles = [o.get("title") or o.get("key") or "" for o in options]
        opts_cell = "<br>".join(f"• {esc(t)}" for t in titles if t)
        rows.append(
            f"| [{esc(p['name'])}](#{anchor(p['name'])}) "
            f"| {esc(p.get('description'))} | {opts_cell} |"
        )
    return "\n".join(rows)


def versions_table(targets) -> str:
    """Supported-versions table; experimental versions get a 🧪 prefix."""
    targets = [t for t in targets or [] if t.get("version") is not None]
    if not targets:
        return ""

    cells = [
        f"🧪&nbsp;{esc(t['version'])}" if t.get("isExperimental") else esc(t["version"])
        for t in targets
    ]
    rows = [
        "| " + " | ".join(cells) + " |",
        "| " + " | ".join(":---:" for _ in cells) + " |",
    ]
    descs = [esc(t.get("description")) for t in targets]
    if any(descs):
        rows.append("| " + " | ".join(descs) + " |")
    return "\n".join(rows)


def spoiler(label: str, count: int, body: str, expanded: bool, targets=None) -> str:
    vtbl = versions_table(targets)
    versions = f"**🎯 Supported versions:**\n\n{vtbl}\n\n" if vtbl else ""
    tag = "<details open>" if expanded else "<details>"
    return (
        f"{tag}\n"
        f"<summary>{label}&nbsp;&nbsp;•&nbsp;&nbsp;{count} {noun(count)}</summary>\n"
        f"<br>\n\n"
        f"{versions}{body}\n\n"
        f"</details>"
    )


def build_content(by_pkg, universal, owner, repo, branch, ver, total, expanded) -> str:
    lines = [
        f"> **[v{ver}](https://github.com/{owner}/{repo}/releases/tag/v{ver})**"
        f"&nbsp;&nbsp;•&nbsp;&nbsp;`{branch}`&nbsp;&nbsp;•&nbsp;&nbsp;"
        f"{total} {noun(total)} total",
        "",
    ]

    for entry in by_pkg.values():
        patches = list(entry["patches"].values())
        lines.append(spoiler(
            f"{PKG_EMOJI} {esc(entry['name'])}", len(patches),
            patches_table(patches), expanded, entry["targets"],
        ))
        lines.append("")

    if universal:
        uni = list(universal.values())
        lines.append(spoiler("🌐 Universal", len(uni), patches_table(uni), expanded))
        lines.append("")

    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# README injection
# --------------------------------------------------------------------------- #

def inject(readme: str, generated: str, repo_full: str):
    """Return (new_readme, start_marker) or (None, None) if markers are missing/misordered."""
    m = START_PATTERN.search(readme)
    if not m:
        return None, None
    end_idx = readme.find(END_MARKER, m.end())
    if end_idx == -1:
        return None, None

    block = f"{m.group(0)}\n{generated}\n{END_MARKER}"
    new = readme[:m.start()] + block + readme[end_idx + len(END_MARKER):]

    # Replace template links
    new = new.replace(
        f"https://morphe.software/add-source?github={TEMPLATE_SLUG}",
        f"https://morphe.software/add-source?github={repo_full}",
    )
    new = new.replace(f"https://github.com/{TEMPLATE_SLUG}", f"https://github.com/{repo_full}")
    return new, m.group(0)


# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #

def parse_args():
    p = argparse.ArgumentParser(description="Inject a generated patches section into README.md")
    p.add_argument("repo", help="owner/repo")
    p.add_argument("branch")
    p.add_argument("json", nargs="?", default="patches-list.json", type=Path)
    p.add_argument("readme", nargs="?", default="README.md", type=Path)
    p.add_argument("--expand", action="store_true", help="always expand spoilers")
    p.add_argument("--expand-threshold", type=int, default=20,
                   help="auto-expand when total patches <= N (default 20)")
    p.add_argument("--check", action="store_true",
                   help="don't write; exit 1 if README is out of date")
    return p.parse_args()


def main() -> int:
    args = parse_args()

    if not re.fullmatch(r"[^/\s]+/[^/\s]+", args.repo):
        die(f"Invalid repo format: {args.repo} (expected owner/repo)")
    owner, repo = args.repo.split("/", 1)

    data = load_data(args.json)
    ver = str(data.get("version") or "0.0.0").lstrip("v")
    by_pkg, universal = group_patches(data["patches"])
    total = sum(len(e["patches"]) for e in by_pkg.values()) + len(universal)

    if not args.readme.is_file():
        die(f"README not found: {args.readme}")
    readme = args.readme.read_text(encoding="utf-8")

    m = START_PATTERN.search(readme)
    expanded = args.expand or total <= args.expand_threshold or bool(m and "EXPANDED" in m.group(0))

    generated = build_content(by_pkg, universal, owner, repo, args.branch, ver, total, expanded)
    new_readme, _ = inject(readme, generated, args.repo)

    if new_readme is None:
        # Fallback: print to stdout so CI can capture it
        print(generated)
        die(f"Markers <!-- PATCHES_START [EXPANDED] --> / {END_MARKER} "
            f"not found (or misordered) in {args.readme}. Printed to stdout instead.")

    changed = new_readme != readme
    if args.check:
        if changed:
            die(f"{args.readme} is out of date; re-run without --check")
        print(f"✅ {args.readme} is up to date")
        return 0

    if changed:
        args.readme.write_text(new_readme, encoding="utf-8")
    status = "Injected" if changed else "No changes to"
    print(f"✅ {status} {args.readme} (v{ver}, branch={args.branch}, "
          f"{total} {noun(total)}, expanded={expanded})")
    return 0


if __name__ == "__main__":
    sys.exit(main())