"""Release text for HushPinterest: the CHANGELOG cut, the GitHub release notes and the index.

  py -3 scripts/release/release_text.py check (--unreleased | --version 0.0.7)
  py -3 scripts/release/release_text.py cut --version 0.0.7 [--date 2026-10-11]
  py -3 scripts/release/release_text.py notes --version 0.0.7 --intro FILE --tail FILE --out FILE
  py -3 scripts/release/release_text.py index --version 0.0.7 --created 2026-10-11T03:34:54
        --summary FILE --runtime N --patch N [--bundle FILE]
  py -3 scripts/release/release_text.py signed --version 0.0.7 [--bundle FILE]

Every command checks its inputs first and changes nothing when a check fails. --root points any
of them at another checkout, which is how the unit tests run them. scripts/release/release.ps1
runs them in stage order.

A release section of the CHANGELOG may only hold plain bullets and "* **Tooling:** " bullets,
one line each. HushPinterest patches one app, so a bullet with no label is a change to Pinterest and
needs no "Pinterest:" in front of it. A bullet that still opens with "* **Pinterest:** " is accepted as the
same thing and the label is dropped when the section is cut, so it never reaches the CHANGELOG
release section, the GitHub notes or the index. Morphe Manager's reader shows unlabeled lines as
the update, skips Tooling lines, and refuses any other label. The notes carry the section's
Pinterest bullets under "What's new", between the intro and the tail written by hand for that
release. They're for the people patching Pinterest, so the Tooling bullets stay in the CHANGELOG
and neither the intro nor the tail may add a Behind the scenes or Validation section. The index's bundle description is the release
facts, then the section's Pinterest bullets under "### What's new", which Morphe Manager shows for the
release a phone was patched with.
"""

import argparse
import base64
import binascii
import datetime
import hashlib
import json
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import NoReturn

ROOT = Path(__file__).resolve().parents[2]
APP = "Pinterest"
SCOPES = (APP, "Tooling")
VERSION = re.compile(r"^\d+\.\d+\.\d+$")
DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
CREATED = re.compile(r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$")
BULLET = re.compile(r"^\* \*\*(?P<scope>[^*\n]+?):\*\* (?P<text>\S.*)$")
DASHES = ("\u2014", "\u2013")
REPOSITORY = "SysAdminDoc/HushPinterest"
PACKAGE = "com.pinterest"
# A markdown link to a file in this repo. It works in CHANGELOG.md on GitHub, but on a release page it
# resolves under /releases/tag/ and in Morphe Manager it goes nowhere, so the notes and the index carry
# it as a link to the file on main. A link with a scheme (https:, mailto:) or to an anchor is left alone.
RELATIVE_LINK = re.compile(r"(?<=\]\()(?![A-Za-z][A-Za-z0-9+.-]*:|#)(?:\./|/)?([^()\s]+)(?=\))")


class ReleaseTextError(Exception):
    pass


def fail(message: str) -> NoReturn:
    raise ReleaseTextError(message)


@dataclass(frozen=True)
class Bullet:
    line: str
    scope: str
    text: str


def absolute_links(text: str) -> str:
    """The text with every relative link pointed at the file on main."""
    return RELATIVE_LINK.sub(lambda link: f"https://github.com/{REPOSITORY}/blob/main/{link.group(1)}", text)


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


# Ed25519 verification (RFC 8032, 5.1.7) for the MorpheSig1 check. The standard library has no
# Ed25519 and the release runs Python with -I, so no package can supply it. Points are in
# extended coordinates (X, Y, Z, T).
P = 2 ** 255 - 19
L = 2 ** 252 + 27742317777372353535851937790883648493
D = -121665 * pow(121666, P - 2, P) % P
ROOT_OF_MINUS_ONE = pow(2, (P - 1) // 4, P)
IDENTITY = (0, 1, 1, 0)


def point_add(a, b):
    x1, y1, z1, t1 = a
    x2, y2, z2, t2 = b
    e, f, g, h = (y1 - x1) * (y2 - x2), (y1 + x1) * (y2 + x2), 2 * t1 * t2 * D, 2 * z1 * z2
    e, f, g, h = f - e, h - g, h + g, f + e
    return e * f % P, g * h % P, f * g % P, e * h % P


def point_times(point, scalar: int):
    result = IDENTITY
    while scalar:
        if scalar & 1:
            result = point_add(result, point)
        point = point_add(point, point)
        scalar >>= 1
    return result


def point_encode(point) -> bytes:
    x, y, z, _ = point
    inverse = pow(z, P - 2, P)
    x, y = x * inverse % P, y * inverse % P
    return (y | (x & 1) << 255).to_bytes(32, "little")


def point_decode(raw: bytes):
    """The point a 32-byte encoding names, or None for bytes that name no point."""
    y = int.from_bytes(raw, "little")
    sign, y = y >> 255, y & ((1 << 255) - 1)
    if y >= P:
        return None
    square = (y * y - 1) * pow(D * y * y + 1, P - 2, P) % P
    x = pow(square, (P + 3) // 8, P)
    if (x * x - square) % P:
        x = x * ROOT_OF_MINUS_ONE % P
    if (x * x - square) % P or (x == 0 and sign):
        return None
    if x & 1 != sign:
        x = P - x
    return x, y, 1, x * y % P


BASE = point_decode((4 * pow(5, P - 2, P) % P).to_bytes(32, "little"))


def ed25519_verify(public: bytes, message: bytes, signature: bytes) -> bool:
    if len(public) != 32 or len(signature) != 64:
        return False
    key, nonce = point_decode(public), point_decode(signature[:32])
    s = int.from_bytes(signature[32:], "little")
    if key is None or nonce is None or s >= L:
        return False
    # A small-order key (the identity among them) verifies a made-up signature on any content.
    # Java's verifier refuses such a key as malformed, and so does this one.
    if point_encode(point_times(key, 8)) == point_encode(IDENTITY):
        return False
    h = int.from_bytes(hashlib.sha512(signature[:32] + public + message).digest(), "little") % L
    return point_encode(point_times(BASE, s)) == point_encode(point_add(nonce, point_times(key, h)))


def b64(field: str) -> bytes:
    """Base64 the way Java's decoder takes it: padding may be left off, but padding that's there must be right."""
    if "=" not in field and len(field) % 4:
        field += "=" * (-len(field) % 4)
    try:
        return base64.b64decode(field, validate=True)
    except (ValueError, binascii.Error):
        return b""


def published_key(root: Path) -> str:
    path = root / "morphe-signing.pub"
    if not path.is_file():
        fail("There is no morphe-signing.pub, the public half of the bundle signing key.")
    key = read(path)[0].strip()
    if not re.fullmatch(r"[A-Za-z0-9+/]{43}=", key) or point_decode(base64.b64decode(key)) is None:
        fail("morphe-signing.pub isn't a Base64 Ed25519 public key.")
    return key


def bundle_signer(root: Path, version: str, bundle: str | None = None) -> str:
    """The published key, once it's checked that this key signed the bundle as it is now.

    Without `bundle` it reads patches/build/release, where buildAndroid signed the bundle, and holds
    it to the bundle.sha256 written beside it. `bundle` is a copy the release carries on with (the
    assets folder, whose signed SHA256SUMS and hosted copy the release checks on their own), so
    only its signature is read.

    Morphe Manager pins the key it first sees for a source and refuses an update signed by another
    key or by none. So the index only ever names the key in morphe-signing.pub, and only for a
    bundle that key signed: its MorpheSig1 signature checks out over the bytes
    PatchBundleSignature signs, the archive with an empty comment. A bundle changed after signing
    that kept its comment fails here.
    """
    published = published_key(root)
    release = root / "patches/build/release"
    path = Path(bundle) if bundle else release / f"patches-{version}.mpp"
    name = str(path) if bundle else f"patches/build/release/patches-{version}.mpp"
    if not path.is_file():
        fail(f"{name} is missing.")
    data = path.read_bytes()
    if not bundle:
        recorded = release / "bundle.sha256"
        if not recorded.is_file() or read(recorded)[0].strip().lower() != hashlib.sha256(data).hexdigest():
            fail(f"{name} doesn't match the bundle.sha256 the build wrote, so it changed after the build.")
    # The end record is the last one whose comment reaches the end of the file, as signBundle finds it.
    end = data.rfind(b"PK\x05\x06")
    while end >= 0 and (end + 22 > len(data) or int.from_bytes(data[end + 20:end + 22], "little") != len(data) - end - 22):
        end = data.rfind(b"PK\x05\x06", 0, end)
    if end < 0:
        fail(f"{name} isn't a zip.")
    fields = data[end + 22:].decode("ascii", "replace").split(" ")
    if len(fields) != 3 or fields[0] != "MorpheSig1":
        fail(f"{name} isn't signed. Build it again with HUSHPINTEREST_BUNDLE_SIGNING_KEY set.")
    if fields[1] != published:
        fail(f"{name} is signed by another key than morphe-signing.pub.")
    message = b"MorpheSig1" + hashlib.sha256(data[:end + 20] + b"\x00\x00").digest()
    if not ed25519_verify(base64.b64decode(published), message, b64(fields[2])):
        fail(f"{name}'s signature doesn't match its contents, so it changed after it was signed.")
    return published


def signed(args) -> None:
    """Stops a release whose bundle isn't signed by the published key, before anything is tagged."""
    check_version(args.version)
    key = bundle_signer(Path(args.root), args.version, args.bundle)
    print(f"[release] {Path(args.bundle).name if args.bundle else f'patches-{args.version}.mpp'} is signed by "
          f"morphe-signing.pub's key ({key})")


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
    pinterest = sum(1 for b in bullets if b.scope == "Pinterest")
    print(f"[release] {label}: {len(bullets)} bullets, {pinterest} Pinterest and {len(bullets) - pinterest} Tooling, "
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
    # Pinterest first, the way Manager and the notes read them, each group in the order written.
    ordered = [b for b in bullets if b.scope == "Pinterest"] + [b for b in bullets if b.scope == "Tooling"]
    heading = f"## {args.version} ({date})"
    after = text[end:]
    released = heading + "\n\n" + "\n".join(b.line for b in ordered) + ("\n\n" if after else "\n")
    write(path, text[:start] + released + after, newline)
    pinterest = sum(1 for b in ordered if b.scope == "Pinterest")
    print(f"[release] {len(ordered)} bullets under {heading}: {pinterest} Pinterest, {len(ordered) - pinterest} Tooling")


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
        heading = re.search(r"^## (What's new|Behind the scenes|Validation|What was checked)\s*$", part, re.MULTILINE)
        if heading:
            fail(f"The {name} has a ## {heading.group(1)} heading. What's new comes from the CHANGELOG, and "
                 "the notes leave out Behind the scenes and Validation.")
    shown = [b for b in bullets if b.scope == "Pinterest"]
    whats_new = ["- " + absolute_links(b.text) for b in shown]
    body = "\n\n".join([intro, "## What's new\n\n" + "\n".join(whats_new), tail]) + "\n"
    if any(dash in body for dash in DASHES):
        fail("The notes have an em or en dash. Rewrite the intro or the tail.")
    lines = set(body.split("\n"))
    missing = [b.text[:60] for b in shown if "- " + absolute_links(b.text) not in lines]
    if missing:
        fail("These CHANGELOG bullets didn't make it into the notes: " + "; ".join(missing))
    write(Path(args.out), body)
    print(f"[release] notes for {args.version}: {len(whats_new)} bullets under What's new, "
          f"{len(bullets) - len(whats_new)} Tooling left in the CHANGELOG")


def catalog_facts(root: Path, version: str) -> tuple[int, str, int]:
    """The patch count, the one declared Pinterest build and its version code."""
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
        fail("patches-list.json has to declare exactly one Pinterest build for a release, and it declares "
             + (", ".join(f"{v} ({c})" for v, c in sorted(builds)) or "none") + ".")
    (target, code), = builds
    return len(patches), target, code


def manager_floor(root: Path) -> str:
    match = re.search(r'^manager-floor\s*=\s*"(\d+(?:\.\d+)+)"', read(root / "gradle/libs.versions.toml")[0], re.MULTILINE)
    if not match:
        fail("gradle/libs.versions.toml has no manager-floor.")
    return match.group(1)


def android_floor(readme: str) -> str:
    match = re.search(r"img\.shields\.io/badge/platform-Android%20(\d+L?)%2B", readme)
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
    bullets = released_section(root, args.version)
    count, target, code = catalog_facts(root, args.version)
    floor = manager_floor(root)
    readme_path = root / "README.md"
    readme, readme_newline = read(readme_path)
    android = android_floor(readme)
    summary = read(Path(args.summary))[0].strip()
    if not summary:
        fail("The summary is the release's own sentence or two for Morphe Manager, and it can't be empty.")
    if re.search(r"^### ", summary, re.MULTILINE):
        fail("The summary has a ### line, and the release's changes go there.")
    # The release facts check reads every "N patches" and every "Pinterest <build>" in the
    # description, and each has to name this release's.
    for other in re.findall(r"(?<![\d.])(\d+) patches\b", summary):
        if int(other) != count:
            fail(f"The summary says {other} patches, and this release has {count}.")
    for other in re.findall(r"(?<![A-Za-z])Pinterest\s+(\d+(?:\.\d+)+)(?!\d)", summary):
        if other != target:
            fail(f"The summary names Pinterest {other}, and this release targets {target}.")
    description = (
        f"HushPinterest v{args.version}: {count} patches for Pinterest {target}, which needs Android {android} "
        f"or newer. {summary} Validation: {args.runtime} runtime tests passed. All {args.patch} patch tests "
        f"passed. All {count} patches applied without forcing to Pinterest {target}. Needs Morphe Manager "
        f"{floor} or newer. The .mpp is a patch bundle, not a Pinterest APK. Uninstall the stock app first, "
        "then sign in with your email and a Pinterest password."
    )
    if any(dash in description for dash in DASHES):
        fail("The summary has an em or en dash.")
    # Morphe Manager shows this description, not the CHANGELOG, for the release a phone was
    # patched with, and reads a ### heading with * **Scope:** bullets under it as its list of
    # changes. So the section's Pinterest bullets follow the facts word for word, the way Manager
    # shows them for every older release. They come after the facts checks above, which read the
    # prose alone: a bullet may name an older build or another patch count, and
    # validate-release-facts.ps1 reads the description only above its first ### line for that reason.
    description += "\n\n### What's new\n\n" + "\n".join(absolute_links(b.line) for b in bullets if b.scope == "Pinterest")
    bundle_path = root / "patches-bundle.json"
    bundle_text, bundle_newline = read(bundle_path)
    bundle = json.loads(bundle_text)
    # Manager pins the key the index names when it first adds the source. A checkout that
    # publishes a key only indexes a bundle that key signed, read from the copy being released.
    signer = None
    if (root / "morphe-signing.pub").is_file():
        if not args.bundle:
            fail("--bundle names the release's .mpp, so the index can name the key that signed it.")
        signer = bundle_signer(root, args.version, args.bundle)
    bundle.update({
        "created_at": args.created,
        "description": description,
        "download_url": f"https://github.com/{REPOSITORY}/releases/download/v{args.version}/patches-{args.version}.mpp",
        "version": args.version,
    })
    if signer:
        bundle["public_key"] = signer
    readme = swap(readme, r"^The latest release is \[v\d+\.\d+\.\d+\]\([^)\s]*\), with \d+ patches\.",
                  f"The latest release is [v{args.version}](https://github.com/{REPOSITORY}/releases/tag/v{args.version}), "
                  f"with {count} patches.", "README")
    form_path = root / ".github/ISSUE_TEMPLATE/bug_report.yml"
    form, form_newline = read(form_path)
    # [ \t] and not \s at the line ends: under MULTILINE \s* runs on through a blank line.
    form = swap(form, r"^([ \t]*placeholder:[ \t]*)HushPinterest \S+ on Pinterest \S+[ \t]*$",
                rf"\g<1>HushPinterest {args.version} on Pinterest {target}", "bug report form")
    # The file the reporter patched, when the form still offers one as an example. Whatever kind of
    # file it names (a universal APK, a bundle) stays; only the version moves.
    form = re.sub(r"^([ \t]*placeholder:[ \t]*APKMirror [^,\n]+, )\d+(?:\.\d+)+ \(\d+\)[ \t]*$",
                  rf"\g<1>{target} ({code})", form, count=1, flags=re.MULTILINE)
    write(bundle_path, json.dumps(bundle, indent=2, ensure_ascii=False) + "\n", bundle_newline)
    write(readme_path, readme, readme_newline)
    write(form_path, form, form_newline)
    print(f"[release] the index, README and bug form point at v{args.version}: {count} patches for Pinterest {target}, "
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
    for name in ("--version", "--created", "--summary"):
        p.add_argument(name, required=True)
    p.add_argument("--runtime", type=int, required=True)
    p.add_argument("--patch", type=int, required=True)
    p.add_argument("--bundle", help="the .mpp being released, whose signer the index names")
    p.set_defaults(run=index)
    p = sub.add_parser("signed", help="refuse a release bundle morphe-signing.pub's key didn't sign")
    p.add_argument("--version", required=True)
    p.add_argument("--bundle", help="a copy of the bundle to check instead of patches/build/release")
    p.set_defaults(run=signed)
    args = parser.parse_args(argv)
    try:
        args.run(args)
    except ReleaseTextError as error:
        print(f"[release] {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
