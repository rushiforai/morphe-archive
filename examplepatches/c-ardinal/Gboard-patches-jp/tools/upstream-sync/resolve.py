"""Mechanically resolve an upstream release merge for the fork (stdlib only, run with python -I)."""

import argparse
import hashlib
import json
import re
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

CATALOG = "patches/src/main/resources/gboard/gboard-port-product-catalog.json"
CATALOG_SHA = "patches/src/main/resources/gboard/gboard-port-product-catalog.sha256"
SETTINGS_XML = "extensions/extension/src/main/settings-text/gboard_settings_text.xml"
ALLOWED_CONFLICTS = {"CHANGELOG.md", "gradle.properties", "patches-bundle.json", "patches-list.json", CATALOG_SHA}
EN_FEATURES = "### ✨ New Features"
ZH_FEATURES = "### ✨ 新功能"
ZH_FIXES = "### 🐛 修復"
EN_PLACEHOLDER_BULLET = "* **Gboard:** fill missing Japanese settings strings with English placeholders (translation pending)."
ZH_PLACEHOLDER_BULLET = "* **Gboard:** 缺少日文的設定文字暫以英文填入（待翻譯）。"
JP_HEADING = re.compile(r"^## \[(?P<base>[^\]]+?)-jp\.\d+\]")
ENTRY = re.compile(r'<plurals name="(?P<plural>[^"]+)"|<(?P<tag>string|item)\b(?P<attrs>[^>]*)>(?P<body>.*?)</(?P=tag)>', re.S)
EN_TRANSLATION = re.compile(r'\n(?P<indent>[ \t]*)<translation locale="en">(?P<text>.*?)</translation>', re.S)


def git(repo, *args, check=True):
    result = subprocess.run(["git", *args], cwd=repo, capture_output=True, check=False)
    if check and result.returncode != 0:
        raise SystemExit(f"git {' '.join(args)} failed: {result.stderr.decode('utf-8', 'replace')}")
    return result.stdout.decode("utf-8")


def write_text(path, text):
    Path(path).write_bytes(text.encode("utf-8"))


def split_sections(text):
    """Return (preamble, [section, ...]) where each section starts with a '## ' heading line."""
    parts = re.split(r"(?m)^(?=## )", text)
    return parts[0], [p.rstrip("\n") for p in parts[1:]]


def heading_base(section):
    match = re.match(r"## \[([^\]]+)\]", section)
    return match.group(1) if match else None


def section_body(sections, version):
    for section in sections:
        if heading_base(section) == version:
            return section.split("\n", 1)[1].strip("\n") if "\n" in section else ""
    return ""


def append_bullet(body, heading, bullet, before=None):
    lines = body.split("\n") if body else []
    if heading not in lines:
        block = [heading, "", bullet]
        if before in lines:
            at = lines.index(before)
            return "\n".join(lines[:at] + block + [""] + lines[at:])
        if heading == EN_FEATURES:
            return "\n".join(block + ([""] + lines if lines else []))
        return "\n".join(lines + ([""] if lines else []) + block)
    start = lines.index(heading) + 1
    end = next((i for i in range(start, len(lines)) if lines[i].startswith("### ")), len(lines))
    last = max((i for i in range(start, end) if lines[i].strip()), default=start - 1)
    return "\n".join(lines[: last + 1] + ([""] if last == start - 1 else []) + [bullet] + lines[last + 1 :])


def new_section_body(upstream_sections, version, has_placeholders):
    body = section_body(upstream_sections, version)
    if has_placeholders:
        body = append_bullet(body, EN_FEATURES, EN_PLACEHOLDER_BULLET, before=None)
        body = append_bullet(body, ZH_FEATURES, ZH_PLACEHOLDER_BULLET, before=ZH_FIXES)
    return body or f"{EN_FEATURES}\n\n* **Gboard:** sync with upstream {version}."


def splice_changelog(upstream_text, fork_text, new_heading, new_body):
    preamble, sections = split_sections(upstream_text)
    fork_only = [s for s in split_sections(fork_text)[1] if JP_HEADING.match(s)]
    upstream_bases = {heading_base(s) for s in sections}
    orphans = [s for s in fork_only if JP_HEADING.match(s).group("base") not in upstream_bases]
    merged = [f"{new_heading}\n\n{new_body}", *orphans]
    for section in sections:
        merged += [s for s in fork_only if JP_HEADING.match(s).group("base") == heading_base(section)]
        merged.append(section)
    return preamble + "\n\n".join(merged) + "\n"


def render_bundle(upstream_bundle_text, description, version, slug, created_at):
    bundle = json.loads(upstream_bundle_text)
    bundle.update(
        created_at=created_at,
        description=description,
        download_url=f"https://github.com/{slug}/releases/download/v{version}/patches-{version}.mpp",
        signature_download_url="",
        version=version,
    )
    return json.dumps(bundle, ensure_ascii=False, indent=2)


def set_gradle_version(text, version):
    updated, count = re.subn(r"(?m)^version = .*$", f"version = {version}", text)
    if count != 1:
        raise SystemExit("gradle.properties: expected exactly one 'version = ' line")
    return updated


def fill_ja_placeholders(xml):
    """Insert a ja translation copied from en into every entry lacking one; returns (xml, keys)."""
    out, keys, plural, pos = [], [], None, 0
    for match in ENTRY.finditer(xml):
        if match.group("plural"):
            plural = match.group("plural")
            continue
        body = match.group("body")
        if 'locale="ja"' in body:
            continue
        en = EN_TRANSLATION.search(body)
        if not en:
            continue
        name = re.search(r'(?:name|quantity)="([^"]+)"', match.group("attrs")).group(1)
        keys.append(name if match.group("tag") == "string" else f"{plural}[{name}]")
        insert_at = match.start("body") + body.rfind("</translation>") + len("</translation>")
        out += [xml[pos:insert_at], f'\n{en.group("indent")}<translation locale="ja">{en.group("text")}</translation>']
        pos = insert_at
    return "".join(out) + xml[pos:], keys


# PR body and release notes are posted to GitHub, so they carry no upstream-derived prose
# (links, mentions or references there could notify upstream); details live in CHANGELOG.md.
def pr_body(tag, version, resolved, placeholders):
    lines = [
        f"Automated sync of upstream release `{tag}` into the fork, staged as `{version}`.",
        "",
        f"Upstream changes: see the `{version}` section of CHANGELOG.md in this branch.",
        "",
        "## Auto-resolved files",
        "",
        *(f"- `{path}`" for path in resolved),
        "",
        "## Japanese translation needed",
        "",
        *([f"- `{key}`" for key in placeholders] or ["- none"]),
        "",
    ]
    return "\n".join(lines)


def release_notes(tag, version):
    prerelease = version.rsplit(".", 1)[0] + ".0"
    return (
        f"Pre-release build of the upstream `{tag}` sync for testing on a device.\n\n"
        f"The tag is `v{prerelease}`, but the bundled files already say `{version}`: "
        f"`v{version}` will be tagged after the sync PR is merged.\n\n"
        f"Upstream changes: see the `{version}` section of CHANGELOG.md in the sync branch.\n"
    )


def resolve(repo, tag, slug, out):
    out.mkdir(parents=True, exist_ok=True)
    if subprocess.run(["git", "rev-parse", "-q", "--verify", "MERGE_HEAD"], cwd=repo, capture_output=True).returncode != 0:
        print("No merge in progress (MERGE_HEAD missing); the merge failed before producing conflicts.", file=sys.stderr)
        return 2
    conflicted = [p for p in git(repo, "diff", "--name-only", "--diff-filter=U").splitlines() if p]
    blocked = [p for p in conflicted if p not in ALLOWED_CONFLICTS]
    if blocked:
        write_text(out / "conflicts.txt", "\n".join(blocked) + "\n")
        print("Unresolvable conflicts:\n" + "\n".join(blocked), file=sys.stderr)
        return 2

    upstream_ver = tag.removeprefix("v")
    version = f"{upstream_ver}-jp.1"
    now = datetime.now(timezone.utc)
    root = Path(repo)

    for path in ("gradle.properties", "patches-list.json"):
        if path in conflicted:
            git(repo, "checkout", "--theirs", "--", path)
    write_text(root / "gradle.properties", set_gradle_version((root / "gradle.properties").read_text("utf-8"), version))

    xml, placeholders = fill_ja_placeholders((root / SETTINGS_XML).read_text("utf-8"))
    write_text(root / SETTINGS_XML, xml)
    write_text(out / "placeholders.txt", "".join(f"{key}\n" for key in placeholders))

    upstream_changelog = git(repo, "show", "MERGE_HEAD:CHANGELOG.md")
    body = new_section_body(split_sections(upstream_changelog)[1], upstream_ver, bool(placeholders))
    heading = f"## [{version}](https://github.com/{slug}/compare/v{upstream_ver}...v{version}) ({now:%Y-%m-%d})"
    changelog = splice_changelog(upstream_changelog, git(repo, "show", "HEAD:CHANGELOG.md"), heading, body)
    write_text(root / "CHANGELOG.md", changelog)

    bundle = render_bundle(git(repo, "show", "MERGE_HEAD:patches-bundle.json"), body, version, slug, f"{now:%Y-%m-%dT%H:%M:%S}")
    write_text(root / "patches-bundle.json", bundle)

    catalog = (root / CATALOG).read_bytes()
    if re.search(rb"(?m)^(<{7}|={7}|>{7})( |$)", catalog):
        raise SystemExit(f"{CATALOG} still contains conflict markers")
    json.loads(catalog)
    write_text(root / CATALOG_SHA, hashlib.sha256(catalog).hexdigest())

    resolved = ["CHANGELOG.md", "gradle.properties", "patches-bundle.json", CATALOG_SHA]
    resolved += [p for p in ("patches-list.json",) if p in conflicted] + ([SETTINGS_XML] if placeholders else [])
    git(repo, "add", "--", *resolved)
    write_text(out / "pr-body.md", pr_body(tag, version, resolved, placeholders))
    write_text(out / "release-notes.md", release_notes(tag, version))
    print(f"Resolved {tag} as {version}; {len(placeholders)} Japanese placeholder(s).")
    return 0


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--upstream-tag", required=True)
    parser.add_argument("--repo-slug", required=True)
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--repo", default=".", help="repository root (default: current directory)")
    args = parser.parse_args(argv)
    if not re.fullmatch(r"v\d+\.\d+\.\d+", args.upstream_tag):
        parser.error("--upstream-tag must look like v1.2.3")
    return resolve(args.repo, args.upstream_tag, args.repo_slug, args.out)


if __name__ == "__main__":
    sys.exit(main())
