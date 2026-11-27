import io
import json
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch
from urllib.error import HTTPError
from bs4 import BeautifulSoup

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import upstream
import publish


def html(value):
    return BeautifulSoup(value, "html.parser")


class DiscoveryTests(unittest.TestCase):
    listing = html('<h5 class="appRowTitle"><a href="/apk/waze/waze-5-25-0-0-release/">Waze 5.25.0.0</a></h5>')

    def test_prefers_arm64_and_captures_identity(self):
        variants = html('''<div class="table-row">5.25.0.0 BUNDLE 33 S 1030800 arm64-v8a + armeabi-v7a
          <a href="/universal-android-apk-download/">5.25.0.0</a></div>
          <div class="table-row">5.25.0.0 BUNDLE 27 S 1030800 arm64-v8a
          <a href="/arm64-android-apk-download/">5.25.0.0</a></div>''')
        with patch.object(upstream, "page", side_effect=[self.listing, variants]):
            result = upstream.discover(None)
        self.assertEqual(result["tag"], f"waze-5.25.0.0-1030800-patches-{upstream.BUNDLE_SERIES}")
        self.assertTrue(result["variant_url"].endswith('/arm64-android-apk-download/'))
        self.assertEqual(result["extension"], ".apkm")

    def test_never_falls_back_when_latest_has_no_arm64(self):
        with patch.object(upstream, "page", side_effect=[self.listing, html('<div>armeabi-v7a</div>')]):
            with self.assertRaisesRegex(ValueError, "no ARM64"):
                upstream.discover(None)

    def test_auth_and_rate_limit_errors_do_not_trigger_builds(self):
        for status in [401, 403, 404, 429, 500]:
            with patch.dict(upstream.os.environ, GH_TOKEN="test"), patch.object(upstream, "urlopen", side_effect=HTTPError('',status,'',{},None)):
                with self.assertRaises(HTTPError):
                    upstream.published_waze_releases("owner/repo")


def waze(version="5.24.90.901", code=1030734, series="1.15"):
    return {"version": version, "version_code": code,
            "tag": f"waze-{version}-{code}-patches-{series}"}


class ReleaseGateTests(unittest.TestCase):
    def test_version_gate_ignores_patch_series_and_compares_numbers(self):
        baseline = waze()
        for candidate, expected in [
            (waze(), False),
            (waze(series="1.99"), False),
            (waze("5.24.5.0", 1030732), False),
            (waze("5.24.5.0", 1030900), False),
            (waze("5.25.0.0", 1030734), False),
            (waze("5.25.0.0", 1030800), True),
            (waze("5.24.90.901", 1030735), True),
            (waze("5.100.0.0", 1030900), True),
            (waze("5.9.0.0", 1030900), False),
        ]:
            with self.subTest(candidate=candidate):
                plan = upstream.release_plan(candidate, [baseline])
                self.assertEqual(plan["publish"], expected)
                self.assertEqual(plan["skip"], not expected)
                self.assertEqual(plan["source_tag"], candidate["tag"] if expected else baseline["tag"])

    def test_no_release_allows_initial_build_or_retry_after_failure(self):
        plan = upstream.release_plan(waze(), [])
        self.assertTrue(plan["publish"])
        self.assertFalse(plan["skip"])

    def test_uses_highest_waze_build_not_most_recent_publication(self):
        releases = [waze("5.24.5.0", 1030732, "1.99"), waze(), waze(series="1.14")]
        plan = upstream.release_plan(waze(series="2.0"), releases)
        self.assertTrue(plan["skip"])
        self.assertEqual(plan["source_tag"], releases[1]["tag"])

    def test_force_only_builds_artifacts_for_existing_new_and_first_versions(self):
        for candidate, releases in [(waze(), [waze()]),
                                    (waze("5.25.0.0", 1030800), [waze()]), (waze(), [])]:
            with self.subTest(candidate=candidate, releases=releases):
                plan = upstream.release_plan(candidate, releases, force=True)
                self.assertFalse(plan["skip"])
                self.assertFalse(plan["publish"])
                self.assertEqual(plan["source_tag"], releases[0]["tag"] if releases else "")

    def test_paginates_and_ignores_drafts_but_counts_legacy_and_prerelease_tags(self):
        first = [{"tag_name": "unrelated", "draft": False}] * 99 + [
            {"tag_name": waze("6.0.0.0", 2000000)["tag"], "draft": True}]
        second = [{"tag_name": "waze-5.24.5.0-1030732", "draft": False},
                  {"tag_name": waze()["tag"], "draft": False, "prerelease": True}]
        with patch.dict(upstream.os.environ, GH_TOKEN="test"), patch.object(
                upstream, "urlopen", side_effect=[io.BytesIO(json.dumps(x).encode()) for x in [first, second]]) as api:
            releases = upstream.published_waze_releases("owner/repo")
        self.assertEqual([x["version_code"] for x in releases], [1030732, 1030734])
        self.assertIn("page=2", api.call_args_list[1].args[0].full_url)
        self.assertTrue(upstream.release_plan(waze(), releases)["skip"])
        self.assertEqual(upstream.release_plan(waze(), releases)["source_tag"], "waze-5.24.5.0-1030732")

    def test_unpublished_draft_does_not_block_retry(self):
        draft = [{"tag_name": waze()["tag"], "draft": True}]
        with patch.dict(upstream.os.environ, GH_TOKEN="test"), patch.object(
                upstream, "urlopen", return_value=io.BytesIO(json.dumps(draft).encode())):
            releases = upstream.published_waze_releases("owner/repo")
        self.assertEqual(releases, [])
        self.assertTrue(upstream.release_plan(waze(), releases)["publish"])

    def test_unrecognised_published_waze_tag_stops_check(self):
        with patch.dict(upstream.os.environ, GH_TOKEN="test"), patch.object(
                upstream, "urlopen", return_value=io.BytesIO(b'[{"tag_name":"waze-changed-format"}]')):
            with self.assertRaisesRegex(ValueError, "Cannot determine"):
                upstream.published_waze_releases("owner/repo")

    def test_check_outputs_skip_and_existing_source_tag_for_new_patch_series(self):
        with tempfile.TemporaryDirectory() as directory:
            metadata = Path(directory) / "upstream.json"
            output = Path(directory) / "output"
            with patch.dict(upstream.os.environ, GITHUB_REPOSITORY="owner/repo", GITHUB_OUTPUT=str(output)), \
                    patch.object(sys, "argv", ["upstream.py", "check", "--metadata", str(metadata)]), \
                    patch.object(upstream, "discover", return_value=waze(series="1.99")), \
                    patch.object(upstream, "published_waze_releases", return_value=[waze()]), \
                    patch("sys.stdout", new_callable=io.StringIO):
                upstream.main()
            self.assertTrue(json.loads(metadata.read_text())["skip"])
            fields = dict(line.split("=", 1) for line in output.read_text().splitlines())
            self.assertEqual(fields["build"], "false")
            self.assertEqual(fields["publish"], "false")
            self.assertEqual(fields["source_tag"], waze()["tag"])

    def test_publisher_rechecks_history_before_uploading_changed_patch_series(self):
        info = {**waze(series="1.99"), "publish": True}
        with patch.dict(publish.os.environ, GITHUB_REPOSITORY="owner/repo", RELEASE_TAG=info["tag"]), \
                patch.object(Path, "read_text", return_value=json.dumps(info)), \
                patch.object(publish, "published_waze_releases", return_value=[waze()]) as history, \
                patch.object(publish.subprocess, "run") as command, patch("sys.stdout", new_callable=io.StringIO):
            publish.main()
        history.assert_called_once()
        command.assert_not_called()

    def test_publisher_cannot_publish_forced_or_unchecked_build(self):
        for flag in [{"publish": False}, {}]:
            info = {**waze(), **flag}
            with patch.dict(publish.os.environ, RELEASE_TAG=info["tag"]), \
                    patch.object(Path, "read_text", return_value=json.dumps(info)), \
                    patch.object(publish, "published_waze_releases") as history, \
                    patch.object(publish.subprocess, "run") as command, patch("sys.stdout", new_callable=io.StringIO):
                publish.main()
            history.assert_not_called()
            command.assert_not_called()

    def test_publisher_uploads_validated_newer_waze(self):
        info = {**waze("5.25.0.0", 1030800), "publish": True, "extension": ".apkm",
                "bundle_version": "1.15.1030800", "source_commit": "abc123", "variant_url": "https://example.com"}
        with patch.dict(publish.os.environ, GITHUB_REPOSITORY="owner/repo", RELEASE_TAG=info["tag"]), \
                patch.object(Path, "read_text", return_value=json.dumps(info)), \
                patch.object(Path, "is_file", return_value=True), patch.object(Path, "write_text"), \
                patch.object(publish, "published_waze_releases", return_value=[waze()]), \
                patch.object(publish.subprocess, "run") as command:
            command.return_value.returncode = 1
            publish.main()
        commands = [call.args[0] for call in command.call_args_list]
        self.assertEqual([args[2] for args in commands], ["view", "create", "upload", "edit"])
        self.assertIn("--draft", commands[1])
        self.assertIn("--draft=false", commands[3])


if __name__ == "__main__":
    unittest.main()
