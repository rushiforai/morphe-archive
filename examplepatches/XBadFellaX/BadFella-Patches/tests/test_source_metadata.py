"""Manager decodes custom-source timestamps directly as kotlinx LocalDateTime."""
import datetime
import json
from pathlib import Path
import re
import unittest


def manager_timestamp(value):
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(?:\.\d{1,9})?", value):
        raise ValueError("Morphe custom-source created_at must have no timezone suffix")
    return datetime.datetime.fromisoformat(value)


class SourceMetadataTests(unittest.TestCase):

    def test_remote_atv_declares_exact_build(self):
        root = Path(__file__).resolve().parents[1]
        catalog = json.loads((root / "patches-list.json").read_text(encoding="utf-8"))
        patch = next(p for p in catalog["patches"] if p["name"] == "Remote ATV ad-free")
        package = next(p for p in patch["compatiblePackages"] if p["packageName"] == "tech.simha.androidtvremote")
        self.assertEqual(len(package["targets"]), 1)
        target = package["targets"][0]
        self.assertEqual(target["version"], "6.1.0")
        self.assertTrue(target["versionCodes"])
        self.assertEqual(set(target["versionCodes"].values()), {45})
        self.assertFalse(target["isExperimental"])

    def test_published_metadata_contract(self):
        root = Path(__file__).resolve().parents[1]
        manifest = json.loads((root / "patches-bundle.json").read_text(encoding="utf-8"))
        catalog = json.loads((root / "patches-list.json").read_text(encoding="utf-8"))
        self.assertIsNone(manager_timestamp(manifest["created_at"]).tzinfo)
        self.assertEqual(manifest["version"], catalog["version"])
        version = manifest["version"]
        self.assertEqual(manifest["download_url"],
                         f"https://github.com/XBadFellaX/BadFella-Patches/releases/download/v{version}/patches-{version}.mpp")

    def test_preview_changelog_is_visible_in_manager(self):
        """Manager's preview channel reads CHANGELOG.md on dev down to the first stable heading, then narrows
        it per app by bullet scope (`- **App:**`). A missing entry, or bullets naming no app, show nothing."""
        root = Path(__file__).resolve().parents[1]
        version = json.loads((root / "patches-bundle.json").read_text(encoding="utf-8"))["version"]
        heading = re.compile(r"^## (\S+) \((\d{4}-\d{2}-\d{2})\)$")
        entries = []
        for line in (root / "CHANGELOG.md").read_text(encoding="utf-8").splitlines():
            match = heading.match(line)
            if match:
                if entries and "-" not in entries[-1][0]:
                    break
                entries.append((match.group(1), []))
            elif entries and line.startswith(("- ", "* ")):
                entries[-1][1].append(line)
        if "-" not in version:
            return
        self.assertEqual(entries[0][0], version, "CHANGELOG.md must start with the manifest's preview version")
        for name, bullets in entries:
            if "-" not in name:
                continue
            with self.subTest(entry=name):
                self.assertTrue(bullets, "preview entry has no bullets")
                for bullet in bullets:
                    self.assertRegex(bullet, r"^[-*] \*\*[^*]+:\*\* ", "scope each bullet to its app")

    def test_timezone_suffixes_rejected_by_manager(self):
        for value in ["2026-10-30T05:01:09+00:00", "2026-10-30T05:01:09Z"]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                manager_timestamp(value)

    def test_local_timestamps_and_calendar_validation(self):
        self.assertEqual(manager_timestamp("2026-10-30T05:01:09").second, 9)
        self.assertEqual(manager_timestamp("2026-10-30T05:01:09.123").microsecond, 123000)
        with self.assertRaises(ValueError):
            manager_timestamp("2026-02-30T05:01:09")
