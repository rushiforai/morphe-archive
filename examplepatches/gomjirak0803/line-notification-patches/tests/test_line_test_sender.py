"""Offline tests: no credentials loaded and no messages sent to LINE."""
import io
import json
import sys
import unittest
import urllib.error
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
import line_test_sender as sender


class SenderTest(unittest.TestCase):
    def test_26_messages_batching_and_order(self):
        messages = sender.make_messages(26, "mixed", "TEST")
        chunks = sender.batches(messages, 5)
        self.assertEqual([len(c) for c in chunks], [5, 5, 5, 5, 5, 1])
        self.assertIn("26/26", chunks[-1][-1]["text"])
        self.assertGreater(len(messages[1]["text"]), 100)
        self.assertIn("두 번째 줄", messages[2]["text"])

    def test_rejects_group_ids_and_header_injection(self):
        for token, user in [("fake\r\nHeader:x", "U" + "0" * 32), ("fake", "C" + "0" * 32)]:
            with self.assertRaises(ValueError):
                sender.credentials(token, user)
        with self.assertRaises(ValueError):
            sender.make_messages(27, "short", "TEST")

    def test_push_fixed_endpoint_notify_enabled_and_secret_not_in_body(self):
        captured = []
        class Response:
            status = 200
            def __enter__(self): return self
            def __exit__(self, *args): pass
        class Client:
            def open(self, request, **kwargs):
                captured.append(request)
                return Response()
        creds = sender.credentials("FAKE_TOKEN_FOR_OFFLINE_TEST_ONLY", "U" + "0" * 32)
        sender.push(creds, sender.make_messages(1, "short", "TEST"), opener=Client())
        request = captured[0]
        self.assertEqual(request.full_url, sender.PUSH_URL)
        body = json.loads(request.data)
        self.assertIs(body["notificationDisabled"], False)
        self.assertNotIn(creds.token, request.data.decode())

    def test_timeout_is_not_retried_and_secrets_not_displayed(self):
        calls = []
        class Client:
            def open(self, *args, **kwargs):
                calls.append(1)
                raise urllib.error.URLError("FAKE_PRIVATE_DETAIL")
        with self.assertRaises(sender.SendError) as raised:
            sender.push(sender.credentials("FAKE_TOKEN", "U" + "0" * 32),
                        sender.make_messages(1, "short", "TEST"), opener=Client())
        self.assertEqual(len(calls), 1)
        self.assertNotIn("FAKE_PRIVATE_DETAIL", str(raised.exception))

    def test_http_error_body_not_displayed(self):
        class Client:
            def open(self, *args, **kwargs):
                raise urllib.error.HTTPError(sender.PUSH_URL, 401, "FAKE_PRIVATE_DETAIL", {}, io.BytesIO(b"FAKE_PRIVATE_DETAIL"))
        with self.assertRaises(sender.SendError) as raised:
            sender.push(sender.credentials("FAKE_TOKEN", "U" + "0" * 32),
                        sender.make_messages(1, "short", "TEST"), opener=Client())
        self.assertIn("401", str(raised.exception))
        self.assertNotIn("FAKE_PRIVATE_DETAIL", str(raised.exception))

    def test_redirect_never_forwards_bearer(self):
        with self.assertRaises(sender.SendError):
            sender.NoRedirect().redirect_request(None, None, 302, "", {}, "https://example.invalid/")

    def test_cancelled_before_first_request(self):
        import threading
        stopped = threading.Event()
        stopped.set()
        calls, events = [], []
        sender.send_sequence(None, sender.make_messages(2, "short", "TEST"), 1, 10, 1,
                             stopped, events.append, send=lambda *args: calls.append(1))
        self.assertEqual(calls, [])
        self.assertIn("취소", events[-1])

    def test_sequence_stops_after_failure(self):
        import threading
        calls, events = [], []
        def fail(*args):
            calls.append(1)
            raise sender.SendError("expected failure")
        sender.send_sequence(None, sender.make_messages(26, "mixed", "TEST"), 5, 0, 1,
                             threading.Event(), events.append, send=fail)
        self.assertEqual(calls, [1])
        self.assertEqual(events[-1], "expected failure")

    def test_location_sticker_mention_and_features_payloads(self):
        uid = "U" + "a" * 32
        loc = sender.make_messages(1, "location", "TEST")[0]
        self.assertEqual(loc["type"], "location")
        self.assertIn("강남역", loc["title"])

        sticker = sender.make_messages(1, "sticker", "TEST")[0]
        self.assertEqual(sticker, {"type": "sticker", "packageId": "446", "stickerId": "1988"})

        mention = sender.make_messages(1, "mention", "TEST", uid)[0]
        self.assertEqual(mention["type"], "textV2")
        self.assertEqual(mention["substitution"]["me"]["mentionee"], {"type": "user", "userId": uid})

        features = sender.make_messages(3, "features", "TEST", uid)
        self.assertEqual([m["type"] for m in features], ["location", "sticker", "textV2"])

        with self.assertRaises(ValueError):
            sender.make_messages(1, "mention", "TEST")
        with self.assertRaises(ValueError):
            sender.make_messages(1, "features", "TEST", "C" + "0" * 32)

    def test_local_creds_storage_custom_and_group_target(self):
        import tempfile

        self.assertEqual(sender.CREDS_PATH.parent.name, ".tools")
        uid = "U" + "a" * 32
        gid = "C" + "b" * 32
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / ".tools" / "line-bot-creds.json"
            with self.assertRaises(ValueError):
                sender.load_creds(path)
            sender.save_creds("FAKE_TOKEN", uid, gid, path=path)
            loaded_creds, loaded_gid = sender.load_creds(path)
            self.assertEqual(loaded_creds.token, "FAKE_TOKEN")
            self.assertEqual(loaded_creds.user_id, uid)
            self.assertEqual(loaded_gid, gid)
            self.assertTrue(sender.delete_creds(path))
            self.assertFalse(sender.delete_creds(path))

        custom = sender.make_messages(1, "custom", "TEST", custom_text="긴급 테스트")[0]
        self.assertEqual(custom, {"type": "text", "text": "긴급 테스트"})
        mention_all = sender.make_messages(1, "mention_all", "TEST")[0]
        self.assertEqual(mention_all["type"], "textV2")
        self.assertEqual(mention_all["substitution"]["all"]["mentionee"], {"type": "all"})

        captured = []
        class Response:
            status = 200
            def __enter__(self): return self
            def __exit__(self, *args): pass
        class Client:
            def open(self, request, **kwargs):
                captured.append(json.loads(request.data))
                return Response()
        sender.push(sender.credentials("FAKE_TOKEN", uid), [mention_all], opener=Client(), to=gid)
        self.assertEqual(captured[0]["to"], gid)
        with self.assertRaises(ValueError):
            sender.credentials("FAKE_TOKEN", gid)


if __name__ == "__main__":
    unittest.main()
