"""Release text for HushThreads: the CHANGELOG cut, the README, the GitHub notes and the index.

  python scripts/release/release_text.py cut --version 0.0.13 [--date 2026-10-09]
  python scripts/release/release_text.py readme --version 0.0.13
  python scripts/release/release_text.py notes --version 0.0.13 --intro FILE --update FILE --out FILE
  python scripts/release/release_text.py index --version 0.0.13 --created 2026-10-09T17:03:42 --summary FILE
  python scripts/release/release_text.py description --version 0.0.13 --current FILE --out FILE

Each command checks its inputs and writes nothing when a check fails. scripts/release/release.ps1
runs them stage by stage, and they can also run alone. scripts/validate-release-facts.ps1 stays the
judge of what they write: the stages run it after them.
"""

from __future__ import annotations

import argparse
import datetime
import json
import re
import sys
import xml.etree.ElementTree as ElementTree
from pathlib import Path
from typing import NoReturn

ROOT = Path(__file__).resolve().parents[2]
APP = "Threads"
# The scopes a released section may use, in the order the GitHub notes list them. Morphe Manager
# shows a bullet only to the app it names, so Docs and Tooling bullets reach nobody there.
SCOPES = ("Threads", "Docs", "Tooling")
VERSION = re.compile(r"^\d+\.\d+\.\d+$")
DASHES = ("\u2014", "\u2013")
BULLET = re.compile(r"^\* \*\*(?P<scope>[^*]+?):\*\* (?P<text>\S.*)$")
MANAGER_NAMED = re.compile(r"\bMorphe Manager(?:\]\([^)\s]*\))?\s+(\d+(?:\.\d+)+)\s+or newer\b")
# The release check test sends a User-Agent naming the version, so the cut moves it with the rest.
USER_AGENT_TEST = "extensions/threads/src/test/java/app/morphe/extension/hushthreads/settings/ReleaseTransportTest.java"
RUNTIME_RESULTS = ("extensions/threads/build/test-results/testDebugUnitTest",)
PATCH_RESULTS = ("patches/build/test-results/test", "patches/build/test-results/fixtureTest")
SMALL = ("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten")


def fail(message: str) -> NoReturn:
    raise SystemExit(f"[release] {message}")


def here(name: str) -> Path:
    return ROOT / name


def read(path: Path) -> str:
    if not path.is_file():
        fail(f"{path} is missing")
    return path.read_text(encoding="utf-8").replace("\r\n", "\n")


def write(path: Path, text: str) -> None:
    path.write_text(text, encoding="utf-8", newline="\n")


def key(version: str) -> tuple[int, ...]:
    return tuple(int(part) for part in version.split("."))


def check_version(version: str) -> None:
    if not VERSION.match(version):
        fail(f"{version} isn't X.Y.Z")


def swap(text: str, pattern: str, replacement: str, what: str, expected: int | None = 1) -> str:
    """Replaces every match, and fails unless there were `expected` of them (at least one for None)."""
    new, count = re.subn(pattern, replacement, text, flags=re.MULTILINE)
    if count == 0 or (expected is not None and count != expected):
        fail(f"{what}: expected {expected if expected is not None else 'at least one'} match, found {count}")
    return new


def section_span(text: str, heading: str) -> tuple[int, int, int] | None:
    """Where the `## <heading>` line starts, where its body starts and where the body ends."""
    match = re.search(rf"^## {re.escape(heading)}[^\n]*\n", text, re.MULTILINE)
    if not match:
        return None
    following = re.search(r"^#{1,2}(?!#)\s", text[match.end():], re.MULTILINE)
    end = match.end() + following.start() if following else len(text)
    return match.start(), match.end(), end


def bullets(body: str, where: str) -> list[tuple[str, str]]:
    """Each `* **Scope:** text` line as (scope, text), refusing anything Manager would misread."""
    items = []
    for line in body.split("\n"):
        if not line.strip():
            continue
        match = BULLET.match(line)
        if not match:
            if line.lstrip().startswith(("- ", "+ ")):
                fail(f"{where}: Manager reads '* ' bullets only, so rewrite this one: {line[:80]}")
            fail(f"{where}: every line has to be a one-line '* **Scope:** ' bullet, so join or rescope: {line[:80]}")
        scope = match.group("scope")
        if scope not in SCOPES:
            fail(f"{where}: {scope} isn't one of the scopes {', '.join(SCOPES)}: {line[:80]}")
        if any(dash in line for dash in DASHES):
            fail(f"{where}: em or en dash in: {line[:80]}")
        items.append((scope, match.group("text")))
    return items


def source_version() -> str:
    match = re.search(r"(?m)^\s*version\s*=\s*(\S+)\s*$", read(here("gradle.properties")))
    if not match:
        fail("gradle.properties names no version")
    return match.group(1)


def manager_floor() -> str:
    match = re.search(r'(?m)^\s*manager-floor\s*=\s*"([^"]+)"', read(here("gradle/libs.versions.toml")))
    if not match:
        fail("gradle/libs.versions.toml pins no manager-floor")
    return match.group(1)


def catalog() -> dict:
    """The facts patches-list.json gives: its version, the patch count, the package and its builds."""
    data = json.loads(read(here("patches-list.json")))
    patches = data.get("patches") or []
    if not patches:
        fail("patches-list.json lists no patches")
    packages: dict[str, set] = {}
    codes: dict[str, set] = {}
    for patch in patches:
        for package, versions in (patch.get("compatiblePackages") or {}).items():
            packages.setdefault(package, set()).update(str(v) for v in versions or [])
    if len(packages) != 1:
        fail(f"patches-list.json names {len(packages)} packages, and a release targets one")
    package, versions = next(iter(packages.items()))
    if not versions:
        fail(f"patches-list.json names no {package} build")
    for patch in patches:
        for entry in patch.get("compatibility") or []:
            if entry.get("packageName") != package:
                continue
            for target in entry.get("targets") or []:
                pinned = target.get("versionCodes") or {}
                codes.setdefault(str(target.get("version")), set()).update(str(c) for c in pinned.values())
    targets = sorted(versions, key=key, reverse=True)
    return {
        "version": str(data.get("version") or ""),
        "count": len(patches),
        "package": package,
        "targets": targets,
        "codes": {v: sorted(codes.get(v, set())) for v in targets},
    }


def test_count(folders: tuple[str, ...], what: str) -> int:
    """Test cases in the JUnit results under the folders, refusing a run with a failure or a skip."""
    total = 0
    files = 0
    for folder in folders:
        directory = here(folder)
        for path in sorted(directory.glob("*.xml")) if directory.is_dir() else []:
            files += 1
            document = ElementTree.parse(path).getroot()
            suites = [document] if document.tag == "testsuite" else document.findall("testsuite")
            for suite in suites:
                for kind in ("failures", "errors", "skipped"):
                    if int(suite.get(kind) or 0):
                        fail(f"{path.name} has {kind}={suite.get(kind)}, so it isn't a clean {what} run to quote")
                total += len(suite.findall("testcase"))
    if files == 0:
        fail(f"no {what} test results under {', '.join(folders)}. -Stage build runs them in this checkout")
    return total


def spoken(items: list[str]) -> str:
    return items[0] if len(items) == 1 else ", ".join(items[:-1]) + " and " + items[-1]


def counted(n: int) -> str:
    """A count as the prose around it writes one: words up to ten, digits above."""
    return SMALL[n] if 0 <= n < len(SMALL) else str(n)


def runs(targets: list[str]) -> str:
    if len(targets) <= 2:
        return "the run" if len(targets) == 1 else "both runs"
    return f"all {counted(len(targets))} runs"


def dated_section(version: str) -> list[tuple[str, str]]:
    changelog = read(here("CHANGELOG.md"))
    span = section_span(changelog, f"{version} (")
    if span is None:
        fail(f"CHANGELOG has no dated {version} heading. Run -Stage prepare first")
    items = bullets(changelog[span[1]:span[2]], version)
    if not any(scope == APP for scope, _ in items):
        fail(f"the {version} section has no **{APP}:** bullet, so Manager would show no update")
    return items


def cut(args) -> None:
    version = args.version
    check_version(version)
    date = args.date or datetime.date.today().isoformat()
    try:
        datetime.date.fromisoformat(date)
    except ValueError:
        fail(f"{date} isn't a YYYY-MM-DD date")
    old = source_version()
    if not VERSION.match(old) or key(version) <= key(old):
        fail(f"gradle.properties is at {old}, and a release moves forward from it, so {version} can't be cut")
    changelog = read(here("CHANGELOG.md"))
    if re.search(rf"^##\s+\[?v?{re.escape(version)}(?![\d.])", changelog, re.MULTILINE):
        fail(f"CHANGELOG already has a {version} heading")
    span = section_span(changelog, "Unreleased")
    if span is None:
        fail("CHANGELOG has no ## Unreleased section to release")
    start, body, end = span
    items = bullets(changelog[body:end], "Unreleased")
    if not items:
        fail("Unreleased has no bullets")
    if not any(scope == APP for scope, _ in items):
        fail(f"Unreleased has no **{APP}:** bullet, so Manager would show no update")
    heading = f"## {version} ({date})"
    edits = {"CHANGELOG.md": changelog[:start] + heading + "\n" + changelog[body:]}
    edits["gradle.properties"] = swap(read(here("gradle.properties")),
                                      rf"^(\s*version\s*=\s*){re.escape(old)}(\s*)$", rf"\g<1>{version}\g<2>",
                                      "gradle.properties version")
    readme = swap(read(here("README.md")), rf"(img\.shields\.io/badge/version-){re.escape(old)}-",
                  rf"\g<1>{version}-", "README version badge")
    edits["README.md"] = swap(readme, rf'alt="Version {re.escape(old)}"', f'alt="Version {version}"',
                              "README version badge text")
    edits[USER_AGENT_TEST] = swap(read(here(USER_AGENT_TEST)), rf"HushThreads/{re.escape(old)}(?![\w.])",
                                  f"HushThreads/{version}", "the release check test's User-Agent", expected=None)
    for name, text in edits.items():
        write(here(name), text)
    scopes = ", ".join(f"{sum(1 for s, _ in items if s == scope)} {scope}" for scope in SCOPES)
    print(f"[release] {len(items)} bullets under {heading} ({scopes}); {old} moves to {version} in "
          "gradle.properties, the README badge and the release check test")


def readme(args) -> None:
    version = args.version
    check_version(version)
    info = catalog()
    if info["version"] != f"v{version}":
        fail(f"patches-list.json is at {info['version']}, not v{version}. Run :patches:generatePatchesList after the cut")
    path = here("README.md")
    text = read(path)
    latest = re.compile(r"^(The latest release is )\[v(\d+\.\d+\.\d+)\]\((https://github\.com/[^)\s]+/releases/tag/)"
                        r"v\d+\.\d+\.\d+\), with \d+ patches\.", re.MULTILINE)
    found = latest.findall(text)
    if len(found) != 1:
        fail(f"README has {len(found)} 'The latest release is [vX](...), with N patches.' lines, and needs one")
    previous = found[0][1]
    text = latest.sub(rf"\g<1>[v{version}](\g<3>v{version}), with {info['count']} patches.", text)
    text, moved = re.subn(r"^HushThreads v\d+\.\d+\.\d+ has \d+ patches\.", f"HushThreads v{version} has {info['count']} patches.",
                          text, flags=re.MULTILINE)
    write(path, text)
    print(f"[release] README names v{version} as the latest release, with {info['count']} patches"
          + (", and its Patches section does too" if moved else ""))
    stale = [(number, line) for number, line in enumerate(text.split("\n"), 1)
             if re.search(rf"(?<![\d.]){re.escape(previous)}(?![\d.])", line)]
    if stale:
        print(f"[release] README lines that still name {previous}, for review:")
        for number, line in stale:
            print(f"  {number}: {line[:120]}")


def notes(args) -> None:
    version = args.version
    check_version(version)
    items = dated_section(version)
    intro = read(Path(args.intro)).strip()
    update = read(Path(args.update)).strip()
    for name, text in (("intro", intro), ("update", update)):
        if not text:
            fail(f"the {name} file is empty")
        if re.search(r"^#{1,2} ", text, re.MULTILINE):
            fail(f"the {name} has a heading of its own, and the notes add those")
    floor = manager_floor()
    named = sorted(set(MANAGER_NAMED.findall(intro + "\n" + update)) - {floor})
    if named:
        fail(f"the notes name Morphe Manager {', '.join(named)} or newer, but the catalog pins {floor}")
    info = catalog()
    runtime = test_count(RUNTIME_RESULTS, "runtime")
    patch = test_count(PATCH_RESULTS, "patch")
    sections = []
    carried = 0
    for scope in SCOPES:
        lines = [f"- {text}" for s, text in items if s == scope]
        carried += len(lines)
        if lines:
            sections.append(f"## {scope}\n\n" + "\n".join(lines))
    if carried != len(items):
        fail(f"{len(items) - carried} CHANGELOG bullets didn't make it into the notes")
    targets = info["targets"]
    validation = (f"{runtime} runtime tests and {patch} patch tests passed locally, along with both Android lints and "
                  f"the release script checks. All {info['count']} patches applied without forcing to Threads "
                  f"{spoken(targets)}, and the release receipt records {runs(targets)}. The dependency advisory "
                  "check passed.")
    text = (intro + "\n\n" + "\n\n".join(sections) + "\n\n## Update\n\n" + update + "\n\n## Validation\n\n"
            + validation + "\n")
    if any(dash in text for dash in DASHES):
        fail("the notes have an em or en dash")
    write(Path(args.out), text)
    print(f"[release] notes for v{version}: all {len(items)} CHANGELOG bullets, {runtime} runtime and {patch} "
          f"patch tests, {len(text)} characters")


def index(args) -> None:
    version = args.version
    check_version(version)
    try:
        datetime.datetime.strptime(args.created, "%Y-%m-%dT%H:%M:%S")
    except ValueError:
        fail(f"{args.created} isn't a UTC time written yyyy-MM-ddTHH:mm:ss, which Manager needs")
    info = catalog()
    if info["version"] != f"v{version}":
        fail(f"patches-list.json is at {info['version']}, not v{version}")
    summary = read(Path(args.summary)).strip()
    if not summary:
        fail("the summary file is empty")
    floor = manager_floor()
    targets = info["targets"]
    target, rest = targets[0], targets[1:]
    codes = info["codes"].get(target) or []
    runtime = test_count(RUNTIME_RESULTS, "runtime")
    patch = test_count(PATCH_RESULTS, "patch")
    count = info["count"]
    # Every "Threads <build>" here names the newest declared build, the one the release check
    # reads as the target; the older builds follow it without the app's name.
    description = (
        f"HushThreads v{version} has {count} patches for Threads {target} ({info['package']})"
        + (f", and builds {spoken(rest)} work too" if rest else "") + ".\n\n"
        + summary + "\n\n"
        + f"Validation: {runtime} runtime tests passed locally. All {patch} patch tests passed too, along with both "
        + f"Android lints. All {count} patches applied to Threads {spoken(targets)} without forcing, and the release "
        + f"receipt records {runs(targets)}.\n\n"
        + f"Needs Morphe Manager {floor} or newer. Patch the arm64-v8a bundle of Threads {target}"
        + (f" (version code {' or '.join(codes)})" if codes else "") + (f", or of {spoken(rest)}" if rest else "")
        + ". The .mpp is a patch bundle, not a Threads APK. Uninstall the stock Threads first, and keep the "
        + "manager's signing key for updates."
    )
    if any(dash in description for dash in DASHES):
        fail("the summary has an em or en dash")
    bundle_path = here("patches-bundle.json")
    bundle = json.loads(read(bundle_path))
    url = swap(str(bundle.get("download_url") or ""), r"/releases/download/v\d+\.\d+\.\d+/patches-\d+\.\d+\.\d+\.mpp$",
               f"/releases/download/v{version}/patches-{version}.mpp", "patches-bundle.json download_url")
    bundle.update({"created_at": args.created, "description": description, "download_url": url, "version": version})
    form_path = here(".github/ISSUE_TEMPLATE/bug_report.yml")
    form = swap(read(form_path), r"^([ \t]*placeholder:[ \t]*)Version \d+\.\d+\.\d+ for Threads \S+[ \t]*$",
                rf"\g<1>Version {version} for Threads {target}", "bug report form version placeholder")
    write(bundle_path, json.dumps(bundle, indent=2, ensure_ascii=False) + "\n")
    write(form_path, form)
    print(f"[release] the index and the bug report form point at v{version}: {count} patches for Threads {target}, "
          f"{runtime} runtime and {patch} patch tests")


def description(args) -> None:
    version = args.version
    check_version(version)
    info = catalog()
    count, target = info["count"], info["targets"][0]
    current = read(Path(args.current)).strip()
    new = re.sub(r"\bHushThreads v\d+\.\d+\.\d+", f"HushThreads v{version}", current)
    new = re.sub(r"(?<![\d.])\d+ patches\b", f"{count} patches", new)
    new = re.sub(r"\bThreads\s+\d+(?:\.\d+)+(?!\d)", f"Threads {target}", new)
    missing = [fact for fact, pattern in ((f"HushThreads v{version}", rf"\bHushThreads v{re.escape(version)}\b"),
                                           (f"{count} patches", rf"(?<![\d.]){count} patches\b"),
                                           (f"Threads {target}", rf"\bThreads {re.escape(target)}(?!\d)"))
               if not re.search(pattern, new)]
    if missing:
        fail(f"the repository description doesn't name {', '.join(missing)}. It reads: {current}\n"
             f"Write one in this shape and set it by hand: HushThreads v{version}: ... {count} patches for Threads {target}.")
    if any(dash in new for dash in DASHES):
        fail("the repository description has an em or en dash")
    write(Path(args.out), new + "\n")
    print(f"[release] repository description: {new}")


def main() -> None:
    # A Windows console can't print every character a bullet holds, and a failed print is no reason
    # to stop after the files were written.
    for stream in (sys.stdout, sys.stderr):
        if hasattr(stream, "reconfigure"):
            stream.reconfigure(errors="replace")
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    commands = parser.add_subparsers(dest="command", required=True)
    command = commands.add_parser("cut")
    command.add_argument("--version", required=True)
    command.add_argument("--date")
    command.set_defaults(run=cut)
    command = commands.add_parser("readme")
    command.add_argument("--version", required=True)
    command.set_defaults(run=readme)
    command = commands.add_parser("notes")
    for name in ("--version", "--intro", "--update", "--out"):
        command.add_argument(name, required=True)
    command.set_defaults(run=notes)
    command = commands.add_parser("index")
    for name in ("--version", "--created", "--summary"):
        command.add_argument(name, required=True)
    command.set_defaults(run=index)
    command = commands.add_parser("description")
    for name in ("--version", "--current", "--out"):
        command.add_argument(name, required=True)
    command.set_defaults(run=description)
    args = parser.parse_args()
    args.run(args)


if __name__ == "__main__":
    main()
