import re
import unittest
from pathlib import Path

from apk import FetchError, download, is_challenge, missing_names, with_retries

ROOT = Path(__file__).resolve().parents[2]
JAVA = ROOT / "extensions/jimaku/src/main/java"
NAMES = Path(__file__).resolve().parent / "youtube-names.txt"


class RetryTest(unittest.TestCase):
    def setUp(self):
        self.calls = 0
        self.waits = []

    def failing(self, times, status=504):
        def call():
            self.calls += 1
            if self.calls <= times:
                raise FetchError("https://example.org", status)
            return "ok"
        return call

    def test_retries_then_succeeds(self):
        result = with_retries(self.failing(2), attempts=3, wait=20, sleep=self.waits.append)
        self.assertEqual(result, "ok")
        self.assertEqual(self.calls, 3)
        self.assertEqual(self.waits, [20, 20])

    def test_retries_give_up(self):
        with self.assertRaises(FetchError):
            with_retries(self.failing(99), attempts=3, wait=20, sleep=self.waits.append)
        self.assertEqual(self.calls, 3)

    def test_curl_failure_is_retried(self):
        result = with_retries(self.failing(1, status=None), attempts=3, wait=20, sleep=self.waits.append)
        self.assertEqual(result, "ok")
        self.assertEqual(self.calls, 2)

    def test_client_error_is_not_retried(self):
        with self.assertRaises(FetchError):
            with_retries(self.failing(99, status=404), attempts=3, wait=20, sleep=self.waits.append)
        self.assertEqual(self.calls, 1)


RELEASE_PAGE = (
    '<div class="table-row headerFont"><div><a href="/apk/google-inc/youtube/youtube-21-20-405-release/'
    'youtube-21-20-405-4-android-apk-download/">21.20.405</a> <span>APK</span> universal nodpi</div>\n</div>'
)
VARIANT_PAGE = '<a href="/apk/google-inc/youtube/youtube-21-20-405-4-android-apk-download/download/?key=k1">Download</a>'
KEY_PAGE = '<a href="/wp-content/themes/APKMirror/download.php?id=1&amp;key=k2">here</a>'


class FakeSession:
    """APKMirror's pages; the file itself fails with the given statuses, one per session, then succeeds."""

    def __init__(self, log, file_statuses):
        self.log = log
        self.file_statuses = file_statuses

    def get(self, url, referer=None, out=None):
        self.log.append(url)
        if out:
            if self.file_statuses:
                raise FetchError(url, self.file_statuses.pop(0))
            return ""
        if "download.php" in url:
            raise AssertionError("the file is fetched with out")
        if "/download/?key=" in url:
            return KEY_PAGE
        if url.endswith("-apk-download/"):
            return VARIANT_PAGE
        return RELEASE_PAGE


class DownloadTest(unittest.TestCase):
    def download(self, file_statuses):
        self.log, self.waits = [], []
        download("21.20.405", "out.apk", session=lambda: FakeSession(self.log, file_statuses), sleep=self.waits.append)

    def test_server_error_starts_the_chain_again_for_a_new_key(self):
        # 2026-10-30: download.php answered 502, and the same link again 403, its key spent.
        self.download([502])
        files = [url for url in self.log if "download.php" in url]
        releases = [url for url in self.log if url.endswith("youtube-21-20-405-release/")]
        self.assertEqual(len(files), 2)
        self.assertEqual(len(releases), 2)
        self.assertTrue(files[0].endswith("download.php?id=1&key=k2"))
        self.assertEqual(len(self.waits), 1)

    def test_client_error_on_the_file_gives_up(self):
        with self.assertRaises(FetchError):
            self.download([403])
        self.assertEqual(len([url for url in self.log if "download.php" in url]), 1)


class ChallengeTest(unittest.TestCase):
    # 2026-10-30 12:39 UTC: every APKMirror page answered 403 with Cloudflare's "Just a moment..." page.
    CHALLENGE = "<!DOCTYPE html><html><head><title>Just a moment...</title></head><body>cType: 'managed'</body></html>"

    def test_cloudflare_challenge_is_recognised(self):
        self.assertTrue(is_challenge(403, self.CHALLENGE))

    def test_other_answers_are_not_challenges(self):
        self.assertFalse(is_challenge(200, self.CHALLENGE))
        self.assertFalse(is_challenge(403, "<html><title>Forbidden</title></html>"))
        self.assertFalse(is_challenge(502, ""))

    def test_challenge_is_not_retried_and_says_why(self):
        error = FetchError("https://www.apkmirror.com/", 403, challenge=True)
        self.assertFalse(error.retryable)
        self.assertIn("bot check", str(error))


class NamesTest(unittest.TestCase):
    def test_missing_names(self):
        dump = (
            "      resource 0x7f0b0123 id/player_subtitle_button\n"
            "      resource 0x7f0b0124 id/player_subtitle_button_x\n"
            "      resource 0x7f150001 string/bottom_sheet_accessibility_pane_title\n"
        )
        names = ["id/player_subtitle_button", "id/fullscreen_button", "string/bottom_sheet_accessibility_pane_title"]
        self.assertEqual(missing_names(dump, names), ["id/fullscreen_button"])

    def test_names_list_covers_the_code(self):
        message = "A YouTube lookup by name changed: update .github/follow-morphe/youtube-names.txt"
        sources = {path: path.read_text(encoding="utf-8") for path in JAVA.rglob("*.java")}
        lookups = {path.relative_to(JAVA).as_posix(): text.count("getIdentifier(") for path, text in sources.items()}
        self.assertEqual(
            {path: count for path, count in lookups.items() if count},
            {"app/jimaku/extension/Player.java": 1, "app/jimaku/extension/ui/Sheet.java": 1},
            message,
        )

        player = (JAVA / "app/jimaku/extension/Player.java").read_text(encoding="utf-8")
        found = set()
        for argument in re.findall(r"resourceId\(([^)]*)\)", player):
            if argument == "String name":
                continue
            literal = re.fullmatch(r'"([^"]+)"', argument)
            constant = re.fullmatch(r"(\w+)(?:\[[^\]]*\])?", argument)
            self.assertTrue(literal or constant, f"{message} (resourceId({argument}))")
            if literal:
                found.add("id/" + literal.group(1))
                continue
            declaration = re.search(r"\bString(?:\[\])? " + constant.group(1) + r" = ([^;]+);", player)
            self.assertIsNotNone(declaration, f"{message} ({constant.group(1)})")
            found.update("id/" + name for name in re.findall(r'"([^"]+)"', declaration.group(1)))

        sheet = (JAVA / "app/jimaku/extension/ui/Sheet.java").read_text(encoding="utf-8")
        for argument in re.findall(r"hostString\(([^)]*)\)", sheet):
            if argument == "String name":
                continue
            literal = re.fullmatch(r'"([^"]+)"', argument)
            self.assertTrue(literal, f"{message} (hostString({argument}))")
            found.add("string/" + literal.group(1))

        listed = {line.strip() for line in NAMES.read_text(encoding="utf-8").splitlines() if line.strip()}
        self.assertEqual(found, listed, message)


if __name__ == "__main__":
    unittest.main()
