#!/usr/bin/env python3
"""Publish from a dedicated worktree; leave generated metadata for a ship PR."""

import os
from pathlib import Path
import re
import subprocess
import sys


def run(*args, capture=False):
    result = subprocess.run(args, check=True, text=True,
                            stdout=subprocess.PIPE if capture else None)
    return result.stdout.strip() if capture else None


def main():
    os.chdir(Path(__file__).resolve().parents[1])
    verified = os.environ.get("E2E_VERIFIED_SHA", "")
    if not re.fullmatch(r"[0-9a-f]{40}", verified):
        sys.exit("Set E2E_VERIFIED_SHA to the full commit that passed docs/testing.md.")
    branch = run("git", "branch", "--show-current", capture=True)
    if not branch.startswith("agent/release-"):
        sys.exit("Use a dedicated agent/release-<version> worktree from origin/main.")
    if run("git", "status", "--porcelain", capture=True):
        sys.exit("Release requires a clean worktree, including untracked files.")
    run("git", "fetch", "origin", "main", "--tags")
    head = run("git", "rev-parse", "HEAD", capture=True)
    if head != verified or head != run("git", "rev-parse", "origin/main", capture=True):
        sys.exit("HEAD must equal both E2E_VERIFIED_SHA and current origin/main.")
    if not os.environ.get("GITHUB_TOKEN") or not os.environ.get("GITHUB_ACTOR"):
        sys.exit("Set GITHUB_ACTOR and GITHUB_TOKEN for the local build and release.")
    os.environ["GITHUB_REPOSITORY"] = "JCapretta/chessable-patches"
    os.environ["GITHUB_REF_NAME"] = "main"
    run("task", "verify")
    run("npm", "ci", "--ignore-scripts", "--no-audit", "--no-fund")
    # semantic-release discovers its release branch on the remote. This branch
    # points at tested main; generated metadata is committed only after release.
    run("git", "push", "--set-upstream", "origin", branch)
    run("npx", "--no-install", "semantic-release", "--no-ci", "--branches", branch)
    print("Inspect generated metadata, commit it on this branch, then run ship.")
    print("If publication failed, inspect GitHub tags/assets before retrying.")


if __name__ == "__main__":
    main()
