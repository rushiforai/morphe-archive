"""Focused offline smoke test: works even if port 18765 belongs to another service."""
import threading
import unittest
from urllib.error import HTTPError
from urllib.request import Request, urlopen

from adb_reverse_fixture import FixtureHandler, ThreadingHTTPServer


class FixtureSmokeTest(unittest.TestCase):
    def test_catalog_thread_thumbnail_and_post(self):
        server = ThreadingHTTPServer(("127.0.0.1", 0), FixtureHandler)
        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        root = f"http://127.0.0.1:{server.server_port}/aimoge/"
        try:
            with urlopen(root + "futaba.php?mode=cat") as response:
                self.assertEqual(response.status, 200)
                self.assertIn("charset=Shift_JIS", response.headers["Content-Type"])
                html = response.read().decode("shift_jis")
                self.assertIn("futatabi test board", html)
                self.assertIn("res/1001.htm", html)
            with urlopen(root + "res/1001.htm") as response:
                self.assertEqual(response.status, 200)
                self.assertIn("futatabi reply fixture", response.read().decode("shift_jis"))
            with urlopen(root + "thumb/1.png") as response:
                self.assertEqual(response.status, 200)
                self.assertEqual(response.headers["Content-Type"], "image/png")
                self.assertEqual(response.read()[:8], b"\x89PNG\r\n\x1a\n")
            with self.assertRaises(HTTPError) as error:
                urlopen(Request(root + "futaba.php", data=b"com=test", method="POST"))
            self.assertEqual(error.exception.code, 403)
        finally:
            server.shutdown()
            server.server_close()


if __name__ == "__main__":
    unittest.main()
