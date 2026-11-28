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

    def test_hulu_tv_build_hash_is_not_a_version_number(self):
        # Issue 64: 6344DFC8P3.9.606 is older than the pinned C59F39CFP3.10.33.
        self.assertNewer("C59F39CFP3.10.33", "6344DFC8P3.9.606")
        self.assertNewer("0A1B2C3DP3.10.40", "C59F39CFP3.10.33")
        self.assertNotNewer("6344DFC8P3.10.33", "C59F39CFP3.10.33")

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


class PlayOnlyTest(unittest.TestCase):
    """National Forests & Grasslands 1.4.0 was on Google Play while APKPure still
    had 1.3.0, and Recreation.gov is not on APKPure at all."""

    APPS = {"gov.usda.fs.nfg": {"versions": ["1.3.0"], "patches": ["Block analytics"]}}

    def run_check(self, apkpure, listed, play, inspected=None):
        with mock.patch.object(app_updates, "apkpure_versions", return_value=apkpure), \
                mock.patch.object(app_updates, "play_listed_version", return_value=listed) as page, \
                mock.patch.object(app_updates, "check_version") as check_version, \
                mock.patch.object(app_updates, "inspect_apk", return_value=inspected or {}) as inspect:
            results = app_updates.check(self.APPS, {"gov.usda.fs.nfg": "National Forests & Grasslands"}, {},
                                        "cli", "mpp", "work", "aapt2", "apksigner", None, Path("keep"), play)
        check_version.assert_not_called()
        return results[0], inspect, page

    PHONE = {"tv_build": False, "cert": "matches", "version_name": "1.4.0",
             "patches": {"applied": ["Block analytics"], "failed": []}}

    def test_newer_on_play_is_checked_from_play(self):
        record, inspect, _ = self.run_check(["1.3.0"], "1.4.0", FakePlay("1.4.0"), self.PHONE)
        self.assertEqual((record["status"], record["latest"], record["source"]), ("update", "1.4.0", "Google Play"))
        self.assertEqual(inspect.call_args.args[1:3], (Path("base.apk"), Path("app.apks")))
        self.assertEqual(app_updates.review_reasons(record), [])

    def test_app_missing_from_apkpure_is_checked_from_play(self):
        record, _, _ = self.run_check([], "1.4.0", FakePlay("1.4.0"), self.PHONE)
        self.assertEqual((record["status"], record["latest"]), ("update", "1.4.0"))

    def test_same_version_on_play_is_up_to_date(self):
        play = FakePlay("1.3.0")
        record, inspect, _ = self.run_check(["1.3.0"], "1.3.0", play)
        self.assertEqual(record["status"], "up to date")
        inspect.assert_not_called()

    def test_rollout_not_served_to_this_phone_is_up_to_date(self):
        play = FakePlay("1.3.0")
        record, inspect, _ = self.run_check(["1.3.0"], "1.4.0", play)
        self.assertEqual(record["status"], "up to date")
        inspect.assert_not_called()
        self.assertIn("gov.usda.fs.nfg", play.discarded)

    def test_failed_play_download_is_reported_for_review(self):
        record, _, _ = self.run_check(["1.3.0"], "1.4.0", FakePlay("1.4.0", download=False))
        self.assertEqual((record["status"], record["latest"], record["download"]), ("update", "1.4.0", "failed"))
        self.assertIn("The download from Google Play failed", app_updates.review_reasons(record)[0])

    def test_store_page_is_not_read_when_apkpure_has_an_update(self):
        with mock.patch.object(app_updates, "apkpure_versions", return_value=["1.4.0", "1.3.0"]), \
                mock.patch.object(app_updates, "play_listed_version") as page, \
                mock.patch.object(app_updates, "check_version", return_value=self.PHONE):
            results = app_updates.check(self.APPS, {}, {}, "cli", "mpp", "work", "aapt2", "apksigner", None,
                                        Path("keep"), FakePlay("1.4.0"))
        page.assert_not_called()
        self.assertEqual(results[0]["status"], "update")


class CleanupTest(unittest.TestCase):
    def test_keeps_the_download_folder(self):
        """Run 42789639970: patching Play's com.abc.abcnews.apk must not touch
        APKPure's com.abc.abcnews-11.12.0 download folder."""
        import tempfile
        with tempfile.TemporaryDirectory() as workdir:
            work = Path(workdir)
            (work / "com.abc.abcnews-11.12.0").mkdir()
            (work / "com.abc.abcnews-result.json").write_text("{}")
            (work / "com.abc.abcnews-patched.apk").write_text("")
            (work / "com.abc.abcnews-patched-temporary-files").mkdir()
            app_updates.remove_patch_outputs(workdir, "com.abc.abcnews")
            self.assertEqual(sorted(p.name for p in work.iterdir()), ["com.abc.abcnews-11.12.0"])


class OlderApkTest(unittest.TestCase):
    """Issues 65 and 68: APKPure listed a version above the Netflix pin, but the
    APK it served was 9.92.0, below the 9.93.0 pin."""

    PINNED = "9.93.0 build 7 74878"
    APPS = {"com.netflix.mediaclient": {"versions": [PINNED], "patches": ["Disable autoplay"]}}

    def run_phone(self, apk_version, served):
        outcome = {"tv_build": False, "cert": "matches", "version_name": apk_version,
                   "patches": {"applied": ["Disable autoplay"], "failed": []}}
        with mock.patch.object(app_updates, "apkpure_versions", return_value=["9.94.0 build 1 75000"]), \
                mock.patch.object(app_updates, "check_version", return_value=outcome), \
                mock.patch.object(app_updates, "inspect_apk", return_value={}) as inspect:
            results = app_updates.check(self.APPS, {"com.netflix.mediaclient": "Netflix"}, {}, "cli", "mpp",
                                        "work", "aapt2", "apksigner", None, Path("keep"), FakePlay(served))
        return results[0], inspect

    def test_older_apk_is_not_reported(self):
        record, inspect = self.run_phone("9.92.0 build 9 74772", "9.92.0 build 9 74772")
        self.assertEqual(record["status"], "up to date")
        self.assertEqual(record["not_newer"], ["9.94.0 build 1 75000 (APK is 9.92.0 build 9 74772)"])
        inspect.assert_not_called()

    def test_older_apk_with_unknown_play_version_is_up_to_date(self):
        record, _ = self.run_phone("9.92.0 build 9 74772", None)
        self.assertEqual((record["status"], record["latest"]), ("up to date", self.PINNED))

    def test_newer_apk_is_still_reported(self):
        record, _ = self.run_phone("9.94.0 build 1 75000", "9.94.0 build 1 75000")
        self.assertEqual((record["status"], record["latest"]), ("update", "9.94.0 build 1 75000"))

class DevOnlyCloseTest(unittest.TestCase):
    """An app no main release has yet must not be closed as "released"."""

    def run_sync(self, stable):
        record = {"package": "com.netflix.mediaclient", "name": "Netflix", "pinned": "9.93.0 build 7 74878",
                  "status": "up to date"}
        calls = []

        def gh(*args, stdin=None):
            calls.append(args)
            if args[:2] == ("issue", "list"):
                return '[{"number": 68, "title": "App update: Netflix 9.92.0 build 9 74772"}]'
            return ""

        with mock.patch.object(app_updates, "gh", side_effect=gh):
            app_updates.sync_issues([record], None, stable)
        edits = [c for c in calls if c[:2] == ("issue", "edit")]
        closes = [c for c in calls if c[:2] == ("issue", "close")]
        return edits, closes

    def test_dev_only_app_closes_without_claiming_a_release(self):
        edits, closes = self.run_sync({"com.other.app": "1.0"})
        self.assertEqual(len(closes), 1)
        self.assertIn("which no main release includes yet", closes[0][-1])
        self.assertNotIn("main release targets", closes[0][-1])
        self.assertNotIn(app_updates.RELEASED_LABEL, edits[0])

    def test_released_app_still_says_main_release(self):
        edits, closes = self.run_sync({"com.netflix.mediaclient": "9.93.0 build 7 74878"})
        self.assertIn("The latest main release targets Netflix", closes[0][-1])
        self.assertIn(app_updates.RELEASED_LABEL, edits[0])


class CoveredVersionTest(unittest.TestCase):
    """An "update" the release already covers must not open an issue the next run closes."""

    def run_sync(self, latest, stable):
        record = {"package": "com.netflix.mediaclient", "name": "Netflix", "pinned": "9.93.0 build 7 74878",
                  "status": "update", "latest": latest, "targets": [], "patches": None}
        calls = []

        def gh(*args, stdin=None):
            calls.append(args)
            if args[:2] == ("issue", "list"):
                return "[]"
            return "https://github.com/o/r/issues/99" if args[:2] == ("issue", "create") else ""

        with mock.patch.object(app_updates, "gh", side_effect=gh):
            app_updates.sync_issues([record], None, stable)
        return [c for c in calls if c[:2] == ("issue", "create")]

    def test_older_than_main_release_opens_nothing(self):
        stable = {"com.netflix.mediaclient": "9.93.0 build 7 74878"}
        self.assertEqual(self.run_sync("9.92.0 build 9 74772", stable), [])

    def test_same_as_main_release_opens_nothing(self):
        stable = {"com.netflix.mediaclient": "9.93.0 build 7 74878"}
        self.assertEqual(self.run_sync("9.93.0 build 7 74878", stable), [])

    def test_newer_than_main_release_opens_an_issue(self):
        stable = {"com.netflix.mediaclient": "9.93.0 build 7 74878"}
        self.assertEqual(len(self.run_sync("9.94.0 build 2 75100", stable)), 1)


class HashVersionTest(unittest.TestCase):
    """Nikkei Asia names versions with build hashes, which cannot be put in order."""

    PINNED = "8a14774d3a9cb8f25eaae58f4c4e4f3e"
    APPS = {"com.nikkei.asia": {"versions": {PINNED}, "patches": ["Block analytics & tracking"]}}

    def run_check(self, listed):
        with mock.patch.object(app_updates, "apkpure_versions") as apkpure, \
                mock.patch.object(app_updates, "play_listed_version", return_value=listed), \
                mock.patch.object(app_updates, "check_version") as download:
            results = app_updates.check(self.APPS, {}, {}, "cli", "mpp", "work", "aapt2", "apksigner", None,
                                        Path("keep"), None)
        apkpure.assert_not_called()
        download.assert_not_called()
        return results[0]

    def test_untargeted_play_version_is_an_update_for_review(self):
        record = self.run_check("e5d58f23e8a98a57519b231696ca744e")
        self.assertEqual((record["status"], record["latest"]), ("update", "e5d58f23e8a98a57519b231696ca744e"))
        self.assertIn("build hash", app_updates.review_reasons(record)[0])

    def test_targeted_play_version_is_up_to_date(self):
        self.assertEqual(self.run_check(self.PINNED)["status"], "up to date")

    def test_only_the_same_hash_is_covered(self):
        self.assertTrue(app_updates.covered(self.PINNED, self.PINNED))
        self.assertFalse(app_updates.covered("0" * 32, self.PINNED))
        self.assertFalse(app_updates.covered("f" * 32, self.PINNED))


class IsTvBuildTest(unittest.TestCase):
    """A phone build that lists Android TV as optional is not a TV build."""

    def badging(self, text):
        result = mock.Mock(stdout=text)
        with mock.patch.object(app_updates, "run", return_value=result):
            return app_updates.is_tv_build(Path("app.apk"), "aapt2")

    def test_optional_leanback_feature_is_a_phone_build(self):
        self.assertFalse(self.badging(
            "uses-feature-not-required: name='android.software.leanback'\n"
            "launchable-activity: name='com.tubitv.MainActivity'\n"))

    def test_tv_launcher_is_a_tv_build(self):
        self.assertTrue(self.badging(
            "launchable-activity: name='a.Main'\nleanback-launchable-activity: name='a.TvMain'\n"))

    def test_tv_build_that_requires_leanback(self):
        # Starz 6.12.1 for Android TV (version code 9511).
        self.assertTrue(self.badging(
            "launchable-activity: name='com.starz.amznfiretv.SplashActivity'\n"
            "leanback-launchable-activity: name='com.starz.amznfiretv.SplashActivity'\n"
            "  uses-feature: name='android.software.leanback'\n"))

    def test_one_apk_for_phones_and_tvs_is_a_phone_build(self):
        # Substack 3.14.0 has a TV activity, but leanback is optional (issue 95).
        self.assertFalse(self.badging(
            "launchable-activity: name='com.substack.app.ui.AppActivity'\n"
            "leanback-launchable-activity: name='com.substack.tv.TvActivity'\n"
            "  uses-feature-not-required: name='android.software.leanback'\n"))


# list-patches output of Morphe CLI 2.3.0: a TV package has a "Form factor"
# line between its name and its versions, and a phone package has none.
LIST_PATCHES = """INFO: Index: 0
Name: Skip ads
Description: Removes the ads.
Enabled: true
Compatible packages:
\tPackage name: com.abc.abcnews
\tForm factor: TV
\tCompatible versions:
\t\t11.12.0
\tVersion codes:
\t\t11.12.0: ARM64_V8A=53550563, X86=53550563

Index: 1
Name: Hide rating prompt
Description: Hides the prompt.
Enabled: true
Compatible packages:
\tPackage name: com.tubitv
\tCompatible versions:
\t\t10.44.1
\t\t10.46.0
\tPackage name: com.foxnews.android
\tForm factor: TV
\tCompatible versions:
\t\t5.50.0
"""


class BundleAppsTest(unittest.TestCase):
    def test_reads_packages_with_and_without_a_form_factor(self):
        result = mock.Mock(stdout=LIST_PATCHES)
        with mock.patch.object(app_updates, "run", return_value=result):
            apps = app_updates.bundle_apps("cli.jar", "patches.mpp")
        self.assertEqual(apps["com.abc.abcnews"]["versions"], {"11.12.0"})
        self.assertEqual(apps["com.abc.abcnews"]["patches"], ["Skip ads"])
        self.assertEqual(apps["com.tubitv"]["versions"], {"10.44.1", "10.46.0"})
        self.assertEqual(apps["com.foxnews.android"]["versions"], {"5.50.0"})
        self.assertEqual(apps["com.foxnews.android"]["patches"], ["Hide rating prompt"])


if __name__ == "__main__":
    unittest.main()
