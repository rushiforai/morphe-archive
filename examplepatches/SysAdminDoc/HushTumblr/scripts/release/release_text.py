"""Release text for HushTumblr: the CHANGELOG cut, the GitHub release notes and the index.

  py -3 scripts/release/release_text.py check (--unreleased | --version 0.0.7)
  py -3 scripts/release/release_text.py cut --version 0.0.7 [--date 2026-10-11]
  py -3 scripts/release/release_text.py notes --version 0.0.7 --intro FILE --tail FILE --out FILE
  py -3 scripts/release/release_text.py index --version 0.0.7 --created 2026-10-11T03:34:54
        --summary FILE --runtime N --patch N --sha256 HEX

Every command checks its inputs first and changes nothing when a check fails. --root points any
of them at another checkout, which is how the unit tests run them. scripts/release/release.ps1
runs them in stage order.

A release section of the CHANGELOG may only hold plain bullets and "* **Tooling:** " bullets,
one line each. HushTumblr patches one app, so a bullet with no label is a change to Tumblr and
needs no "Tumblr:" in front of it. A bullet that still opens with "* **Tumblr:** " is accepted as the
same thing and the label is dropped when the section is cut, so it never reaches the CHANGELOG
release section, the GitHub notes or the index. Morphe Manager's reader shows unlabeled lines as
the update, skips Tooling lines, and refuses any other label. The notes carry every bullet of the
section, the Tumblr ones under "What's new" and Tooling ones under "Behind the scenes", between the
intro and the tail written by hand for that release. The index description carries the same
bullets under level-three headings, so Manager can show the current release's changes too.
"""

import argparse
import datetime
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import NoReturn

ROOT = Path(__file__).resolve().parents[2]
APP = "Tumblr"
SCOPES = (APP, "Tooling")
VERSION = re.compile(r"^\d+\.\d+\.\d+$")
DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
CREATED = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$")
SHA256 = re.compile(r"^[0-9a-f]{64}$")
BULLET = re.compile(r"^\* \*\*(?P<scope>[^*\n]+?):\*\* (?P<text>\S.*)$")
DASHES = ("\u2014", "\u2013")
REPOSITORY = "SysAdminDoc/HushTumblr"
PACKAGE = "com.tumblr"


class ReleaseTextError(Exception):
    pass


def fail(message: str) -> NoReturn:
    raise ReleaseTextError(message)


@dataclass(frozen=True)
class Bullet:
    line: str
    scope: str
    text: str


def read(path: Path) -> tuple[str, str]:
    """The file's text with LF line ends, and the line end it was written with."""
    raw = path.read_bytes().decode("utf-8")
    newline = "\r\n" if "\r\n" in raw else "\n"
    return raw.replace("\r\n", "\n"), newline


def write(path: Path, text: str, newline: str = "\n") -> None:
    path.write_bytes(text.replace("\n", newline).encode("utf-8"))


def section_span(text: str, heading: str) -> tuple[int, int, int] | None:
    """Where the `## <heading>` section starts, where its body starts and where it ends.

    The heading has to be the whole line, or the version followed by a space (a dated heading).
    The body runs to the next level-two heading, or to the end of the file.
    """
    match = re.search(rf"^## {re.escape(heading)}(?: [^\n]*)?$\n?", text, re.MULTILINE)
    if not match:
        return None
    following = re.search(r"^## ", text[match.end():], re.MULTILINE)
    end = match.end() + following.start() if following else len(text)
    return match.start(), match.end(), end


def release_bullets(body: str, label: str) -> list[Bullet]:
    """The bullets of a section that is about to be released, or a failure naming what's wrong."""
    bullets: list[Bullet] = []
    refused: list[str] = []
    dashed: list[str] = []
    for line in body.split("\n"):
        if not line.strip():
            continue
        if not line.startswith("* "):
            fail(f"{label} has a line that isn't a bullet of its own, and Morphe Manager would drop it. "
                 f"Join it onto the bullet above: {line[:80]}")
        if not line[2:].strip():
            fail(f"{label} has an empty bullet: {line[:80]}")
        match = BULLET.match(line)
        if not match:
            # No label: a change to the app, written as it stands.
            bullet = Bullet(line, APP, line[2:].strip())
        elif match.group("scope") == APP:
            # The app's own label says nothing here, so the bullet is kept without it.
            bullet = Bullet("* " + match.group("text"), APP, match.group("text"))
        else:
            bullet = Bullet(line, match.group("scope"), match.group("text"))
        if bullet.scope not in SCOPES:
            refused.append(f"**{bullet.scope}:** {bullet.text[:60]}")
        if any(dash in line for dash in DASHES):
            dashed.append(line[:60])
        bullets.append(bullet)
    if refused:
        fail(f"{label} has bullets a release can't carry: a release section takes only plain bullets "
             f"and **Tooling:** bullets, since Morphe Manager's reader refuses any other scope. Remove the "
             f"label or move these out of the section: " + "; ".join(refused))
    if dashed:
        fail(f"{label} has em or en dashes. Rewrite these: " + "; ".join(dashed))
    if not bullets:
        fail(f"{label} has no bullets, so there is nothing to release.")
    if not any(b.scope == APP for b in bullets):
        fail(f"{label} has no bullet about the app (one without a **Tooling:** label), so Morphe Manager "
             "would show this release as no update.")
    return bullets


def check_version(version: str) -> None:
    if not VERSION.match(version):
        fail(f"{version} isn't X.Y.Z.")


def changelog(root: Path) -> Path:
    path = root / "CHANGELOG.md"
    if not path.is_file():
        fail(f"There is no CHANGELOG.md at {path}.")
    return path


def released_section(root: Path, version: str) -> list[Bullet]:
    text, _ = read(changelog(root))
    match = re.search(rf"^## {re.escape(version)} \((\d{{4}}-\d{{2}}-\d{{2}})\)$", text, re.MULTILINE)
    if not match:
        fail(f"CHANGELOG has no dated {version} heading. Run the prepare stage first.")
    span = section_span(text, version)
    return release_bullets(text[span[1]:span[2]], f"The {version} section")


def check(args) -> None:
    root = Path(args.root)
    if args.unreleased:
        text, _ = read(changelog(root))
        span = section_span(text, "Unreleased")
        if span is None:
            fail("CHANGELOG has no ## Unreleased section.")
        bullets = release_bullets(text[span[1]:span[2]], "Unreleased")
        label = "Unreleased"
    else:
        check_version(args.version)
        bullets = released_section(root, args.version)
        label = args.version
    tumblr = sum(1 for b in bullets if b.scope == "Tumblr")
    print(f"[release] {label}: {len(bullets)} bullets, {tumblr} Tumblr and {len(bullets) - tumblr} Tooling, "
          "all of them ones a release can carry")


def cut(args) -> None:
    root = Path(args.root)
    check_version(args.version)
    date = args.date or datetime.date.today().isoformat()
    if not DATE.match(date):
        fail(f"{date} isn't YYYY-MM-DD.")
    path = changelog(root)
    text, newline = read(path)
    if re.search(rf"^## \[?v?{re.escape(args.version)}\b", text, re.MULTILINE):
        fail(f"CHANGELOG already has a {args.version} heading.")
    span = section_span(text, "Unreleased")
    if span is None:
        fail("CHANGELOG has no ## Unreleased section to release.")
    start, body_start, end = span
    bullets = release_bullets(text[body_start:end], "Unreleased")
    # Tumblr first, the way Manager and the notes read them, each group in the order written.
    ordered = [b for b in bullets if b.scope == "Tumblr"] + [b for b in bullets if b.scope == "Tooling"]
    heading = f"## {args.version} ({date})"
    after = text[end:]
    released = heading + "\n\n" + "\n".join(b.line for b in ordered) + ("\n\n" if after else "\n")
    write(path, text[:start] + released + after, newline)
    tumblr = sum(1 for b in ordered if b.scope == "Tumblr")
    print(f"[release] {len(ordered)} bullets under {heading}: {tumblr} Tumblr, {len(ordered) - tumblr} Tooling")


def notes(args) -> None:
    root = Path(args.root)
    check_version(args.version)
    bullets = released_section(root, args.version)
    intro = read(Path(args.intro))[0].strip()
    tail = read(Path(args.tail))[0].strip()
    if not intro or not tail:
        fail("The intro and the tail are the paragraphs written for this release around its CHANGELOG "
             "bullets. Neither can be empty.")
    for name, part in (("intro", intro), ("tail", tail)):
        if re.search(r"^## (What's new|Behind the scenes)\s*$", part, re.MULTILINE):
            fail(f"The {name} has a What's new or Behind the scenes heading of its own. Those two come from the "
                 "CHANGELOG, every bullet of the section.")
    whats_new = ["- " + b.text for b in bullets if b.scope == "Tumblr"]
    behind = ["- " + b.text for b in bullets if b.scope == "Tooling"]
    parts = [intro, "## What's new\n\n" + "\n".join(whats_new)]
    if behind:
        parts.append("## Behind the scenes\n\n" + "\n".join(behind))
    parts.append(tail)
    body = "\n\n".join(parts) + "\n"
    if any(dash in body for dash in DASHES):
        fail("The notes have an em or en dash. Rewrite the intro or the tail.")
    lines = set(body.split("\n"))
    missing = [b.text[:60] for b in bullets if "- " + b.text not in lines]
    if missing:
        fail("These CHANGELOG bullets didn't make it into the notes: " + "; ".join(missing))
    write(Path(args.out), body)
    print(f"[release] notes for {args.version}: all {len(bullets)} bullets of the section, "
          f"{len(whats_new)} under What's new and {len(behind)} under Behind the scenes")


def catalog_facts(root: Path, version: str) -> tuple[int, str, int]:
    """The patch count, the one declared Tumblr build and its version code."""
    data = json.loads(read(root / "patches-list.json")[0])
    if data.get("version") != f"v{version}":
        fail(f"patches-list.json is {data.get('version')}, not v{version}. Run the prepare stage first.")
    patches = data["patches"]
    builds: set[tuple[str, int]] = set()
    for patch in patches:
        for app in patch.get("compatibility") or []:
            if app.get("packageName") != PACKAGE:
                continue
            for target in app.get("targets") or []:
                if target.get("experimental"):
                    continue
                for code in (target.get("versionCodes") or {}).values():
                    builds.add((target["version"], int(code)))
    if len(builds) != 1:
        fail("patches-list.json has to declare exactly one Tumblr build for a release, and it declares "
             + (", ".join(f"{v} ({c})" for v, c in sorted(builds)) or "none") + ".")
    (target, code), = builds
    return len(patches), target, code


def manager_floor(root: Path) -> str:
    match = re.search(r'^manager-floor\s*=\s*"(\d+(?:\.\d+)+)"', read(root / "gradle/libs.versions.toml")[0], re.MULTILINE)
    if not match:
        fail("gradle/libs.versions.toml has no manager-floor.")
    return match.group(1)


def android_floor(readme: str) -> str:
    match = re.search(r"img\.shields\.io/badge/platform-Android%20(\d+)%2B", readme)
    if not match:
        fail("README has no platform badge saying which Android it needs.")
    return match.group(1)


def swap(text: str, pattern: str, replacement: str, what: str) -> str:
    new, count = re.subn(pattern, replacement, text, count=1, flags=re.MULTILINE)
    if count != 1:
        fail(f"{what}: nothing matched {pattern[:70]!r}.")
    return new


def index(args) -> None:
    root = Path(args.root)
    check_version(args.version)
    if not CREATED.match(args.created):
        fail(f"--created {args.created} isn't YYYY-MM-DDTHH:MM:SS (the release's publishedAt, in UTC).")
    if args.runtime <= 0 or args.patch <= 0:
        fail("The runtime and patch test counts come from the release gate's results and can't be zero.")
    if not SHA256.match(args.sha256):
        fail(f"--sha256 {args.sha256} isn't the 64 lowercase hex digits of the signed patches-{args.version}.mpp.")
    bullets = released_section(root, args.version)
    count, target, code = catalog_facts(root, args.version)
    floor = manager_floor(root)
    readme_path = root / "README.md"
    readme, readme_newline = read(readme_path)
    android = android_floor(readme)
    summary = read(Path(args.summary))[0].strip()
    if not summary:
        fail("The summary is the release's own sentence or two for Morphe Manager, and it can't be empty.")
    # The release facts check reads every "N patches" and every "Tumblr <build>" in the
    # description, and each has to name this release's.
    for other in re.findall(r"(?<![\d.])(\d+) patches\b", summary):
        if int(other) != count:
            fail(f"The summary says {other} patches, and this release has {count}.")
    for other in re.findall(r"Tumblr\s+(\d+(?:\.\d+)+)(?!\d)", summary):
        if other != target:
            fail(f"The summary names Tumblr {other}, and this release targets {target}.")
    description = (
        f"HushTumblr v{args.version}: {count} patches for Tumblr {target}, which needs Android {android} "
        f"or newer. {summary} Validation: {args.runtime} runtime tests passed. All {args.patch} patch tests "
        f"passed. All {count} patches applied without forcing to Tumblr {target}. Needs Morphe Manager "
        f"{floor} or newer. The .mpp is a patch bundle, not a Tumblr APK. Uninstall the stock app first, "
        "then sign in with your email and a Tumblr password."
    )
    if any(dash in description for dash in DASHES):
        fail("The summary has an em or en dash.")
    # Manager reads the current release from its description rather than CHANGELOG.md.
    # Keep the facts above the first heading: release bullets may name older builds or counts.
    for scope, heading in (("Tumblr", "What's new"), ("Tooling", "Behind the scenes")):
        lines = [bullet.line for bullet in bullets if bullet.scope == scope]
        if lines:
            description += f"\n\n### {heading}\n\n" + "\n".join(lines)
    bundle_path = root / "patches-bundle.json"
    if bundle_path.exists():
        if args.first:
            fail("--first writes the first patches-bundle.json, and there is one already.")
        bundle_text, bundle_newline = read(bundle_path)
        bundle = json.loads(bundle_text)
    elif args.first:
        # The first release has no index to update. The keys are the ones every index carries,
        # in its order; Manager reads no signature file, so that URL stays empty.
        bundle = {"created_at": "", "description": "", "download_url": "", "signature_download_url": "", "version": ""}
        bundle_newline = "\n"
    else:
        fail("patches-bundle.json is missing. Only the first release writes a new one, and "
             "publish-release.ps1 says --first only when no release came before.")
    bundle.update({
        "created_at": args.created,
        "description": description,
        "download_url": f"https://github.com/{REPOSITORY}/releases/download/v{args.version}/patches-{args.version}.mpp",
        "version": args.version,
    })
    readme = swap(readme, r"^The latest release is \[v\d+\.\d+\.\d+\]\([^)\s]*\), with \d+ patches\.",
                  f"The latest release is [v{args.version}](https://github.com/{REPOSITORY}/releases/tag/v{args.version}), "
                  f"with {count} patches.", "README")
    # The Verify a download example: label, digest and file name all move to the signed asset.
    readme = swap(readme, r"^(.* )The v\d+\.\d+\.\d+ bundle's line:$", rf"\g<1>The v{args.version} bundle's line:",
                  "README checksum label")
    readme = swap(readme, r"^[0-9a-f]{64}  patches-\d+\.\d+\.\d+\.mpp$", f"{args.sha256}  patches-{args.version}.mpp",
                  "README checksum line")
    form_path = root / ".github/ISSUE_TEMPLATE/bug_report.yml"
    form, form_newline = read(form_path)
    # [ \t] and not \s at the line ends: under MULTILINE \s* runs on through a blank line.
    form = swap(form, r"^([ \t]*placeholder:[ \t]*)HushTumblr \S+ on Tumblr \S+[ \t]*$",
                rf"\g<1>HushTumblr {args.version} on Tumblr {target}", "bug report form")
    # The file the reporter patched, when the form still offers one as an example.
    form = re.sub(r"^([ \t]*placeholder:[ \t]*APKMirror (?:bundle|universal APK), )\d+(?:\.\d+)+ \(\d+\)[ \t]*$",
                  rf"\g<1>{target} ({code})", form, count=1, flags=re.MULTILINE)
    write(bundle_path, json.dumps(bundle, indent=2, ensure_ascii=False) + "\n", bundle_newline)
    write(readme_path, readme, readme_newline)
    write(form_path, form, form_newline)
    print(f"[release] the index, README and bug form point at v{args.version}: {count} patches for Tumblr {target}, "
          f"{args.runtime} runtime and {args.patch} patch tests, Morphe Manager {floor} or newer")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--root", default=str(ROOT), help="the checkout to work on (this one by default)")
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("check", help="hold a section to what a release can carry, changing nothing")
    group = p.add_mutually_exclusive_group(required=True)
    group.add_argument("--unreleased", action="store_true")
    group.add_argument("--version")
    p.set_defaults(run=check)
    p = sub.add_parser("cut", help="date the Unreleased section as the release")
    p.add_argument("--version", required=True)
    p.add_argument("--date")
    p.set_defaults(run=cut)
    p = sub.add_parser("notes", help="write the GitHub release notes from the released section")
    for name in ("--version", "--intro", "--tail", "--out"):
        p.add_argument(name, required=True)
    p.set_defaults(run=notes)
    p = sub.add_parser("index", help="point patches-bundle.json, the README and the bug form at the release")
    for name in ("--version", "--created", "--summary", "--sha256"):
        p.add_argument(name, required=True)
    p.add_argument("--runtime", type=int, required=True)
    p.add_argument("--patch", type=int, required=True)
    p.add_argument("--first", action="store_true",
                   help="the first release: write patches-bundle.json, which doesn't exist yet")
    p.set_defaults(run=index)
    args = parser.parse_args(argv)
    try:
        args.run(args)
    except ReleaseTextError as error:
        print(f"[release] {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
