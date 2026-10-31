"""Tests for the BitChord compatibility watcher, against a fake GitHub API."""

import json
import os
import re
import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))
import bitchord_watch as watch  # noqa: E402


def release(tag, abis=("arm64-v8a", "armeabi-v7a", "x86_64"), draft=False, number=1):
    return {
        "tag_name": tag,
        "draft": draft,
        "id": number,
        "assets": [
            {
                "name": f"BitChord-{tag}_{abi}.apk",
                "browser_download_url": f"https://x/{tag}/{abi}",
            }
            for abi in abis
        ]
        + [
            {
                "name": f"BitChord-{tag}_wear.apk",
                "browser_download_url": "https://x/wear",
            }
        ],
    }


class FakeGitHub:
    def __init__(self, releases, branches, issues=()):
        self.releases, self.branches = releases, branches
        self.issues = list(issues)
        self.comments = []

    def __call__(self, path, method="GET", body=None):
        path = re.sub(r"[?&](per_page|page)=\d+", "", path)
        if path.startswith(f"repos/{watch.UPSTREAM}/releases"):
            return self.releases
        if path.startswith(f"repos/{watch.UPSTREAM}/branches"):
            return [{"name": n, "commit": {"sha": s}} for n, s in self.branches.items()]
        if path.endswith("/labels"):
            return {}
        if path.startswith("repos/me/patch/issues?"):
            return self.issues
        if path == "repos/me/patch/issues" and method == "POST":
            issue = {"number": len(self.issues) + 1, "state": "open", **body}
            self.issues.append(issue)
            return issue
        match = re.match(r"repos/me/patch/issues/(\d+)(/comments)?$", path)
        if match:
            issue = self.issues[int(match.group(1)) - 1]
            if match.group(2):
                self.comments.append((issue["number"], body["body"]))
            else:
                issue.update(body)
            return issue
        raise AssertionError("Unexpected API call: " + path)


class WatchTest(unittest.TestCase):
    def setUp(self):
        patcher = mock.patch.dict(
            os.environ, {"GITHUB_REPOSITORY": "me/patch", "GITHUB_RUN_ID": "7"}
        )
        patcher.start()
        self.addCleanup(patcher.stop)
        self.supported = mock.patch.object(
            watch, "supported_version", return_value="1.8.1"
        )
        self.supported.start()
        self.addCleanup(self.supported.stop)

    def use(self, fake):
        patcher = mock.patch.object(watch, "api", fake)
        patcher.start()
        self.addCleanup(patcher.stop)

    def test_only_versions_newer_than_supported(self):
        self.use(
            FakeGitHub(
                [release("v1.8.1"), release("v1.8")],
                {"v1.8.1": "a", "main": "b", "v1.7": "c"},
            )
        )
        self.assertEqual(watch.targets(force=False), [])

    def test_release_supersedes_branch_and_branches_are_found(self):
        fake = FakeGitHub(
            [release("v1.8.2", number=5), release("v1.9", draft=True)],
            {"v1.8.2": "aaa", "v1.9": "bbb", "web-player": "ccc"},
        )
        self.use(fake)
        found = {t["version"]: t for t in watch.targets(force=False)}
        self.assertEqual(set(found), {"1.8.2", "1.9"})
        self.assertEqual(found["1.8.2"]["kind"], "release")
        self.assertEqual(set(found["1.8.2"]["apks"]), set(watch.ABIS))
        self.assertEqual(
            found["1.9"],
            {"kind": "branch", "ref": "v1.9", "id": "bbb", "version": "1.9"},
        )

    def test_newest_three_versions_only(self):
        branches = {f"v1.{n}": str(n) for n in range(9, 14)}
        self.use(FakeGitHub([], branches))
        self.assertEqual(
            [t["version"] for t in watch.targets(False)], ["1.13", "1.12", "1.11"]
        )

    def run_report(self, fake, target, passed):
        self.use(fake)
        with tempfile.TemporaryDirectory() as folder:
            result = Path(folder) / "one"
            result.mkdir()
            (result / "target.json").write_text(json.dumps(target))
            if passed is not None:
                (result / "result.json").write_text(json.dumps({"passed": passed}))
                (result / "summary.md").write_text("table\n")
            watch.report(folder)

    def test_issue_lifecycle(self):
        fake = FakeGitHub([], {"v1.8.2": "aaa"})
        branch = {"kind": "branch", "ref": "v1.8.2", "id": "aaa", "version": "1.8.2"}

        self.run_report(fake, branch, passed=False)
        self.assertEqual(len(fake.issues), 1)
        self.assertEqual(fake.issues[0]["title"], "BitChord 1.8.2 compatibility")
        self.assertIn("no longer matches", fake.issues[0]["body"])
        self.assertEqual(fake.comments, [])

        self.use(fake)
        self.assertEqual(watch.targets(False), [], "Same commit is not tested again")
        self.assertEqual(len(watch.targets(True)), 1, "--force tests it anyway")

        self.run_report(fake, dict(branch, id="bbb"), passed=False)
        self.assertEqual(
            fake.comments, [], "No comment while the result stays the same"
        )

        self.run_report(fake, dict(branch, id="ccc"), passed=True)
        self.assertEqual(len(fake.issues), 1)
        self.assertIn("every check passes", fake.issues[0]["body"])
        self.assertEqual(len(fake.comments), 1)
        self.assertIn("now passes", fake.comments[0][1])

        fake.issues[0]["state"] = "closed"
        self.run_report(fake, dict(branch, id="ddd"), passed=False)
        self.assertEqual(
            fake.issues[0]["state"], "open", "A new failure reopens the issue"
        )
        self.assertEqual(len(fake.comments), 2)

    def test_failed_build_is_reported(self):
        fake = FakeGitHub([], {})
        self.run_report(
            fake, {"kind": "branch", "ref": "v1.9", "id": "e", "version": "1.9"}, None
        )
        self.assertIn("build or download failed", fake.issues[0]["body"])


if __name__ == "__main__":
    unittest.main()
