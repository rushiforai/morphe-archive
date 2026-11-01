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


    def archive(self, name, contents):
        source = self.root / name
        with zipfile.ZipFile(source, 'w') as archive:
            for filename, data in contents:
                archive.writestr(filename, data)
        return source

    def test_xapk_without_manifest_preserves_every_apk_payload(self):
        contents = {'com.publisher.news.apk': b'publisher-signed-base',
                    'config.arm64_v8a.apk': b'signed-native-split',
                    'config.en.apk': b'signed-language-split',
                    'config.xxhdpi.apk': b'signed-density-split'}
        source = self.archive('public.xapk', contents.items())
        original = source.read_bytes()
        staged, reference = validator.prepare_input(source, self.output)
        self.assertEqual(reference.read_bytes(), contents['com.publisher.news.apk'])
        with zipfile.ZipFile(staged) as archive:
            expected = dict(contents)
            expected['base.apk'] = expected.pop('com.publisher.news.apk')
            self.assertEqual(set(archive.namelist()), set(expected))
            for name, data in expected.items():
                self.assertEqual(archive.read(name), data)
        self.assertEqual(source.read_bytes(), original)

    def test_manifest_base_hint_disambiguates_feature_split(self):
        manifest = {'split_apks': [{'id': 'base', 'file': 'publisher.apk'},
                                   {'id': 'feature', 'file': 'reader.apk'}]}
        source = self.archive('hinted.xapk', [('manifest.json', json.dumps(manifest)),
                              ('publisher.apk', b'base'), ('reader.apk', b'feature'),
                              ('config.en.apk', b'language')])
        original = source.read_bytes()
        staged, reference = validator.prepare_input(source, self.output)
        self.assertEqual(reference.read_bytes(), b'base')
        with zipfile.ZipFile(staged) as archive:
            self.assertEqual(archive.read('base.apk'), b'base')
            self.assertEqual(archive.read('reader.apk'), b'feature')
            self.assertEqual(archive.read('config.en.apk'), b'language')
        self.assertEqual(source.read_bytes(), original)

    def test_existing_base_takes_precedence_and_keeps_metadata_archive_bytes(self):
        source = self.archive('existing.apkm', [('base.apk', b'base'), ('feature.apk', b'feature'),
                              ('info.json', '{"pname":"publisher"}'),
                              ('manifest.json', '{"split_apks":[{"id":"base","file":"missing.apk"}]}')])
        original = source.read_bytes()
        staged, reference = validator.prepare_input(source, self.output)
        self.assertEqual(staged.read_bytes(), original)
        self.assertEqual(reference.read_bytes(), b'base')
        self.assertEqual(source.read_bytes(), original)

    def test_ambiguous_base_candidates_are_rejected_without_writing(self):
        source = self.archive('ambiguous.xapk', [('publisher.apk', b'one'), ('reader.apk', b'two')])
        original = source.read_bytes()
        with self.assertRaisesRegex(ValueError, '[Aa]mbiguous|[Ee]xpected.*base'):
            validator.prepare_input(source, self.output)
        self.assertEqual(list(self.output.iterdir()), [])
        self.assertEqual(source.read_bytes(), original)

    def test_duplicate_apk_basenames_are_rejected(self):
        source = self.archive('duplicate.xapk', [('publisher.apk', b'base'),
                              ('one/config.en.apk', b'one'), ('two/config.en.apk', b'two')])
        with self.assertRaisesRegex(ValueError, '[Cc]ollid|[Dd]uplicate'):
            validator.prepare_input(source, self.output)
        self.assertEqual(list(self.output.iterdir()), [])

    def test_path_traversal_is_rejected_even_with_canonical_base(self):
        for member in ['../config.en.apk', '/config.en.apk', 'nested/../../config.en.apk',
                       r'..\config.en.apk']:
            with self.subTest(member=member):
                source = self.archive('unsafe.apks', [('base.apk', b'base'), (member, b'unsafe')])
                original = source.read_bytes()
                with self.assertRaisesRegex(ValueError, '[Uu]nsafe.*path'):
                    validator.prepare_input(source, self.output)
                self.assertEqual(source.read_bytes(), original)
                self.assertEqual(list(self.output.iterdir()), [])

    def test_conflicting_or_missing_manifest_base_hint_is_rejected(self):
        for hints in [[{'id': 'base', 'file': 'missing.apk'}],
                      [{'id': 'base', 'file': 'publisher.apk'}, {'id': 'base', 'file': 'reader.apk'}]]:
            with self.subTest(hints=hints):
                source = self.archive('bad-hint.xapk', [('publisher.apk', b'base'), ('reader.apk', b'feature'),
                                      ('manifest.json', json.dumps({'split_apks': hints}))])
                with self.assertRaisesRegex(ValueError, '[Bb]ase'):
                    validator.prepare_input(source, self.output)
                self.assertEqual(list(self.output.iterdir()), [])

    def test_nested_xapk_members_stage_under_unique_original_basenames(self):
        source = self.archive('nested.xapk', [('apks/publisher.apk', b'base'),
                              ('apks/config.en.apk', b'language')])
        staged, reference = validator.prepare_input(source, self.output)
        with zipfile.ZipFile(staged) as archive:
            self.assertEqual(archive.namelist(), ['base.apk', 'config.en.apk'])
            self.assertEqual(archive.read('config.en.apk'), b'language')
        self.assertEqual(reference.read_bytes(), b'base')


class TargetRoutingTests(unittest.TestCase):
    def test_gva_uses_mediahuis_controls_and_its_own_verifier(self):
        self.assertEqual(validator.APPS.get('gva'), validator.APPS['hbvl'])
        self.assertEqual(
            validator.verifier_command('gva', Path('decoded'), {'Hide ads'}),
            [sys.executable, 'tests/verify_gva.py', 'decoded', '-e', 'Hide ads'])

    def test_buienalarm_routes_all_controls_with_publisher_reference(self):
        self.assertEqual(validator.APPS['buienalarm'], {
            'Fix Google services': [], 'Hide ads': ['Fix Google services'],
            'Hide Premium banner': ['Fix Google services'],
            'Disable tracking': ['Hide ads', 'Fix Google services'],
            'Skip consent screens': ['Disable tracking', 'Hide ads', 'Fix Google services'],
        })
        self.assertEqual(validator.verifier_command('buienalarm', Path('decoded'), {'Hide ads'},
                         original_reference=Path('publisher.apk')),
                         [sys.executable, 'tests/verify_buienalarm.py', 'decoded', '--original', 'publisher.apk', '-e', 'Hide ads'])
        self.assertEqual(len(validator.patch_selections(validator.APPS['buienalarm'], None)), 6)
        with self.assertRaisesRegex(ValueError, 'publisher original'):
            validator.verifier_command('buienalarm', Path('decoded'), set())

    def test_gva_ed_and_hln_use_their_own_verifiers_and_sibling_selections(self):
        for app, sibling in [('gva', 'hbvl'), ('ed', 'ad'), ('hln', 'humo')]:
            with self.subTest(app=app):
                expected = dict(validator.APPS[sibling])
                if app in {'ed', 'hln'}:
                    expected['Hide empty listening carousel'] = []
                self.assertEqual(validator.APPS.get(app), expected)
                self.assertEqual(
                    validator.verifier_command(app, Path('decoded'), {'Hide ads'}),
                    [sys.executable, f'tests/verify_{app}.py', 'decoded', '-e', 'Hide ads'])
                self.assertEqual(
                    len(validator.patch_selections(validator.APPS[app], None)),
                    len(expected) + 1)

    def test_west_privacy_controls_and_bound_apk_verifier(self):
        self.assertEqual(validator.APPS.get('west'), {
            'Hide ads': [], 'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
        })
        self.assertEqual(
            validator.verifier_command('west', Path('decoded'), {'Hide ads'}, apk=Path('input.apk')),
            [sys.executable, 'tests/verify_west.py', 'decoded', '--apk', 'input.apk', '-e', 'Hide ads'])
        self.assertEqual(len(validator.patch_selections(validator.APPS['west'], None)), 4)

    def test_belgian_news_controls_use_their_own_verifiers(self):
        for app in ('demorgen', 'humo', 'hln', 'nieuwsblad', 'dsnieuws', 'hbvl', 'gva'):
            with self.subTest(app=app):
                expected = {
                    'Hide ads': [], 'Disable tracking': ['Hide ads'],
                    'Skip consent screens': ['Disable tracking', 'Hide ads'],
                    'Hide Premium banner': [],
                }
                if app in ('demorgen', 'humo', 'hln'):
                    expected['Read full articles'] = []
                self.assertEqual(validator.APPS.get(app), expected)
                self.assertEqual(
                    validator.verifier_command(app, Path('decoded'), {'Hide ads'}),
                    [sys.executable, f'tests/verify_{app}.py', 'decoded', '-e', 'Hide ads'])
                self.assertEqual(len(validator.patch_selections(expected, None)), len(expected) + 1)

    def test_hln_stable_controls_use_the_independent_verifier(self):
        self.assertEqual(validator.APPS.get('hln'), {
            'Hide ads': [], 'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
            'Hide Premium banner': [], 'Read full articles': [],
            'Hide empty listening carousel': [],
        })
        self.assertEqual(
            validator.verifier_command('hln', Path('decoded'), {'Read full articles'}),
            [sys.executable, 'tests/verify_hln.py', 'decoded', '-e', 'Read full articles'])

    def test_detijd_verifies_packed_hermes_asset_and_article_ad_dependency(self):
        self.assertEqual(validator.APPS['detijd']['Read full articles'], ['Hide ads'])
        self.assertEqual(validator.APPS['detijd']['Skip onboarding'], [])
        self.assertEqual(
            validator.verifier_command('detijd', Path('decoded'), {'Read full articles'}, apk=Path('rebuilt.apk')),
            [sys.executable, 'tests/verify_detijd.py', 'decoded', '--apk', 'rebuilt.apk', '-e', 'Read full articles'],
        )

    def test_tubantia_ports_all_five_ad_controls(self):
        self.assertEqual(validator.APPS['tubantia'], validator.APPS['ad'])
        self.assertEqual(
            validator.verifier_command('tubantia', Path('decoded'), {'Read full articles'}),
            [sys.executable, 'tests/verify_tubantia.py', 'decoded', '-e', 'Read full articles'])

    def test_humo_stable_controls_use_the_independent_verifier(self):
        self.assertEqual(validator.APPS.get('humo'), {
            'Hide ads': [], 'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
            'Hide Premium banner': [], 'Read full articles': [],
        })
        self.assertEqual(
            validator.verifier_command('humo', Path('decoded'), {'Read full articles'}),
            [sys.executable, 'tests/verify_humo.py', 'decoded', '-e', 'Read full articles'])

    def test_demorgen_stable_controls_use_the_independent_verifier(self):
        self.assertEqual(validator.APPS.get('demorgen'), {
            'Hide ads': [], 'Disable tracking': ['Hide ads'],
            'Skip consent screens': ['Disable tracking', 'Hide ads'],
            'Hide Premium banner': [], 'Read full articles': [],
        })
        self.assertEqual(
            validator.verifier_command('demorgen', Path('decoded'), {'Read full articles'}),
            [sys.executable, 'tests/verify_demorgen.py', 'decoded', '-e', 'Read full articles'])

    def test_detijd_verifies_packed_hermes_asset_and_article_ad_dependency(self):
        self.assertEqual(validator.APPS['detijd']['Read full articles'], ['Hide ads'])
        self.assertEqual(validator.APPS['detijd']['Skip onboarding'], [])
        self.assertEqual(
            validator.verifier_command('detijd', Path('decoded'), {'Read full articles'}, apk=Path('rebuilt.apk')),
            [sys.executable, 'tests/verify_detijd.py', 'decoded', '--apk', 'rebuilt.apk', '-e', 'Read full articles'],
        )

    def test_belgian_news_controls_use_their_own_verifiers(self):
        for app in ('demorgen', 'humo', 'hln', 'nieuwsblad', 'dsnieuws', 'hbvl'):
            with self.subTest(app=app):
                expected = {
                    'Hide ads': [], 'Disable tracking': ['Hide ads'],
                    'Skip consent screens': ['Disable tracking', 'Hide ads'],
                    'Hide Premium banner': [],
                }
                if app in ('demorgen', 'humo', 'hln'):
                    expected['Read full articles'] = []
                if app == 'hln':
                    expected['Hide empty listening carousel'] = []
                if app in ('hbvl', 'gva'):
                    expected['Hide newspaper navigation'] = []
                self.assertEqual(validator.APPS.get(app), expected)
                self.assertEqual(
                    validator.verifier_command(app, Path('decoded'), {'Hide ads'}),
                    [sys.executable, f'tests/verify_{app}.py', 'decoded', '-e', 'Hide ads'])
                self.assertEqual(len(validator.patch_selections(expected, None)), len(expected) + 1)

    def test_tvgids_binds_original_and_rebuilt_native_images(self):
        self.assertEqual(validator.APPS.get('tvgids'), {'Hide ads': [], 'Disable tracking': ['Hide ads'],
                         'Skip consent screens': ['Disable tracking', 'Hide ads']})
        command = validator.verifier_command('tvgids', Path('decoded'), {'Hide ads'},
                                             apk=Path('rebuilt.apk'), original_reference=Path('original.apk'))
        self.assertEqual(command, [sys.executable, 'tests/verify_tvgids.py', 'decoded',
                                   '--apk', 'rebuilt.apk', '--original', 'original.apk', '-e', 'Hide ads'])
        with self.assertRaisesRegex(ValueError, 'original'):
            validator.verifier_command('tvgids', Path('decoded'), {'Hide ads'}, apk=Path('rebuilt.apk'))

    def test_marktplaats_threatmetrix_is_a_normal_default_control(self):
        catalog = json.loads((ROOT / 'patches-list.json').read_text())
        matches = [p for p in catalog['patches'] if p['name'] == 'Disable ThreatMetrix']
        self.assertEqual(len(matches), 1)
        self.assertIs(matches[0]['default'], True)

    def test_marktplaats_uses_its_own_apk_bound_verifier(self):
        self.assertEqual(validator.APPS.get('marktplaats'), {'Hide ads': [], 'Disable tracking': ['Hide ads'], 'Disable ThreatMetrix': [], 'Skip consent screens': ['Disable tracking', 'Hide ads'], 'Google sign-in via microG-Re': []})
        command=validator.verifier_command('marktplaats',Path('decoded'),{'Hide ads'},apk=Path('rebuilt.apk'))
        self.assertEqual(command,[sys.executable,'tests/verify_marktplaats.py','decoded','--apk','rebuilt.apk','-e','Hide ads'])
        self.assertEqual(validator.patch_selections(validator.APPS['marktplaats'],['all']),[['Hide ads','Disable tracking','Disable ThreatMetrix','Skip consent screens','Google sign-in via microG-Re']])

    def test_9292_uses_its_own_apk_bound_verifier(self):
        self.assertEqual(validator.APPS['9292'], {
            'Fix PairIP startup': [], 'Hide ads': ['Fix PairIP startup'],
            'Disable tracking': ['Hide ads', 'Fix PairIP startup'],
            'Skip consent screens': ['Disable tracking', 'Hide ads', 'Fix PairIP startup']})
        command=validator.verifier_command('9292',Path('decoded'),{'Hide ads'},apk=Path('rebuilt.apk'))
        self.assertEqual(command,[sys.executable,'tests/verify_9292.py','decoded','--apk','rebuilt.apk','-e','Hide ads'])

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


class KijkRoutingTests(unittest.TestCase):
    def test_consent_includes_tracking_without_forcing_ads(self):
        self.assertEqual(validator.APPS['kijk'], {'Hide ads': [], 'Disable tracking': [],
                                                'Skip consent screens': ['Disable tracking']})
        command = validator.verifier_command('kijk', Path('/decoded/output'),
                    {'Skip consent screens', 'Disable tracking'}, apk=Path('/output.apk'),
                    original_reference=Path('/decoded/original'), original_input=Path('/original.apk'))
        self.assertEqual(command[1], 'tests/verify_kijk_consent.py')
        self.assertIn('Skip consent screens', command)
        self.assertIn('Disable tracking', command)
        self.assertNotIn('Hide ads', command)
        self.assertEqual(command[-4:], ['--original-apk', '/original.apk', '--patched-apk', '/output.apk'])

    def test_kijk_validation_requires_both_decoded_reference_and_original_payload(self):
        with self.assertRaisesRegex(ValueError, 'decoded publisher original'):
            validator.verifier_command('kijk', Path('/output'), set())
        with self.assertRaisesRegex(ValueError, 'original APK'):
            validator.verifier_command('kijk', Path('/output'), set(), apk=Path('/output.apk'),
                                       original_reference=Path('/original'))


if __name__ == "__main__":
    unittest.main()


class VideolandMobileRoutingTests(unittest.TestCase):
    def test_mobile_controls_and_whole_archive_verifier(self):
        self.assertEqual(validator.APPS.get('videoland'), {
            'Hide ads': [], 'Disable tracking': [], 'Skip consent screens': ['Disable tracking']})
        command = validator.verifier_command('videoland', Path('/output'),
                    {'Disable tracking', 'Skip consent screens'}, apk=Path('/out.apk'),
                    original_reference=Path('/stock'), original_input=Path('/original.apks'))
        self.assertEqual(command, [sys.executable, 'tests/verify_videoland.py', '/stock', '/output',
                    '--tracking', '--consent', '--original-apks', '/original.apks', '--patched-apk', '/out.apk'])
        self.assertEqual(validator.STREAMING_ORIGINALS['videoland'],
            'c990c0339ac1b8c79031aabccba0046f63ca005266031a18c35051c8b7a73810')

    def test_mobile_requires_reference_and_complete_split_payload(self):
        with self.assertRaisesRegex(ValueError, 'original'):
            validator.verifier_command('videoland', Path('/output'), set())
        with self.assertRaisesRegex(ValueError, 'whole original'):
            validator.verifier_command('videoland', Path('/output'), set(), apk=Path('/out.apk'),
                                       original_reference=Path('/stock'))


class MediaRoutingTests(unittest.TestCase):
    def test_medium_controls_route_to_complete_original_and_payload_checks(self):
        self.assertEqual(set(validator.APPS['medium']),
                         {'Disable optional tracking', 'Hide native promotions', 'Read full articles natively'})
        command = validator.verifier_command('medium', Path('/out'), {'Read full articles natively'},
                    apk=Path('/out.apk'), original_reference=Path('/stock'), original_input=Path('/source.apks'))
        self.assertEqual(command, [sys.executable, 'tests/verify_medium.py', '/stock', '/out',
            '-e', 'Read full articles natively', '--original-apks', '/source.apks', '--patched-apk', '/out.apk'])

    def test_npo_dependencies_preserve_control_isolation_and_form_factor(self):
        expected = {'Fix PairIP startup': [], 'Hide ads': ['Fix PairIP startup'],
                    'Disable tracking': ['Fix PairIP startup']}
        for app in ['npo', 'npostarttv']:
            self.assertEqual(validator.APPS[app], expected)
            command = validator.verifier_command(app, Path('/out'), {'Fix PairIP startup', 'Hide ads'},
                        original_reference=Path('/stock'))
            self.assertEqual(command[:4], [sys.executable, 'tests/verify_npo.py', '/stock', '/out'])
            self.assertEqual('--phone' in command, app == 'npo')
            self.assertNotIn('Disable tracking', command)

    def test_tv_unavailable_content_is_included_without_forcing_other_controls(self):
        self.assertEqual(validator.APPS['videolandatv'], {'Hide ads': [], 'Disable tracking': [],
                                                       'Hide unavailable content': []})
        command = validator.verifier_command('videolandatv', Path('/out'), {'Hide unavailable content'},
                    apk=Path('/out.apk'), original_reference=Path('/stock'), original_input=Path('/source.apks'))
        self.assertEqual(command, [sys.executable, 'tests/verify_videoland_atv.py', '/stock', '/out',
            '--unavailable', '--original-apks', '/source.apks', '--patched-apk', '/out.apk'])

    def test_new_media_routes_reject_missing_references_and_split_payload(self):
        for app in ['medium', 'npo', 'npostarttv', 'videolandatv']:
            with self.subTest(app=app):
                with self.assertRaisesRegex(ValueError, 'decoded publisher original'):
                    validator.verifier_command(app, Path('/out'), set())
                with self.assertRaisesRegex(ValueError, 'whole original split'):
                    validator.verifier_command(app, Path('/out'), set(), apk=Path('/out.apk'),
                                               original_reference=Path('/stock'))
