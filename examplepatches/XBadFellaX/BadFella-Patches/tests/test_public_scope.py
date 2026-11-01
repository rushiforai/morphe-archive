"""The public source contains only its supported app modules."""
import json
from pathlib import Path
import unittest

class PublicScopeTests(unittest.TestCase):
    def test_public_modules_and_catalog(self):
        root = Path(__file__).resolve().parents[1]
        modules = root / 'patches/src/main/kotlin/app/badfella/patches'
        self.assertEqual({p.name for p in modules.iterdir() if p.is_dir()},
                         {'ticktick', 'emby', 'remoteatv', 'peptalk', 'wanderlog'})
        catalog = json.loads((root / 'patches-list.json').read_text())
        self.assertEqual(len(catalog['patches']), 9)
        self.assertEqual({c['packageName'] for p in catalog['patches'] for c in p['compatiblePackages']},
                         {'com.ticktick.task', 'com.mb.android', 'tech.simha.androidtvremote',
                          'com.peptalk.app', 'com.wanderlog.android'})
