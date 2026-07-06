#!/usr/bin/env python3
"""Create a CalVer release tag, wait for CI release assets, and sign the .mpp."""
from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

TAG_PATTERN = re.compile(r"^v(?P<version>\d{2}\.\d{1,2}\.\d{1,2}-(?P<sha>[0-9a-f]{6}))$")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "Create/push a vYY.M.D-<sha> tag, wait for the GitHub release "
            "workflow, then sign and upload the generated .mpp.asc asset."
        )
    )
    parser.add_argument("--repo", default=os.getenv("REPO", "kareemlukitomo/morphe-patches"))
    parser.add_argument("--remote", default=os.getenv("RELEASE_REMOTE", "github"))
    parser.add_argument("--branch", default=os.getenv("RELEASE_BRANCH", ""))
    parser.add_argument("--tag", default=os.getenv("TAG", ""))
    parser.add_argument("--workflow", default=os.getenv("RELEASE_WORKFLOW", "Release"))
    parser.add_argument(
        "--timeout-seconds",
        type=int,
        default=int(os.getenv("RELEASE_TIMEOUT_SECONDS", "1800")),
    )
    parser.add_argument(
        "--poll-interval",
        type=int,
        default=int(os.getenv("RELEASE_POLL_INTERVAL", "20")),
    )
    parser.add_argument("--allow-dirty", action="store_true", default=os.getenv("ALLOW_DIRTY", "0") == "1")
    parser.add_argument("--skip-push", action="store_true", default=os.getenv("SKIP_PUSH", "0") == "1")
    parser.add_argument("--skip-sign", action="store_true", default=os.getenv("SKIP_SIGN", "0") == "1")
    parser.add_argument(
        "--skip-metadata-commit",
        action="store_true",
        default=os.getenv("SKIP_METADATA_COMMIT", "0") == "1",
        help="Do not download release metadata assets, commit them to the branch, and push.",
    )
    parser.add_argument("--dry-run", action="store_true", default=os.getenv("DRY_RUN", "0") == "1")
    parser.add_argument("--keep", action="store_true", default=os.getenv("KEEP", "0") == "1")
    parser.add_argument("--gpg-key", default=os.getenv("GPG_KEY", ""))
    return parser.parse_args()


def run(command: list[str], *, capture: bool = False, env: dict[str, str] | None = None) -> str:
    printable = " ".join(command)
    if not capture:
        print(f"$ {printable}", flush=True)
    result = subprocess.run(
        command,
        check=True,
        text=True,
        stdout=subprocess.PIPE if capture else None,
        stderr=subprocess.PIPE if capture else None,
        env=env,
    )
    return result.stdout.strip() if capture else ""


def require_command(name: str) -> None:
    if shutil.which(name) is None:
        raise SystemExit(f"{name} is required")


def git(*args: str, capture: bool = True) -> str:
    return run(["git", *args], capture=capture)


def gh(*args: str, capture: bool = True) -> str:
    return run(["gh", *args], capture=capture)


def current_branch() -> str:
    return git("branch", "--show-current")


def short_head() -> str:
    return git("rev-parse", "--short=6", "HEAD")


def full_head() -> str:
    return git("rev-parse", "HEAD")


def generated_tag() -> str:
    now = datetime.now(timezone.utc)
    return f"v{now:%y}.{now.month}.{now.day}-{short_head()}"


def validate_tag(tag: str, expected_sha: str) -> str:
    match = TAG_PATTERN.match(tag)
    if match is None:
        raise SystemExit(f"Expected tag like v26.4.30-abcdef, got: {tag}")
    if match.group("sha") != expected_sha:
        raise SystemExit(f"Tag suffix {match.group('sha')} does not match HEAD {expected_sha}")
    return match.group("version")


def ensure_worktree_ok(allow_dirty: bool) -> None:
    status = git("status", "--porcelain")
    if not status:
        return

    print("Worktree has local changes not included in the release tag:")
    print(status)
    if not allow_dirty:
        raise SystemExit("Refusing to release from a dirty worktree. Re-run with --allow-dirty to tag HEAD anyway.")
    print("Continuing because --allow-dirty was provided.")


def local_tag_target(tag: str) -> str | None:
    result = subprocess.run(
        ["git", "rev-parse", "-q", "--verify", f"refs/tags/{tag}^{{commit}}"],
        check=False,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
    )
    if result.returncode != 0:
        return None
    return result.stdout.strip()


def ensure_local_tag(tag: str, head_sha: str, dry_run: bool) -> None:
    target = local_tag_target(tag)
    if target:
        if target != head_sha:
            raise SystemExit(f"Local tag {tag} points at {target}, not {head_sha}")
        print(f"Local tag exists: {tag} -> {head_sha[:7]}")
        return

    if dry_run:
        print(f"Would create annotated tag {tag}")
        return

    run(["git", "tag", "-a", tag, "-m", f"Release {tag}"])


def push_refs(remote: str, branch: str, tag: str, dry_run: bool) -> None:
    commands = [
        ["git", "push", remote, branch],
        ["git", "push", remote, f"refs/tags/{tag}"],
    ]
    for command in commands:
        if dry_run:
            print("Would run: " + " ".join(command))
        else:
            run(command)


def find_release_run(repo: str, workflow: str, tag: str, head_sha: str) -> dict | None:
    output = gh(
        "run",
        "list",
        "--repo",
        repo,
        "--workflow",
        workflow,
        "--event",
        "push",
        "--json",
        "databaseId,headBranch,headSha,status,conclusion,url,createdAt,displayTitle",
        "--limit",
        "30",
    )
    runs = json.loads(output)
    for run_data in runs:
        if run_data.get("headBranch") == tag and run_data.get("headSha") == head_sha:
            return run_data
    return None


def run_status(repo: str, run_id: int) -> dict:
    return json.loads(gh("run", "view", str(run_id), "--repo", repo, "--json", "status,conclusion,url"))


def wait_for_release_run(args: argparse.Namespace, tag: str, head_sha: str) -> str:
    deadline = time.monotonic() + args.timeout_seconds
    run_id: int | None = None
    run_url = ""

    while time.monotonic() < deadline:
        if run_id is None:
            candidate = find_release_run(args.repo, args.workflow, tag, head_sha)
            if candidate is None:
                print(f"Waiting for GitHub Actions workflow {args.workflow!r} for {tag}...")
                time.sleep(args.poll_interval)
                continue
            run_id = int(candidate["databaseId"])
            run_url = candidate.get("url") or ""
            print(f"Found run {run_id}: {run_url}")

        status = run_status(args.repo, run_id)
        run_url = status.get("url") or run_url
        conclusion = status.get("conclusion") or ""
        print(f"Run {run_id}: {status['status']}{('/' + conclusion) if conclusion else ''}")
        if status["status"] == "completed":
            if conclusion != "success":
                raise SystemExit(f"Release workflow failed with conclusion {conclusion}: {run_url}")
            return run_url
        time.sleep(args.poll_interval)

    raise SystemExit(f"Timed out after {args.timeout_seconds}s waiting for release workflow for {tag}")


def release_assets(repo: str, tag: str) -> tuple[str, list[dict]]:
    release = json.loads(gh("release", "view", tag, "--repo", repo, "--json", "url,assets"))
    return release["url"], release.get("assets", [])


def wait_for_mpp_asset(repo: str, tag: str, timeout_seconds: int, poll_interval: int) -> str:
    deadline = time.monotonic() + timeout_seconds
    while time.monotonic() < deadline:
        try:
            url, assets = release_assets(repo, tag)
        except subprocess.CalledProcessError:
            print(f"Waiting for GitHub release {tag}...")
            time.sleep(poll_interval)
            continue

        names = [asset["name"] for asset in assets]
        print(f"Release assets: {', '.join(names) if names else '(none yet)'}")
        if any(name.endswith(".mpp") for name in names):
            return url
        time.sleep(poll_interval)

    raise SystemExit(f"Timed out waiting for .mpp asset on release {tag}")


def signing_env() -> dict[str, str]:
    env = os.environ.copy()
    if env.get("GITHUB_TOKEN") or env.get("GH_TOKEN"):
        return env
    if shutil.which("gh") is None:
        return env
    try:
        token = gh("auth", "token")
    except subprocess.CalledProcessError:
        return env
    if token:
        env["GH_TOKEN"] = token
    return env


def sign_release(args: argparse.Namespace, tag: str, dry_run: bool) -> None:
    script = Path(__file__).with_name("sign-latest-release.py")
    command = [sys.executable, str(script), "--repo", args.repo, "--tag", tag]
    if args.keep:
        command.append("--keep")
    if args.gpg_key:
        command.extend(["--gpg-key", args.gpg_key])
    if dry_run:
        command.append("--dry-run")
    run(command, env=signing_env())


def normalize_bundle_metadata_timestamp(path: Path) -> None:
    import json

    data = json.loads(path.read_text())
    created_at = str(data.get("created_at", ""))
    if created_at:
        data["created_at"] = created_at.replace("Z", "").split(".", 1)[0]
        path.write_text(json.dumps(data, indent=2) + "\n")


def sync_release_metadata_assets(args: argparse.Namespace, tag: str, branch: str) -> None:
    print("Syncing release metadata assets into the repository root...")
    run(
        [
            "gh",
            "release",
            "download",
            tag,
            "--repo",
            args.repo,
            "--pattern",
            "patches-bundle.json",
            "--pattern",
            "patches-list.json",
            "--clobber",
        ]
    )

    normalize_bundle_metadata_timestamp(Path("patches-bundle.json"))
    run(["git", "add", "patches-bundle.json", "patches-list.json"])
    staged_diff = subprocess.run(
        ["git", "diff", "--cached", "--quiet", "--", "patches-bundle.json", "patches-list.json"],
        check=False,
    )
    if staged_diff.returncode == 0:
        print("Release metadata is already current.")
        return

    run(["git", "commit", "-m", f"chore: publish patch metadata for {tag}"])
    if args.skip_push:
        print("Skipping metadata push because --skip-push was provided.")
        return
    run(["git", "push", args.remote, branch])


def main() -> int:
    args = parse_args()
    require_command("git")
    require_command("gh")

    branch = args.branch or current_branch()
    if not branch:
        raise SystemExit("Could not determine current branch; pass --branch")

    head_short = short_head()
    head_sha = full_head()
    tag = args.tag.strip() or generated_tag()
    version = validate_tag(tag, head_short)

    print(f"Release version : {version}")
    print(f"Release tag     : {tag}")
    print(f"Commit          : {head_sha}")
    print(f"Remote/branch   : {args.remote}/{branch}")
    print(f"GitHub repo     : {args.repo}")

    ensure_worktree_ok(args.allow_dirty or args.dry_run)
    ensure_local_tag(tag, head_sha, args.dry_run)

    if args.skip_push:
        print("Skipping git push because --skip-push was provided.")
    else:
        push_refs(args.remote, branch, tag, args.dry_run)

    if args.dry_run:
        print("Dry run complete; not waiting for CI or signing.")
        return 0

    run_url = wait_for_release_run(args, tag, head_sha)
    release_url = wait_for_mpp_asset(args.repo, tag, args.timeout_seconds, args.poll_interval)
    print(f"Release workflow: {run_url}")
    print(f"GitHub release  : {release_url}")

    if args.skip_sign:
        print("Skipping signing because --skip-sign was provided.")
        return 0

    sign_release(args, tag, dry_run=False)
    if args.skip_metadata_commit:
        print("Skipping metadata commit because --skip-metadata-commit was provided.")
    else:
        sync_release_metadata_assets(args, tag, branch)
    print("Build, release, and signing flow completed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
