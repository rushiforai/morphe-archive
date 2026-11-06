"""Regression checks for generated app compatibility metadata."""

import json
import re
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
EXPECTED_PATCHES = {
    "Disable AppsFlyer",
    "Disable analytics libraries",
    "Disable analytics manifest components",
}


class PatchListGeneratorTests(unittest.TestCase):
    def test_patch_list_matches_current_bundle_and_yandex_weather_target(self):
        properties = (ROOT / "gradle.properties").read_text(encoding="utf-8")
        project_version = re.search(r"(?m)^version\s*=\s*(\S+)\s*$", properties)
        self.assertIsNotNone(project_version, "gradle.properties must define version")

        patch_list = json.loads((ROOT / "patches-list.json").read_text(encoding="utf-8"))
        self.assertEqual(project_version.group(1), patch_list["version"])

        weather_targets = {}
        for patch in patch_list["patches"]:
            if patch["name"] not in EXPECTED_PATCHES:
                continue
            package = next(
                (
                    item
                    for item in patch.get("compatiblePackages") or []
                    if item["packageName"] == "ru.yandex.weatherplugin"
                ),
                None,
            )
            if package is not None:
                weather_targets[patch["name"]] = package["targets"]

        self.assertEqual(EXPECTED_PATCHES, set(weather_targets))
        for patch_name, targets in weather_targets.items():
            self.assertEqual(
                ["26.10.10"],
                [target["version"] for target in targets],
                patch_name,
            )
            for target in targets:
                self.assertEqual(
                    {260100010},
                    set(target["versionCodes"].values()),
                    patch_name,
                )


if __name__ == "__main__":
    unittest.main()
