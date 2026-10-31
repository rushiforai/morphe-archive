"""Check app pages can describe original inputs without inventing a download."""
import importlib.util
import json
from pathlib import Path
import re
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('app_pages', ROOT / 'scripts/check_docs_app_pages.py')
pages = importlib.util.module_from_spec(spec)
spec.loader.exec_module(pages)


class LocalOriginalInputTests(unittest.TestCase):
    def test_downloads_row_resolves_the_local_anchor_for_page_comparison(self):
        with tempfile.TemporaryDirectory() as temporary:
            site = Path(temporary)
            guide = site / 'en/guides/downloads.md'
            guide.parent.mkdir(parents=True)
            guide.write_text('| [Test app](../apps/test-app.md)<br>1.0 · build 1 · **Pre-release** | [Use your own APKS](#local-original-inputs) |\n')
            with patch.object(pages, 'SITE', site):
                self.assertEqual(pages.downloads('en'), {
                    'test-app': ('../guides/downloads.md#local-original-inputs', True)})

    def test_local_original_link_is_validated_in_both_languages(self):
        metadata = ROOT / 'patches-list.json'
        apps = pages.load_apps([metadata])
        for language, label in [('en', 'Use your own'), ('nl', 'Gebruik je eigen')]:
            with self.subTest(language=language), tempfile.TemporaryDirectory() as temporary:
                fixture = ROOT / f'docs/site/{language}/apps/trouw.md'
                text = fixture.read_text()
                text = re.sub(r'\[Download [^\]]+\]\(https://buzzheavier.com/[^)]+\)\{[^}]+\}',
                              f'[{label} APKS](../guides/downloads.md#local-original-inputs){{ .md-button }}', text)
                target = Path(temporary) / 'trouw.md'
                target.write_text(text)
                rows = {'trouw': ('../guides/downloads.md#local-original-inputs', False)}
                self.assertEqual(pages.check_page(target, language, apps, rows, None, None), [])
                errors = pages.check_page(target, language, apps, {}, None, None)
                self.assertTrue(any('downloads guide row' in error for error in errors), errors)

    def test_local_button_still_has_to_match_metadata_input_type(self):
        with tempfile.TemporaryDirectory() as temporary:
            text = (ROOT / 'docs/site/en/apps/trouw.md').read_text()
            text = re.sub(r'\[Download [^\]]+\]\(https://buzzheavier.com/[^)]+\)\{[^}]+\}',
                          '[Use your own APK](../guides/downloads.md#local-original-inputs){ .md-button }', text)
            target = Path(temporary) / 'trouw.md'
            target.write_text(text)
            errors = pages.check_page(target, 'en', pages.load_apps([ROOT / 'patches-list.json']),
                                      {'trouw': ('../guides/downloads.md#local-original-inputs', False)}, None, None)
            self.assertIn('metadata input type and download button disagree', errors)


class TargetScopedControlTests(unittest.TestCase):
    def test_phone_page_does_not_inherit_tv_only_controls(self):
        with tempfile.TemporaryDirectory() as temporary:
            meta = Path(temporary) / 'patches-list.json'
            def cp(version, code, factor):
                return {'packageName': 'example.same.package', 'apkFileType': 'APKS', 'formFactor': factor,
                        'targets': [{'version': version, 'versionCodes': {'ALL': code}}]}
            meta.write_text(json.dumps({'patches': [
                {'name': 'Hide ads', 'compatiblePackages': [cp('1.0', 100, 'MOBILE'), cp('2.0', 200, 'TV')]},
                {'name': 'Disable tracking', 'compatiblePackages': [cp('1.0', 100, 'MOBILE'), cp('2.0', 200, 'TV')]},
                {'name': 'Hide unavailable content', 'compatiblePackages': [cp('2.0', 200, 'TV')]},
            ]}))
            entry = pages.load_apps([meta])['example.same.package'][meta]
            self.assertEqual(entry['controls_by_target'][('1.0', '100')], {'Hide ads', 'Disable tracking'})
            self.assertEqual(entry['controls_by_target'][('2.0', '200')],
                             {'Hide ads', 'Disable tracking', 'Hide unavailable content'})

            text = (ROOT / 'docs/site/en/apps/trouw.md').read_text()
            text = re.sub(r'^\*\*Supported app:.*$', '**Supported app:** 1.0 · **Build:** 100 · **Input:** APKS', text, count=1, flags=re.M)
            text = re.sub(r'^`[^`]+`$', '`example.same.package`', text, count=1, flags=re.M)
            text = re.sub(r'(## Available controls\n\n)[^\n]+', r'\1Disable tracking, Hide ads.', text)
            page = Path(temporary) / 'test-app.md'; page.write_text(text)
            button = re.search(pages.LANG['en']['button'], text)
            rows = {'test-app': (button['url'], False)}
            self.assertEqual(pages.check_page(page, 'en', pages.load_apps([meta]), rows, None, None), [])
