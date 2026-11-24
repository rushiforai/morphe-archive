"""Verify Morphe Manager remote bundle metadata compatibility."""
import json
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]


class BundleMetadataTest(unittest.TestCase):
    def test_created_at_matches_java_local_date_time(self):
        # Morphe Manager 2.6.0 deserializes created_at with java.time.LocalDateTime.parse,
        # which rejects timezone offsets such as "+00:00" or "Z".
        bundle = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
        self.assertRegex(bundle["created_at"], r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$")

    def test_prepare_release_formats_utc_without_offset(self):
        source = (ROOT / "scripts/prepare_release.py").read_text(encoding="utf-8")
        self.assertNotIn(".isoformat()", source)
        self.assertIn('strftime("%Y-%m-%dT%H:%M:%S")', source)

    def test_bundle_and_patch_list_versions_align(self):
        bundle = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
        listing = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        self.assertEqual(bundle["version"], listing["version"])
        self.assertEqual(len(listing["patches"]), 6)

    def test_bundle_description_matches_release_notes(self):
        bundle = json.loads((ROOT / "patches-bundle.json").read_text(encoding="utf-8"))
        self.assertTrue(bundle["description"].strip())
        self.assertIn(bundle["version"], bundle["description"])
        notes = (ROOT / "docs/RELEASE_NOTES.md").read_text(encoding="utf-8").strip()
        self.assertTrue(notes)
        source = (ROOT / "scripts/prepare_release.py").read_text(encoding="utf-8")
        self.assertIn("docs/RELEASE_NOTES.md", source)

    def test_ci_and_build_run_full_python_test_suite(self):
        build_src = (ROOT / "scripts/build.py").read_text(encoding="utf-8")
        self.assertIn('"test_*.py"', build_src)
        self.assertNotIn("test_message_history.py", build_src)

        workflow = (ROOT / ".github/workflows/release.yml").read_text(encoding="utf-8")
        prepare_idx = workflow.find("python scripts/prepare_release.py")
        test_idx = workflow.find('python -m unittest discover -s tests -p "test_*.py"')
        publish_idx = workflow.find("gh release create")
        self.assertGreaterEqual(prepare_idx, 0)
        self.assertGreater(test_idx, prepare_idx)
        self.assertGreater(publish_idx, test_idx)


if __name__ == "__main__":
    unittest.main()
