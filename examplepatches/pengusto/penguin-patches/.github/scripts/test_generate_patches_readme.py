"""Release-render regressions; no APK/build dependencies required."""

import json
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / ".github/scripts/generate_patches_readme.py"


def app_count(data):
    return len({pkg['packageName'] for patch in data['patches']
                for pkg in patch.get('compatiblePackages', []) or []})


class ReleaseReadmeTests(unittest.TestCase):
    def render(self, data=None, expanded=False, readme=None):
        with tempfile.TemporaryDirectory() as tmp:
            metadata = Path(tmp) / "patches.json"
            target = Path(tmp) / "README.md"
            metadata.write_text(json.dumps(data or json.loads((ROOT / "patches-list.json").read_text())))
            original_json = metadata.read_bytes()
            text = readme or (ROOT / "README.md").read_text()
            if expanded:
                text = text.replace("<!-- PATCHES_START -->", "<!-- PATCHES_START EXPANDED -->")
            target.write_text(text)
            command = [sys.executable, str(SCRIPT), "pengusto/penguin-patches", "dev", str(metadata), str(target)]
            result = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            first = target.read_text()
            subprocess.run(command, check=True, capture_output=True)
            self.assertEqual(target.read_text(), first, "regeneration must be idempotent")
            self.assertEqual(metadata.read_bytes(), original_json, "rendering must not modify metadata")
            return first

    def test_current_release_stays_compact_and_links_to_guides(self):
        result = self.render()
        self.assertNotIn("<details open>", result)
        metadata = json.loads((ROOT / "patches-list.json").read_text())
        self.assertIn(f"All {app_count(metadata)} apps and supported versions", result)
        self.assertIn(f"{len(metadata['patches'])} patches · {app_count(metadata)} apps", result)
        for guide in re.findall(r"\]\((docs/[^)#]+)", result):
            self.assertTrue((ROOT / guide).is_file(), guide)
        self.assertIn("[Song artist order](docs/FINAMP_NATIVE.md)", result)
        self.assertIn("[Separate all-day reminder defaults](docs/CALENDAR_REMINDERS.md)", result)
        self.assertIn('id="prefer-each-track-s-embedded-cover"', result)
        self.assertIn('id="prefer-each-tracks-embedded-cover"', result)

    def test_small_next_prerelease_updates_summary_without_expanding(self):
        data = json.loads((ROOT / "patches-list.json").read_text())
        data["version"] = "v1.2.0-dev.1"
        data["patches"] = [p for p in data["patches"] if p["name"] == "Song artist order"]
        result = self.render(data)
        self.assertNotIn("<details open>", result)
        self.assertIn("1 patch · 1 app", result)
        self.assertIn("/releases/tag/v1.2.0-dev.1", result)
        self.assertIn("`dev`", result)
        self.assertNotIn("/releases/tag/v1.1.0", result)

    def test_expansion_requires_explicit_opt_in(self):
        result = self.render(expanded=True)
        catalogue = result.split("<!-- PATCHES_START EXPANDED -->")[1].split("<!-- PATCHES_END -->")[0]
        metadata = json.loads((ROOT / "patches-list.json").read_text())
        self.assertEqual(catalogue.count("<details open>"), 1 + app_count(metadata))

    def check_gallery(self, data, rendered):
        gallery = (ROOT / "docs/PATCH_EXAMPLES.md").read_text()
        sections = dict(re.findall(
            r'<a id="([^"]+)"></a>(.*?)(?=\n<a id=|\Z)', gallery, re.DOTALL
        ))
        for patch in data["patches"]:
            slug = re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", patch["name"].lower())).strip("-")
            with self.subTest(patch=patch["name"]):
                self.assertIn(slug, sections, "released patches need a comparison")
                images = re.findall(r'<img src="([^"]+)"[^>]+alt="([^"]+)"', sections[slug])
                self.assertEqual(len(images), 2, "each patch needs both sides of the comparison")
                self.assertTrue(images[0][1].startswith("Before:"))
                self.assertTrue(images[1][1].startswith("After:"))
                for source, _ in images:
                    if not source.startswith("https://"):
                        self.assertTrue((ROOT / "docs" / source).resolve().is_file(), source)
                self.assertIn(f"[Before / after](#preview-{slug})", rendered)

    def test_every_released_patch_has_a_reachable_image_pair(self):
        data = json.loads((ROOT / "patches-list.json").read_text())
        self.check_gallery(data, self.render())

    def test_two_additional_finamp_fixes_have_gallery_links(self):
        data = {"version": "1.3.0", "patches": [
            {"name": name, "description": "A focused Finamp fix", "compatiblePackages": [
                {"packageName": "com.unicornsonlsd.finamp", "name": "Finamp", "targets": [{"version": "1.0.1"}]}]}
            for name in ("Keep player output controls accessible", "Fix quick settings banner contrast")
        ]}
        result = self.render(data)
        self.assertIn("2 patches · 1 app", result)
        self.check_gallery(data, result)
        for slug in ("keep-player-output-controls-accessible", "fix-quick-settings-banner-contrast"):
            self.assertIn(f"[Before / after](#preview-{slug})", result)
        self.assertNotIn("<details open>", result)

    def test_mihon_preview_embeds_real_pair_and_guide(self):
        data = {"version": "1.5.0", "patches": [{
            "name": "Preserve excluded Default-category downloads",
            "description": "Honor the existing Default deletion exclusion", "use": False,
            "compatiblePackages": [{"packageName": "app.mihon", "name": "Mihon",
                                    "targets": [{"version": "0.21.3"}]}]}]}
        result = self.render(data)
        self.check_gallery(data, result)
        self.assertIn("docs/MIHON.md", result)
        self.assertIn('src="tests/mihon/evidence/2026-10-30/before.png"', result)
        self.assertIn('src="tests/mihon/evidence/2026-10-30/after.png"', result)
        self.assertIn("Marc Went / Dunky13", result)

    def test_readme_embeds_every_released_pair_with_root_relative_paths(self):
        data = json.loads((ROOT / "patches-list.json").read_text())
        result = self.render(data)
        previews = result.split("<!-- PATCHES_PREVIEWS_START -->")[1].split("<!-- PATCHES_PREVIEWS_END -->")[0]
        self.assertEqual(previews.count("<summary>"), len(data["patches"]))
        self.assertEqual(len(re.findall(r"^### ", previews, re.MULTILINE)), app_count(data))
        self.assertEqual(previews.count("<img "), 2 * len(data["patches"]))
        self.assertNotIn("## About these comparisons", previews)
        sections = dict(re.findall(r'<a id="preview-([^"]+)"></a>(.*?)(?=\n<a id=|\Z)', previews, re.DOTALL))
        for patch in data["patches"]:
            slug = re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", patch["name"].lower())).strip("-")
            with self.subTest(patch=patch["name"]):
                images = re.findall(r'<img src="([^"]+)"[^>]+alt="([^"]+)"', sections[slug])
                self.assertRegex(sections[slug], r'^\s*<details>\s*<summary>')
                self.assertEqual(len(images), 2)
                self.assertTrue(images[0][1].startswith("Before:"))
                self.assertTrue(images[1][1].startswith("After:"))
                for source, _ in images:
                    if not source.startswith("https://"):
                        self.assertTrue((ROOT / source).is_file(), source)
        ids = re.findall(r'<a id="([^"]+)">', result)
        self.assertEqual(len(ids), len(set(ids)), "README anchors must remain distinct")
        self.assertIn("**Source-widget comparison, not Android APK screenshots.**", previews)
        self.assertIn("**Breal versus Penguin comparison.**", previews)
        self.assertIn("**Previous versus revised Morphe patch.**", previews)

    def test_finamp_hero_count_follows_metadata_instead_of_stale_copy(self):
        data = json.loads((ROOT / "patches-list.json").read_text())
        count = sum(any(package.get("packageName") == "com.unicornsonlsd.finamp"
                        for package in patch.get("compatiblePackages", [])) for patch in data["patches"])
        stale = re.sub(r"Explore the \d+ Finamp patches", "Explore the 3 Finamp patches", (ROOT / "README.md").read_text())
        self.assertIn(f"Explore the {count} Finamp patches", self.render(data, readme=stale))
        data["patches"] = [p for p in data["patches"] if p["name"] == "Song artist order"]
        result = self.render(data, readme=stale)
        self.assertIn("Explore the 1 Finamp patch →", result)
        self.assertNotIn("Explore the 3 Finamp patches", result)
        self.assertEqual(result.split("<!-- PATCHES_PREVIEWS_START -->")[1].split("<!-- PATCHES_PREVIEWS_END -->")[0].count("<img "), 2)

    def test_missing_released_preview_fails_without_rewriting_readme(self):
        with tempfile.TemporaryDirectory() as tmp:
            metadata, target = Path(tmp) / "patches.json", Path(tmp) / "README.md"
            metadata.write_text(json.dumps({"version": "2.0.0", "patches": [{"name": "Missing evidence"}]}))
            original = (ROOT / "README.md").read_bytes()
            target.write_bytes(original)
            result = subprocess.run([sys.executable, str(SCRIPT), "pengusto/penguin-patches", "main", str(metadata), str(target)], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("Missing before/after evidence for Missing evidence", result.stderr)
            self.assertEqual(target.read_bytes(), original)

    def test_unknown_and_universal_patches_do_not_gain_dead_links(self):
        data = {"version": "2.0.0", "patches": [
            {"name": "New app fix", "description": "Keep \\1 literal", "compatiblePackages": [
                {"packageName": "example.new", "name": "New app", "targets": [{"version": "2.0"}]}]},
            {"name": "Universal fix", "description": "Works across apps"},
        ]}
        result = self.render(data, readme="Intro\n<!-- PATCHES_START -->\n<!-- PATCHES_END -->\nFooter")
        self.assertNotIn("<details open>", result)
        self.assertIn('id="new-app-fix"', result)
        self.assertIn('id="universal-fix"', result)
        self.assertNotIn("](#", result)
        self.assertIn("Keep \\1 literal", result)
        self.assertTrue(result.endswith("Footer"))


if __name__ == "__main__":
    unittest.main()
