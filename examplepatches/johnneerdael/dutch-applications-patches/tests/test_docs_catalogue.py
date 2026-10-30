"""Publication contracts: concise README and patch-specific compatibility."""
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]


def fixture():
    def patch(name, version, code, default):
        return {'name': name, 'description': 'Keep weather | disable optional measurement.',
                'default': default, 'options': [], 'compatiblePackages': [{
                    'packageName': 'example.weather', 'name': 'Example Weather',
                    'formFactor': 'MOBILE', 'targets': [{
                        'version': version, 'versionCodes': {'ARM64_V8A': code},
                        'minSdk': 28, 'isExperimental': False}]}]}
    return {'version': '3.2.1', 'patches': [
        patch('Hide ads', '1.0', 100, True),
        patch('Disable alerts', '2.0', 200, False)]}


def prerelease_fixture(package='nl.rtl.videoland.v2', name='Videoland Android TV', form_factor='TV'):
    data = fixture()
    data['version'] = '3.3.0-dev.1'
    for patch in data['patches']:
        patch['compatiblePackages'][0].update(packageName=package, name=name, formFactor=form_factor)
    return data


class ReadmeSummaryTests(unittest.TestCase):
    def generate(self, marker, data=None, counterpart=None):
        data = fixture() if data is None else data
        with tempfile.TemporaryDirectory() as folder:
            directory = Path(folder)
            source = directory / 'patches.json'
            readme = directory / 'README.md'
            source.write_text(json.dumps(data))
            readme.write_text(f'Header remains\n{marker}\nstale\n<!-- PATCHES_END -->\nFooter remains\n')
            command = [sys.executable, str(ROOT / '.github/scripts/generate_patches_readme.py'),
                       'owner/repository', 'main', str(source), str(readme)]
            if counterpart is not None:
                peer = directory / 'counterpart.json'
                peer.write_text(json.dumps(counterpart))
                command.append(str(peer))
            result = subprocess.run(command,
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(source.read_text()), data)
            if counterpart is not None:
                self.assertEqual(json.loads(peer.read_text()), counterpart)
            return readme.read_text()

    def test_summary_keeps_brand_and_links_without_repeating_patch_descriptions(self):
        text = self.generate('<!-- PATCHES_START SUMMARY -->')
        self.assertIn('Header remains', text)
        self.assertIn('Footer remains', text)
        self.assertIn('Example Weather', text)
        self.assertIn('3.2.1', text)
        self.assertNotIn('<details', text)
        self.assertNotIn('Keep weather', text)
        self.assertIn('morphe-patches.neerdael.nl', text)
        self.assertIn('vary by patch', text)
        self.assertIn('| App | Changes | Target app versions | Input | Patches |', text)
        self.assertIn('### Other apps', text)

    def test_existing_full_catalogue_marker_retains_its_contract(self):
        text = self.generate('<!-- PATCHES_START -->')
        self.assertIn('<details', text)
        self.assertIn('Hide ads', text)
        self.assertIn('Disable alerts', text)

    def test_videoland_uses_entertainment_and_its_guide_when_present_in_metadata(self):
        data = fixture()
        for patch in data['patches']:
            package = patch['compatiblePackages'][0]
            package.update(packageName='nl.rtl.videoland.v2', name='Videoland Android TV', formFactor='TV')
        text = self.generate('<!-- PATCHES_START SUMMARY -->', data)
        self.assertIn('### Entertainment', text)
        self.assertIn('https://morphe-patches.neerdael.nl/apps/videoland-android-tv/', text)
        self.assertNotIn('Videoland', self.generate('<!-- PATCHES_START SUMMARY -->'))

    def test_published_prereleases_share_the_normal_tables(self):
        text = self.generate('<!-- PATCHES_START SUMMARY -->', counterpart=prerelease_fixture())
        self.assertIn('[Stable v3.2.1]', text)
        self.assertIn('[Pre-release v3.3.0-dev.1]', text)
        row = next(line for line in text.splitlines() if line.startswith('| [Videoland'))
        self.assertIn('**Pre-release**', row)
        self.assertIn('### Entertainment', text)
        self.assertNotIn('## Development release', text)
        self.assertNotIn('## Help test', text)

    def test_belgian_news_prereleases_link_their_own_guides_in_news(self):
        apps = [
            ('be.persgroep.android.news.mobiledm', 'De Morgen', 'demorgen'),
            ('be.humo.tvgids', 'Humo', 'humo'),
            ('be.persgroep.android.news.mobilehln', 'HLN', 'hln'),
            ('com.twipemobile.nbmobile', 'Nieuwsblad', 'nieuwsblad'),
            ('com.twipemobile.dsmobile', 'DS Nieuws', 'dsnieuws'),
        ]
        for package, name, slug in apps:
            with self.subTest(package=package):
                text = self.generate('<!-- PATCHES_START SUMMARY -->',
                                     counterpart=prerelease_fixture(package, name, 'MOBILE'))
                self.assertIn('### News and reading', text)
                news = text.split('### News and reading', 1)[1].split('###', 1)[0]
                self.assertIn(f'| [{name}](https://morphe-patches.neerdael.nl/apps/{slug}/) **Pre-release** |', news)

    def test_dev_generation_can_use_a_published_stable_counterpart(self):
        text = self.generate('<!-- PATCHES_START SUMMARY -->', prerelease_fixture(), fixture())
        self.assertIn('[Stable v3.2.1]', text)
        self.assertIn('[Pre-release v3.3.0-dev.1]', text)
        self.assertIn('| [Example Weather]', text)
        self.assertIn('| [Videoland Android TV]', text)

    def test_same_app_retains_channel_specific_counts(self):
        preview = prerelease_fixture('example.weather', 'Example Weather', 'MOBILE')
        preview['patches'][1]['default'] = True
        preview['patches'][1]['compatiblePackages'][0]['targets'][0]['version'] = '3.0'
        text = self.generate('<!-- PATCHES_START SUMMARY -->', counterpart=preview)
        rows = [line for line in text.splitlines() if line.startswith('| [Example Weather]')]
        self.assertEqual(len(rows), 1)
        self.assertIn('**Pre-release**', rows[0])
        self.assertIn('2 stable / 2 pre-release', rows[0])
        self.assertIn('1.0, 2.0 (stable)<br>1.0, 3.0 (pre-release)', rows[0])


class SiteCatalogueTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location('docs_catalogue', ROOT / 'scripts/generate_docs_catalog.py')
        cls.module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.module)

    def test_each_patch_keeps_its_own_version_codes_and_default(self):
        text = self.module.render(fixture(), 'en')
        first = text.split('### Hide ads', 1)[1].split('### Disable alerts', 1)[0]
        second = text.split('### Disable alerts', 1)[1]
        self.assertIn('1.0', first)
        self.assertIn('100', first)
        self.assertNotIn('2.0', first)
        self.assertIn('On', first)
        self.assertIn('2.0', second)
        self.assertIn('200', second)
        self.assertIn('Off', second)
        self.assertIn('ARM64_V8A', text)

    def test_dutch_labels_are_explicit_about_original_english_descriptions(self):
        text = self.module.render(fixture(), 'nl')
        self.assertIn('Standaard', text)
        self.assertIn('Engels', text)
        self.assertIn('Uit', text)
        self.assertIn('Keep weather | disable optional measurement.', text)

    def test_home_lists_each_app_once_and_keeps_patch_specific_targets(self):
        text = self.module.render_home_apps(fixture(), 'en')
        self.assertEqual(text.count('<article '), 1)
        self.assertIn('Example Weather', text)
        self.assertIn('example.weather', text)
        self.assertIn('3.2.1', text)
        self.assertIn('2 patches', text)
        self.assertIn('Hide ads <span', text)
        self.assertIn('1.0', text.split('Hide ads', 1)[1].split('</li>', 1)[0])
        self.assertNotIn('2.0', text.split('Hide ads', 1)[1].split('</li>', 1)[0])
        self.assertIn('default off', text.split('Disable alerts', 1)[1])
        self.assertIn('reference/catalogue.md#example-weather', text)

    def test_home_marks_experimental_and_unspecified_versions(self):
        data = fixture()
        data['patches'][0]['compatiblePackages'][0]['targets'][0]['isExperimental'] = True
        data['patches'][1]['compatiblePackages'][0]['targets'] = []
        text = self.module.render_home_apps(data, 'nl')
        self.assertIn('1.0 · experimenteel', text)
        self.assertIn('Geen specifieke versie opgegeven', text)
        self.assertIn('standaard uit', text)

    def test_home_merges_prerelease_only_apps_without_changing_stable_metadata(self):
        stable, preview = fixture(), prerelease_fixture()
        originals = json.dumps([stable, preview], sort_keys=True)
        for language in ('en', 'nl'):
            text = self.module.render_home_apps(stable, language, prerelease=preview)
            self.assertEqual(text.count('<article '), 2)
            self.assertEqual(text.count('dap-app-card__badge'), 1)
            self.assertIn('Pre-release</span>', text)
            self.assertIn('data-channel="prerelease"', text)
            self.assertIn('(apps/videoland-android-tv.md)', text)
            self.assertIn('3.2.1', text)
            self.assertIn('3.3.0-dev.1', text)
            self.assertIn('data-category="entertainment"', text)
        self.assertEqual(json.dumps([stable, preview], sort_keys=True), originals)
        self.assertNotIn('Videoland', self.module.render(stable, 'en'))

    def test_identical_dev_controls_do_not_duplicate_or_mark_stable_app(self):
        stable = fixture()
        preview = prerelease_fixture('example.weather', 'Example Weather', 'MOBILE')
        preview['patches'].reverse()
        for patch in preview['patches']:
            patch['description'] = 'Documentation-only changes belong on the app page.'
        text = self.module.render_home_apps(stable, 'en', prerelease=preview)
        self.assertEqual(text.count('<article '), 1)
        self.assertNotIn('dap-app-card__badge', text)
        self.assertIn('2 patches', text)

    def test_supplemental_stable_metadata_is_not_mislabelled_prerelease(self):
        with self.assertRaisesRegex(ValueError, 'Expected prerelease metadata'):
            self.module.render_home_apps(fixture(), 'en', prerelease=fixture())

    def test_updated_dev_controls_keep_stable_targets_and_channel_counts(self):
        stable = fixture()
        preview = prerelease_fixture('example.weather', 'Example Weather', 'MOBILE')
        preview['patches'][1]['default'] = True
        preview['patches'][1]['compatiblePackages'][0]['targets'][0]['version'] = '3.0'
        text = self.module.render_home_apps(stable, 'en', prerelease=preview)
        self.assertEqual(text.count('<article '), 1)
        self.assertIn('Pre-release</span>', text)
        self.assertIn('2 stable · 2 pre-release patches', text)
        stable_part, preview_part = text.split('<p class="dap-app-card__channel">Pre-release</p>')
        self.assertIn('2.0', stable_part)
        self.assertIn('default off', stable_part)
        self.assertIn('3.0', preview_part)
        self.assertNotIn('default off', preview_part)

    def test_same_package_on_two_form_factors_is_not_deduplicated(self):
        preview = prerelease_fixture('example.weather', 'Example Weather TV', 'TV')
        text = self.module.render_home_apps(fixture(), 'en', prerelease=preview)
        self.assertEqual(text.count('<article '), 2)
        self.assertIn('Pre-release</span>', text)

    def test_dev_only_generation_marks_cards_and_uses_dev_catalogue_fallback(self):
        text = self.module.render_home_apps(prerelease_fixture('example.preview', 'Example Preview'), 'en')
        self.assertIn('Pre-release</span>', text)
        self.assertIn('blob/dev/docs/site/en/reference/catalogue.md#example-preview', text)

    def test_release_announcements_do_not_separate_home_intro_from_catalogue(self):
        for language in ('en', 'nl'):
            intro = (ROOT / f'docs/site/{language}/index.md').read_text().split('<!-- HOME_APPS_START -->')[0]
            self.assertTrue(intro.rstrip().endswith('</div>\n</div>'))
            self.assertNotRegex(intro, r'(?m)^## ')

    def test_videoland_preview_link_does_not_add_an_app_to_stable_metadata(self):
        data = fixture()
        for patch in data['patches']:
            package = patch['compatiblePackages'][0]
            package.update(packageName='nl.rtl.videoland.v2', name='Videoland Android TV', formFactor='TV')
        for language in ('en', 'nl'):
            preview = self.module.render_home_apps(data, language)
            self.assertIn('(apps/videoland-android-tv.md)', preview)
            self.assertIn('data-category="entertainment"', preview)
            self.assertNotIn('Videoland', self.module.render_home_apps(fixture(), language))

    def test_home_escapes_metadata_and_does_not_turn_universal_patches_into_apps(self):
        data = fixture()
        data['patches'][0]['name'] = '<script>alert("x")</script>'
        data['patches'].append({'name': 'Universal', 'compatiblePackages': None})
        text = self.module.render_home_apps(data, 'en')
        self.assertNotIn('<script>', text)
        self.assertIn('&lt;script&gt;', text)
        self.assertEqual(text.count('<article '), 1)

    def test_home_renders_all_current_supported_apps_with_local_guide_links(self):
        data = json.loads((ROOT / 'patches-list.json').read_text())
        for language in ('nl', 'en'):
            text = self.module.render_home_apps(data, language)
            targets = {(p['packageName'], p.get('formFactor'))
                       for patch in data['patches'] for p in patch.get('compatiblePackages') or []}
            self.assertEqual(text.count('<article '), len(targets))
            self.assertIn('(apps/marktplaats.md)', text)
            if any(package == 'nl.negentwee' for package, _ in targets):
                self.assertIn('(apps/9292.md)', text)
            else:
                self.assertNotIn('(apps/9292.md)', text)
            self.assertIn('(apps/nos-teletekst.md)', text)
            self.assertIn('(apps/omroep-brabant.md)', text)
            self.assertIn('(apps/buienalarm.md)', text)
            self.assertIn('(apps/dumpert.md)', text)

    def test_generator_updates_home_markers_and_detects_stale_release_data(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            script = root / 'scripts/generate_docs_catalog.py'
            script.parent.mkdir()
            script.write_text((ROOT / 'scripts/generate_docs_catalog.py').read_text())
            metadata = root / 'patches-list.json'
            metadata.write_text(json.dumps(fixture()))
            for language in ('nl', 'en'):
                home = root / 'docs/site' / language / 'index.md'
                home.parent.mkdir(parents=True)
                home.write_text('Intro\n<!-- HOME_APPS_START -->\n<!-- HOME_APPS_END -->\nFooter\n')
            subprocess.run([sys.executable, str(script)], check=True, capture_output=True)
            result = subprocess.run([sys.executable, str(script), '--check'], capture_output=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            text = (root / 'docs/site/en/index.md').read_text()
            self.assertTrue(text.startswith('Intro\n'))
            self.assertTrue(text.endswith('Footer\n'))
            self.assertIn('Example Weather', text)
            data = fixture()
            data['version'] = '3.2.2'
            metadata.write_text(json.dumps(data))
            result = subprocess.run([sys.executable, str(script), '--check'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 1)
            self.assertIn('en/index.md', result.stderr)
            self.assertIn('en/reference/catalogue.md', result.stderr)

    def test_cli_prerelease_snapshot_only_changes_home_not_stable_catalogue(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            script = root / 'scripts/generate_docs_catalog.py'
            script.parent.mkdir()
            script.write_text((ROOT / 'scripts/generate_docs_catalog.py').read_text())
            stable, preview = root / 'patches-list.json', root / 'preview.json'
            stable.write_text(json.dumps(fixture()))
            preview.write_text(json.dumps(prerelease_fixture()))
            for language in ('en', 'nl'):
                home = root / f'docs/site/{language}/index.md'
                home.parent.mkdir(parents=True)
                home.write_text('Intro\n<!-- HOME_APPS_START -->\n<!-- HOME_APPS_END -->\nFooter\n')
            command = [sys.executable, str(script), '--prerelease-metadata', str(preview)]
            result = subprocess.run(command, capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn('Videoland', (root / 'docs/site/en/index.md').read_text())
            self.assertNotIn('Videoland', (root / 'docs/site/en/reference/catalogue.md').read_text())
            data = prerelease_fixture()
            data['version'] = '3.3.0-dev.2'
            preview.write_text(json.dumps(data))
            result = subprocess.run(command + ['--check'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 1)
            self.assertIn('en/index.md', result.stderr)
            self.assertNotIn('reference/catalogue.md', result.stderr)
            self.assertEqual(json.loads(stable.read_text()), fixture())


if __name__ == '__main__':
    unittest.main()
