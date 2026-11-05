#!/usr/bin/env python3
"""Write the release notes for one release of this patch bundle (Markdown on stdout).

semantic-release runs this as @semantic-release/exec's generateNotesCmd (see .releaserc); its
stdout becomes nextRelease.notes, which goes into CHANGELOG.md, patches-bundle.json, the release
commit message and the GitHub release body.

The notes compare the previous release's patches-list.json with the new one (new, updated and
removed apps; patches added to or removed from an app) and add one line per user-facing commit
(feat -> "New:", fix -> "Fixed:", perf -> "Faster:") under the app its scope names.

    generate_release_notes.py --repo OWNER/REPO --version 2.2.0 --previous-tag v2.1.0 --build
    generate_release_notes.py --repo OWNER/REPO --version 2.2.0 --previous-list old.json \
        --new-list new.json --from v2.1.0 --to HEAD

With --build, the new patches-list.json comes from `./gradlew generatePatchesList` run for the
next version (stdout of Gradle goes to stderr); the tracked patches-list.json is restored after
it, so semantic-release's prepare step still writes the real one. When the working tree already
holds the list for the next version (semantic-release runs generateNotes again after prepare),
that list is used and nothing is built.

The script never fails the release: any error falls back to a plain list of the user-facing
commits, and an error there to a one-line note. It always exits 0. Python stdlib only.
"""

import argparse
from datetime import datetime, timezone
import json
import os
from pathlib import Path
import re
import subprocess
import sys

USER_FACING = {"feat": "New", "fix": "Fixed", "perf": "Faster"}
SUBJECT_RE = re.compile(
    r"^(?P<type>[A-Za-z]+)(?:\((?P<scope>[^)]*)\))?(?P<bang>!)?:\s*(?P<subject>.+)$"
)
# "#123" that is not part of a word, a URL path or an existing Markdown link text.
ISSUE_RE = re.compile(r"(?<![\w/&\[])#(\d+)\b")
UPDATED_TO_VERSION_RE = re.compile(r"^updated? to version\b", re.IGNORECASE)
COMPAT_VAL_RE = re.compile(r"\bval\s+(COMPATIBILITY_\w+)\s*=\s*Compatibility\(")
PACKAGE_NAME_RE = re.compile(r'\bpackageName\s*=\s*"([^"]+)"')
COMPAT_REF_RE = re.compile(r"\bCOMPATIBILITY_[A-Z0-9_]+\b")

UNIVERSAL = "*"
PATCHES_DIR = Path("patches/src/main/kotlin/app/template/patches")
CONSTANTS = PATCHES_DIR / "shared" / "Constants.kt"


def log(message):
    print(f"[release-notes] {message}", file=sys.stderr)


# ---------------------------------------------------------------------------------------------
# Commits
# ---------------------------------------------------------------------------------------------

def normalize(text):
    return re.sub(r"[^a-z0-9]", "", (text or "").lower())


def clean_subject(text, repo):
    text = text.strip().rstrip(".").strip()
    if text:
        text = text[0].upper() + text[1:]
    if repo:
        text = ISSUE_RE.sub(
            lambda m: f"[#{m.group(1)}](https://github.com/{repo}/issues/{m.group(1)})", text
        )
    return text


def parse_commits(subjects):
    """User-facing commits as dicts {label, scopes, subject}, deduplicated, in the given order.

    Skips merge/revert commits, non-conventional subjects, types other than feat/fix/perf, and
    "updated to version ..." commits (the Updated apps table covers those).
    """
    commits, seen = [], set()
    for line in subjects:
        line = (line or "").strip()
        match = SUBJECT_RE.match(line)
        if not match:
            continue
        label = USER_FACING.get(match.group("type").lower())
        subject = match.group("subject").strip()
        if not label or not subject or UPDATED_TO_VERSION_RE.match(subject):
            continue
        scopes = [s.strip() for s in (match.group("scope") or "").split(",") if s.strip()]
        key = (label, tuple(normalize(s) for s in scopes), subject.lower().rstrip("."))
        if key in seen:
            continue
        seen.add(key)
        commits.append({"label": label, "scopes": scopes, "subject": subject})
    return commits


def git(repo_root, *args):
    return subprocess.run(
        ["git", *args], cwd=repo_root, check=True, capture_output=True, text=True,
        encoding="utf-8", errors="replace",
    ).stdout


def git_subjects(repo_root, previous_ref, to_ref):
    """Commit subjects in previous_ref..to_ref (all of to_ref without previous_ref), oldest first."""
    revision = f"{previous_ref}..{to_ref}" if previous_ref else to_ref
    out = git(repo_root, "log", "--no-merges", "--reverse", "--format=%s", revision)
    return [line for line in out.splitlines() if line.strip()]


# ---------------------------------------------------------------------------------------------
# patches-list.json
# ---------------------------------------------------------------------------------------------

def load_apps(patch_list):
    """{package: {"name", "versions", "patches"}} from a parsed patches-list.json.

    Patches without compatiblePackages apply to every app and are grouped under UNIVERSAL.
    """
    apps = {}
    for patch in patch_list.get("patches") or []:
        name = patch.get("name")
        if not name:
            continue
        packages = patch.get("compatiblePackages")
        if not packages:
            entry = apps.setdefault(UNIVERSAL, {"name": "All apps", "versions": set(), "patches": set()})
            entry["patches"].add(name)
            continue
        for package in packages:
            package_name = package.get("packageName")
            if not package_name:
                continue
            entry = apps.setdefault(
                package_name, {"name": package_name, "versions": set(), "patches": set()}
            )
            if package.get("name"):
                entry["name"] = package["name"]
            for target in package.get("targets") or []:
                entry["versions"].add(target.get("version") or "any")
            entry["patches"].add(name)
    return apps


def format_versions(versions):
    return ", ".join(f"`{v}`" for v in sorted(versions)) if versions else ""


def sort_key(apps, package):
    return (package == UNIVERSAL, apps[package]["name"].lower(), package)


# ---------------------------------------------------------------------------------------------
# Scope -> app
# ---------------------------------------------------------------------------------------------

def scan_patch_dirs(repo_root):
    """{normalized patch directory name: {package names}} from the patch sources.

    Each directory under PATCHES_DIR is mapped through the COMPATIBILITY_* constants its Kotlin
    files use, and Constants.kt maps each constant to its packageName. Missing sources give {}.
    """
    root = Path(repo_root)
    constants_file = root / CONSTANTS
    if not constants_file.is_file():
        return {}
    text = constants_file.read_text(encoding="utf-8", errors="replace")
    constant_packages = {}
    starts = list(COMPAT_VAL_RE.finditer(text))
    for i, match in enumerate(starts):
        end = starts[i + 1].start() if i + 1 < len(starts) else len(text)
        package = PACKAGE_NAME_RE.search(text, match.end(), end)
        if package:
            constant_packages[match.group(1)] = package.group(1)

    index = {}
    for directory in sorted((root / PATCHES_DIR).iterdir()):
        if not directory.is_dir() or directory.name == "shared":
            continue
        packages = set()
        for source in directory.rglob("*.kt"):
            for ref in COMPAT_REF_RE.findall(source.read_text(encoding="utf-8", errors="replace")):
                if ref in constant_packages:
                    packages.add(constant_packages[ref])
        if packages:
            index.setdefault(normalize(directory.name), set()).update(packages)
    return index


def resolve_scope(scope, names, dir_index):
    """Packages a commit scope names, or an empty set.

    Order: a patch directory name; an app name, package name or last package segment; then the
    one app whose name starts with the scope (at least 4 characters, so "gpsmapcamera" finds
    "GPS Map Camera Editor").
    """
    key = normalize(scope)
    if not key:
        return set()
    by_dir = {p for p in dir_index.get(key, set()) if p in names}
    if by_dir:
        return by_dir
    exact = {
        package for package, name in names.items()
        if package != UNIVERSAL
        and key in (normalize(name), normalize(package), normalize(package.rsplit(".", 1)[-1]))
    }
    if exact:
        return exact
    if len(key) >= 4:
        prefixed = {
            package for package, name in names.items()
            if package != UNIVERSAL and normalize(name).startswith(key)
        }
        if len(prefixed) == 1:
            return prefixed
    return set()


def covered_by_added_patches(subject, added):
    """True for an "add X, Y and Z" feat whose every item is a patch added in this release.

    An "updated to version ..." part is ignored (the Updated apps table covers it).
    """
    match = re.match(r"^adds?\s+(.+)$", subject.strip().rstrip("."), re.IGNORECASE)
    if not match or not added:
        return False
    rest = re.sub(r"\bupdated? to version\s+\S+", " ", match.group(1).lower())
    found = False
    # Longest names first, so "Hide Premium tab" is not eaten by a shorter "Hide Premium".
    for name in sorted(added, key=len, reverse=True):
        if name.lower() in rest:
            rest = rest.replace(name.lower(), " ")
            found = True
    return found and not re.sub(r"[\s,&]+|\band\b|\bthe\b|\bpatch(?:es)?\b", "", rest)


# ---------------------------------------------------------------------------------------------
# Rendering
# ---------------------------------------------------------------------------------------------

def heading(version, date):
    return f"## {version} ({date})"


def download_line(repo, version):
    return (
        f"**Download:** [patches-{version}.mpp](https://github.com/{repo}/releases/download/"
        f"v{version}/patches-{version}.mpp)"
    )


def commit_line(commit, repo, with_scope=False):
    subject = clean_subject(commit["subject"], repo)
    if with_scope and commit["scopes"]:
        return f"- {commit['label']}: **{', '.join(commit['scopes'])}:** {subject}"
    return f"- {commit['label']}: {subject}"


def render_notes(old_list, new_list, subjects, repo, version, date, dir_index=None):
    """Full notes from both patch lists and the commit subjects of the release range."""
    dir_index = dir_index or {}
    old_apps, new_apps = load_apps(old_list), load_apps(new_list)
    names = {p: a["name"] for p, a in old_apps.items()}
    names.update({p: a["name"] for p, a in new_apps.items()})

    added_apps = sorted((p for p in new_apps if p not in old_apps), key=lambda p: sort_key(new_apps, p))
    removed_apps = sorted((p for p in old_apps if p not in new_apps), key=lambda p: sort_key(old_apps, p))
    kept = [p for p in new_apps if p in old_apps]

    highlights, other = {}, []
    for commit in parse_commits(subjects):
        packages = set()
        for scope in commit["scopes"]:
            packages |= resolve_scope(scope, names, dir_index)
        if not packages:
            other.append(commit)
            continue
        # New and removed apps get one line each; their commits add nothing for users.
        for package in packages:
            if package in new_apps and package in old_apps:
                highlights.setdefault(package, []).append(commit)

    sections = []
    if added_apps:
        lines = ["### 🆕 New apps"]
        for package in added_apps:
            app = new_apps[package]
            versions = format_versions(app["versions"])
            patches = ", ".join(sorted(app["patches"], key=str.lower))
            lines.append(f"- **{app['name']}**{' ' + versions if versions else ''} - {patches}")
        sections.append("\n".join(lines))

    for package in sorted(kept, key=lambda p: sort_key(new_apps, p)):
        old, new = old_apps[package], new_apps[package]
        added = sorted(new["patches"] - old["patches"], key=str.lower)
        removed = sorted(old["patches"] - new["patches"], key=str.lower)
        lines = []
        if added:
            lines.append(f"- New: {', '.join(added)}")
        for commit in highlights.get(package, []):
            if commit["label"] == "New" and covered_by_added_patches(commit["subject"], added):
                continue
            lines.append(commit_line(commit, repo))
        if removed:
            lines.append(f"- Removed: {', '.join(removed)}")
        if lines:
            versions = format_versions(new["versions"])
            emoji = "🌐" if package == UNIVERSAL else "📱"
            sections.append(
                f"### {emoji} {new['name']}{' ' + versions if versions else ''}\n" + "\n".join(lines)
            )

    updated = sorted(
        (p for p in kept if p != UNIVERSAL and old_apps[p]["versions"] != new_apps[p]["versions"]),
        key=lambda p: sort_key(new_apps, p),
    )
    if updated:
        lines = ["### ⬆️ Updated apps", "| App | From | To |", "|---|---|---|"]
        for package in updated:
            lines.append(
                f"| {new_apps[package]['name']} | {format_versions(old_apps[package]['versions'])} "
                f"| {format_versions(new_apps[package]['versions'])} |"
            )
        sections.append("\n".join(lines))

    if removed_apps:
        sections.append(
            "\n".join(["### 🗑️ Removed apps"] + [f"- {old_apps[p]['name']}" for p in removed_apps])
        )

    if other:
        sections.append("\n".join(["### 🔧 Other"] + [commit_line(c, repo) for c in other]))

    if not sections:
        sections.append("No user-facing changes.")
    return "\n\n".join([heading(version, date), *sections, download_line(repo, version)]) + "\n"


def render_fallback(subjects, repo, version, date):
    """Plain notes: every user-facing commit, used when a patch list is missing."""
    commits = parse_commits(subjects)
    body = (
        "\n".join(["### Changes"] + [commit_line(c, repo, with_scope=True) for c in commits])
        if commits else "No user-facing changes."
    )
    return "\n\n".join([heading(version, date), body, download_line(repo, version)]) + "\n"


# ---------------------------------------------------------------------------------------------
# Inputs
# ---------------------------------------------------------------------------------------------

def read_json(path):
    with open(path, encoding="utf-8") as handle:
        return json.load(handle)


def previous_list_from_git(repo_root, ref):
    try:
        return json.loads(git(repo_root, "show", f"{ref}:patches-list.json"))
    except (subprocess.CalledProcessError, ValueError, OSError) as error:
        log(f"no patches-list.json at {ref}: {error}")
        return None


def build_new_list(repo_root, version, runner=subprocess.run):
    """patches-list.json for `version`, built with Gradle when the working tree does not have it.

    Returns the parsed list or None. The tracked patches-list.json is restored afterwards and any
    bundle the build left for another version is deleted, so the prepare step starts clean.
    """
    root = Path(repo_root)
    list_file = root / "patches-list.json"
    try:
        current = read_json(list_file)
        if current.get("version") == version:
            log(f"using the existing patches-list.json for {version}")
            return current
    except (OSError, ValueError):
        pass

    libs = root / "patches" / "build" / "libs"
    before = set(libs.glob("*.mpp")) if libs.is_dir() else set()
    gradlew = root / ("gradlew.bat" if os.name == "nt" else "gradlew")
    command = [str(gradlew), "generatePatchesList", f"-Pversion={version}"]
    log("running " + " ".join(command))
    try:
        result = runner(command, cwd=root, stdout=sys.stderr, stderr=sys.stderr)
        if result.returncode != 0:
            log(f"generatePatchesList failed with exit code {result.returncode}")
            return None
        built = read_json(list_file)
        if built.get("version") != version:
            log(f"generatePatchesList wrote version {built.get('version')}, expected {version}")
            return None
        return built
    except (OSError, ValueError) as error:
        log(f"generatePatchesList failed: {error}")
        return None
    finally:
        try:
            git(root, "checkout", "--", "patches-list.json")
        except (subprocess.CalledProcessError, OSError) as error:
            log(f"could not restore patches-list.json: {error}")
        if libs.is_dir():
            for bundle in set(libs.glob("*.mpp")) - before:
                if bundle.name != f"patches-{version}.mpp":
                    bundle.unlink(missing_ok=True)


def resolve_previous_ref(repo_root, given, to_ref):
    if given:
        return given
    try:
        return git(repo_root, "describe", "--tags", "--abbrev=0", to_ref).strip() or None
    except (subprocess.CalledProcessError, OSError):
        return None


def generate(args):
    repo_root = Path(args.repo_root).resolve()
    date = args.date or datetime.now(timezone.utc).date().isoformat()
    previous_ref = resolve_previous_ref(repo_root, args.previous_tag, args.to)
    log(f"range: {previous_ref or '(first release)'}..{args.to}")

    subjects = []
    try:
        subjects = git_subjects(repo_root, previous_ref, args.to)
    except (subprocess.CalledProcessError, OSError) as error:
        log(f"git log failed: {error}")

    try:
        if args.new_list:
            new_list = read_json(args.new_list)
        elif args.build:
            new_list = build_new_list(repo_root, args.version)
        else:
            new_list = read_json(repo_root / "patches-list.json")
        if args.previous_list:
            old_list = read_json(args.previous_list)
        elif previous_ref:
            old_list = previous_list_from_git(repo_root, previous_ref)
        else:
            old_list = None
        if new_list and old_list:
            dir_index = {}
            try:
                dir_index = scan_patch_dirs(repo_root)
            except OSError as error:
                log(f"could not scan the patch directories: {error}")
            return render_notes(old_list, new_list, subjects, args.repo, args.version, date, dir_index)
        log("a patches list is missing; writing the plain commit list")
    except Exception as error:  # noqa: BLE001 - the release must never fail on its notes
        log(f"full notes failed ({type(error).__name__}: {error}); writing the plain commit list")
    return render_fallback(subjects, args.repo, args.version, date)


def parse_args(argv):
    parser = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    parser.add_argument("--repo", default=os.environ.get("GITHUB_REPOSITORY", ""),
                        help="OWNER/REPO (default: $GITHUB_REPOSITORY)")
    parser.add_argument("--version", required=True, help="the version being released, without v")
    parser.add_argument("--previous-tag", default="",
                        help="last release tag (semantic-release lastRelease.gitTag); empty = "
                             "the nearest tag reachable from --to, or a first release")
    parser.add_argument("--to", default="HEAD", help="end of the commit range (default HEAD)")
    parser.add_argument("--previous-list", help="previous patches-list.json (default: the one at --previous-tag)")
    parser.add_argument("--new-list", help="new patches-list.json (default: see --build)")
    parser.add_argument("--build", action="store_true",
                        help="build the new list with ./gradlew generatePatchesList unless the "
                             "working tree already has it for --version")
    parser.add_argument("--repo-root", default=".", help="repository root (default: cwd)")
    parser.add_argument("--date", help="release date YYYY-MM-DD (default: today, UTC)")
    return parser.parse_args(argv)


def main(argv=None):
    args = parse_args(argv)
    try:
        notes = generate(args)
    except Exception as error:  # noqa: BLE001 - never fail the release
        log(f"release notes failed: {type(error).__name__}: {error}")
        date = args.date or datetime.now(timezone.utc).date().isoformat()
        notes = "\n\n".join([heading(args.version, date), download_line(args.repo, args.version)]) + "\n"
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(encoding="utf-8")
    sys.stdout.write(notes)
    return 0


if __name__ == "__main__":
    sys.exit(main())
