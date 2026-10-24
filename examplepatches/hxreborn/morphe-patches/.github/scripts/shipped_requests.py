#!/usr/bin/env python3
"""python3 shipped_requests.py <previous-patches-list.json> <patches-list.json> <requests.json> [<tag> <owner/repo>]"""

import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "actions" / "triage"))
from app_request import find_package, supported_apps
from fields import field, parse_fields

OPEN_ENDED = "something else"


def requested_features(body):
    value = field(parse_fields(body), "Requested features")
    return [feature.strip() for feature in value.split(",") if feature.strip()]


def asks_for_one_feature(body):
    features = requested_features(body)
    return len(features) == 1 and not features[0].lower().startswith(OPEN_ENDED)


def shipped(previous, current, requests):
    known = supported_apps(previous)
    added = {package: name for package, name in supported_apps(current).items() if package not in known}
    rows = []
    for request in requests:
        if request.get("state") != "OPEN":
            continue
        body = request.get("body") or ""
        package = find_package(body).lower()
        if package in added:
            rows.append({"number": request["number"], "package": package, "app": added[package],
                         "close": asks_for_one_feature(body)})
    return rows


def prerelease_comment(row, tag, repo):
    link = f"[{tag}](https://github.com/{repo}/releases/tag/{tag})"
    comment = (f"<!-- prerelease-bot -->\nA pre-release with patches for {row['app']} is out: {link}. "
               f"In Morphe Manager open Sources, this bundle, and turn on Pre-release patches, "
               f"then update the bundle and patch {row['app']}. Reply here whether it works.")
    if row["close"]:
        comment += " The request closes when the change is merged into main."
    return comment + "\n"


if __name__ == "__main__":
    previous, current, requests = (json.loads(Path(path).read_text(encoding="utf-8")) for path in sys.argv[1:4])
    prerelease = sys.argv[4:6]
    for row in shipped(previous, current, requests):
        if prerelease:
            row["comment"] = prerelease_comment(row, *prerelease)
        print(json.dumps(row))
