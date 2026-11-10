"""Tests for app_updates.py: version order, and Android TV builds on APKPure.

Run from the repository root: python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import unittest
from pathlib import Path
from unittest import mock

import app_updates


class NewerTest(unittest.TestCase):
    def assertNewer(self, a, b):
        self.assertTrue(app_updates.newer(a, b), f"{a} should be newer than {b}")
        self.assertFalse(app_updates.newer(b, a), f"{b} should not be newer than {a}")

    def assertNotNewer(self, a, b):
        self.assertFalse(app_updates.newer(a, b), f"{a} should not be newer than {b}")

    def test_plain_versions_compare_by_number(self):
        self.assertNewer("22.0.0.321", "22.0.0.36")
        self.assertNewer("10.44.2", "10.9.0")
        self.assertNotNewer("1.0", "1.0")

    def test_hulu_build_part(self):
        # APKPure lists only the part after the "+".
        self.assertTrue(app_updates.newer("18552421-google", "6.34.0+18552420-google"))
        self.assertFalse(app_updates.newer("18552419-google", "6.34.0+18552420-google"))

    def test_disney_build_parts_order_by_date(self):
        # APKPure lists "rc3-2026.11.02"; the rc number starts over with each version.
        pinned = "26.20.0+rc3-2026.11.02"
        self.assertTrue(app_updates.newer("rc1-2026.11.20", pinned))
        self.assertFalse(app_updates.newer("rc6-2026.07.30", pinned))
        self.assertFalse(app_updates.newer("rc5-2026.10.05", pinned))
        self.assertFalse(app_updates.newer("rc3-2026.11.02", pinned))

    def test_disney_undated_old_releases_are_older(self):
        self.assertFalse(app_updates.newer("3.5.0-rc4", "26.20.0+rc2-2026.10.28"))
        self.assertFalse(app_updates.newer("3.2.3-rc4", "26.20.0+rc3-2026.11.02"))
        self.assertFalse(app_updates.newer("4.4.1-rc1-2025.04.10", "26.20.0+rc3-2026.11.02"))

    def test_disney_full_names(self):
        self.assertNewer("26.21.0+rc1-2026.11.20", "26.20.0+rc3-2026.11.02")
        self.assertNewer("26.20.0+rc3-2026.11.02", "26.20.0+rc2-2026.10.28")

    def test_sorting_newest_first(self):
        listed = ["rc6-2026.07.30", "rc1-2026.11.20", "3.5.0-rc4", "rc3-2026.11.02", "rc5-2026.10.05"]
        ordered = sorted(listed, key=app_updates.version_order, reverse=True)
        self.assertEqual(ordered, ["rc1-2026.11.20", "rc3-2026.11.02", "rc5-2026.10.05", "rc6-2026.07.30", "3.5.0-rc4"])


class FakePlay:
    def __init__(self, served, download=True):
        self.served = served
        self.download = download
        self.discarded = []

    def version(self, package):
        return self.served

    def downloaded(self, package):
        return (Path("base.apk"), Path("app.apks")) if self.download else None

    def discard(self, package):
        self.discarded.append(package)


class TvBuildTest(unittest.TestCase):
    """APKPure lists only the Android TV build of Tubi 10.44.5000."""

    APPS = {"com.tubitv": {"versions": ["10.44.2"], "patches": ["Skip ads"]}}

    def run_check(self, play, inspected=None):
        tv = {"tv_build": True, "cert": "matches", "version_name": "10.44.5000"}
        with mock.patch.object(app_updates, "apkpure_versions", return_value=["10.44.5000", "10.44.2"]), \
                mock.patch.object(app_updates, "check_version", return_value=tv), \
                mock.patch.object(app_updates, "inspect_apk", return_value=inspected or {}) as inspect:
            results = app_updates.check(self.APPS, {"com.tubitv": "Tubi"}, {}, "cli", "mpp", "work", "aapt2",
                                        "apksigner", None, Path("keep"), play)
        return results[0], inspect

    def test_phone_build_unchanged_is_up_to_date(self):
        play = FakePlay("10.44.2")
        record, inspect = self.run_check(play)
        self.assertEqual(record["status"], "up to date")
        self.assertEqual(record["tv_builds_skipped"], ["10.44.5000"])
        inspect.assert_not_called()
        self.assertEqual(play.discarded, ["com.tubitv"])

    def test_newer_phone_build_is_checked_from_play(self):
        phone = {"tv_build": False, "cert": "matches", "version_name": "10.45.0",
                 "patches": {"applied": ["Skip ads"], "failed": []}}
        record, inspect = self.run_check(FakePlay("10.45.0"), phone)
        self.assertEqual(record["status"], "update")
        self.assertEqual(record["latest"], "10.45.0")
        self.assertEqual(record["source"], "Google Play")
        self.assertFalse(record["rollout"])
        self.assertEqual(inspect.call_args.args[1:3], (Path("base.apk"), Path("app.apks")))
        self.assertEqual(app_updates.review_reasons(record), [])

    def test_unknown_play_version_is_reported_for_review(self):
        record, _ = self.run_check(FakePlay(None))
        self.assertEqual(record["status"], "update")
        self.assertTrue(record["tv_build"])

    def test_tv_only_issue_is_closed(self):
        record = {"package": "com.tubitv", "name": "Tubi", "pinned": "10.44.2", "status": "up to date",
                  "play": "10.44.2", "tv_builds_skipped": ["10.44.5000"]}
        calls = []

        def gh(*args, stdin=None):
            calls.append(args)
            return '[{"number": 32, "title": "App update: Tubi 10.44.5000"}]' if args[:2] == ("issue", "list") else ""

        with mock.patch.object(app_updates, "gh", side_effect=gh):
            app_updates.sync_issues([record], None, {"com.tubitv": "10.44.2"})
        closes = [c for c in calls if c[:2] == ("issue", "close")]
        self.assertEqual(len(closes), 1)
        self.assertEqual(closes[0][2], "32")
        self.assertIn("still serves Tubi `10.44.2` to phones", closes[0][-1])


if __name__ == "__main__":
    unittest.main()
