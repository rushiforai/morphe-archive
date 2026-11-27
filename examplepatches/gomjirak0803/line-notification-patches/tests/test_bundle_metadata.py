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

    def test_patch_list_line_target_matches_shared_kt(self):
        shared_src = (ROOT / "patches/src/main/kotlin/app/linenotifications/patches/shared/Shared.kt").read_text(encoding="utf-8")
        target_match = re.search(
            r'AppTarget\(\s*version\s*=\s*"([^"]+)"\s*,\s*versionCode\s*=\s*(\d+)\s*,\s*isExperimental\s*=\s*(true|false)',
            shared_src,
        )
        self.assertIsNotNone(target_match)
        expected_version = target_match.group(1)
        expected_code = int(target_match.group(2))
        expected_experimental = target_match.group(3) == "true"
        self.assertIn(f'packageMetadata.versionName != "{expected_version}"', shared_src)
        self.assertIn(f'packageMetadata.versionCode != "{expected_code}"', shared_src)

        listing = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        self.assertEqual(len(listing["patches"]), 6)
        for patch in listing["patches"]:
            line_pkgs = [
                pkg for pkg in patch["compatiblePackages"]
                if pkg["packageName"] == "jp.naver.line.android"
            ]
            self.assertEqual(len(line_pkgs), 1, f"Missing jp.naver.line.android in {patch['name']}")
            targets = line_pkgs[0]["targets"]
            self.assertTrue(targets, f"No targets in {patch['name']}")
            self.assertEqual(
                [t["version"] for t in targets],
                [expected_version],
                f"Target version mismatch in {patch['name']}",
            )
            self.assertTrue(
                all(code == expected_code for code in targets[0]["versionCodes"].values()),
                f"Target versionCode mismatch in {patch['name']}",
            )
            self.assertIs(
                targets[0]["isExperimental"],
                expected_experimental,
                f"Target isExperimental mismatch in {patch['name']}",
            )

    def test_release_workflow_prerelease_is_conditional(self):
        workflow = (ROOT / ".github/workflows/release.yml").read_text(encoding="utf-8")
        branch_match = re.search(
            r"if\s*\(\$version\s*-match\s*'-'\)\s*\{(?P<pre>.*?)\}\s*else\s*\{(?P<stable>.*?)\}",
            workflow,
            re.S,
        )
        self.assertIsNotNone(branch_match)
        pre_block = branch_match.group("pre")
        stable_block = branch_match.group("stable")
        self.assertIn("gh release create", pre_block)
        self.assertIn("--prerelease", pre_block)
        self.assertIn("gh release create", stable_block)
        self.assertNotIn("--prerelease", stable_block)
        self.assertEqual(workflow.count("--prerelease"), 1)


if __name__ == "__main__":
    unittest.main()
