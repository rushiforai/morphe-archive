#!/usr/bin/env python3
"""
Remembers which apps passed their emulator test with exactly the code they're built from, so a test
isn't run twice for the same code and the release only tests what changed.

An app's fingerprint is a hash of every file its emulator test depends on:
- its own patches, extension, settings (.github/apps/<app>.json), check script (check_app.py and
  its .github/scripts/apps/<app>.py) and "test_inputs";
- the shared build and test: the rest of patches/ and extensions/ that belongs to no app, the
  Gradle files, the Morphe CLI version, emulator-app.yml, emulator_run.py and the emulator action.
Docs, other apps and the release files don't count. gradle.properties is left out too: the release
changes only its version.

When an app passes, emulator-app.yml records the ref refs/tested/<app>/<fingerprint>. A ref can be
read from any branch and any run, so the test after a merge into main counts for the release when
the code is the same.

python3 tested.py plan [--all]       JSON list of the apps without a passed test (all with --all)
python3 tested.py changed <base>     JSON list of the apps whose test depends on a file changed
                                     since <base> (a pull request's base; emulator-pr.yml)
python3 tested.py fingerprint <app>  the app's fingerprint
python3 tested.py record <app>       records that the app passed at HEAD

The Quora feed test (feed-test.yml) is remembered the same way, with the date: it checks Quora's
own pages, which change without us, so a pass only counts for FEED_DAYS days.

python3 tested.py feed-plan          "passed" when the feed test passed for this code lately, else "test"
python3 tested.py feed-record        records that the feed test passed at HEAD today
"""

import datetime
import hashlib
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SHARED = [
    "patches/", "extensions/", "gradle/", "build.gradle.kts", "settings.gradle.kts", "gradlew",
    ".github/morphe-cli-version", ".github/workflows/emulator-app.yml",
    ".github/scripts/emulator_run.py", ".github/actions/install-emulator/",
]


# The feed test signs in to a test account; it runs again after this many days even when nothing
# changed (the release runs twice a week).
FEED_DAYS = 3
FEED_FILES = [".github/workflows/feed-test.yml", ".github/scripts/feed-test.mjs",
              ".github/scripts/check_app.py", ".github/scripts/apps/quora.py"]


def git(*args):
    return subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=True, check=True).stdout


def settings():
    apps = {}
    for path in sorted((ROOT / ".github" / "apps").glob("*.json")):
        apps[path.stem] = json.loads(path.read_text(encoding="utf-8"))
    return apps


def own_paths(key, app):
    paths = [app["patches"].rstrip("/") + "/", f".github/apps/{key}.json"]
    if app.get("extension"):
        paths.append(app["extension"].rstrip("/") + "/")
    # Other files the check uses, for example a helper script it calls.
    paths += app.get("test_inputs", [])
    for command in app["check"]:
        for word in command.split():
            if word.startswith(".github/scripts/") and word.endswith(".py"):
                paths.append(word)
    # The app's own part of check_app.py, when it has one.
    if (ROOT / ".github" / "scripts" / "apps" / f"{key}.py").exists():
        paths.append(f".github/scripts/apps/{key}.py")
    return paths


def depends_on(key, apps):
    """A test for whether the app's emulator test depends on a file (a path from the repo root)."""
    mine = own_paths(key, apps[key])
    others = [p for other, app in apps.items() if other != key for p in own_paths(other, app)
              if p.endswith("/")]

    def counts(path):
        return any(path == p or path.startswith(p) for p in mine) or (
            any(path == p or path.startswith(p) for p in SHARED)
            and not any(path.startswith(p) for p in others))
    return counts


def fingerprint(key, apps):
    counts = depends_on(key, apps)
    lines = []
    for line in git("ls-files", "-s").splitlines():
        # "<mode> <blob> <stage>\t<path>": the blob hash stands for the file's content.
        meta, path = line.split("\t", 1)
        if counts(path):
            lines.append(f"{meta.split()[1]} {path}")
    return hashlib.sha256("\n".join(sorted(lines)).encode()).hexdigest()[:32]


def feed_fingerprint(apps):
    blobs = git("ls-files", "-s", "--", *FEED_FILES)
    return hashlib.sha256((fingerprint("quora", apps) + blobs).encode()).hexdigest()[:32]


def feed_passed(apps):
    out = subprocess.run(["git", "ls-remote", "origin", f"refs/tested/quora-feed/{feed_fingerprint(apps)}/*"],
                         cwd=ROOT, capture_output=True, text=True)
    today = datetime.datetime.now(datetime.timezone.utc).date()
    for line in out.stdout.splitlines():
        day = line.rsplit("/", 1)[-1]
        try:
            when = datetime.datetime.strptime(day, "%Y%m%d").date()
        except ValueError:
            continue
        if (today - when).days < FEED_DAYS:
            return day
    return None


def ref(key, apps):
    return f"refs/tested/{key}/{fingerprint(key, apps)}"


def passed(name):
    out = subprocess.run(["git", "ls-remote", "origin", name], cwd=ROOT, capture_output=True, text=True)
    return out.returncode == 0 and name in out.stdout


def main():
    apps = settings()
    command = sys.argv[1] if len(sys.argv) > 1 else ""
    if command == "plan":
        everything = "--all" in sys.argv[2:]
        todo = []
        for key in apps:
            name = ref(key, apps)
            done = not everything and passed(name)
            print(f"{key}: {name} {'passed before' if done else 'to test'}", file=sys.stderr)
            if not done:
                todo.append(key)
        print(json.dumps(todo))
    elif command == "changed" and len(sys.argv) == 3:
        # The files the pull request changes, from where it left the base branch to HEAD. A change
        # to the pull request workflow itself tests every app.
        files = git("diff", "--name-only", f"{sys.argv[2]}...HEAD").split()
        print("Changed: " + " ".join(files), file=sys.stderr)
        everything = ".github/workflows/emulator-pr.yml" in files
        todo = [key for key in apps
                if everything or any(depends_on(key, apps)(f) for f in files)]
        print(json.dumps(todo))
    elif command == "feed-plan":
        day = feed_passed(apps)
        print(f"feed test: {'passed on ' + day if day else 'to run'}", file=sys.stderr)
        print("passed" if day else "test")
    elif command == "feed-record":
        today = datetime.datetime.now(datetime.timezone.utc).strftime("%Y%m%d")
        name = f"refs/tested/quora-feed/{feed_fingerprint(apps)}/{today}"
        head = git("rev-parse", "HEAD").strip()
        result = subprocess.run(["git", "push", "origin", f"+{head}:{name}"], cwd=ROOT,
                                capture_output=True, text=True)
        if result.returncode != 0:
            print(f"::warning::Couldn't record {name}: {result.stderr.strip()}")
        else:
            print(f"Recorded {name} at {head}")
    elif command == "fingerprint" and len(sys.argv) == 3:
        print(fingerprint(sys.argv[2], apps))
    elif command == "record" and len(sys.argv) == 3:
        name = ref(sys.argv[2], apps)
        if passed(name):
            print(f"{name} is already recorded.")
            return
        head = git("rev-parse", "HEAD").strip()
        result = subprocess.run(["git", "push", "origin", f"{head}:{name}"], cwd=ROOT,
                                capture_output=True, text=True)
        if result.returncode != 0:
            # Not fatal: the app is just tested again next time.
            print(f"::warning::Couldn't record {name}: {result.stderr.strip()}")
        else:
            print(f"Recorded {name} at {head}")
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main()
