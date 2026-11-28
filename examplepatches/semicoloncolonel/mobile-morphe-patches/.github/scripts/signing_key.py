#!/usr/bin/env python3
"""Keep the published signing key fingerprint in step with morphe-signing.pub.

Morphe Manager shows the signer of a patch source as the first 8 bytes of the
SHA-256 hash of its public key, in groups of four hex digits. This script
computes that fingerprint and writes it to:

- docs/assets/signed-by.svg, the black "Signed by" box,
- the signer blocks in README.md and docs/signing-key.md, and
- the key history table in docs/signing-key.md. A key that is not in the table
  gets a new row, and the row before it gets an end date. Rows are never
  removed, so the table keeps every key the source has used.

With --check it changes nothing and exits 1 when any of those files is out of
date. It also warns when patches-bundle.json carries a different key, which is
expected only between a key change and the next release.
"""

import argparse
import base64
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path

KEY_FILE = "morphe-signing.pub"
BUNDLE_FILE = "patches-bundle.json"
SVG_FILE = "docs/assets/signed-by.svg"
README_FILE = "README.md"
HISTORY_FILE = "docs/signing-key.md"

SIGNER_START = "<!-- signer:start -->"
SIGNER_END = "<!-- signer:end -->"
HISTORY_START = "<!-- history:start -->"
HISTORY_END = "<!-- history:end -->"

HISTORY_HEADER = (
    "| Fingerprint | Public key | In use from | In use until | Added in |\n"
    "|-------------|------------|-------------|--------------|----------|"
)
CURRENT = "current"


def fingerprint(public_key_b64: str) -> str:
    raw = base64.b64decode(public_key_b64.strip(), validate=True)
    digest = hashlib.sha256(raw).hexdigest()[:16]
    return " ".join(digest[i:i + 4] for i in range(0, 16, 4))


def render_svg(fp: str) -> str:
    label = f"Signed by {fp}"
    return (
        '<svg xmlns="http://www.w3.org/2000/svg" width="340" height="72" '
        f'viewBox="0 0 340 72" role="img" aria-label="{label}">\n'
        f"  <title>{label}</title>\n"
        '  <rect x="0.5" y="0.5" width="339" height="71" rx="10" fill="#000000" stroke="#3d444d"/>\n'
        '  <text x="24" y="28" fill="#b0b0b0" '
        'font-family="-apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif" '
        'font-size="12" font-weight="600" letter-spacing="1.6">SIGNED BY</text>\n'
        '  <text x="24" y="54" fill="#ffffff" '
        'font-family="ui-monospace,SFMono-Regular,Menlo,Consolas,Liberation Mono,monospace" '
        f'font-size="22" font-weight="600" letter-spacing="0.5">{fp}</text>\n'
        "</svg>\n"
    )


def signer_block(fp: str, key: str, svg_path: str, history_link: str | None) -> str:
    image = f'<img alt="Signed by {fp}" src="{svg_path}">'
    if history_link:
        image = f'<a href="{history_link}">{image}</a>'
        note = (
            "Morphe Manager shows this signer on the source. If it shows a different one, "
            f'check the <a href="{history_link}">signing key history</a> before you apply the patches.'
        )
    else:
        note = f"Full public key: <code>{key}</code>"
    return (
        f"{SIGNER_START}\n"
        '<p align="center">\n'
        f"  {image}\n"
        "  <br>\n"
        f"  <sub>{note}</sub>\n"
        "</p>\n"
        f"{SIGNER_END}"
    )


def replace_between(text: str, start: str, end: str, block: str, name: str) -> str:
    pattern = re.compile(re.escape(start) + r".*?" + re.escape(end), re.S)
    if not pattern.search(text):
        raise SystemExit(f"{name}: missing {start} ... {end} markers")
    return pattern.sub(lambda _: block, text, count=1)


def parse_history(text: str) -> list[list[str]]:
    pattern = re.compile(re.escape(HISTORY_START) + r"(.*?)" + re.escape(HISTORY_END), re.S)
    match = pattern.search(text)
    if not match:
        raise SystemExit(f"{HISTORY_FILE}: missing {HISTORY_START} ... {HISTORY_END} markers")
    rows = []
    for line in match.group(1).strip().splitlines()[2:]:
        cells = [cell.strip() for cell in line.strip().strip("|").split("|")]
        if len(cells) == 5:
            rows.append(cells)
    return rows


def render_history(rows: list[list[str]]) -> str:
    lines = [HISTORY_HEADER] + ["| " + " | ".join(row) + " |" for row in rows]
    return f"{HISTORY_START}\n" + "\n".join(lines) + f"\n{HISTORY_END}"


def update_history(rows: list[list[str]], fp: str, key: str, since: str, commit_cell: str) -> list[list[str]]:
    """Add the key if it is new. Returns a new list; never drops rows."""
    fp_cell = f"`{fp}`"
    rows = [list(row) for row in rows]
    for row in rows:
        if row[0] == fp_cell:
            return rows
    for row in rows:
        if row[3] == CURRENT:
            row[3] = since
    rows.append([fp_cell, f"`{key}`", since, CURRENT, commit_cell])
    return rows


def git(root: Path, *args: str) -> str:
    return subprocess.run(["git", "-C", str(root), *args], check=True,
                          capture_output=True, text=True).stdout.strip()


def repo_slug(root: Path) -> str:
    slug = os.environ.get("GITHUB_REPOSITORY")
    if slug:
        return slug
    url = git(root, "remote", "get-url", "origin")
    match = re.search(r"github\.com[:/](.+?)(?:\.git)?$", url)
    if not match:
        raise SystemExit(f"Cannot read the GitHub repository from {url}")
    return match.group(1)


def key_commit(root: Path) -> tuple[str, str]:
    """Date and full hash of the last commit that changed the key file."""
    out = git(root, "log", "-1", "--format=%cs %H", "--", KEY_FILE)
    if not out:
        raise SystemExit(f"{KEY_FILE} has no commits yet. Commit it, then run this again.")
    date, sha = out.split()
    return date, sha


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--repo", default=".", help="repository root")
    parser.add_argument("--check", action="store_true", help="report out-of-date files and change nothing")
    args = parser.parse_args()
    root = Path(args.repo).resolve()

    key = (root / KEY_FILE).read_text().strip()
    fp = fingerprint(key)

    bundle = root / BUNDLE_FILE
    if bundle.exists():
        bundle_key = json.loads(bundle.read_text()).get("public_key", "").strip()
        if bundle_key and bundle_key != key:
            print(f"::warning::{BUNDLE_FILE} has key {fingerprint(bundle_key)}, {KEY_FILE} has {fp}. "
                  "The next release updates the bundle.")

    readme = root / README_FILE
    history = root / HISTORY_FILE
    svg = root / SVG_FILE

    expected = {
        svg: render_svg(fp),
        readme: replace_between(readme.read_text(), SIGNER_START, SIGNER_END,
                                signer_block(fp, key, SVG_FILE, HISTORY_FILE), README_FILE),
    }

    history_text = history.read_text()
    rows = parse_history(history_text)
    if not any(row[0] == f"`{fp}`" for row in rows):
        since, sha = key_commit(root)
        commit_cell = f"[{sha[:7]}](https://github.com/{repo_slug(root)}/commit/{sha})"
        rows = update_history(rows, fp, key, since, commit_cell)
    history_text = replace_between(history_text, SIGNER_START, SIGNER_END,
                                   signer_block(fp, key, "assets/signed-by.svg", None), HISTORY_FILE)
    expected[history] = replace_between(history_text, HISTORY_START, HISTORY_END,
                                        render_history(rows), HISTORY_FILE)

    stale = [path for path, text in expected.items() if not path.exists() or path.read_text() != text]
    if args.check:
        for path in stale:
            print(f"::error file={path.relative_to(root)}::Out of date for signing key {fp}. "
                  "Run python .github/scripts/signing_key.py")
        print(f"Signing key {fp}: " + ("out of date" if stale else "up to date"))
        return 1 if stale else 0

    for path in stale:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(expected[path])
        print(f"Updated {path.relative_to(root)}")
    print(f"Signing key {fp}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
