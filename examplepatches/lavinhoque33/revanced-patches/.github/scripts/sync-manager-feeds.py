# Copyright (C) 2026 lavinhoque33
# Licensed under the GNU General Public License v3.0.
# Written by lavinhoque33, 2026-11-25.

import json
import os
import re
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory


REPOSITORY = "lavinhoque33/revanced-patches"
REPO_URL = f"https://github.com/{REPOSITORY}"
BRANCHES = ("rvx-latest", "main", "rvx-dev", "dev")
DESCRIPTOR = "patches-bundle.json"
CHANGELOG = "CHANGELOG.md"
VERSION_TAG = re.compile(r"v(\d+)\.(\d+)\.(\d+)(?:-dev\.(\d+))?", re.ASCII)
CHANGELOG_HEADING = re.compile(r"^#{1,3} +\[(?P<version>[^\]\n]+)\]\([^\n)]*\) +\(\d{4}-\d{2}-\d{2}\)$", re.M)


def git(*args, **kwargs):
    return subprocess.check_output(["git", *args], **kwargs)


def github(endpoint, *args):
    return json.loads(subprocess.check_output(["gh", "api", f"repos/{REPOSITORY}/{endpoint}", *args]))


def version_key(tag):
    match = VERSION_TAG.fullmatch(tag)
    if match is None:
        return None
    major, minor, patch, dev = match.groups()
    return int(major), int(minor), int(patch), dev is None, int(dev or 0)


def bundle_descriptor(release):
    if release["draft"] or not release["published_at"]:
        return None
    tag = release["tag_name"]
    version = tag.removeprefix("v")
    filename = f"patches-{version}.mpp"
    url = f"{REPO_URL}/releases/download/{tag}/{filename}"
    if not any(asset["name"] == filename and asset["state"] == "uploaded" and asset["size"] > 0
               and asset["browser_download_url"] == url for asset in release["assets"]):
        return None
    return {
        "created_at": release["published_at"].removesuffix("Z"),
        "description": release["body"] or "",
        "download_url": url,
        "version": version,
    }


def select_channels(stable_release, releases):
    stable_tag = stable_release["tag_name"]
    stable_key = version_key(stable_tag)
    stable = bundle_descriptor(stable_release)
    if stable_key is None or not stable_key[3] or stable_release["prerelease"] or stable is None:
        raise ValueError(f"GitHub Latest ({stable_tag}) must be a published stable RVX release with its .mpp uploaded")

    dev_key, dev = stable_key, stable
    for release in releases:
        if release["draft"] or not release["prerelease"]:
            continue
        key = version_key(release["tag_name"])
        if key is None or key[3] or key <= dev_key:
            continue
        descriptor = bundle_descriptor(release)
        if descriptor is not None:
            dev_key, dev = key, descriptor
    return stable, dev


def entry(descriptor, url, notes):
    version = descriptor["version"]
    date = descriptor["created_at"].split("T", 1)[0]
    heading = f"## [{version}]({url}) ({date})\n\n"
    return f"{heading}{notes}\n\n" if notes else heading


def notes_for(descriptor):
    notes = descriptor["description"].strip()
    heading = CHANGELOG_HEADING.match(notes)
    if heading is not None and heading["version"].removeprefix("v") == descriptor["version"]:
        return notes[heading.end():].lstrip()
    return notes


def tag_changelog(tag):
    return git("show", f"refs/tags/{tag}:{CHANGELOG}").decode("utf-8")


def stable_changelog(descriptor):
    version = descriptor["version"]
    tag = f"v{version}"
    changelog = tag_changelog(tag)
    heading = CHANGELOG_HEADING.search(changelog)
    history = changelog[heading.start():] if heading else ""
    if heading is not None and heading["version"].removeprefix("v") == version:
        return history
    return entry(descriptor, f"{REPO_URL}/releases/tag/{tag}", notes_for(descriptor)) + history


def dev_changelog(descriptor, stable_version, stable_history):
    version = descriptor["version"]
    changelog = tag_changelog(f"v{version}")
    heading = CHANGELOG_HEADING.search(changelog)
    notes = notes_for(descriptor)
    if heading is not None:
        top_version = heading["version"].removeprefix("v")
        if top_version == version:
            following = CHANGELOG_HEADING.search(changelog, heading.end())
            end = following.start() if following is not None else len(changelog)
            return changelog[heading.start():end].rstrip() + "\n\n" + stable_history
        if top_version == stable_version and changelog.startswith("## Unreleased\n"):
            # The version-only dev tags leave the actual patch notes in Unreleased.
            notes = changelog[len("## Unreleased\n"):heading.start()].strip() or notes
    url = f"{REPO_URL}/compare/v{stable_version}...v{version}"
    return entry(descriptor, url, notes) + stable_history


def descriptor_bytes(descriptor):
    return (json.dumps(descriptor, indent=2, ensure_ascii=False) + "\n").encode("utf-8")


def feed_commit(ref, files, index_env, version):
    # A private Git index preserves the rest of each branch without checking it out.
    git("read-tree", ref, env=index_env)
    for path, contents in files.items():
        blob = git("hash-object", "-w", "--stdin", input=contents).decode().strip()
        git("update-index", "--add", "--cacheinfo", f"100644,{blob},{path}", env=index_env)
    tree = git("write-tree", env=index_env).decode().strip()
    if tree == git("rev-parse", f"{ref}^{{tree}}").decode().strip():
        return None
    return git(
        "-c", "user.name=github-actions[bot]",
        "-c", "user.email=41898282+github-actions[bot]@users.noreply.github.com",
        "commit-tree", tree, "-p", ref, "-m", f"chore: Sync Manager feed to v{version} [skip ci]",
    ).decode().strip()


def sync(remote, stable_release, releases):
    stable, dev = select_channels(stable_release, releases)
    stable_version, dev_version = stable["version"], dev["version"]
    tags = {f"v{stable_version}", f"v{dev_version}"}
    git("fetch", "--depth=1", "--no-tags", remote,
        *(f"refs/heads/{branch}:refs/remotes/feed-sync/{branch}" for branch in BRANCHES),
        *(f"refs/tags/{tag}:refs/tags/{tag}" for tag in sorted(tags)))

    stable_history = stable_changelog(stable)
    dev_history = stable_history
    if dev_version != stable_version:
        dev_history = dev_changelog(dev, stable_version, stable_history)
    stable_files = {DESCRIPTOR: descriptor_bytes(stable)}
    dev_files = {DESCRIPTOR: descriptor_bytes(dev)}
    feeds = {
        "rvx-latest": (stable_version, stable_files),
        "main": (stable_version, {**stable_files, CHANGELOG: stable_history.encode("utf-8")}),
        "rvx-dev": (dev_version, dev_files),
        "dev": (dev_version, {**dev_files, CHANGELOG: dev_history.encode("utf-8")}),
    }
    updates = []
    with TemporaryDirectory(prefix="rvx-manager-feeds-") as directory:
        index_env = dict(os.environ, GIT_INDEX_FILE=str(Path(directory) / "index"))
        for branch, (version, files) in feeds.items():
            commit = feed_commit(f"refs/remotes/feed-sync/{branch}", files, index_env, version)
            print(f"{branch}: v{version} ({'syncing' if commit else 'up to date'})", flush=True)
            if commit is not None:
                updates.append(f"{commit}:refs/heads/{branch}")
    if updates:
        git("push", "--atomic", "--no-follow-tags", remote, *updates)
    return bool(updates)


def main():
    if os.environ.get("GITHUB_ACTIONS") != "true" or os.environ.get("GITHUB_REPOSITORY") != REPOSITORY:
        raise SystemExit("Run this from the Sync Manager feeds workflow in the RVX fork.")
    stable_release = github("releases/latest")
    pages = github("releases?per_page=100", "--paginate", "--slurp")
    sync(f"{REPO_URL}.git", stable_release, (release for page in pages for release in page))


if __name__ == "__main__":
    main()
