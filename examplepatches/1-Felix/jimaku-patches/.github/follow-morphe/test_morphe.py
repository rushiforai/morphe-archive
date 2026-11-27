import copy
import re
import unittest
from unittest import mock
from pathlib import Path

import morphe
from morphe import (
    PATCHER,
    PLUGIN,
    commit_subject,
    current_line,
    is_newer,
    raise_version,
    rewrite_constants,
    youtube_entry,
)

ROOT = Path(__file__).resolve().parents[2]
CONSTANTS = ROOT / "patches/src/main/kotlin/app/jimaku/patches/shared/Constants.kt"
# Constants.kt as Jimaku v1.0.1 shipped it, following Morphe v2.0.0 (V2_TARGETS below).
FOLLOWED_V2 = Path(__file__).resolve().parent / "test-data/Constants-v1.0.1.kt"

SIGNATURES = [
    "5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6",
    "3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a",
]

# Morphe v2.0.0's YouTube targets, as its patches-list.json declares them.
V2_TARGETS = [
    {"version": "21.43.523", "isExperimental": True, "minSdk": 29},
    {"version": "21.42.241", "isExperimental": True, "minSdk": 29},
    {"version": "21.30.216", "isExperimental": False, "minSdk": 29},
    {"version": "21.28.208", "isExperimental": False, "minSdk": 29},
    {"version": "21.23.492", "isExperimental": False, "minSdk": 28},
    {"version": "20.51.39", "isExperimental": False, "minSdk": 28},
    {"version": "20.26.46", "isExperimental": False, "minSdk": 26},
]


def youtube_package(targets, signatures=SIGNATURES):
    return {
        "packageName": "com.google.android.youtube",
        "apkFileType": "APK_REQUIRED",
        "appIconColor": "#FF0033",
        "signatures": list(signatures),
        "targets": copy.deepcopy(targets),
    }


def patches_list(*target_lists):
    patches = [{"name": "Some patch", "compatiblePackages": None}]
    for targets in target_lists:
        patches.append({
            "name": "A YouTube patch",
            "compatiblePackages": [
                {"packageName": "com.google.android.apps.youtube.music", "targets": []},
                youtube_package(targets),
            ],
        })
    return {"patches": patches}


def versions(targets):
    return [target["version"] for target in targets]


class VersionTest(unittest.TestCase):
    def test_versions_compare_numerically(self):
        self.assertTrue(is_newer("21.30.216", "21.5.10"))
        self.assertTrue(is_newer("v2.1.0", "v2.0.0"))
        self.assertTrue(is_newer("2.1.0", "2.1.0-dev.1"))
        self.assertTrue(is_newer("2.1.0-dev.1", "2.0.1"))
        self.assertTrue(is_newer("2.1.0-dev.10", "2.1.0-dev.9"))
        self.assertFalse(is_newer("v1.49.0", "v2.0.0"))
        self.assertFalse(is_newer("v2.0.0", "v2.0.0"))


class TargetsTest(unittest.TestCase):
    def test_current_line_is_stable_and_newest_line(self):
        entry = youtube_entry(patches_list(V2_TARGETS))
        self.assertEqual(versions(current_line(entry)), ["21.30.216", "21.28.208", "21.23.492"])

    def test_current_line_is_newest_first_by_number(self):
        shuffled = [V2_TARGETS[4], V2_TARGETS[2], V2_TARGETS[3]]
        shuffled.append({"version": "21.5.10", "isExperimental": False, "minSdk": 28})
        entry = youtube_entry(patches_list(shuffled))
        self.assertEqual(versions(current_line(entry)), ["21.30.216", "21.28.208", "21.23.492", "21.5.10"])

    def test_experimental_newest_never_counts(self):
        targets = copy.deepcopy(V2_TARGETS)
        for target in targets:
            if target["version"].startswith("21."):
                target["isExperimental"] = True
        entry = youtube_entry(patches_list(targets))
        self.assertEqual(versions(current_line(entry)), ["20.51.39", "20.26.46"])

    def test_no_stable_target_raises(self):
        targets = copy.deepcopy(V2_TARGETS)
        for target in targets:
            target["isExperimental"] = True
        with self.assertRaises(ValueError):
            current_line(youtube_entry(patches_list(targets)))

    def test_targets_common_to_all_patches(self):
        fewer = [target for target in V2_TARGETS if target["version"] != "21.28.208"]
        entry = youtube_entry(patches_list(V2_TARGETS, fewer))
        self.assertEqual(versions(current_line(entry)), ["21.30.216", "21.23.492"])

    def test_no_youtube_patch_raises(self):
        with self.assertRaises(ValueError):
            youtube_entry({"patches": [{"name": "Other", "compatiblePackages": None}]})


class ConstantsTest(unittest.TestCase):
    def setUp(self):
        self.constants = FOLLOWED_V2.read_text(encoding="utf-8")
        self.entry = youtube_entry(patches_list(V2_TARGETS))

    def test_rewrite_is_identity_for_followed_release(self):
        rewritten = rewrite_constants(self.constants, self.entry, current_line(self.entry))
        self.assertEqual(rewritten, self.constants)

    def test_rewrite_sets_targets_and_min_sdk_floor(self):
        rewritten = rewrite_constants(
            self.constants, self.entry, [{"version": "21.40.1", "isExperimental": False, "minSdk": 26}]
        )
        self.assertIn('version = "21.40.1",\n                minSdk = 28,\n', rewritten)
        self.assertNotIn("21.30.216", rewritten)
        self.assertEqual(rewritten.count("AppTarget("), 1)

    def test_rewrite_replaces_signatures_only_when_they_differ(self):
        new = ["a" * 64, "b" * 64]
        entry = copy.deepcopy(self.entry)
        entry["signatures"] = new
        rewritten = rewrite_constants(self.constants, entry, current_line(entry))
        block = rewritten.split("signatures = setOf(")[1].split(")")[0]
        self.assertEqual(
            [line.strip().strip('",') for line in block.strip().splitlines()], new
        )
        self.assertNotIn("// Android 13+", rewritten)

        same = rewrite_constants(self.constants, self.entry, current_line(self.entry))
        self.assertIn("// Android 13+", same)

    def test_rewrite_takes_file_type_and_icon_colour(self):
        entry = copy.deepcopy(self.entry)
        entry["apkFileType"] = "APK_OR_BUNDLE"
        entry["appIconColor"] = "#00AA11"
        rewritten = rewrite_constants(self.constants, entry, current_line(entry))
        self.assertIn("apkFileType = ApkFileType.APK_OR_BUNDLE,", rewritten)
        self.assertIn("appIconColor = 0x00AA11,", rewritten)


class LiveConstantsTest(unittest.TestCase):
    """The live Constants.kt changes with every follow; it must stay rewritable without pinning its values."""

    def test_live_constants_round_trip(self):
        kotlin = CONSTANTS.read_text(encoding="utf-8")
        targets = [
            {"version": version, "isExperimental": False, "minSdk": int(min_sdk)}
            for version, min_sdk in re.findall(r'version = "([^"]+)",\s*minSdk = (\d+),', kotlin)
        ]
        self.assertTrue(targets)
        entry = {
            "apkFileType": re.search(r"apkFileType = ApkFileType\.(\w+)", kotlin).group(1),
            "appIconColor": "#" + re.search(r"appIconColor = 0x([0-9A-Fa-f]+)", kotlin).group(1),
            "signatures": re.findall(r'"([0-9a-f]{64})"', kotlin),
            "targets": targets,
        }
        self.assertEqual(rewrite_constants(kotlin, entry, targets), kotlin)


class LibrariesTest(unittest.TestCase):
    def test_raise_version_never_lowers(self):
        self.assertEqual(
            raise_version('morphe-patcher = "2.0.1"', PATCHER, "2.0.0"), 'morphe-patcher = "2.0.1"'
        )
        self.assertEqual(
            raise_version('morphe-patcher = "2.0.1"', PATCHER, "2.1.0"), 'morphe-patcher = "2.1.0"'
        )
        plugin = 'id("app.morphe.patches") version "2.1.0-dev.1"'
        self.assertEqual(raise_version(plugin, PLUGIN, "2.0.0"), plugin)
        self.assertEqual(
            raise_version(plugin, PLUGIN, "2.1.0"), 'id("app.morphe.patches") version "2.1.0"'
        )

    def test_raise_version_touches_only_the_matched_line(self):
        toml = 'morphe-patcher = "2.0.1"\n\nmorphe-patcher = { module = "app.morphe:morphe-patcher", version.ref = "morphe-patcher" }\n'
        raised = raise_version(toml, PATCHER, "2.2.0")
        self.assertEqual(raised, toml.replace('"2.0.1"', '"2.2.0"'))

    def test_project_files_match_the_patterns(self):
        toml = (ROOT / "gradle/libs.versions.toml").read_text(encoding="utf-8")
        settings = (ROOT / "settings.gradle.kts").read_text(encoding="utf-8")
        self.assertNotEqual(raise_version(toml, PATCHER, "999.0.0"), toml)
        self.assertNotEqual(raise_version(settings, PLUGIN, "999.0.0"), settings)


class CheckTest(unittest.TestCase):
    def check(self, latest, recorded, **kwargs):
        entry = youtube_entry(patches_list(V2_TARGETS))
        record = mock.Mock(read_text=mock.Mock(return_value=recorded + "\n"))
        with mock.patch.object(morphe, "latest_stable_tag", return_value=latest), \
                mock.patch.object(morphe, "_entry_and_targets", return_value=(entry, current_line(entry))), \
                mock.patch.object(morphe, "RECORD", record):
            return morphe.check(**kwargs)

    def test_new_release_is_followed(self):
        outputs = self.check("v2.1.0", "v2.0.0", tag=None)
        self.assertEqual((outputs["follow"], outputs["dry_run"], outputs["tag"]), (True, False, "v2.1.0"))
        self.assertEqual(outputs["targets"], ["21.30.216", "21.28.208", "21.23.492"])

    def test_followed_or_older_release_is_not_followed(self):
        self.assertFalse(self.check("v2.0.0", "v2.0.0", tag=None)["follow"])
        self.assertFalse(self.check("v1.49.0", "v2.0.0", tag=None)["follow"])

    def test_given_tag_is_a_dry_run(self):
        outputs = self.check("v2.0.0", "v2.0.0", tag="v1.48.0")
        self.assertEqual((outputs["follow"], outputs["dry_run"], outputs["tag"]), (True, True, "v1.48.0"))

    def test_run_off_main_is_a_dry_run(self):
        # Only main's code may be released: a run from another branch tests, and pushes nothing.
        outputs = self.check("v2.1.0", "v2.0.0", tag=None, dry_run=True)
        self.assertEqual((outputs["follow"], outputs["dry_run"]), (True, True))

    def test_run_off_main_tests_the_latest_release_even_when_followed(self):
        outputs = self.check("v2.0.0", "v2.0.0", tag=None, dry_run=True)
        self.assertEqual((outputs["follow"], outputs["dry_run"], outputs["tag"]), (True, True, "v2.0.0"))


class SubjectTest(unittest.TestCase):
    def test_commit_subjects(self):
        three = [{"version": v} for v in ["21.30.216", "21.28.208", "21.23.492"]]
        two = [{"version": v} for v in ["21.20.405", "21.16.256"]]
        self.assertEqual(
            commit_subject("v2.0.0", three, True, False),
            "bump: YouTube 21.30.216, 21.28.208 and 21.23.492, the stable targets of Morphe v2.0.0",
        )
        self.assertEqual(
            commit_subject("v1.48.0", two, True, True),
            "bump: YouTube 21.20.405 and 21.16.256, the stable targets of Morphe v1.48.0",
        )
        self.assertEqual(
            commit_subject("v2.0.0", [three[0]], True, False),
            "bump: YouTube 21.30.216, the stable target of Morphe v2.0.0",
        )
        self.assertEqual(
            commit_subject("v2.0.0", three, False, True), "bump: build with Morphe v2.0.0's patcher"
        )
        self.assertEqual(
            commit_subject("v2.0.0", three, False, False),
            "chore: Morphe v2.0.0 followed, nothing to change",
        )


if __name__ == "__main__":
    unittest.main()
