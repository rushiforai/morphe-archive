"""Exercise the same synthetic first-party session contract for X and Discord.
No Android device, credentials, or external requests.
"""
import http.client
import json
from pathlib import Path
import tempfile
import threading
import unittest
from http.server import ThreadingHTTPServer
from v04_mebuki_trial_fixture import Handler


class SessionFixtureTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory()
        Handler.log_file = str(Path(cls.temp.name) / "requests.jsonl")
        cls.server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        cls.worker = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.worker.start()

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.worker.join()
        cls.temp.cleanup()

    def get(self, path, cookie=None):
        # New connection per request also covers a fresh client using saved state.
        connection = http.client.HTTPConnection("127.0.0.1", self.server.server_port, timeout=3)
        try:
            connection.request("GET", path, headers={"Cookie": cookie} if cookie else {})
            response = connection.getresponse()
            body = response.read()
            return response.status, body, response.getheader("Location")
        finally:
            connection.close()

    def test_both_providers_share_first_party_contract(self):
        for provider in ("x", "discord"):
            with self.subTest(provider=provider):
                cookie = "mock_session=" + provider + "-fixture"
                for _ in range(2):
                    status, body, _ = self.get("/api/auth/get-session", cookie)
                    self.assertEqual(200, status)
                    data = json.loads(body)
                    self.assertIsInstance(data["user"], dict)
                    self.assertIsInstance(data["session"], dict)
                for path in ("/api/catalog", "/api/thread/LOCALdemoA0/messages"):
                    status, body, _ = self.get(path, cookie)
                    self.assertEqual(200, status)
                    self.assertTrue(json.loads(body)["fixtureOnly"])

    def test_anonymous_and_invalid(self):
        for cookie in (None, "mock_session=expired-fixture",
                       "mock_session=x-fixture-invalid", "other=mock_session=offline-test"):
            with self.subTest(cookie_present=bool(cookie)):
                status, body, _ = self.get("/api/auth/get-session", cookie)
                self.assertEqual(200, status)
                self.assertIsNone(json.loads(body))
                self.assertEqual((302, b"", "/"), self.get("/api/catalog", cookie))

    def test_previous_fixture_contract(self):
        status, body, _ = self.get("/api/auth/get-session", "mock_session=offline-test")
        self.assertEqual(200, status)
        self.assertIn("session", json.loads(body))


if __name__ == "__main__":
    unittest.main()
