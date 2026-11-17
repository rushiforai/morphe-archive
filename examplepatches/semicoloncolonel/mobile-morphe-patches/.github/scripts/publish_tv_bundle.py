"""Publish the Android TV bundle to the tv-morphe-patches repository.

The TV patches are built from this repository with -Pflavor=tv. This script
releases that .mpp in the TV repository and updates the patches-bundle.json that
Morphe Manager reads from it: the main branch for stable releases and the dev
branch for pre-releases, as in this repository.

The TV release takes this repository's version number. A version is published
only when a file the TV bundle is built from changed since the last TV release
on that branch, so a phone-only release does not show TV users an update. The
TV version numbers therefore skip the phone-only releases.

Usage (release.yml runs it after semantic-release):

    python3 .github/scripts/publish_tv_bundle.py --repo OWNER/tv-morphe-patches \
        --branch dev --version 1.2.0-dev.3 --mpp build/tv/patches.mpp [--dry-run]

GH_TOKEN must be able to write to the TV repository. --dry-run prints what it
would do and changes nothing.
"""

import argparse
import base64
import datetime
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SOURCE_REPO = "semicoloncolonel/mobile-morphe-patches"
PATCHES_DIR = "patches/src/main/kotlin/semicoloncolonel/mobilestream/patches"
TEMPLATE_DIR = ROOT / ".github" / "tv-repo"

EXTENSION_DIR = "extensions/extension/src/main/java/semicoloncolonel/mobilestream/extension"

# Files outside the app folders that every TV build includes.
COMMON_PATHS = [
    f"{PATCHES_DIR}/shared",
    f"{EXTENSION_DIR}/shared",
    "extensions/proguard-rules.pro",
    "extensions/extension/build.gradle.kts",
    "patches/build.gradle.kts",
    "settings.gradle.kts",
    "build.gradle.kts",
    "gradle",
]

# Shared files that list phone apps only.
PHONE_ONLY_SHARED = {f"{PATCHES_DIR}/shared/ShoppingApps.kt", f"{PATCHES_DIR}/shared/GovApps.kt"}

# A commit subject that names one of these is listed in the TV release notes.
TV_NAMES = re.compile(
    r"Android TV|Apple TV|Disney|HBO|Hulu|JustWatch|NewsNation|Plex|Pluto|Starz|Tubi|YouTube TV|YTTV|"
    r"every app|all apps",
    re.I,
)

RELEASE_TYPES = {"feat": "Features", "fix": "Bug Fixes", "perf": "Performance", "revert": "Reverts"}


def run(*args: str, check: bool = True) -> subprocess.CompletedProcess:
    return subprocess.run(args, check=check, capture_output=True, text=True, cwd=ROOT)


def tv_bundle_apps() -> list[str]:
    """Reads tvBundleApps from patches/build.gradle.kts, so the two never drift."""
    text = (ROOT / "patches/build.gradle.kts").read_text()
    match = re.search(r"val tvBundleApps = setOf\((.*?)\)", text, re.S)
    if not match:
        sys.exit("tvBundleApps not found in patches/build.gradle.kts")
    return re.findall(r'"([^"]+)"', match.group(1))


def tv_paths() -> list[str]:
    apps = tv_bundle_apps()
    return [f"{PATCHES_DIR}/{app}" for app in apps] + [f"{EXTENSION_DIR}/{app}" for app in apps] + COMMON_PATHS


IMPORT_RE = re.compile(r"import semicoloncolonel\.mobilestream\.patches\.(\w+)\.shared\.Constants as (\w+)")
COMPAT_RE = re.compile(r"(\w+)\.\w*COMPATIBILITY\b")


def phone_aliases(text: str) -> set[str]:
    """Import aliases of phone-only apps' Constants in a shared patch file."""
    apps = set(tv_bundle_apps())
    return {alias for app, alias in IMPORT_RE.findall(text) if app not in apps}


def is_phone_only_line(line: str, aliases: set[str]) -> bool:
    """True for a diff line that only adds or removes phone apps from a shared list."""
    line = line.strip()
    if not line:
        return True
    match = IMPORT_RE.fullmatch(line)
    if match:
        return match.group(1) not in tv_bundle_apps()
    names = COMPAT_RE.findall(line)
    rest = COMPAT_RE.sub("", line).replace(",", "").strip()
    return bool(names) and not rest and all(name in aliases for name in names)


def relevant_changes(old: str, new: str) -> list[str]:
    """Files the TV bundle is built from that changed between two commits.

    A change to a shared patch that only adds or removes phone apps does not
    count, so adding a phone app does not publish a TV release.
    """
    files = run("git", "diff", "--name-only", old, new, "--", *tv_paths()).stdout.split()
    relevant = []
    for path in files:
        if path in PHONE_ONLY_SHARED:
            continue
        if path.startswith(f"{PATCHES_DIR}/shared/") and path.endswith(".kt"):
            texts = [run("git", "show", f"{ref}:{path}", check=False).stdout for ref in (old, new)]
            aliases = phone_aliases(texts[0]) | phone_aliases(texts[1])
            diff = run("git", "diff", "-U0", old, new, "--", path).stdout.splitlines()
            lines = [l[1:] for l in diff if l[:1] in "+-" and not l.startswith(("+++", "---"))]
            if all(is_phone_only_line(l, aliases) for l in lines):
                continue
        relevant.append(path)
    return relevant


def gh_api(path: str, method: str = "GET", fields: dict | None = None, check: bool = True):
    args = ["gh", "api", "-X", method, path]
    if fields is not None:
        args += ["--input", "-"]
    result = subprocess.run(
        args, input=json.dumps(fields) if fields is not None else None,
        capture_output=True, text=True, cwd=ROOT,
    )
    if result.returncode != 0:
        if check:
            sys.exit(f"gh api {method} {path} failed: {result.stderr.strip()}")
        return None
    return json.loads(result.stdout) if result.stdout.strip() else {}


def read_file(repo: str, branch: str, path: str) -> tuple[str | None, str | None]:
    """Returns (text, sha) of a file on a branch, or (None, None)."""
    data = gh_api(f"repos/{repo}/contents/{path}?ref={branch}", check=False)
    if not data or "content" not in data:
        return None, None
    return base64.b64decode(data["content"]).decode(), data["sha"]


def write_file(repo: str, branch: str, path: str, text: str, message: str, dry_run: bool) -> None:
    current, sha = read_file(repo, branch, path)
    if current == text:
        return
    print(f"{'Would write' if dry_run else 'Writing'} {path} on {branch}")
    if dry_run:
        return
    fields = {"message": message, "content": base64.b64encode(text.encode()).decode(), "branch": branch}
    if sha:
        fields["sha"] = sha
    gh_api(f"repos/{repo}/contents/{path}", "PUT", fields)


def ensure_branches(repo: str, branch: str, dry_run: bool) -> None:
    """Creates main from the template when the repository is empty, and dev from main."""
    if gh_api(f"repos/{repo}/branches/main", check=False) is None:
        print(f"{repo} has no main branch yet; it starts from the template.")
        sync_template(repo, dry_run, initial=True)
    if branch != "main" and gh_api(f"repos/{repo}/branches/{branch}", check=False) is None:
        print(f"{'Would create' if dry_run else 'Creating'} branch {branch} from main")
        if not dry_run:
            sha = gh_api(f"repos/{repo}/git/ref/heads/main")["object"]["sha"]
            gh_api(f"repos/{repo}/git/refs", "POST", {"ref": f"refs/heads/{branch}", "sha": sha})


def sync_template(repo: str, dry_run: bool, initial: bool = False) -> None:
    """Copies .github/tv-repo to the TV repository's main branch and syncs its labels.

    build_tv_repo.py writes most of those files from this repository's copies.
    """
    message = "docs: Set up the TV patch source" if initial else "docs: Update from mobile-morphe-patches"
    # README first, so a new repository starts with it.
    files = sorted(p for p in TEMPLATE_DIR.rglob("*") if p.is_file())
    files.sort(key=lambda p: p.name != "README.md")
    for path in files:
        write_file(repo, "main", path.relative_to(TEMPLATE_DIR).as_posix(), path.read_text(), message, dry_run)
    print(f"{'Would sync' if dry_run else 'Syncing'} labels from .github/labels.json")
    if not dry_run:
        subprocess.run([sys.executable, str(ROOT / ".github/scripts/sync_labels.py")], check=True, cwd=ROOT,
                       env={**os.environ, "GH_REPO": repo})


def changed_tv_files(since_version: str | None, version: str) -> list[str]:
    if since_version is None:
        return ["(first TV release)"]
    if run("git", "rev-parse", "-q", "--verify", f"refs/tags/v{since_version}", check=False).returncode:
        print(f"Tag v{since_version} is not in this repository; publishing.")
        return ["(last TV version unknown)"]
    return relevant_changes(f"v{since_version}", f"v{version}")


def release_notes(since_version: str | None, version: str) -> str:
    """Lists the feat, fix, perf, and revert commits that touched the TV bundle's files."""
    date = datetime.datetime.now(datetime.timezone.utc).date().isoformat()
    lines = [f"# [{version}](https://github.com/{SOURCE_REPO}/releases/tag/v{version}) ({date})", ""]
    sections: dict[str, list[str]] = {}
    shared_changes = 0
    if since_version is not None:
        log = run("git", "log", "--no-merges", "--format=%H%x09%s",
                  f"v{since_version}..v{version}", "--", *tv_paths(), check=False).stdout
        for entry in log.splitlines():
            sha, subject = entry.split("\t", 1)
            match = re.match(r"(\w+)(\([^)]*\))?!?: (.+)", subject)
            if not match or match.group(1) not in RELEASE_TYPES:
                continue
            changed = relevant_changes(f"{sha}^", sha)
            if not changed:
                continue
            app_dirs = tuple(f"{root}/{app}/" for app in tv_bundle_apps() for root in (PATCHES_DIR, EXTENSION_DIR))
            if TV_NAMES.search(match.group(3)) or any(path.startswith(app_dirs) for path in changed):
                sections.setdefault(RELEASE_TYPES[match.group(1)], []).append(
                    f"* {match.group(3)} ([{sha[:7]}](https://github.com/{SOURCE_REPO}/commit/{sha}))")
            else:
                shared_changes += 1
    for title in RELEASE_TYPES.values():
        if title in sections:
            lines += [f"### {title}", "", *sections[title], ""]
    if since_version is None:
        lines += ["The first release of the Android TV patches as their own source.", ""]
    elif shared_changes:
        lines += [f"{'Also includes' if sections else 'Includes'} {shared_changes} {'change' if shared_changes == 1 else 'changes'} to the shared "
                  "patches and extension. The mobile-morphe-patches release notes have the details.", ""]
    elif not sections:
        lines += ["Built from the shared patches and extension of this version.", ""]
    lines.append(f"Built from [mobile-morphe-patches v{version}](https://github.com/{SOURCE_REPO}/releases/tag/v{version}).")
    return "\n".join(lines)


def write_patches_list(repo: str, branch: str, version: str, path: Path | None, dry_run: bool) -> None:
    """Commits patches-list.json, the patch list third-party tools read, if one was built."""
    if path is None:
        return
    text = path.read_text()
    if json.loads(text).get("version") != version:
        sys.exit(f"{path} is for another version, not {version}")
    write_file(repo, branch, "patches-list.json", text if text.endswith("\n") else text + "\n",
               f"chore: Update the patch list for v{version} [skip ci]", dry_run)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", required=True, help="OWNER/tv-morphe-patches")
    parser.add_argument("--branch", required=True, choices=["main", "dev"])
    parser.add_argument("--version")
    parser.add_argument("--mpp", type=Path)
    parser.add_argument("--patches-list", type=Path,
                        help="patches-list.json for this bundle, committed beside patches-bundle.json")
    parser.add_argument("--force", action="store_true", help="publish even if no TV file changed")
    parser.add_argument("--notes-file", type=Path, help="release notes to use instead of the generated ones")
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--setup-only", action="store_true",
                        help="only create the branches and sync the README, forms, and labels")
    args = parser.parse_args()
    repo, branch, version = args.repo, args.branch, args.version

    if args.setup_only:
        ensure_branches(repo, branch, args.dry_run)
        sync_template(repo, args.dry_run)
        return 0
    if not version or not args.mpp or not args.mpp.is_file():
        sys.exit("--version and an existing --mpp are required")

    ensure_branches(repo, branch, args.dry_run)

    current, _ = read_file(repo, branch, "patches-bundle.json")
    since = json.loads(current)["version"] if current else None
    if since == version:
        print(f"{repo} {branch} is already at {version}.")
        write_patches_list(repo, branch, version, args.patches_list, args.dry_run)
        return 0

    changed = changed_tv_files(since, version)
    # Main still offering a dev pre-release takes the first stable release as is.
    replaces_preview = branch == "main" and since is not None and "-" in since
    if not changed and not args.force and not replaces_preview:
        print(f"No TV bundle file changed since v{since}; {version} is not published to {repo}.")
        return 0
    print(f"Publishing {version} to {repo} {branch} (last TV version: {since or 'none'}).")
    print("Changed: " + ", ".join(changed[:20]) + (" ..." if len(changed) > 20 else ""))

    notes = args.notes_file.read_text().strip() if args.notes_file else release_notes(since, version)
    asset = f"patches-{version}.mpp"
    tag = f"v{version}"

    if gh_api(f"repos/{repo}/releases/tags/{tag}", check=False) is None:
        print(f"{'Would create' if args.dry_run else 'Creating'} release {tag} with {asset}")
        if not args.dry_run:
            with tempfile.TemporaryDirectory() as tmp:
                path = Path(tmp) / asset
                shutil.copyfile(args.mpp, path)
                with open(Path(tmp) / "notes.md", "w") as f:
                    f.write(notes)
                command = ["gh", "release", "create", tag, str(path), "--repo", repo,
                           "--target", branch, "--title", tag, "--notes-file", str(Path(tmp) / "notes.md")]
                if branch == "dev":
                    command.append("--prerelease")
                subprocess.run(command, check=True, cwd=ROOT)
    else:
        print(f"Release {tag} already exists in {repo}; only the bundle JSON is updated.")

    bundle = {
        "created_at": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
        "description": notes,
        "download_url": f"https://github.com/{repo}/releases/download/{tag}/{asset}",
        "signature_download_url": "",
        "version": version,
        "public_key": (ROOT / "morphe-signing.pub").read_text().strip(),
    }
    text = json.dumps(bundle, indent=2) + "\n"
    write_patches_list(repo, branch, version, args.patches_list, args.dry_run)
    write_file(repo, branch, "patches-bundle.json", text, f"chore: Release {tag} [skip ci]", args.dry_run)
    # Until the TV repository has a stable release, main offers the latest dev
    # pre-release too, so the stable channel works from the start.
    if branch == "dev":
        main_bundle, _ = read_file(repo, "main", "patches-bundle.json")
        if main_bundle is None or "-" in json.loads(main_bundle)["version"]:
            write_patches_list(repo, "main", version, args.patches_list, args.dry_run)
            write_file(repo, "main", "patches-bundle.json", text,
                       f"chore: Offer {tag} until the first stable release [skip ci]", args.dry_run)
    sync_template(repo, args.dry_run)

    if args.dry_run:
        print("\n--- patches-bundle.json ---\n" + json.dumps(bundle, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
