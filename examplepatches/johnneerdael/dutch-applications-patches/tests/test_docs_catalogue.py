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


class ReadmeSummaryTests(unittest.TestCase):
    def generate(self, marker):
        with tempfile.TemporaryDirectory() as folder:
            directory = Path(folder)
            source = directory / 'patches.json'
            readme = directory / 'README.md'
            source.write_text(json.dumps(fixture()))
            readme.write_text(f'Header remains\n{marker}\nstale\n<!-- PATCHES_END -->\nFooter remains\n')
            result = subprocess.run([sys.executable, str(ROOT / '.github/scripts/generate_patches_readme.py'),
                                     'owner/repository', 'main', str(source), str(readme)],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertEqual(json.loads(source.read_text()), fixture())
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
            self.assertEqual(text.count('<article '), 17)
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


if __name__ == '__main__':
    unittest.main()
