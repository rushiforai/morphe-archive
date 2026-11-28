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

    def test_version_written_with_a_prefix_passes(self):
        # Issue 135 on mobile-morphe-patches: "v32.20.0.100" was read as unsupported.
        for written in ("v26.20.0+rc2-2026.10.28", "V 26.20.0+rc2-2026.10.28",
                        "version 26.20.0+rc2-2026.10.28", "`26.20.0+rc2-2026.10.28`"):
            self.assertIsNone(self.check("Disney+", written, code="179321403"), written)

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
            "so it lists the version and build you used, and the `status: untargeted version` label will be removed. "
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

    def test_evidence(self):
        shot = "![Screenshot](https://github.com/user-attachments/assets/296dd177-da97-4036-8257-e28ab9753434)"
        video = "https://github.com/user-attachments/assets/a41a4fa8-1099-41ef-96e7-5eeeb52e362d"
        crash = ("FATAL EXCEPTION: main\nProcess: com.disney.disneyplus, PID: 1867\n"
                 "java.lang.IllegalStateException: boom\n\tat com.disney.App.onCreate(SourceFile:6)")
        def report(screens, log=None):
            return (form("Disney+", "26.20.0+rc3-2026.11.02") + f"\n### Crash log\n\n{log or '_No response_'}\n\n"
                    f"### Screenshots or video\n\n{screens}\n")
        for body in (report(shot), report(video), report("See crash log", crash)):
            self.assertTrue(t.has_evidence(body, t.parse_form(body)))
        for body in (report("The app is broken"), report("See crash log", "Error: it does not work"),
                     report("none", "it crashes")):
            self.assertFalse(t.has_evidence(body, t.parse_form(body)))

    def test_required_fields_come_from_the_forms(self):
        bug = [label for label, _ in t.required_fields("1-bug-report.yml")]
        self.assertIn("Device", bug)
        self.assertIn("Screenshots or video", bug)
        self.assertNotIn("Crash log", bug)
        enhancement = [label for label, _ in t.required_fields("2-enhancement.yml")]
        self.assertEqual(enhancement[:2], ["App", "Patch"])
        self.assertNotIn("Anything else", enhancement)

    def test_issue_33_is_incomplete(self):
        """Issue 33 came in through the Enhancement form with only the description filled in;
        GitHub writes "None" for a dropdown left empty."""
        body = ("### App\n\nNone\n\n### Patch\n\n_No response_\n\n### App version\n\n_No response_\n\n"
                "### Phone or Android TV build\n\nNone\n\n### Patches version\n\n_No response_\n\n"
                "### What could be better\n\nYou are missing a trailing 0\n")
        fields = t.parse_form(body)
        self.assertEqual(t.form_of(fields), "2-enhancement.yml")
        gaps = t.missing(body, fields, "2-enhancement.yml")
        for label in ("App", "Patch", "App version", "Phone or Android TV build", "Patches version", "Device"):
            self.assertIn(label, gaps)
        self.assertIn("- App\n", t.incomplete_comment(gaps))
        self.assertIn("closes after 7 days", t.incomplete_comment(gaps))

    def test_a_complete_bug_report_has_no_gaps(self):
        values = {"App": "Disney+", "App version": "26.20.0+rc3-2026.11.02",
                  "Are you enrolled as a beta tester for this app?": "No", "Phone or Android TV build": "Phone or tablet",
                  "Where the APK came from": "Aurora Store", "Patches version": "1.0.20", "Patches release": "Main release",
                  "Morphe Manager version": "2.5.0", "Patches selected": "Defaults", "Device": "Samsung Galaxy S25 Ultra",
                  "Android version": "Android 17", "Ad blockers or DNS filters": "No ad blocker or DNS filter",
                  "What happened": "It crashes.", "Steps to reproduce": "Open it.",
                  "Screenshots or video": "![s](https://github.com/user-attachments/assets/296dd177-da97-4036-8257-e28ab9753434)"}
        body = "".join(f"### {k}\n\n{v}\n\n" for k, v in values.items())
        fields = t.parse_form(body)
        self.assertEqual(t.missing(body, fields, t.form_of(fields)), [])
        no_shot = body.replace(values["Screenshots or video"], "The app is broken")
        self.assertEqual(t.missing(no_shot, t.parse_form(no_shot), "1-bug-report.yml"),
                         ["a screenshot, video, or crash log"])

    def test_version_form(self):
        labels = [label for label, _ in t.required_fields("0-version-or-build.yml")]
        self.assertEqual(labels[:5], ["App", "App version", "Are you enrolled as a beta tester for this app?",
                                      "App version code", "Phone or Android TV build"])
        self.assertIn("Morphe Manager's message", labels)
        self.assertNotIn("Anything else", labels)
        body = (form("Disney+", "26.20.0+rc3-2026.11.02", code="1793662190", build="Android TV or Google TV")
                + "\n### Morphe Manager's message\n\nIt says not supported\n")
        fields = t.parse_form(body)
        self.assertEqual(t.form_of(fields), "0-version-or-build.yml")
        self.assertIn("a screenshot of Morphe Manager's message", t.missing(body, fields, "0-version-or-build.yml"))
        # The version check answers it with the supported builds.
        self.assertEqual(t.evaluate(fields, EvaluateTest.apps)["kind"], "build")

    def test_dev_comment_links_the_testing_issue(self):
        text = t.dev_comment("NPS", [{"title": "App update: NPS 2.16.0", "url": "https://example.com/27"}])
        self.assertIn("- [App update: NPS 2.16.0](https://example.com/27)", text)
        self.assertIn("critical problem", text)


if __name__ == "__main__":
    unittest.main()


class TvRepositoryTest(unittest.TestCase):
    """tv-morphe-patches runs the triage with TRIAGE_DEFAULT_BUILD and plain app names."""

    apps = {
        "Apple TV": {"3.0.0": {"codes": set(), "descriptions": {"Phone build"}}},
        "Apple TV (Android TV)": {"17.0.3": {"codes": {170300}, "descriptions": {"Android TV build"}}},
    }

    def setUp(self):
        self.default = t.DEFAULT_BUILD
        t.DEFAULT_BUILD = "Android TV"

    def tearDown(self):
        t.DEFAULT_BUILD = self.default

    def fields(self, version):
        return {"App": "Apple TV", "App version": version, "App version code": None}

    def test_plain_name_maps_to_the_tv_entry(self):
        self.assertIsNone(t.evaluate(self.fields("17.0.3"), self.apps))

    def test_phone_version_is_not_a_tv_target(self):
        problem = t.evaluate(self.fields("3.0.0"), self.apps)
        self.assertEqual(problem["app"], "Apple TV (Android TV)")
        self.assertEqual(problem["kind"], "version")


class TvRedirectTest(unittest.TestCase):
    """This repository sends every Android TV report for a named app to the TV source (issue 80)."""

    apps = dict(apps_from(KOTLIN), **{
        "Hulu": {"6.34.0+18552420-google": {"codes": set(), "descriptions": set()}},
        "Hulu (Android TV)": {"C59F39CFP3.10.33": {"codes": {3010033}, "descriptions": {"Android TV build"}}},
    })

    def setUp(self):
        self.repo = t.TV_REPO
        t.TV_REPO = "semicoloncolonel/tv-morphe-patches"

    def tearDown(self):
        t.TV_REPO = self.repo

    def check(self, *args, **kwargs):
        return t.evaluate(t.parse_form(form(*args, **kwargs)), self.apps)

    def test_issue_80_hulu_tv_goes_to_the_tv_source(self):
        problem = self.check("Hulu", "c59f39cfp3.10.33", build="Android TV or Google TV")
        self.assertEqual(problem["kind"], "tv")
        self.assertEqual(problem["app"], "Hulu (Android TV)")
        self.assertIn("https://github.com/semicoloncolonel/tv-morphe-patches/issues", t.comment(problem))

    def test_tv_target_in_the_same_entry(self):
        self.assertEqual(self.check("HBO Max", "22.0.0.36", build="Android TV or Google TV")["kind"], "tv")

    def test_phone_reports_are_unchanged(self):
        self.assertIsNone(self.check("Hulu", "6.34.0+18552420-google"))

    def test_app_without_a_tv_target_goes_to_the_tv_source(self):
        problem = self.check("Disney+", "26.20.0+rc3-2026.11.02", build="Android TV or Google TV")
        self.assertEqual(problem["kind"], "tv")

    def test_app_this_source_does_not_list_goes_to_the_tv_source(self):
        self.assertEqual(self.check("Prime Video", "6.24.13", build="Android TV or Google TV")["kind"], "tv")

    def test_other_apps_are_left_alone(self):
        self.assertIsNone(self.check("Other (name it in the description)", "1.0", build="Android TV or Google TV"))

    def test_no_redirect_without_a_tv_source(self):
        t.TV_REPO = ""
        self.assertIsNone(self.check("Hulu", "C59F39CFP3.10.33", build="Android TV or Google TV"))
