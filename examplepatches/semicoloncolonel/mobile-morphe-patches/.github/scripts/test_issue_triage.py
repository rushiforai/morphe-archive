"""Tests for issue_triage.py.

Run from the repository root: python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import unittest

import issue_triage as t

KOTLIN = '''
private const val PHONE_VERSION = "22.0.0.321"
object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Disney+",
        packageName = "com.disney.disneyplus",
        targets = listOf(
            AppTarget(version = "26.20.0+rc2-2026.10.28", versionCode = 179321403, description = "Phone build"),
            AppTarget(
                version = "26.20.0+rc3-2026.11.02",
                versionCode = 179366219,
                isExperimental = true,
                minSdk = 32,
                description = "Phone build",
            ),
        )
    )
    val HBO = Compatibility(
        name = "HBO Max",
        packageName = "com.wbd.hbomax",
        targets = listOf(
            AppTarget(version = PHONE_VERSION, versionCode = 1800026515, description = "Phone build"),
            AppTarget("22.0.0.36", 1842000036, description = "Android TV build"),
        )
    )
    val JUSTWATCH = Compatibility(
        name = "JustWatch",
        packageName = "com.justwatch.justwatch",
        targets = listOf(
            AppTarget("26.44.2"),
            AppTarget(
                version = "26.43.8",
                versionCodes = mapOf(SupportedAbi.ARMEABI_V7A to 12643008, SupportedAbi.ARM64_V8A to 2643008),
                description = "Android TV build",
            ),
            devTarget("26.45.0"),
        )
    )
}
'''


def apps_from(text, ref="main"):
    """The structure load_targets builds, from one Kotlin source on one branch."""
    apps = {}
    for name, targets in t.parse_source(text):
        for target in targets:
            apps.setdefault(name, {})[target["version"]] = {
                "codes": target["codes"],
                "descriptions": {target["description"]} if target["description"] else set(),
                "experimental": target["experimental"] or ref == "dev",
                "refs": {ref},
            }
    return apps


def form(app, version, code=None, build="Phone or tablet"):
    return (f"### App\n\n{app}\n\n### App version\n\n{version}\n\n"
            f"### App version code\n\n{code or '_No response_'}\n\n"
            f"### Phone or Android TV build\n\n{build}\n\n### What happened\n\nIt crashes.\n")


class ParseTest(unittest.TestCase):
    def test_form_fields(self):
        fields = t.parse_form(form("Disney+", "26.20.0+rc3-2026.11.02"))
        self.assertEqual(fields["App"], "Disney+")
        self.assertEqual(fields["App version"], "26.20.0+rc3-2026.11.02")
        self.assertIsNone(fields["App version code"])
        self.assertEqual(fields["What happened"], "It crashes.")

    def test_targets(self):
        apps = dict(t.parse_source(KOTLIN))
        disney = {x["version"]: x for x in apps["Disney+"]}
        self.assertEqual(disney["26.20.0+rc2-2026.10.28"]["codes"], {179321403})
        self.assertTrue(disney["26.20.0+rc3-2026.11.02"]["experimental"])
        hbo = {x["version"]: x for x in apps["HBO Max"]}
        self.assertEqual(hbo["22.0.0.321"]["codes"], {1800026515})  # from a constant
        self.assertEqual(hbo["22.0.0.36"]["codes"], {1842000036})  # positional
        justwatch = {x["version"]: x for x in apps["JustWatch"]}
        self.assertEqual(justwatch["26.43.8"]["codes"], {12643008, 2643008})  # per-ABI map
        self.assertTrue(justwatch["26.45.0"].get("dev"))


class EvaluateTest(unittest.TestCase):
    apps = apps_from(KOTLIN)

    def check(self, *args, **kwargs):
        return t.evaluate(t.parse_form(form(*args, **kwargs)), self.apps)

    def test_supported_report_passes(self):
        self.assertIsNone(self.check("Disney+", "26.20.0+rc2-2026.10.28", code="179321403"))

    def test_unsupported_version(self):
        problem = self.check("Disney+", "26.14.0+rc6-2026.07.30")
        self.assertEqual(problem["kind"], "version")

    def test_issue_15_android_tv_build_by_version_code(self):
        problem = self.check("Disney+", "26.20.0+rc3-2026.11.02", code="1793662190", build="Android TV or Google TV")
        self.assertEqual(problem["kind"], "build")
        self.assertIn("1793662190", problem["reason"])

    def test_android_tv_build_without_version_code(self):
        problem = self.check("Disney+", "26.20.0+rc3-2026.11.02", build="Android TV or Google TV")
        self.assertEqual(problem["reason"], "it is the Android TV build")

    def test_phone_build_of_a_tv_only_version(self):
        problem = self.check("HBO Max", "22.0.0.36")
        self.assertEqual(problem["reason"], "it is the phone build")

    def test_reports_that_cannot_be_checked_are_left_alone(self):
        self.assertIsNone(self.check("Other (name it in the description)", "1.0"))
        self.assertIsNone(self.check("Some unknown app", "1.0"))
        self.assertIsNone(self.check("JustWatch", "26.44.2", build="Not sure"))


class CommentTest(unittest.TestCase):
    """The comment text was approved as written; change these only with a new approval."""

    apps = apps_from(KOTLIN)

    def test_version_comment(self):
        problem = t.evaluate(t.parse_form(form("Disney+", "26.14.0+rc6-2026.07.30")), self.apps)
        text = t.comment(problem)
        self.assertTrue(text.startswith(
            "The patches do not support Disney+ `26.14.0+rc6-2026.07.30`, so this report cannot be looked "
            "into yet. They support these versions of Disney+:\n\n"))
        self.assertIn("- `26.20.0+rc3-2026.11.02`: Phone build; version code `179366219`; experimental", text)

    def test_build_comment(self):
        problem = t.evaluate(t.parse_form(form(
            "Disney+", "26.20.0+rc3-2026.11.02", code="1793662190", build="Android TV or Google TV")), self.apps)
        text = t.comment(problem)
        self.assertTrue(text.startswith(
            "The patches support Disney+ `26.20.0+rc3-2026.11.02`, but not the file you patched, because its "
            "version code is `1793662190`. They support these versions and builds of Disney+:\n\n"))
        self.assertTrue(text.endswith(
            "Please patch one of these and check whether the problem still happens. If it does, edit this issue "
            "so it lists the version and build you used, and the `untargeted version` label will be removed. "
            "An issue with this label closes after 7 days without an update."))

    def test_dev_only_versions_are_marked(self):
        line = t.version_line("26.45.0", {"codes": set(), "descriptions": set(), "experimental": True,
                                          "refs": {"dev"}})
        self.assertEqual(line, "- `26.45.0`: experimental, in the dev pre-releases only")

    def test_dev_reports(self):
        self.assertTrue(t.is_dev_report({"Patches release": "Dev pre-release"}))
        self.assertTrue(t.is_dev_report({"Patches version": "1.0.20-dev.4", "Patches release": "Not sure"}))
        self.assertFalse(t.is_dev_report({"Patches version": "1.0.19", "Patches release": "Main release"}))
        self.assertFalse(t.is_dev_report({}))

    def test_dev_comment_links_the_testing_issue(self):
        text = t.dev_comment("NPS", [{"title": "App update: NPS 2.16.0", "url": "https://example.com/27"}])
        self.assertIn("- [App update: NPS 2.16.0](https://example.com/27)", text)
        self.assertIn("critical problem", text)


if __name__ == "__main__":
    unittest.main()
