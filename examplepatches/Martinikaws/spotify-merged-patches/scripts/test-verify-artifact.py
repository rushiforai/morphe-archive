import importlib.util
from pathlib import Path
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location("verify_artifact", Path(__file__).with_name("verify-artifact.py"))
verify = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verify)

ANDROID = "http://schemas.android.com/apk/res/android"


def component(kind, name, *attributes):
    """One application component as aapt2 dumps it."""
    lines = [f"      E: {kind} (line=1)", f'        A: {ANDROID}:name(0x01010003)="{name}" (Raw: "{name}")']
    return lines + [f"        A: {ANDROID}:{attribute}" for attribute in attributes]


STOCK = component("activity", "com.example.Main") + component("provider", "com.example.Files")
BROWSER = component("activity", "app.spicetify.extension.spotify.settings.ServerMusicActivity",
                    "exported(0x01010010)=false")
PROVIDER = component("provider", "app.spicetify.extension.spotify.localserver.ServerFileProvider",
                     "exported(0x01010010)=false", "grantUriPermissions(0x0101001b)=false",
                     'authorities(0x01010018)="com.spotify.music.spicetify.localserver"')


class ManifestRuleTest(unittest.TestCase):
    def check(self, added, server_files=False):
        dumps = {apk: "\n".join([f"N: android={ANDROID} (line=1)", "  E: manifest (line=1)",
                                 "    E: application (line=1)"] + lines)
                 for apk, lines in (("stock.apk", STOCK), ("patched.apk", STOCK + added))}
        with patch.object(verify.subprocess, "check_output", side_effect=lambda command, text: dumps[command[3]]):
            verify.verify_manifest("aapt2", "stock.apk", "patched.apk", server_files)

    def test_unchanged_manifest_passes(self):
        self.check([])

    # A root mount install keeps the stock manifest, so it never registers what a patch adds.
    def test_added_activity_is_refused(self):
        with self.assertRaisesRegex(AssertionError, "must not add a manifest activity"):
            self.check(component("activity", "app.spicetify.Added", "exported(0x01010010)=false"))

    def test_added_provider_is_refused(self):
        with self.assertRaisesRegex(AssertionError, "must not add a manifest provider"):
            self.check(component("provider", "app.spicetify.Added", "exported(0x01010010)=false"))

    def test_server_files_add_only_their_browser_and_provider(self):
        self.check(BROWSER + PROVIDER, server_files=True)
        with self.assertRaisesRegex(AssertionError, "Server browser does not match"):
            self.check(BROWSER + PROVIDER)
        with self.assertRaisesRegex(AssertionError, "must not add a manifest activity"):
            self.check(BROWSER + PROVIDER + component("activity", "app.spicetify.Added"), server_files=True)


class ThemeRuleTest(unittest.TestCase):
    def dump(self, output, check, *arguments):
        with patch.object(verify.subprocess, "check_output", return_value=output):
            return check("aapt2", "patched.apk", *arguments)

    # aapt2 tags each overlayable color, which an earlier pattern read as a missing color.
    def test_overlayable_colors_keep_their_default(self):
        output = ("    resource 0x7f060616 color/gray_70 OVERLAYABLE\n      () #ffb3b3b3\n"
                  "    resource 0x7f060617 color/gray_7_50\n      () #80121212\n")
        self.assertEqual({"gray_70": ("0x7f060616", "#ffb3b3b3"), "gray_7_50": ("0x7f060617", "#80121212")},
                         self.dump(output, verify.colors))

    def test_the_overlayable_declares_exactly_the_role_map(self):
        names = verify.role_map_colors()
        self.assertEqual(62, len(names))
        def overlayable(colors):
            return 'name="SpicetifyTheme" actor=""\n  policies="public"\n' + "".join(f"    color/{name}\n" for name in colors)
        self.assertEqual(62, self.dump(overlayable(names), verify.verify_overlayable, True))
        with self.assertRaisesRegex(AssertionError, r"missing \['gray_7'\]"):
            self.dump(overlayable(names[1:]), verify.verify_overlayable, True)
        with self.assertRaisesRegex(AssertionError, r"extra \['gray_7_50'\]"):
            self.dump(overlayable(names + ["gray_7_50"]), verify.verify_overlayable, True)
        with self.assertRaisesRegex(AssertionError, "without Theme colors"):
            self.dump(overlayable(names), verify.verify_overlayable, False)
        with self.assertRaisesRegex(AssertionError, "Missing the public SpicetifyTheme"):
            self.dump("", verify.verify_overlayable, True)
        self.assertEqual(0, self.dump("", verify.verify_overlayable, False))


if __name__ == "__main__":
    unittest.main()
