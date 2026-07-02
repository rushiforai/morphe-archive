"""
Reads a repos list (one "owner/repo" per line) and adds each repo as a
customBundle entry in the Morphe Manager settings JSON.

For each repo, checks whether the patches-bundle.json file exists on the
`main` branch, falling back to `master` if not found. Repos that are
already present (matched by source URL, case-insensitive) are skipped so
the script is safe to re-run.

Usage:
    python add_repos_to_bundles.py [REPOS_FILE] [SETTINGS_FILE] [OUTPUT_FILE]

Defaults:
    REPOS_FILE    = repos.txt
    SETTINGS_FILE = morphe_manager_settings.json
    OUTPUT_FILE   = same as SETTINGS_FILE (overwrite)
"""

import json
import sys
import time
import urllib.request
import urllib.error

BUNDLE_PATH = "patches-bundle.json"
BRANCHES_TO_TRY = ("main", "master")


def load_repos(path):
    with open(path) as f:
        return [
            line.strip()
            for line in f
            if line.strip() and not line.strip().startswith("#")
        ]


def branch_has_bundle(repo, branch, timeout=8):
    url = f"https://raw.githubusercontent.com/{repo}/{branch}/{BUNDLE_PATH}"
    req = urllib.request.Request(url, method="HEAD")
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.status == 200
    except urllib.error.HTTPError as e:
        return False
    except Exception:
        return False


def resolve_branch(repo):
    for branch in BRANCHES_TO_TRY:
        if branch_has_bundle(repo, branch):
            return branch
    return None


def repo_display_name(repo):
    owner, _, name = repo.partition("/")
    return name or repo


def main():
    repos_file = sys.argv[1] if len(sys.argv) > 1 else "repos.txt"
    settings_file = sys.argv[2] if len(sys.argv) > 2 else "morphe_manager_settings.json"
    output_file = sys.argv[3] if len(sys.argv) > 3 else settings_file

    repos = load_repos(repos_file)

    with open(settings_file) as f:
        data = json.load(f)

    bundles = data["settings"].setdefault("customBundles", [])
    existing_sources = {b["source"].lower() for b in bundles}
    existing_sort_orders = [b.get("sortOrder", 0) for b in bundles]
    next_sort_order = (max(existing_sort_orders) + 1) if existing_sort_orders else 1

    added = []
    skipped_existing = []
    skipped_no_bundle = []

    for repo in repos:
        candidate_url = f"https://raw.githubusercontent.com/{repo}/main/{BUNDLE_PATH}".lower()
        # Skip if any branch variant of this repo is already a bundle source
        already_present = any(
            src.startswith(f"https://raw.githubusercontent.com/{repo.lower()}/")
            for src in existing_sources
        )
        if already_present:
            skipped_existing.append(repo)
            continue

        branch = resolve_branch(repo)
        if branch is None:
            skipped_no_bundle.append(repo)
            continue

        now_ms = int(time.time() * 1000)
        source_url = f"https://raw.githubusercontent.com/{repo}/{branch}/{BUNDLE_PATH}"
        bundle_entry = {
            "name": repo_display_name(repo),
            "source": source_url,
            "autoUpdate": True,
            "sortOrder": next_sort_order,
            "createdAt": now_ms,
            "updatedAt": now_ms,
        }
        bundles.append(bundle_entry)
        existing_sources.add(source_url.lower())
        next_sort_order += 1
        added.append((repo, branch))

    with open(output_file, "w") as f:
        json.dump(data, f, indent=4)
        f.write("\n")

    print(f"Added {len(added)} repos.")
    print(f"Skipped {len(skipped_existing)} already present.")
    print(f"Skipped {len(skipped_no_bundle)} with no patches-bundle.json on main/master.")

    if skipped_no_bundle:
        print("\nNo bundle found for:")
        for r in skipped_no_bundle:
            print(f"  - {r}")

    if added:
        print("\nAdded:")
        for r, b in added:
            print(f"  - {r} ({b})")


if __name__ == "__main__":
    main()