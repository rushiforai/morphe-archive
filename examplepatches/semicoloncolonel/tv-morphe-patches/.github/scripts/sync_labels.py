#!/usr/bin/env python3
"""Makes the repository's issue labels match .github/labels.json.

Each label in the file is created, or updated to the file's color and
description. Labels that are not in the file are listed but left alone, so a
label is only deleted on purpose. The scripts that apply labels (issue_triage,
app_updates, auto_bump, launch_check) only create a label when it is missing,
so this file stays the one place that sets colors and descriptions.

Runs from .github/workflows/sync_labels.yml when the file changes on main.

    python3 .github/scripts/sync_labels.py [--dry-run]
"""

import argparse
import json
import subprocess
from pathlib import Path

LABELS = Path(".github/labels.json")


def current():
    out = subprocess.run(["gh", "label", "list", "--limit", "200", "--json", "name,color,description"],
                         capture_output=True, text=True, check=True).stdout
    return {label["name"]: label for label in json.loads(out)}


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--dry-run", action="store_true", help="print the changes instead of making them")
    args = parser.parse_args()
    wanted = json.loads(LABELS.read_text())
    existing = current()
    for label in wanted:
        have = existing.get(label["name"])
        if have and have["color"].upper() == label["color"].upper() and have["description"] == label["description"]:
            continue
        print(("update " if have else "create ") + label["name"])
        if not args.dry_run:
            subprocess.run(["gh", "label", "create", label["name"], "--force", "--color", label["color"],
                            "--description", label["description"]], check=True)
    for name in sorted(set(existing) - {label["name"] for label in wanted}):
        print(f"not in {LABELS}: {name}")


if __name__ == "__main__":
    main()
