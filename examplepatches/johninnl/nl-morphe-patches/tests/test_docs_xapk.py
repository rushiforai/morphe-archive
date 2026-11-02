"""Keep complete XAPK targets representable in both public app guides."""
import importlib.util
from pathlib import Path
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'scripts'))
spec = importlib.util.spec_from_file_location('app_pages_xapk', ROOT / 'scripts/check_docs_app_pages.py')
checker = importlib.util.module_from_spec(spec)
spec.loader.exec_module(checker)


class XapkGuideTests(unittest.TestCase):
    def test_complete_local_xapk_guide_matches_its_target_in_both_languages(self):
        url = '../guides/downloads.md#local-original-inputs'
        apps = {'2dehands': {Path('metadata.json'): {'targets': {
            ('16.19.0', '633464'): {'input': 'XAPK', 'controls': {'Hide ads': True}}}}}}
        downloads = {'2dehands': {'url': url, 'version': '16.19.0', 'build': '633464'}}
        for language, metadata, table in [
            ('en', '**App version:** 16.19.0 · **Build:** 633464 · **Original file:** XAPK',
             '| Patch | Default | What it does |\n| --- | --- | --- |\n| **Hide ads** | On | Removes ads. |'),
            ('nl', '**Appversie:** 16.19.0 · **Build:** 633464 · **Origineel bestand:** XAPK',
             '| Patch | Standaard | Wat verandert er? |\n| --- | --- | --- |\n| **Hide ads** | Aan | Verwijdert advertenties. |'),
        ]:
            with self.subTest(language=language), tempfile.TemporaryDirectory() as scratch:
                page = Path(scratch) / '2dehands.md'
                page.write_text(f'# 2dehands\n\n{metadata}\n\n[Original]({url})\n\n## Patches\n\n{table}\n')
                self.assertEqual(checker.check_page(page, language, apps, downloads), [])


if __name__ == '__main__':
    unittest.main()
