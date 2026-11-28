"""Tests for the input preflight.

A base APK extracted from an app bundle declares the split types it needs; installing
it alone fails on Android long before any patched code runs. These tests pin the
refusal, the coverage check, and the plan itself, using synthetic zips whose
AndroidManifest.xml is plain UTF-16LE text — the same encoding the real binary manifest
uses for its string pool.
"""
from __future__ import annotations

import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO / "scripts"))

import preflight  # noqa: E402


def make_apk(path: Path, manifest: str, *, dexes=("classes.dex", "classes2.dex")) -> Path:
    """A zip that looks enough like an APK for the preflight."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(path, "w") as z:
        z.writestr("AndroidManifest.xml", manifest.encode("utf-16-le"))
        for dex in dexes:
            z.writestr(dex, b"dex\n035\x00")
    return path


BASE_MANIFEST = (
    '\x07name\x00\x0bversionCode\x00\x11requiredSplitTypes\x00'
    '\x07android\x00\x11base__abi,base__density\x00\x11com.example.bundle\x00'
)
SPLIT_ABI = '\x07name\x00\nsplitTypes\x00\x07android\x00\x08base__abi\x00\x0econfig.arm64'
SPLIT_DENSITY = '\x07name\x00\nsplitTypes\x00\x07android\x00\x0cbase__density\x00\nconfig.xxhdpi'


class PreflightTest(unittest.TestCase):
    def setUp(self) -> None:
        self.tmp = Path(tempfile.mkdtemp(prefix="preflight-test-"))
        self.addCleanup(lambda: __import__("shutil").rmtree(self.tmp, ignore_errors=True))
        self.work = self.tmp / "work"

    def test_required_split_types_are_read(self) -> None:
        apk = make_apk(self.tmp / "bundle" / "base.apk", BASE_MANIFEST)
        self.assertEqual(["base__abi", "base__density"], preflight.required_split_types(apk))

    def test_a_complete_bundle_is_accepted(self) -> None:
        directory = self.tmp / "bundle"
        make_apk(directory / "base.apk", BASE_MANIFEST)
        make_apk(directory / "config.arm64.apk", SPLIT_ABI, dexes=())
        make_apk(directory / "config.xxhdpi.apk", SPLIT_DENSITY, dexes=())
        plan = preflight.plan(directory, self.work)
        self.assertEqual("base.apk", Path(plan["base"]).name)
        self.assertEqual(2, len(plan["splits"]))
        self.assertEqual(["base__abi", "base__density"], plan["present_types"])

    def test_a_bare_base_is_refused(self) -> None:
        base = make_apk(self.tmp / "base.apk", BASE_MANIFEST)
        with self.assertRaises(preflight.PreflightError) as ctx:
            preflight.plan(base, self.work)
        self.assertIn("base__abi", str(ctx.exception))
        self.assertIn(".xapk", str(ctx.exception))

    def test_a_missing_split_type_is_refused(self) -> None:
        directory = self.tmp / "bundle"
        make_apk(directory / "base.apk", BASE_MANIFEST)
        make_apk(directory / "config.arm64.apk", SPLIT_ABI, dexes=())
        with self.assertRaises(preflight.PreflightError) as ctx:
            preflight.plan(directory, self.work)
        self.assertIn("base__density", str(ctx.exception))

    def test_a_base_without_dex_is_refused(self) -> None:
        directory = self.tmp / "bundle"
        make_apk(directory / "base.apk", BASE_MANIFEST, dexes=())
        make_apk(directory / "config.arm64.apk", SPLIT_ABI, dexes=())
        make_apk(directory / "config.xxhdpi.apk", SPLIT_DENSITY, dexes=())
        with self.assertRaises(preflight.PreflightError) as ctx:
            preflight.plan(directory, self.work)
        self.assertIn("no APK contains a dex", str(ctx.exception))

    def test_two_candidate_bases_are_refused(self) -> None:
        directory = self.tmp / "bundle"
        make_apk(directory / "one.apk", BASE_MANIFEST)
        make_apk(directory / "two.apk", BASE_MANIFEST)
        with self.assertRaises(preflight.PreflightError) as ctx:
            preflight.plan(directory, self.work)
        self.assertIn("two candidate base APKs", str(ctx.exception))

    def test_an_xapk_is_unpacked(self) -> None:
        staging = self.tmp / "staging"
        make_apk(staging / "base.apk", BASE_MANIFEST)
        make_apk(staging / "config.arm64.apk", SPLIT_ABI, dexes=())
        make_apk(staging / "config.xxhdpi.apk", SPLIT_DENSITY, dexes=())
        xapk = self.tmp / "app.xapk"
        with zipfile.ZipFile(xapk, "w") as z:
            for apk in sorted(staging.glob("*.apk")):
                z.write(apk, apk.name)
        plan = preflight.plan(xapk, self.work)
        self.assertEqual(3, len(plan["splits"]) + 1)


if __name__ == "__main__":
    unittest.main()
