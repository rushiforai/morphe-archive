"""Tests for watcher/apple_token_watch.py, with every network call mocked."""
import base64
import importlib.util
import io
import json
import os
import sys
import tempfile
import time
import unittest
from contextlib import redirect_stdout
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parent.parent
_spec = importlib.util.spec_from_file_location("apple_token_watch", ROOT / "watcher" / "apple_token_watch.py")
w = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(w)


def b64url(obj):
    return base64.urlsafe_b64encode(json.dumps(obj).encode()).decode().rstrip("=")


def jwt(header, payload):
    return f"{b64url(header)}.{b64url(payload)}.c2lnbmF0dXJl"


FUTURE = int(time.time()) + 86400 * 30
PAST = int(time.time()) - 3600
WEB = jwt({"alg": "ES256", "kid": "WebPlayKid"}, {"iss": "AMPWebPlay", "exp": FUTURE})
OTHER = jwt({"alg": "ES256", "kid": "Other"}, {"iss": "x", "exp": FUTURE + 5})
EXPIRED = jwt({"alg": "ES256", "kid": "WebPlayKid"}, {"iss": "AMPWebPlay", "exp": PAST})
BROWSE = '<script src="/assets/index-legacy~AbC_1.js"></script><script src="/assets/index-Xy9.js"></script>'
HLS = "https://mvod.itunes.apple.com/clip/P.m3u8"


def fake_get(pages):
    """A get() answering from {url-substring: body}; anything else fails like a 404."""
    calls = []

    def get(url, bearer=None):
        calls.append((url, bearer))
        for part, body in pages.items():
            if part in url:
                return body if isinstance(body, str) else json.dumps(body)
        raise RuntimeError("HTTP Error 404 for " + url)

    get.calls = calls
    return get


def song(album_name="Midnights", ev=None, rel=True, url="https://music.apple.com/us/album/anti-hero/1649434004?i=1"):
    s = {"attributes": {"name": "Anti-Hero", "albumName": album_name, "url": url}}
    if ev is not None:
        s["attributes"]["editorialVideo"] = ev
    if rel:
        s["relationships"] = {"albums": {"data": [{"id": "1649434004"}]}}
    return s


def search(*songs):
    return {"results": {"songs": {"data": list(songs)}}}


class TokenTest(unittest.TestCase):
    def test_b64_pads(self):
        self.assertEqual(w.b64(b64url({"a": 1})), '{"a": 1}')

    def test_prefers_web_player_token(self):
        get = fake_get({"/us/browse": BROWSE, "index-legacy": f"x='{OTHER}';y='{WEB}'"})
        with mock.patch.object(w, "get", get):
            token, exp, kind = w.scrape_token()
        self.assertEqual(token, WEB)
        self.assertEqual(exp, FUTURE)
        self.assertEqual(kind, "web player token")

    def test_fallback_is_first_unexpired(self):
        # every script is read before an unlabelled token is used, so the second one answers too
        get = fake_get({"/us/browse": BROWSE, "index-legacy": f"'{EXPIRED}' 'eyJub3Rqc29u.eyJub3Q.x' '{OTHER}'", "index-Xy9": "nothing here"})
        with mock.patch.object(w, "get", get):
            token, exp, kind = w.scrape_token()
        self.assertEqual(token, OTHER)
        self.assertIn("fallback", kind)

    def test_second_script_searched(self):
        get = fake_get({"/us/browse": BROWSE, "index-legacy": "nothing here", "index-Xy9": WEB})
        with mock.patch.object(w, "get", get):
            self.assertEqual(w.scrape_token()[0], WEB)

    def test_no_scripts(self):
        with mock.patch.object(w, "get", fake_get({"/us/browse": "<html></html>"})):
            with self.assertRaisesRegex(RuntimeError, "no /assets/index"):
                w.scrape_token()

    def test_only_expired_tokens(self):
        get = fake_get({"/us/browse": BROWSE, "index-": EXPIRED})
        with mock.patch.object(w, "get", get):
            with self.assertRaisesRegex(RuntimeError, "no unexpired token in 2"):
                w.scrape_token()


class MotionTest(unittest.TestCase):
    def test_key_order_and_fields(self):
        ev = {"motionDetailTall": {"video": "tall"}, "motionSquareVideo1x1": {"hlsUrl": "square"}}
        self.assertEqual(w.motion(ev), ("motionSquareVideo1x1", "square"))

    def test_empty_values_skipped(self):
        self.assertEqual(w.motion({"motionDetailSquare": {"video": "", "url": "u"}}), ("motionDetailSquare", "u"))

    def test_nothing(self):
        self.assertIsNone(w.motion(None))
        self.assertIsNone(w.motion({}))
        self.assertIsNone(w.motion({"motionDetailSquare": None}))


class ScrapeTest(unittest.TestCase):
    def run_scrape(self, pages):
        pages = {"/us/browse": BROWSE, "index-": WEB, ".m3u8": "#EXTM3U\n", **pages}
        get = fake_get(pages)
        report = []
        with mock.patch.object(w, "get", get):
            w.check_scrape(report)
        return report, get.calls

    def test_song_motion_art(self):
        report, calls = self.run_scrape({"search?": search(song(ev={"motionDetailSquare": {"video": HLS}}))})
        self.assertIn("motion art: motionDetailSquare, HLS playlist ok", report)
        self.assertFalse(any("/albums/" in u for u, _ in calls))
        self.assertTrue(all(b == WEB for u, b in calls if "amp-api" in u))

    def test_probe_album_preferred(self):
        other = song(album_name="Some Live Set", ev={"motionDetailSquare": {"video": "https://x/not-hls.mp4"}})
        report, _ = self.run_scrape({"search?": search(other, song(ev={"motionDetailSquare": {"video": HLS}}))})
        self.assertIn("on 'Midnights'", report[1])

    def test_album_from_relationship(self):
        report, calls = self.run_scrape({
            "search?": search(song()),
            "/albums/1649434004": {"data": [{"attributes": {"name": "Midnights", "editorialVideo": {"motionDetailSquare": {"video": HLS}}}}]},
        })
        self.assertIn("motion art: motionDetailSquare, HLS playlist ok", report)

    def test_album_id_from_url(self):
        report, calls = self.run_scrape({
            "search?": search(song(rel=False, url="https://music.apple.com/us/album/midnights/777?i=1")),
            "/albums/777": {"data": [{"attributes": {"name": "Midnights", "editorialVideo": {"motionDetailTall": {"video": HLS}}}}]},
        })
        self.assertTrue(any("/albums/777" in u for u, _ in calls))
        self.assertIn("motion art: motionDetailTall, HLS playlist ok", report)

    def test_no_album_at_all(self):
        with self.assertRaisesRegex(RuntimeError, "no album relationship"):
            self.run_scrape({"search?": search(song(rel=False, url=""))})

    def test_album_without_motion_art(self):
        with self.assertRaisesRegex(RuntimeError, r"no motion art .*editorialVideo keys: \['motionX'\]"):
            self.run_scrape({"search?": search(song()),
                             "/albums/": {"data": [{"attributes": {"name": "M", "editorialVideo": {"motionX": {}}}}]}})

    def test_no_songs(self):
        with self.assertRaisesRegex(RuntimeError, "returned no songs"):
            self.run_scrape({"search?": {"results": {}}})

    def test_not_hls(self):
        with self.assertRaisesRegex(RuntimeError, "not an HLS playlist"):
            self.run_scrape({"search?": search(song(ev={"motionDetailSquare": {"video": "https://x/a.mp4"}}))})

    def test_playlist_not_hls(self):
        with self.assertRaisesRegex(RuntimeError, "did not load as HLS"):
            self.run_scrape({".m3u8": "<html>", "search?": search(song(ev={"motionDetailSquare": {"video": HLS}}))})


class GetTest(unittest.TestCase):
    def headers_for(self, url, bearer=None, env=None):
        seen = {}

        class Resp(io.BytesIO):
            def __enter__(self):
                return self

            def __exit__(self, *a):
                return False

        def urlopen(req, timeout):
            seen.update({k.lower(): v for k, v in req.header_items()})
            return Resp(b"ok")

        with mock.patch.dict(os.environ, env or {}, clear=True), mock.patch.object(w.urllib.request, "urlopen", urlopen):
            self.assertEqual(w.get(url, bearer), "ok")
        return seen

    def test_github_token_only_for_the_api(self):
        self.assertEqual(self.headers_for("https://api.github.com/repos/a/b/commits", env={"GITHUB_TOKEN": "t"})["authorization"], "Bearer t")
        self.assertNotIn("authorization", self.headers_for("https://music.apple.com/us/browse", env={"GITHUB_TOKEN": "t"}))
        self.assertNotIn("authorization", self.headers_for("https://api.github.com/repos/a/b/commits"))

    def test_apple_bearer(self):
        h = self.headers_for("https://amp-api.music.apple.com/v1/x", bearer="jwt", env={"GITHUB_TOKEN": "t"})
        self.assertEqual(h["authorization"], "Bearer jwt")
        self.assertEqual(h["origin"], "https://music.apple.com")


def commit(sha):
    return [{"sha": sha, "commit": {"committer": {"date": "2026-11-01T00:00:00Z"}, "message": "subject\n\nbody"}}]


class UpstreamTest(unittest.TestCase):
    def setUp(self):
        self.dir = tempfile.TemporaryDirectory()
        self.path = Path(self.dir.name) / "upstream.json"
        # two files of its own, so the logic is tested whatever the real list holds (it is one file now)
        patches = [mock.patch.object(w, "UPSTREAM", self.path), mock.patch.object(w, "check_scrape", lambda report: report.append("scrape ok")),
                   mock.patch.object(w, "UPSTREAM_FILES", [("owner/one", "src/One.kt"), ("owner/two", "src/two.js")])]
        for p in patches:
            p.start()
            self.addCleanup(p.stop)

    def tearDown(self):
        self.dir.cleanup()

    def run_main(self, answers, *args):
        def get(url, bearer=None):
            for (repo, path), body in zip(w.UPSTREAM_FILES, answers):
                if f"/repos/{repo}/commits" in url:
                    self.assertIn("per_page=1", url)
                    if isinstance(body, Exception):
                        raise body
                    return json.dumps(body)
            raise AssertionError(url)

        out = io.StringIO()
        code = 0
        with mock.patch.object(w, "get", get), mock.patch.object(sys, "argv", ["x", *args]), redirect_stdout(out):
            try:
                w.main()
            except SystemExit as e:
                code = e.code
        return code, out.getvalue()

    def names(self):
        return [f"{repo}/{path}" for repo, path in w.UPSTREAM_FILES]

    def test_accept_then_unchanged(self):
        code, out = self.run_main([commit("a1"), commit("b1")], "--accept")
        self.assertEqual(code, 0)
        self.assertIn("recorded as seen", out)
        saved = json.loads(self.path.read_text(encoding="utf-8"))
        self.assertEqual([saved[n]["sha"] for n in self.names()], ["a1", "b1"])
        self.assertEqual(saved[self.names()[0]]["message"], "subject")
        self.assertNotIn(b"\r\n", self.path.read_bytes())
        code, out = self.run_main([commit("a1"), commit("b1")])
        self.assertEqual(code, 0)
        self.assertIn("all good", out)

    def test_changed(self):
        self.run_main([commit("a1"), commit("b1")], "--accept")
        code, out = self.run_main([commit("a1"), commit("b2")])
        self.assertEqual(code, 1)
        self.assertIn("upstream scrape code changed: " + self.names()[1], out)
        self.assertNotIn(self.names()[0] + " (", out)

    def test_nothing_seen_yet(self):
        code, out = self.run_main([commit("a1"), commit("b1")])
        self.assertEqual(code, 1)
        self.assertEqual(out.count("upstream scrape code changed"), 2)

    def test_file_gone_upstream(self):
        self.run_main([commit("a1"), commit("b1")], "--accept")
        code, out = self.run_main([commit("a1"), []])
        self.assertEqual(code, 1)
        self.assertIn("upstream scrape code not found: " + self.names()[1], out)

    def test_github_error_is_not_a_failure(self):
        code, out = self.run_main([RuntimeError("HTTP Error 403: rate limit exceeded"), commit("b1")])
        self.assertEqual(code, 0)
        self.assertIn("upstream: could not check (HTTP Error 403", out)

    def test_accept_fails_when_github_fails(self):
        code, out = self.run_main([RuntimeError("HTTP Error 403: rate limit exceeded"), commit("b1")], "--accept")
        self.assertEqual(code, 1)
        self.assertIn("upstream: could not record", out)
        self.assertFalse(self.path.exists())

    def test_unreadable_repository_fails(self):
        import urllib.error
        gone = urllib.error.HTTPError("https://api.github.com/x", 404, "Not Found", None, None)
        code, out = self.run_main([gone, commit("b1")])
        self.assertEqual(code, 1)
        self.assertIn("upstream scrape code unreadable", out)

    def test_scrape_failure_fails(self):
        def broken(report):
            raise RuntimeError("no token")

        self.run_main([commit("a1"), commit("b1")], "--accept")
        with mock.patch.object(w, "check_scrape", broken):
            code, out = self.run_main([commit("a1"), commit("b1")])
        self.assertEqual(code, 1)
        self.assertIn("Apple scrape broken: no token", out)


if __name__ == "__main__":
    unittest.main()
