"""Exercise split input staging and app-specific validation routing."""
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import unittest
import zipfile

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("validate_targets", ROOT / "scripts/validate_targets.py")
validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)


class InputStagingTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.output = self.root / "output"
        self.output.mkdir()

    def test_complete_directory_preserves_every_split_and_original(self):
        source = self.root / "phone"
        source.mkdir()
        contents = {
            "base.apk": b"base-code-and-resources",
            "split_config.arm64_v8a.apk": b"native-libraries",
            "split_config.en.apk": b"english-strings",
            "split_config.xxxhdpi.apk": b"density-resources",
        }
        for name, data in contents.items():
            (source / name).write_bytes(data)
        staged, reference = validator.prepare_input(source, self.output)
        self.assertEqual(reference, source / "base.apk")
        self.assertEqual(staged.suffix, ".apks")
        with zipfile.ZipFile(staged) as archive:
            self.assertEqual(set(archive.namelist()), set(contents))
            for name, data in contents.items():
                self.assertEqual(archive.read(name), data)
                self.assertEqual((source / name).read_bytes(), data)

    def test_macos_archive_metadata_is_not_passed_to_the_apk_parser(self):
        source = self.root / 'finder.apks'
        with zipfile.ZipFile(source, 'w') as z:
            z.writestr('base.apk', b'original-base')
            z.writestr('split_config.arm64_v8a.apk', b'original-native-split')
            z.writestr('__MACOSX/._base.apk', b'AppleDouble metadata')
            z.writestr('__MACOSX/._split_config.arm64_v8a.apk', b'AppleDouble metadata')
        original = source.read_bytes()
        staged, reference = validator.prepare_input(source, self.output)
        self.assertNotEqual(staged, source)
        with zipfile.ZipFile(staged) as z:
            self.assertEqual(z.namelist(), ['base.apk', 'split_config.arm64_v8a.apk'])
            self.assertEqual(z.read('base.apk'), b'original-base')
            self.assertEqual(z.read('split_config.arm64_v8a.apk'), b'original-native-split')
        self.assertEqual(reference.read_bytes(), b'original-base')
        self.assertEqual(source.read_bytes(), original)

    def test_archive_staging_refuses_to_overwrite_its_original(self):
        source = self.output / 'input.apks'
        with zipfile.ZipFile(source, 'w') as z:
            z.writestr('base.apk', b'original')
            z.writestr('__MACOSX/._base.apk', b'AppleDouble metadata')
        original = source.read_bytes()
        with self.assertRaisesRegex(ValueError, 'original input'):
            validator.prepare_input(source, self.output)
        self.assertEqual(source.read_bytes(), original)

    def test_missing_base_is_rejected(self):
        source = self.root / "phone"
        source.mkdir()
        (source / "split_config.en.apk").write_bytes(b"language")
        with self.assertRaisesRegex(ValueError, "base.apk"):
            validator.prepare_input(source, self.output)

    def test_unexpected_directory_files_are_rejected(self):
        source = self.root / "phone"
        source.mkdir()
        (source / "base.apk").write_bytes(b"base")
        (source / "notes.txt").write_text("not an APK")
        with self.assertRaisesRegex(ValueError, "notes.txt"):
            validator.prepare_input(source, self.output)

    def test_standalone_apk_is_used_unchanged(self):
        apk = self.root / "original.apk"
        apk.write_bytes(b"original")
        self.assertEqual(validator.prepare_input(apk, self.output), (apk, apk))

    def test_archive_keeps_all_splits_and_extracts_reference_base(self):
        apk_set = self.root / "original.apkm"
        with zipfile.ZipFile(apk_set, "w") as archive:
            archive.writestr("base.apk", b"base")
            archive.writestr("split_config.en.apk", b"language")
        staged, reference = validator.prepare_input(apk_set, self.output)
        self.assertEqual(staged, self.output / "input.apks")
        self.assertEqual(staged.read_bytes(), apk_set.read_bytes())
        self.assertEqual(reference.read_bytes(), b"base")
        with zipfile.ZipFile(apk_set) as archive:
            self.assertIn("split_config.en.apk", archive.namelist())


class TargetRoutingTests(unittest.TestCase):
    def test_teletekst_controls_are_independent_and_bind_the_apk(self):
        self.assertEqual(validator.APPS.get('teletekst'),{'Disable tracking':[],'Hide promotions':[]})
        command=validator.verifier_command('teletekst',Path('decoded'),{'Disable tracking'},apk=Path('rebuilt.apk'))
        self.assertEqual(command,[sys.executable,'tests/verify_teletekst.py','decoded','--apk','rebuilt.apk','-e','Disable tracking'])

    def test_brabant_privacy_controls_and_bound_apk_verifier(self):
        self.assertIn('brabant', validator.APPS)
        self.assertEqual(validator.APPS['brabant'], {
            'Hide ads': [],
            'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
        })
        self.assertEqual(validator.verifier_command('brabant', Path('decoded'), {'Hide ads'}, apk=Path('input.apk')),
                         [sys.executable, 'tests/verify_brabant.py', 'decoded', '--apk', 'input.apk', '-e', 'Hide ads'])
        self.assertEqual(len(validator.patch_selections(validator.APPS['brabant'], None)), 4)

    def test_rtl_expert_catalogue_is_opt_in_with_push_warning(self):
        catalog = json.loads((ROOT / 'patches-list.json').read_text())
        matches = [p for p in catalog['patches'] if p['name'] == 'Disable Swrve (expert)']
        self.assertEqual(len(matches), 1)
        patch = matches[0]
        self.assertIs(patch['default'], False)
        self.assertIn('data sharing', patch['description'].lower())
        self.assertIn('push notifications', patch['description'].lower())
        self.assertIn('channel synchronization', patch['description'].lower())
        self.assertEqual({p['packageName'] for p in patch['compatiblePackages']}, {'nl.rtl.rtlnieuws'})


    def test_rtl_privacy_controls_and_bound_apk_verifier(self):
        self.assertIn('rtl', validator.APPS)
        self.assertEqual(validator.APPS['rtl'], {
            'Hide ads': [],
            'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
            'Disable Swrve (expert)': ['Skip consent screens', 'Disable tracking', 'Hide ads'],
        })
        self.assertEqual(validator.verifier_command('rtl', Path('decoded'), {'Hide ads'}, apk=Path('input.apk')),
                         [sys.executable, 'tests/verify_rtl.py', 'decoded', '--apk', 'input.apk', '-e', 'Hide ads'])
        self.assertEqual(len(validator.patch_selections(validator.APPS['rtl'], None)), 5)

    def test_parool_controls_route_to_the_independent_verifier(self):
        # Missing/wrong routing would validate Parool with another app's identity.
        self.assertIn('parool', validator.APPS)
        self.assertEqual(validator.APPS['parool'], {
            'Hide ads': [], 'Hide Premium banner': [],
            'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
            'Read full articles': [],
        })
        self.assertEqual(validator.verifier_command('parool', Path('decoded'), {'Read full articles'}),
                         [sys.executable, 'tests/verify_parool.py', 'decoded', '-e', 'Read full articles'])

    def test_ad_and_nrc_controls_have_independent_validation_matrices(self):
        for app in ('ad', 'nrc'):
            with self.subTest(app=app):
                self.assertIn(app, validator.APPS)
                expected = {
                    'Hide ads': [],
                    'Disable tracking': ['Hide ads'],
                    'Skip consent screens': ['Disable tracking', 'Hide ads'],
                    'Hide Premium banner': [],
                    'Read full articles': [],
                }
                if app == 'nrc':
                    expected['Hide newspaper tab'] = []
                self.assertEqual(validator.APPS[app], expected)
                selections = validator.patch_selections(validator.APPS[app], None)
                self.assertEqual(len(selections), len(expected) + 1)
                self.assertEqual(selections[-1], list(validator.APPS[app]))
                self.assertEqual(
                    validator.verifier_command(app, Path('decoded'), {'Read full articles'}),
                    [sys.executable, f'tests/verify_{app}.py', 'decoded', '-e', 'Read full articles'],
                )

    def test_dumpert_privacy_controls_and_bound_apk_verifier(self):
        self.assertIn('dumpert', validator.APPS)
        self.assertEqual(validator.APPS['dumpert'], {
            'Hide ads': [],
            'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
        })
        self.assertEqual(
            validator.verifier_command('dumpert', Path('decoded'), {'Hide ads'}, apk=Path('input.apk')),
            [sys.executable, 'tests/verify_dumpert.py', 'decoded', '--apk', 'input.apk', '-e', 'Hide ads'],
        )

    def test_existing_verifiers_ignore_the_new_optional_apk_binding(self):
        for app in ('parool', 'trouw', 'ad', 'nrc', 'buienradar'):
            with self.subTest(app=app):
                self.assertEqual(
                    validator.verifier_command(app, Path('decoded'), set(), apk=Path('input.apk')),
                    validator.verifier_command(app, Path('decoded'), set()),
                )

    def test_flitsmeister_local_controls_and_dedicated_verifier(self):
        self.assertIn('flitsmeister', validator.APPS)
        self.assertEqual(validator.APPS['flitsmeister'], {
            'Fix PairIP startup': [], 'Unlock Pro': [], 'Hide Pro notices': [],
            'Disable partner services': [], 'Hide ads': [], 'Disable tracking': [],
        })
        self.assertEqual(
            validator.verifier_command('flitsmeister', Path('decoded'), {'Unlock Pro'}),
            [sys.executable, 'tests/verify_flitsmeister.py', 'decoded', '-e', 'Unlock Pro'],
        )

    def test_ftm_web_controls_keep_the_observed_dependencies(self):
        self.assertIn('ftm', validator.APPS)
        self.assertEqual(validator.APPS['ftm'], {
            'Hide ads': [],
            'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking'],
            'Hide Premium banner': [],
            'Read full articles': [],
        })

    def test_weerplaza_maps_fix_is_required_for_other_controls(self):
        profile = validator.APPS['weerplaza']
        self.assertIn('Fix Google Maps', profile)
        self.assertEqual(profile['Fix Google Maps'], [])
        for patch in ('Hide ads', 'Hide Premium banner', 'Disable tracking', 'Skip consent screens'):
            self.assertIn('Fix Google Maps', profile[patch], patch)

    def test_each_new_target_has_separate_controls_and_dependencies(self):
        common = {"Hide ads", "Hide Premium banner", "Disable tracking", "Skip consent screens"}
        for app in ("weerplaza", "nunl", "volkskrant", "trouw"):
            with self.subTest(app=app):
                self.assertIn(app, validator.APPS)
                profile = validator.APPS[app]
                self.assertTrue(common <= set(profile))
                expected = {"Hide ads", "Disable tracking"}
                if app == 'weerplaza':
                    expected.add('Fix Google Maps')
                self.assertEqual(set(profile["Skip consent screens"]), expected)
                self.assertIn("Hide ads", profile["Disable tracking"])
        self.assertIn("Read full articles", validator.APPS["volkskrant"])
        self.assertIn("Read full articles", validator.APPS.get("trouw", {}))

    def test_new_targets_route_to_their_own_verifier(self):
        destination = Path("decoded")
        for app in ("weerplaza", "nunl", "volkskrant", "trouw", "ftm"):
            self.assertEqual(
                validator.verifier_command(app, destination, {"Disable tracking"}),
                [sys.executable, f"tests/verify_{app}.py", "decoded", "-e", "Disable tracking"],
            )

    def test_existing_targets_keep_existing_verifier_arguments(self):
        self.assertEqual(
            validator.verifier_command("buienradar", Path("decoded"), set()),
            [sys.executable, "tests/verify_targets.py", "buienradar", "decoded"],
        )

    def test_default_matrix_and_focused_selections(self):
        patches = {"Hide ads": [], "Hide Premium banner": []}
        self.assertEqual(validator.patch_selections(patches, None), [
            ["Hide ads"], ["Hide Premium banner"], ["Hide ads", "Hide Premium banner"],
        ])
        self.assertEqual(validator.patch_selections(patches, ["Hide ads"]), [["Hide ads"]])
        self.assertEqual(validator.patch_selections(patches, ["all"]), [list(patches)])
        with self.assertRaisesRegex(ValueError, "Unknown selection"):
            validator.patch_selections(patches, ["missing"])

    def test_compact_decode_cleans_only_its_own_temporary_directory(self):
        with tempfile.TemporaryDirectory() as tmp:
            out = Path(tmp)
            original = out / "input-base.apk"
            original.write_bytes(b"original")
            retained = out / "decoded-original"
            retained.mkdir()
            with validator.decoded_destination(out, "original", compact=True) as destination:
                self.assertNotEqual(destination, retained)
                (destination / "inspection.txt").write_text("temporary evidence")
            self.assertFalse(destination.exists())
            self.assertTrue(retained.is_dir())
            self.assertEqual(original.read_bytes(), b"original")

    def test_failed_compact_verification_keeps_evidence_for_diagnosis(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaisesRegex(RuntimeError, "verification failed"):
                with validator.decoded_destination(Path(tmp), "failed", compact=True) as destination:
                    (destination / "smali.txt").write_text("diagnostic output")
                    raise RuntimeError("verification failed")
            self.assertEqual((destination / "smali.txt").read_text(), "diagnostic output")


if __name__ == "__main__":
    unittest.main()
