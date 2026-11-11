#!/usr/bin/env python3
"""Removes the "may reopen" label from closed issues that stayed quiet for 7 days.

The 7 days count from the later of when the label was added and the issue's
newest comment, so a new comment restarts them. An open issue keeps the label.
Runs daily from .github/workflows/issue_stale.yml.

    python3 .github/scripts/expire_may_reopen.py [--dry-run]
"""

import argparse
import datetime
import json
import subprocess

LABEL = "may reopen"
DAYS = 7


def gh(*args):
    return subprocess.run(["gh", *args], capture_output=True, text=True, check=True).stdout


def when(stamp):
    return datetime.datetime.fromisoformat(stamp.replace("Z", "+00:00"))


def last_activity(number, repo):
    """The later of the newest "may reopen" label event and the newest comment."""
    events = json.loads(gh("api", "--paginate", "--slurp", f"repos/{repo}/issues/{number}/timeline"))
    times = []
    for page in events:
        for event in page:
            if event.get("event") == "labeled" and event.get("label", {}).get("name") == LABEL:
                times.append(when(event["created_at"]))
            elif event.get("event") == "commented":
                times.append(when(event["created_at"]))
    return max(times) if times else None


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()
    repo = gh("repo", "view", "--json", "nameWithOwner", "--jq", ".nameWithOwner").strip()
    issues = json.loads(gh("issue", "list", "--state", "closed", "--label", LABEL, "--limit", "200",
                           "--json", "number"))
    now = datetime.datetime.now(datetime.timezone.utc)
    for issue in issues:
        number = issue["number"]
        last = last_activity(number, repo)
        if last is None or now - last < datetime.timedelta(days=DAYS):
            continue
        print(f"#{number}: no activity since {last:%Y-%m-%d}, removing \"{LABEL}\"")
        if not args.dry_run:
            gh("issue", "edit", str(number), "--remove-label", LABEL)


if __name__ == "__main__":
    main()
