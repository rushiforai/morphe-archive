"""Publication contracts: one catalogue with accurate per-patch compatibility."""
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
        return {'name': name, 'description': 'Internal implementation description.',
                'default': default, 'options': [], 'compatiblePackages': [{
                    'packageName': 'example.weather', 'name': 'Example Weather',
                    'formFactor': 'MOBILE', 'targets': [{
                        'version': version, 'versionCodes': {'ARM64_V8A': code},
                        'minSdk': 28, 'isExperimental': False}]}]}
    return {'version': '3.2.1', 'patches': [
        patch('Hide ads', '1.0', 100, True),
        patch('Disable alerts', '2.0', 200, False)]}


class ReadmeSummaryTests(unittest.TestCase):
    def test_newspaper_navigation_control_is_listed_as_navigation(self):
        data = fixture()
        data['patches'] = data['patches'][:1]
        data['patches'][0]['name'] = 'Hide newspaper navigation'
        text = self.generate(data)
        self.assertIn('| Navigation |', text)

    def test_any_version_waze_addon_links_to_waze_guide(self):
        data = fixture()
        data['patches'] = data['patches'][:1]
        data['patches'][0]['name'] = 'YT Music Morphe in Waze'
        package = data['patches'][0]['compatiblePackages'][0]
        package.update(packageName='com.waze', name='Waze', targets=[{'version': None}])
        text = self.generate(data)
        self.assertIn('Any', text)
        self.assertNotIn('| None |', text)
        self.assertIn('Home audio', text)
        self.assertIn('/apps/waze/', text)

    def generate(self, data=None):
        data = fixture() if data is None else data
        with tempfile.TemporaryDirectory() as folder:
            directory = Path(folder)
            source = directory / 'patches.json'
            readme = directory / 'README.md'
            source.write_text(json.dumps(data))
            readme.write_text('Header remains\n<!-- PATCHES_START SUMMARY -->\nstale\n<!-- PATCHES_END -->\nFooter remains\n')
            result = subprocess.run([sys.executable, str(ROOT / '.github/scripts/generate_patches_readme.py'),
                                     'owner/repository', str(source), str(readme)], capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(source.read_text()), data)
            return readme.read_text()

    def test_summary_keeps_surrounding_prose_without_raw_patch_descriptions(self):
        text = self.generate()
        self.assertIn('Header remains', text)
        self.assertIn('Footer remains', text)
        self.assertIn('Example Weather', text)
        self.assertIn('3.2.1', text)
        self.assertNotIn('Internal implementation', text)
        self.assertIn('vary by patch', text)
        self.assertIn('| App | Changes | Target app versions | Input | Patches |', text)
        self.assertIn('### Other apps', text)
        self.assertIn('1.0, 2.0', text)
        self.assertNotIn('data-channel', text)

    def test_unreleased_snapshot_does_not_link_nonexistent_release(self):
        data = fixture()
        data['version'] = '0.0.0'
        text = self.generate(data)
        self.assertIn('Unreleased source snapshot', text)
        self.assertNotIn('releases/tag/v0.0.0', text)

    def test_phone_and_tv_targets_have_distinct_guides_in_one_table(self):
        data = fixture()
        for index, patch in enumerate(data['patches']):
            package = patch['compatiblePackages'][0]
            package.update(packageName='nl.rtl.videoland.v2', name='Videoland' if index == 0 else 'Videoland Android TV',
                           formFactor='MOBILE' if index == 0 else 'TV')
        text = self.generate(data)
        self.assertIn('### Entertainment', text)
        self.assertIn('/apps/videoland/', text)
        self.assertIn('/apps/videoland-android-tv/', text)
        self.assertEqual(text.count('### Entertainment'), 1)


class SiteCatalogueTests(unittest.TestCase):
    def test_repackaged_music_is_not_listed_as_a_separate_original(self):
        data = fixture()
        data['patches'] = data['patches'][:1]
        patch = data['patches'][0]
        patch['name'] = 'Gearslip music browser support'
        original = patch['compatiblePackages'][0]
        original.update(packageName='com.google.android.apps.youtube.music',
                        name='YouTube Music', apkFileType='APKM', targets=[{'version': None}])
        repackaged = dict(original, packageName='app.morphe.android.apps.youtube.music', apkFileType='APK')
        patch['compatiblePackages'].append(repackaged)
        snapshot = json.dumps(data, sort_keys=True)
        for language in ('en', 'nl'):
            home = self.module.render_home_apps(data, language)
            self.assertEqual(home.count('<article '), 1)
            self.assertEqual(home.count('<li>Gearslip music browser support '), 1)
            self.assertIn('(apps/youtube-music.md)', home)
            catalogue = self.module.render(data, language)
            self.assertEqual(catalogue.count('## YouTube Music'), 1)
            self.assertIn('`com.google.android.apps.youtube.music`', catalogue)
            self.assertNotIn('app.morphe.android.apps.youtube.music', home + catalogue)
            self.assertNotIn('youtube-music-morphe', home + catalogue)
        self.assertEqual(json.dumps(data, sort_keys=True), snapshot)

    def test_any_version_waze_addon_links_to_app_guide(self):
        data = fixture()
        data['patches'] = data['patches'][:1]
        package = data['patches'][0]['compatiblePackages'][0]
        package.update(packageName='com.waze', name='Waze', targets=[{'version': None}])
        for language, label in [('en', 'Any'), ('nl', 'Alle versies')]:
            text = self.module.render_home_apps(data, language)
            self.assertIn(label, text)
            self.assertIn('apps/waze.md', text)

    def test_gva_links_to_its_news_guide(self):
        self.assertEqual(self.module.app_page({'packageName': 'be.concentra.gva.MediaApp'}), ('gva', 'news'))

    def test_dev_bundle_keeps_its_prerelease_version(self):
        data = fixture()
        data['version'] = '1.2.0-dev.1'
        try:
            rendered = self.module.render(data, 'en')
        except ValueError as error:
            self.fail(f'Dev build metadata must be renderable: {error}')
        self.assertIn('1.2.0-dev.1', rendered)
        self.assertIn('Development', self.module.bundle_label(data, False))

    def test_gva_and_ed_link_to_their_own_news_guides(self):
        for package, slug in [('be.concentra.gva.MediaApp', 'gva'), ('com.mecom.ed.nl', 'ed')]:
            with self.subTest(package=package):
                self.assertEqual(self.module.app_page({'packageName': package}), (slug, 'news'))

    def test_release_commits_every_generated_catalogue_page(self):
        config = json.loads((ROOT / '.releaserc').read_text())
        assets = next(plugin[1]['assets'] for plugin in config['plugins']
                      if isinstance(plugin, list) and plugin[0] == './.github/scripts/public_git.cjs')
        for language in ('en', 'nl'):
            self.assertIn(f'docs/site/{language}/index.md', assets)
            self.assertIn(f'docs/site/{language}/reference/catalogue.md', assets)

    @classmethod
    def setUpClass(cls):
        spec = importlib.util.spec_from_file_location('docs_catalogue', ROOT / 'scripts/generate_docs_catalog.py')
        cls.module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(cls.module)

    def test_each_patch_keeps_its_own_versions_and_default_without_internal_details(self):
        data = fixture()
        data['patches'][0]['options'] = [{'key': 'internal', 'description': 'Secret implementation'}]
        text = self.module.render(data, 'en')
        self.assertIn('| Hide ads | On | 1.0 |', text)
        self.assertIn('| Disable alerts | Off | 2.0 |', text)
        self.assertNotIn('ARM64_V8A', text)
        self.assertNotIn('Secret implementation', text)
        self.assertNotIn('Internal implementation', text)

    def test_dutch_labels_are_translated_without_raw_metadata_descriptions(self):
        text = self.module.render(fixture(), 'nl')
        self.assertIn('Standaard', text)
        self.assertIn('Uit', text)
        self.assertNotIn('Internal implementation', text)

    def test_unreleased_snapshot_has_one_explicit_status(self):
        data = fixture()
        data['version'] = '0.0.0'
        self.assertIn('Source snapshot · unreleased', self.module.render(data, 'en'))
        home = self.module.render_home_apps(data, 'en')
        self.assertIn('Source snapshot · unreleased', home)
        self.assertNotIn('data-channel', home)
        self.assertNotIn('dap-app-card__badge', home)

    def test_home_lists_each_app_once_and_keeps_patch_specific_targets(self):
        text = self.module.render_home_apps(fixture(), 'en')
        self.assertEqual(text.count('<article '), 1)
        self.assertIn('Example Weather', text)
        self.assertIn('example.weather', text)
        self.assertIn('3.2.1', text)
        self.assertIn('2 patches', text)
        self.assertIn('1.0', text.split('Hide ads', 1)[1].split('</li>', 1)[0])
        self.assertNotIn('2.0', text.split('Hide ads', 1)[1].split('</li>', 1)[0])
        self.assertIn('default off', text.split('Disable alerts', 1)[1])
        self.assertIn('reference/catalogue.md#example-weather', text)

    def test_home_marks_unspecified_versions(self):
        data = fixture()
        data['patches'][1]['compatiblePackages'][0]['targets'] = []
        text = self.module.render_home_apps(data, 'nl')
        self.assertIn('Geen specifieke versie opgegeven', text)
        self.assertIn('standaard uit', text)

    def test_same_package_on_two_form_factors_is_not_deduplicated(self):
        data = fixture()
        for index, patch in enumerate(data['patches']):
            package = patch['compatiblePackages'][0]
            package.update(packageName='nl.rtl.videoland.v2', name='Videoland' if index == 0 else 'Videoland Android TV',
                           formFactor='MOBILE' if index == 0 else 'TV')
        text = self.module.render_home_apps(data, 'en')
        self.assertEqual(text.count('<article '), 2)
        self.assertIn('(apps/videoland.md)', text)
        self.assertIn('(apps/videoland-android-tv.md)', text)

    def test_home_escapes_metadata_and_does_not_turn_universal_patches_into_apps(self):
        data = fixture()
        data['patches'][0]['name'] = '<script>alert("x")</script>'
        data['patches'].append({'name': 'Universal', 'compatiblePackages': None})
        text = self.module.render_home_apps(data, 'en')
        self.assertNotIn('<script>', text)
        self.assertIn('&lt;script&gt;', text)
        self.assertEqual(text.count('<article '), 1)

    def test_home_covers_every_current_target_with_local_guide_links(self):
        data = json.loads((ROOT / 'patches-list.json').read_text())
        original = json.dumps(data, sort_keys=True)
        targets = {self.module.app_page(package)[0]
                   for patch in data['patches'] for package in patch.get('compatiblePackages') or []}
        self.assertTrue({'podimo', 'bright', 'medium'} <= targets)
        unmapped = {package['packageName'] for patch in data['patches']
                    for package in patch.get('compatiblePackages') or []
                    if self.module.app_page(package)[0] is None}
        self.assertEqual(unmapped, set())
        for language in ('nl', 'en'):
            text = self.module.render_home_apps(data, language)
            self.assertEqual(text.count('<article '), len(targets))
            for slug in targets - {None}:
                self.assertIn(f'(apps/{slug}.md)', text)
        self.assertEqual(json.dumps(data, sort_keys=True), original)

    def test_generator_preserves_home_prose_and_detects_stale_metadata(self):
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
            data = fixture()
            data['version'] = '3.2.2'
            metadata.write_text(json.dumps(data))
            result = subprocess.run([sys.executable, str(script), '--check'], capture_output=True, text=True)
            self.assertEqual(result.returncode, 1)
            self.assertIn('en/index.md', result.stderr)
            self.assertIn('en/reference/catalogue.md', result.stderr)


if __name__ == '__main__':
    unittest.main()
