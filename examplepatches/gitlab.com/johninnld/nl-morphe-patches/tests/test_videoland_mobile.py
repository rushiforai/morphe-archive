"""Adversarial tests for the independent mobile artifact verifier."""
import copy
import os
import re
import unittest

from pathlib import Path
from atv_smali import class_methods, graph
from verify_videoland import CONTRACTS, CONFIG_KEYS, config_code, verify_methods
from verify_videoland_atv import remove_insertion


class VideolandMobileTests(unittest.TestCase):
    def test_empty_inventory_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_methods({}, {}, True, True)

    def test_unrelated_drm_edit_rejected(self):
        before = {'Ldrm;->license()V': graph('.locals 0\nreturn-void')}
        after = copy.deepcopy(before)
        after['Ldrm;->license()V'].insert(1, 'nop')
        with self.assertRaisesRegex(AssertionError, 'Unrelated'):
            verify_methods(before, after, False, False)

    def test_missing_boundary_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'contracts'):
            verify_methods({'Ldrm;->license()V': []}, {'Ldrm;->license()V': []}, True, True)

    def test_config_guard_preserves_unknown_and_null_keys(self):
        code = graph(config_code())
        def execute(key):
            pc, value = 0, None
            while pc < len(code):
                row = code[pc]
                if row.startswith('const-string '): value = row.split('"')[1]
                elif row.startswith('invoke-virtual '): value = value == key
                elif row.startswith('if-nez ') and value:
                    pc = int(row.split('@')[1]); continue
                elif row.startswith('goto '):
                    pc = int(row.split('@')[1]); continue
                elif row.startswith('const/4 '): value = False
                elif row.startswith('return '): return value
                pc += 1
            return 'delegate'
        for key in CONFIG_KEYS: self.assertIs(execute(key), False)
        for key in (None, '', 'playerPictureInPictureEnabled', 'playerHeartbeatEnabled', 'playerAdsLoaderEnabled'):
            self.assertEqual(execute(key), 'delegate')

    def test_original_branch_and_catch_destinations_preserved(self):
        before = graph('.locals 1\n:start\nconst/4 v0, 0x0\nif-eqz v0, :end\n:end\nreturn v0\n.catchall {:start .. :end} :end')
        after = graph('.locals 1\nconst/4 v0, 0x0\nreturn v0\n:start\nconst/4 v0, 0x0\nif-eqz v0, :end\n:end\nreturn v0\n.catchall {:start .. :end} :end')
        self.assertEqual(remove_insertion(after, 1, 2), before)


@unittest.skipUnless(os.environ.get('VIDEOLAND_MOBILE_ORIGINAL') and os.environ.get('VIDEOLAND_MOBILE_COMBINED'),
                     'Provide independently decoded original and combined APK roots')
class VideolandMobileArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.before, cls.after = {}, {}
        for contract in CONTRACTS:
            owner = contract['owner'][1:-1]
            # APKTool may add a path suffix for case-insensitive macOS filesystems.
            for env, destination in [('VIDEOLAND_MOBILE_ORIGINAL', cls.before),
                                     ('VIDEOLAND_MOBILE_COMBINED', cls.after)]:
                root = Path(os.environ[env])
                package, leaf = owner.rsplit('/', 1)
                candidates = list(root.glob('smali*/' + owner + '*.smali'))
                candidates += list(root.glob('smali*/' + package + '.*/' + leaf + '*.smali'))
                matches = [path for path in set(candidates)
                           if re.search(r'^\.class[^\n]* (L[^;]+;)', path.read_text(), re.M)[1] == contract['owner']]
                assert len(matches) == 1, owner
                destination.update(class_methods(matches[0]))

    def test_real_selected_contracts_match(self):
        verify_methods(self.before, self.after, True, True)

    def test_effect_removal_rejected_for_every_boundary(self):
        for contract in CONTRACTS:
            key = contract['owner'] + '->' + contract['signature']
            with self.subTest(key=key):
                after = dict(self.after)
                after[key] = self.before[key]
                with self.assertRaisesRegex(AssertionError, 'effect'):
                    verify_methods(self.before, after, True, True)

    def test_same_size_original_mutations_rejected(self):
        for contract in CONTRACTS:
            key = contract['owner'] + '->' + contract['signature']
            with self.subTest(key=key):
                before = dict(self.before)
                before[key] = list(before[key])
                before[key][1] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'original contract'):
                    verify_methods(before, self.after, True, True)

    def test_selection_isolation_rejected(self):
        for ads, tracking in ((True, False), (False, True), (False, False)):
            with self.subTest(ads=ads, tracking=tracking):
                with self.assertRaisesRegex(AssertionError, 'Unrelated'):
                    verify_methods(self.before, self.after, ads, tracking)

    def test_join_editorial_and_explicit_feedback_are_preserved(self):
        keys = [key for key in self.before
                if (key.startswith('Lhv/h;->') and key.split('->')[1][0] in ('a', 'b', 'e', 'f'))
                or ('Lcom/usabilla/sdk/ubform/Usabilla;->' in key and
                    key.split('->')[1].startswith(('initialize(', 'loadFeedbackForm(', 'updateFragmentManager(')))]
        self.assertEqual(len(keys), 7)
        for key in keys:
            with self.subTest(key=key):
                self.assertEqual(self.before[key], self.after[key])
                after = dict(self.after)
                after[key] = list(after[key])
                after[key][1] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'Unrelated'):
                    verify_methods(self.before, after, True, True)


if __name__ == '__main__':
    unittest.main()
