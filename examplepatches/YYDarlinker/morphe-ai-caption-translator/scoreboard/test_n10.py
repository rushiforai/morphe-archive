"""Regression checks for frozen and projected N10 startup timing."""
import json
import unittest

import n10


class N10StartupTest(unittest.TestCase):
    def test_tracked_startup_metrics_reproduce(self):
        tracked = json.loads(n10.RESULT.read_text(encoding="utf-8"))
        self.assertEqual(tracked, n10.score())
        self.assertEqual(12094, tracked["frozen"]["source_ready_ms"])
        self.assertEqual(29640, tracked["frozen"]["first_content_ms"])
        self.assertEqual(10730, tracked["policy_mirror"]["first_content_ms"])
        self.assertFalse(tracked["policy_mirror"]["device_presented_verified"])


if __name__ == "__main__":
    unittest.main()
