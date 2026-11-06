import unittest

from sync_bundle_release_notes import synchronize


class SyncReleaseNotesTests(unittest.TestCase):
    def setUp(self):
        self.bundle = {
            "version": "1.7.0", "description": "old",
            "created_at": "2026-11-05T12:48:24",
            "download_url": "https://example.org/patches.mpp", "signature_download_url": "",
        }
        self.release = {"tagName": "v1.7.0", "body": "  Correct notes.\n", "isDraft": False}

    def test_only_description_is_updated(self):
        result = synchronize(self.bundle, self.release)
        self.assertEqual(result["description"], "Correct notes.")
        self.assertEqual({k: v for k, v in result.items() if k != "description"},
                         {k: v for k, v in self.bundle.items() if k != "description"})
        self.assertEqual(self.bundle["description"], "old")

    def test_rejects_wrong_version_draft_and_empty_notes(self):
        for change in ({"tagName": "v1.6.4"}, {"isDraft": True}, {"body": "  "}):
            with self.subTest(change=change), self.assertRaises(ValueError):
                synchronize(self.bundle, {**self.release, **change})


if __name__ == "__main__":
    unittest.main()
