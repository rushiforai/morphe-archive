#!/usr/bin/env python3
"""Tests for verify_anchors_online.py, without touching the network.

Every fixture here is either a hand-written HTML fragment or a stub HTTP server started on
localhost, so the whole file runs in about a second and works on a machine with no internet.

The slugging itself is GitHub's own library, so those tests skip cleanly when node or
github-slugger is not available - which is exactly the situation in the offline CI job.

Usage
-----
    python3 .github/scripts/test_verify_anchors_online.py [--slugger-dir DIR]

Exit code 0 = every test passed.
"""

import json
import os
import shutil
import subprocess
import sys
import threading
import unittest
from http.server import BaseHTTPRequestHandler, HTTPServer
from unittest import mock

sys.dont_write_bytecode = True          # keep .github/scripts free of __pycache__
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

import verify_anchors_online as V       # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
def _slugger_dir_from_argv():
    """Read --slugger-dir at import time, so class-level skips can see it.

    unittest evaluates skip conditions when the class is defined, which is before main()
    runs. Setting it in main() left every condition seeing None and skipping everything.
    """
    if "--slugger-dir" in sys.argv:
        return sys.argv[sys.argv.index("--slugger-dir") + 1]
    return os.environ.get("SLUGGER_DIR")


SLUGGER_DIR = _slugger_dir_from_argv()

NEEDS_SLUGGER = unittest.skipUnless(
    SLUGGER_DIR and os.path.isdir(os.path.join(SLUGGER_DIR, "node_modules", "github-slugger")),
    "github-slugger is not installed",
)
NEEDS_SLUGGER.__doc__ = "Skip when the library is absent: that is an install problem, not a bug."


class Stub:
    """A local HTTP server that answers the markdown API with whatever a test wants."""

    def __init__(self, status=200, body=b"<h1>Title</h1>", headers=None):
        self.status = status
        self.body = body
        self.headers = headers or {}
        self.requests = []
        stub = self

        class Handler(BaseHTTPRequestHandler):
            def do_POST(self):
                length = int(self.headers.get("Content-Length") or 0)
                stub.requests.append(self.rfile.read(length))
                self.send_response(stub.status)
                for key, value in stub.headers.items():
                    self.send_header(key, value)
                self.send_header("Content-Length", str(len(stub.body)))
                self.end_headers()
                self.wfile.write(stub.body)

            def log_message(self, *args):
                pass

        self.server = HTTPServer(("127.0.0.1", 0), Handler)
        self.url = f"http://127.0.0.1:{self.server.server_port}/markdown"
        self.thread = threading.Thread(target=self.server.serve_forever,
                                       kwargs={"poll_interval": 0.01}, daemon=True)

    def __enter__(self):
        self.thread.start()
        return self

    def __exit__(self, *exc):
        self.server.shutdown()
        self.server.server_close()


class TestParse(unittest.TestCase):
    def test_heading_text_is_the_rendered_text(self):
        headings, _, _ = V.parse("<h2>Some <code>code</code> here</h2>")
        self.assertEqual(headings, ["Some code here"])

    def test_entities_are_decoded(self):
        headings, hrefs, _ = V.parse(
            '<h2>Remove ads &amp; bloat</h2><a href="#remove-ads--bloat">x</a>'
        )
        self.assertEqual(headings, ["Remove ads & bloat"])
        self.assertEqual(hrefs, ["#remove-ads--bloat"])

    def test_an_image_contributes_no_text_but_its_space_does(self):
        """This is the shape of this repo's H1, and why its anchor starts with a hyphen."""
        headings, _, _ = V.parse('<h1><img src="assets/icon.png" alt=""> GinArena Patch</h1>')
        self.assertEqual(headings, [" GinArena Patch"])

    def test_a_link_inside_a_heading_contributes_its_label(self):
        headings, _, _ = V.parse('<h2><a href="x">Foo</a> bar</h2>')
        self.assertEqual(headings, ["Foo bar"])

    def test_heading_attributes_are_ignored(self):
        headings, _, _ = V.parse('<h3 dir="auto" class="x">T</h3>')
        self.assertEqual(headings, ["T"])

    def test_heading_order_is_document_order(self):
        headings, _, _ = V.parse("<h1>A</h1><h2>B</h2><h3>C</h3>")
        self.assertEqual(headings, ["A", "B", "C"])

    def test_user_content_prefix_is_stripped_from_ids(self):
        _, _, ids = V.parse('<p><a id="user-content-made-by-hand"></a></p>')
        self.assertEqual(ids, {"made-by-hand"})

    def test_every_href_is_collected(self):
        _, hrefs, _ = V.parse('<a href="#a">1</a><a href="https://x">2</a><a href="">3</a>')
        self.assertEqual(hrefs, ["#a", "https://x", ""])

    def test_headings_inside_code_blocks_are_not_headings(self):
        """The API escapes code blocks, and this parser only sees what the API emitted."""
        headings, _, _ = V.parse("<pre><code># not a heading\n</code></pre><h1>Real</h1>")
        self.assertEqual(headings, ["Real"])

    def test_empty_input(self):
        self.assertEqual(V.parse(""), ([], [], set()))


class TestNormalise(unittest.TestCase):
    def test_plain(self):
        self.assertEqual(V.normalise("#foo"), "foo")

    def test_percent_encoding(self):
        self.assertEqual(V.normalise("#cjk-%E9%9A%90%E8%97%8F"), "cjk-\u9690\u85cf")

    def test_user_content_prefix(self):
        self.assertEqual(V.normalise("#user-content-foo"), "foo")

    def test_empty_anchor(self):
        self.assertEqual(V.normalise("#"), "")

    def test_a_percent_that_is_not_an_escape(self):
        self.assertEqual(V.normalise("#100%"), "100%")


class TestEvaluate(unittest.TestCase):
    SLUGS = ["alpha", "remove-ads--bloat", "dup", "dup-1"]

    def test_all_resolve(self):
        problems, checked = V.evaluate(
            [], self.SLUGS, ["#alpha", "#remove-ads--bloat", "#dup-1"], set()
        )
        self.assertEqual(problems, [])
        self.assertEqual(checked, 3)

    def test_dead_link_gets_a_suggestion(self):
        problems, _ = V.evaluate([], self.SLUGS, ["#remove-ads-bloat"], set())
        self.assertEqual(len(problems), 1)
        href, anchor, guess = problems[0]
        self.assertEqual((href, anchor, guess), ("#remove-ads-bloat", "remove-ads-bloat",
                                                 "remove-ads--bloat"))

    def test_empty_anchor_is_a_problem(self):
        problems, _ = V.evaluate([], self.SLUGS, ["#"], set())
        self.assertEqual(len(problems), 1)
        self.assertEqual(problems[0][1], "")

    def test_empty_href_from_an_image_is_ignored(self):
        """![alt](#x) renders as <a href=""><img src=""></a> - not an in-page link."""
        problems, checked = V.evaluate([], self.SLUGS, ["", "https://example.com"], set())
        self.assertEqual(problems, [])
        self.assertEqual(checked, 0)

    def test_hand_written_id_satisfies_a_link(self):
        problems, _ = V.evaluate([], self.SLUGS, ["#made-by-hand"], {"made-by-hand"})
        self.assertEqual(problems, [])

    def test_duplicate_link_instances_are_all_reported(self):
        problems, checked = V.evaluate([], self.SLUGS, ["#nope", "#nope", "#nope"], set())
        self.assertEqual(len(problems), 3)
        self.assertEqual(checked, 3)

    def test_an_empty_anchor_is_never_a_match(self):
        """A heading that slugs to nothing does not make [x](#) work: id="" is not linkable."""
        problems, _ = V.evaluate([], ["", "alpha"], ["#"], set())
        self.assertEqual(len(problems), 1)
        self.assertEqual(problems[0][1], "")

    def test_no_suggestion_when_nothing_is_close(self):
        problems, _ = V.evaluate([], self.SLUGS, ["#zzzzzzzzzz"], set())
        self.assertEqual(problems[0][2], None)


@unittest.skipUnless(shutil.which("node"), "node is not installed")
class TestSlugHeadings(unittest.TestCase):
    def setUp(self):
        # Skip rather than fail when the library is not there: that is an install problem the
        # workflow already warns about, not a broken test.
        if not SLUGGER_DIR or not os.path.isdir(
                os.path.join(SLUGGER_DIR, "node_modules", "github-slugger")):
            self.skipTest("github-slugger is not installed")

    def test_slugs_match_github(self):
        slugs, error = V.slug_headings(
            ["Remove ads & bloat", "Dup", "Dup", "\U0001F9E9 Patches"], SLUGGER_DIR
        )
        self.assertIsNone(error)
        self.assertEqual(slugs, ["remove-ads--bloat", "dup", "dup-1", "-patches"])

    def test_missing_library_is_an_error_not_a_crash(self):
        slugs, error = V.slug_headings(["x"], "/nonexistent-directory")
        self.assertIsNone(slugs)
        self.assertIn("github-slugger", error)

    def test_helper_returning_the_wrong_number_of_slugs_is_an_error(self):
        """A helper that silently drops headings must not be read as agreement."""
        import subprocess as sp
        fake = sp.CompletedProcess(args=[], returncode=0, stdout='["only-one"]', stderr="")
        with mock.patch.object(V.subprocess, "run", return_value=fake):
            slugs, error = V.slug_headings(["a", "b", "c"], "/whatever")
        self.assertIsNone(slugs)
        self.assertIn("asked for 3 slugs, got 1", error)

    def test_helper_printing_rubbish_is_an_error(self):
        import subprocess as sp
        fake = sp.CompletedProcess(args=[], returncode=0, stdout="not json", stderr="")
        with mock.patch.object(V.subprocess, "run", return_value=fake):
            slugs, error = V.slug_headings(["a"], "/whatever")
        self.assertIsNone(slugs)
        self.assertIn("not JSON", error)

    def test_missing_node_is_an_error(self):
        slugs, error = V.slug_headings(["x"], SLUGGER_DIR, node="node-that-does-not-exist")
        self.assertIsNone(slugs)
        self.assertIn("node", error)


@unittest.skipUnless(shutil.which("node"), "node is not installed")
@NEEDS_SLUGGER
class TestSlugHelperContract(unittest.TestCase):
    """The .mjs is a small program in its own right; these are its promises."""

    HELPER = os.path.join(HERE, "slug_headings.mjs")

    def run_helper(self, payload, directory=None):
        return subprocess.run(
            ["node", self.HELPER, directory if directory is not None else (SLUGGER_DIR or "/x")],
            input=payload, capture_output=True, text=True, timeout=120,
        )

    def test_rejects_a_non_array(self):
        result = self.run_helper('{"a": 1}')
        self.assertEqual(result.returncode, 2)
        self.assertIn("array", result.stderr)

    def test_rejects_invalid_json(self):
        self.assertEqual(self.run_helper("nope").returncode, 2)

    def test_rejects_a_missing_directory(self):
        result = self.run_helper("[]", directory="/no/such/dir")
        self.assertEqual(result.returncode, 2)
        self.assertIn("github-slugger", result.stderr)

    def test_rejects_no_argument(self):
        result = subprocess.run(["node", self.HELPER], input="[]",
                                capture_output=True, text=True, timeout=120)
        self.assertEqual(result.returncode, 2)

    def test_numbers_are_stringified_not_crashed(self):
        result = self.run_helper("[1, 2]")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(json.loads(result.stdout), ["1", "2"])


class TestRender(unittest.TestCase):
    def test_success(self):
        with Stub(body=b"<h1>Hi</h1>") as stub:
            html, error = V.render("x", api=stub.url)
        self.assertEqual(html, "<h1>Hi</h1>")
        self.assertIsNone(error)
        self.assertEqual(len(stub.requests), 1)
        self.assertEqual(json.loads(stub.requests[0]), {"text": "x", "mode": "gfm"})

    def test_forbidden_is_not_retried(self):
        with Stub(status=403, body=b'{"message":"rate limit"}') as stub:
            html, error = V.render("x", api=stub.url, attempts=3)
        self.assertIsNone(html)
        self.assertIn("403", error)
        self.assertEqual(len(stub.requests), 1, "a 403 must not be retried")

    def test_rate_limit_is_retried(self):
        with Stub(status=429, body=b"slow down") as stub:
            with mock.patch.object(V.time, "sleep"):
                html, error = V.render("x", api=stub.url, attempts=3)
        self.assertIsNone(html)
        self.assertIn("429", error)
        self.assertEqual(len(stub.requests), 3)

    def test_server_error_is_retried_then_reported(self):
        with Stub(status=500, body=b"boom") as stub:
            with mock.patch.object(V.time, "sleep") as sleeper:
                html, error = V.render("x", api=stub.url, attempts=2)
        self.assertIsNone(html)
        self.assertIn("500", error)
        self.assertEqual(len(stub.requests), 2)
        self.assertEqual(sleeper.call_count, 1)

    def test_recovery_on_a_later_attempt(self):
        """A stub that fails once and then succeeds must end in success."""
        bodies = []

        class Flaky(Stub):
            pass

        with Stub(status=500, body=b"boom") as first:
            pass
        calls = {"n": 0}
        real_render = V.render

        def fake_urlopen(request, timeout=None):
            calls["n"] += 1
            if calls["n"] == 1:
                import urllib.error
                raise urllib.error.URLError("temporary")
            return mock.MagicMock(__enter__=lambda s: s, __exit__=lambda *a: False,
                                  read=lambda: b"<h1>ok</h1>")

        with mock.patch.object(V.urllib.request, "urlopen", fake_urlopen):
            with mock.patch.object(V.time, "sleep"):
                html, error = V.render("x", attempts=3)
        self.assertEqual(html, "<h1>ok</h1>")
        self.assertIsNone(error)
        self.assertEqual(calls["n"], 2)

    def test_connection_refused(self):
        with Stub() as stub:
            url = stub.url
        # the stub is shut down, so this port refuses connections
        html, error = V.render("x", api=url, attempts=1)
        self.assertIsNone(html)
        self.assertIn("could not reach", error)

    def test_non_utf8_response(self):
        with Stub(body=b"\xff\xfe<h1>bad</h1>") as stub:
            html, error = V.render("x", api=stub.url, attempts=1)
        self.assertIsNone(html)
        self.assertIn("UTF-8", error)


class TestMain(unittest.TestCase):
    def run_main(self, argv):
        # main() retries with real backoff; a test must not sit through it.
        with mock.patch("sys.stdout"), mock.patch.object(V.time, "sleep"):
            return V.main(["verify_anchors_online.py"] + argv)

    def test_missing_readme(self):
        self.assertEqual(self.run_main(["/nonexistent/README.md", "--slugger-dir", "/x"]), 2)

    def test_missing_slugger_dir(self):
        import tempfile
        handle, path = tempfile.mkstemp()
        os.write(handle, b"# hi\n")
        os.close(handle)
        with mock.patch.dict(os.environ, {"SLUGGER_DIR": ""}):
            self.assertEqual(self.run_main([path]), 2)

    def test_unreachable_api_is_code_3(self):
        """3 means 'could not check'. The workflow decides that a 3 is a warning."""
        import tempfile
        handle, path = tempfile.mkstemp()
        os.write(handle, b"# hi\n")
        os.close(handle)
        self.assertEqual(
            self.run_main([path, "--slugger-dir", "/x", "--api", "http://127.0.0.1:1/markdown"]), 3
        )

    def test_empty_render_is_not_a_pass(self):
        import tempfile
        handle, path = tempfile.mkstemp()
        os.write(handle, b"# hi\n")
        os.close(handle)
        with Stub(body=b"") as stub:
            code = self.run_main([path, "--slugger-dir", SLUGGER_DIR or "/x", "--api", stub.url])
        self.assertEqual(code, 3, "an empty render must not report success")

    @NEEDS_SLUGGER
    def test_a_link_with_no_headings_at_all_is_a_dead_link(self):
        """Nothing to link to is a real result, not an infrastructure problem."""
        import tempfile
        handle, path = tempfile.mkstemp()
        os.write(handle, b"[x](#nowhere)\n")
        os.close(handle)
        with Stub(body=b'<p><a href="#nowhere">x</a></p>') as stub:
            code = self.run_main([path, "--slugger-dir", SLUGGER_DIR or "/x", "--api", stub.url])
        self.assertEqual(code, 1)

    @NEEDS_SLUGGER
    def test_a_readme_with_nothing_to_check(self):
        import tempfile
        handle, path = tempfile.mkstemp()
        os.write(handle, b"just prose\n")
        os.close(handle)
        with Stub(body=b"<p>just prose</p>") as stub:
            code = self.run_main([path, "--slugger-dir", SLUGGER_DIR or "/x", "--api", stub.url])
        self.assertEqual(code, 0)


def main():
    args = sys.argv[1:]
    if "--slugger-dir" in args:
        index = args.index("--slugger-dir")
        del args[index:index + 2]
    sys.argv = ["test_verify_anchors_online.py"] + args
    unittest.main(verbosity=2)


if __name__ == "__main__":
    main()
