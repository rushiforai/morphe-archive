"""Release text for Hushfeed: the CHANGELOG cut, translation checks, GitHub notes and the index.

  py -3.13 tools/release_text.py cut --version 0.70.0 [--date 2026-10-09]
  py -3.13 tools/release_text.py check-translations (--version 0.70.0 | --unreleased)
  py -3.13 tools/release_text.py github-notes --version 0.70.0 --intro FILE --checked FILE --out FILE
  py -3.13 tools/release_text.py index --version 0.70.0 --created 2026-10-09T17:03:42
        --readme-summary FILE --bundle-summary FILE --device-line TEXT --runtime N --patch N

Each command checks its inputs and changes nothing when a check fails. scripts/release/release.ps1
runs them in order; they can also run alone.
"""

import argparse
import datetime
import json
import re
from pathlib import Path
from typing import NoReturn

ROOT = Path(__file__).resolve().parents[1]
CHANGELOG = ROOT / "CHANGELOG.md"
NOTES = ROOT / "extensions/tiktok/src/main/l10n/notes"
LANGUAGES = ("az", "de", "es", "in", "it", "pt-rBR", "ru", "tr")
SCOPE = "* **TikTok:** "
VERSION = re.compile(r"^\d+\.\d+\.\d+$")
DASHES = ("—", "–")
# Letters only another table uses: a translation answered from the wrong table shows up here.
FOREIGN = {
    "az": r"[Ѐ-ӿ]|ñ|ã|õ|ß|ä",
    "de": r"[Ѐ-ӿ]|ə|ğ|ı|ş|ñ|ã|õ|ç",
    "es": r"[Ѐ-ӿ]|ə|ğ|ı|ş|ß|ä|ã|õ",
    "in": r"[Ѐ-ӿ]|ə|ğ|ı|ş|ß|ä|ñ|ã|õ|ç|é|ü|ö",
    "it": r"[Ѐ-ӿ]|ə|ğ|ı|ş|ß|ä|ñ|ã|õ|ç",
    "pt-rBR": r"[Ѐ-ӿ]|ə|ğ|ı|ş|ß|ä|ñ",
    "ru": r"ə|ğ|ı|ş|ß|ä|ñ|ã|õ|ç|é|ü|ö",
    "tr": r"[Ѐ-ӿ]|ə|ß|ä|ñ|ã|õ",
}
# Every table writes decimals with a comma, so an English "10,000" or "6.7 MB" is untranslated.
ENGLISH_NUMBER = re.compile(r"\b\d{1,3}(?:,\d{3})+\b|\b\d+\.\d+ ?(?:MB|GB|KB|K|M|x|%)(?!\w)")


def fail(message: str) -> NoReturn:
    raise SystemExit(f"[release] {message}")


def read(path: Path) -> str:
    return path.read_text(encoding="utf-8").replace("\r\n", "\n")


def write(path: Path, text: str) -> None:
    path.write_text(text, encoding="utf-8", newline="\n")


def section(text: str, heading: str) -> str | None:
    """The body under a `## <heading>` line up to the next `## ` line, or None."""
    match = re.search(rf"^## {re.escape(heading)}[^\n]*\n", text, re.MULTILINE)
    if not match:
        return None
    rest = text[match.end():]
    following = re.search(r"^## ", rest, re.MULTILINE)
    return rest[: following.start()] if following else rest


def bullets(body: str) -> list[str]:
    lines = [line for line in body.split("\n") if line.strip()]
    stray = [line for line in lines if not line.startswith("* ")]
    if stray:
        fail("a bullet runs over more than one line, join it: " + stray[0][:80])
    return lines


def heading_of(version: str) -> str:
    """The CHANGELOG heading line of a published version."""
    match = re.search(rf"^## {re.escape(version)} \([^)]*\)$", read(CHANGELOG), re.MULTILINE)
    if not match:
        fail(f"CHANGELOG has no published {version} heading")
    return match.group(0)


def cut(args) -> None:
    if not VERSION.match(args.version):
        fail(f"{args.version} isn't X.Y.Z")
    date = args.date or datetime.date.today().isoformat()
    text = read(CHANGELOG)
    if re.search(rf"^## {re.escape(args.version)} ", text, re.MULTILINE):
        fail(f"CHANGELOG already has {args.version}")
    body = section(text, "Unreleased")
    if body is None:
        fail("CHANGELOG has no ## Unreleased")
    items = bullets(body)
    if not items:
        fail("Unreleased is empty")
    unscoped = [i for i in items if not i.startswith(SCOPE)]
    if unscoped:
        fail("Manager shows only TikTok-scoped bullets, retag these: " + "; ".join(i[:60] for i in unscoped))
    heading = f"## {args.version} ({date})"
    new = "## Unreleased\n\n" + heading + "\n\n" + "\n\n".join(items) + "\n\n"
    start = text.index("## Unreleased\n")
    end = start + len("## Unreleased\n") + len(body)
    tables = {lang: NOTES / f"{lang}.txt" for lang in LANGUAGES}
    drafted = {lang: section(read(p), "Unreleased") for lang, p in tables.items() if p.exists()}
    have = [lang for lang, b in drafted.items() if b is not None and b.strip()]
    if have and len(have) != len(LANGUAGES):
        fail("translated in some tables only (" + ", ".join(have) + "): translate every table or none")
    if have:
        # Translated as the bullets landed: hold them to the English before they become the release.
        check_translations(argparse.Namespace(version=None, unreleased=True))
    write(CHANGELOG, text[:start] + new + text[end:].lstrip("\n"))
    for lang in have:
        table = read(tables[lang])
        write(tables[lang], table.replace("## Unreleased\n", heading + "\n", 1))
    print(f"[release] {len(items)} bullets under {heading}; "
          + (f"What's new translated in {len(have)} tables" if have else "What's new is English only"))


def check_translations(args) -> None:
    english_text = read(CHANGELOG)
    key = "Unreleased" if args.unreleased else args.version
    english_body = section(english_text, key)
    if english_body is None:
        fail(f"CHANGELOG has no {key} section")
    english = bullets(english_body)
    problems = []
    found = 0
    for lang in LANGUAGES:
        path = NOTES / f"{lang}.txt"
        if not path.exists():
            continue
        raw = path.read_bytes()
        if raw.startswith(b"\xef\xbb\xbf") or b"\r" in raw:
            problems.append(f"{lang}: BOM or CR line endings")
        body = section(raw.decode("utf-8"), key)
        if body is None or not body.strip():
            continue
        found += 1
        items = bullets(body)
        if len(items) != len(english):
            problems.append(f"{lang}: {len(items)} bullets, the CHANGELOG has {len(english)}")
        pattern = re.compile(FOREIGN[lang])
        for number, (a, b) in enumerate(zip(english, items), 1):
            where = f"{lang} bullet {number}"
            if not b.startswith(SCOPE):
                problems.append(f"{where}: doesn't start {SCOPE.strip()}")
            if re.findall(r"#\d+", a) != re.findall(r"#\d+", b):
                problems.append(f"{where}: issue references differ")
            if a.count("`") != b.count("`"):
                problems.append(f"{where}: backtick count differs")
            if any(d in b for d in DASHES):
                problems.append(f"{where}: em or en dash")
            if any(e in b for e in ("&gt;", "&lt;", "&amp;")):
                problems.append(f"{where}: HTML entity")
            hit = pattern.search(b)
            if hit:
                problems.append(f"{where}: letter {hit.group()!r} from another table")
            numbers = ENGLISH_NUMBER.findall(b)
            if numbers:
                problems.append(f"{where}: English number format {sorted(set(numbers))}")
    if found not in (0, len(LANGUAGES)):
        problems.append(f"{found} of {len(LANGUAGES)} tables translate {key}: every table or none")
    if problems:
        fail("translation check failed:\n  " + "\n  ".join(problems[:40]))
    print(f"[release] {key}: {len(english)} bullets, {found} tables translated and consistent")


MANAGER = re.compile(r"Use Morphe Manager (\d+\.\d+\.\d+) or newer")


def manager_floor() -> str:
    match = MANAGER.search(read(ROOT / "README.md"))
    if not match:
        fail("README doesn't say which Morphe Manager to use")
    return match.group(1)


def github_notes(args) -> None:
    body = section(read(CHANGELOG), args.version + " (")
    if body is None:
        fail(f"CHANGELOG has no published {args.version}")
    items = bullets(body)
    stripped = ["* " + i[len(SCOPE):] if i.startswith(SCOPE) else i for i in items]
    intro = read(Path(args.intro)).strip()
    checked = read(Path(args.checked)).strip()
    update = (f"Refresh the Hushfeed source in Morphe Manager {manager_floor()} or newer and patch TikTok "
              "again. Keep the manager's existing signing key so your login and settings carry over. "
              "The .mpp is a patch bundle, not a TikTok APK.")
    notes = (intro + "\n\n## What's changed\n\n" + "\n".join(stripped) + "\n\n## Update\n\n" + update
             + "\n\n## Checked\n\n" + checked + "\n")
    if any(d in notes for d in DASHES):
        fail("the notes have an em or en dash")
    if notes.count("\n* ") < len(items):
        fail("a CHANGELOG bullet didn't make it into the notes")
    write(Path(args.out), notes)
    print(f"[release] notes for {args.version}: {len(stripped)} of {len(items)} CHANGELOG bullets, {len(notes)} characters")


def catalog() -> tuple[int, list[str]]:
    data = json.loads(read(ROOT / "patches-list.json"))
    patches = data["patches"] if isinstance(data, dict) else data
    versions = set()
    for patch in patches:
        for app in patch.get("compatibility") or []:
            versions.update(t["version"] for t in app.get("targets") or []
                            if t.get("version") and not t.get("experimental"))
    return len(patches), sorted(versions, key=lambda v: tuple(map(int, v.split("."))))


def spoken(items: list[str]) -> str:
    return items[0] if len(items) == 1 else ", ".join(items[:-1]) + " and " + items[-1]


SMALL = ("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten")


def counted(n: int) -> str:
    """A count as the prose around it writes one: words up to ten, digits above."""
    return SMALL[n] if 0 <= n < len(SMALL) else str(n)


def swap(path: Path, pattern: str, replacement: str) -> None:
    text = read(path)
    new, count = re.subn(pattern, replacement, text, count=1, flags=re.MULTILINE)
    if count != 1:
        fail(f"{path.name}: nothing matched {pattern[:60]!r}")
    write(path, new)


def index(args) -> None:
    count, targets = catalog()
    if not targets:
        fail("patches-list.json names no TikTok versions")
    manager = manager_floor()
    readme_summary = read(Path(args.readme_summary)).strip()
    bundle_summary = read(Path(args.bundle_summary)).strip()
    apks = "the supported APK" if len(targets) == 1 else f"all {counted(len(targets))} supported APKs"
    description = (
        f"Hushfeed v{args.version} has {count} patches for global TikTok {spoken(targets)} (com.zhiliaoapp.musically).\n\n"
        + bundle_summary + "\n\n"
        + f"Validation: {args.runtime} runtime tests passed and {args.patch} patch tests passed locally. Both Android "
        + f"lint checks passed. All {count} patches applied to {apks} with resource and manifest checks. The "
        + "attached release receipt identifies the exact source and bundle."
        + (f" {args.device_line.strip()}" if args.device_line else "") + "\n\n"
        + f"Needs Morphe Manager {manager} or newer. Refresh the Hushfeed source to update. The .mpp is a patch "
        + "bundle, not a TikTok APK. Keep the manager's existing signing key when updating."
    )
    if any(d in description + readme_summary for d in DASHES):
        fail("the summaries have an em or en dash")
    bundle_path = ROOT / "patches-bundle.json"
    bundle = json.loads(read(bundle_path))
    bundle.update({
        "created_at": args.created,
        "description": description,
        "download_url": f"https://github.com/SysAdminDoc/hushfeed/releases/download/v{args.version}/patches-{args.version}.mpp",
        "version": args.version,
    })
    readme = ROOT / "README.md"
    swap(readme, r"^Hushfeed v\d+\.\d+\.\d+ contains \d+ patches for TikTok .*$",
         f"Hushfeed v{args.version} contains {count} patches for TikTok {spoken(targets)}. New in this one: "
         f"{readme_summary} It needs Morphe Manager {manager} or newer.")
    swap(readme, r"^The main branch contains \d+ patches, .*$",
         f"The main branch contains {count} patches, the same set as v{args.version}.")
    swap(readme, r"shows all \d+ Hushfeed patches", f"shows all {count} Hushfeed patches")
    swap(ROOT / ".github/ISSUE_TEMPLATE/bug_report.yml", r"placeholder: Version \d+\.\d+\.\d+ for TikTok",
         f"placeholder: Version {args.version} for TikTok")
    write(bundle_path, json.dumps(bundle, indent=2, ensure_ascii=False) + "\n")
    print(f"[release] index, README and bug form point at v{args.version} ({count} patches, TikTok {spoken(targets)})")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    p = sub.add_parser("cut")
    p.add_argument("--version", required=True)
    p.add_argument("--date")
    p.set_defaults(run=cut)
    p = sub.add_parser("check-translations")
    group = p.add_mutually_exclusive_group(required=True)
    group.add_argument("--version")
    group.add_argument("--unreleased", action="store_true")
    p.set_defaults(run=check_translations)
    p = sub.add_parser("github-notes")
    for name in ("--version", "--intro", "--checked", "--out"):
        p.add_argument(name, required=True)
    p.set_defaults(run=github_notes)
    p = sub.add_parser("index")
    for name in ("--version", "--created", "--readme-summary", "--bundle-summary"):
        p.add_argument(name, required=True)
    p.add_argument("--device-line", default="")
    p.add_argument("--runtime", type=int, required=True)
    p.add_argument("--patch", type=int, required=True)
    p.set_defaults(run=index)
    args = parser.parse_args()
    args.run(args)


if __name__ == "__main__":
    main()
