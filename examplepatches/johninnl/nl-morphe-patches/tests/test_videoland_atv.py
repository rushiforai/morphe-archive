"""Regression tests for the independent whole-method preservation verifier."""
import unittest
import copy
import os
from atv_smali import methods
from verify_videoland_atv import SUBSCRIPTION_CONTRACTS
import xml.etree.ElementTree as ET

from atv_smali import graph
from verify_videoland_atv import (A, MERGE_METADATA, config_code, remove_insertion,
                                  verify_manifest, verify_methods)


class VideolandVerifierTests(unittest.TestCase):
    def test_subscription_selection_requires_routing_contracts(self):
        import inspect
        self.assertIn("subscription", inspect.signature(verify_methods).parameters)
        with self.assertRaisesRegex(AssertionError, "contracts"):
            verify_methods({"Ltest;->a()V": []}, {"Ltest;->a()V": []}, False, False, subscription=True)

    def test_empty_inventory_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_methods({}, {}, True, True)

    def test_missing_selected_contracts_are_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'contracts'):
            verify_methods({'Ltest;->a()V': []}, {'Ltest;->a()V': []}, True, True)

    def test_preserves_catch_and_branch_targets(self):
        original = graph('.locals 1\n:try\nconst/4 v0, 0x0\nif-eqz v0, :end\n:end\nreturn v0\n.catchall {:try .. :end} :end')
        emitted = graph('.locals 1\nconst/4 v0, 0x0\nreturn v0\n:try\nconst/4 v0, 0x0\nif-eqz v0, :end\n:end\nreturn v0\n.catchall {:try .. :end} :end')
        self.assertEqual(remove_insertion(emitted, 1, 2), original)

    def test_unknown_method_edits_are_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'Unrelated'):
            verify_methods({'Ltest;->a()V': graph('.locals 0\nreturn-void')},
                           {'Ltest;->a()V': graph('.locals 0\nnop\nreturn-void')}, False, False)

    def test_new_methods_are_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_methods({}, {'Ltest;->a()V': []}, True, True)

    def test_config_known_unknown_and_null_keys(self):
        # Interpret the actual expected Dalvik guard, stopping at the original body.
        program = graph(config_code())
        def execute(key):
            value, pc = None, 0
            while pc < len(program):
                line = program[pc]
                if line.startswith('const-string '):
                    value = line.split('"')[1]
                elif line.startswith('invoke-virtual '):
                    value = value == key
                elif line.startswith('if-nez ') and value:
                    pc = int(line.split('@')[1])
                    continue
                elif line.startswith('goto '):
                    pc = int(line.split('@')[1])
                    continue
                elif line.startswith('const/4 '):
                    value = False
                elif line.startswith('return '):
                    return value
                pc += 1
            return 'delegate'
        for key in ('activateTealium', 'playerNPAWv7Enabled', 'playerSnowplowMediaTrackingEnabled'):
            self.assertIs(execute(key), False)
        for key in (None, '', 'playerHeartbeatEnabled', 'playerAdsLoaderEnabled', 'ActivateTealium'):
            self.assertEqual(execute(key), 'delegate')

    def test_manifest_rejects_unowned_root_component_and_metadata_changes(self):
        original = ET.Element('manifest', {A + 'requiredSplitTypes': 'base__abi,base__density', A + 'splitTypes': ''})
        app = ET.SubElement(original, 'application', {A + 'name': 'TestApp'})
        for name in MERGE_METADATA:
            ET.SubElement(app, 'meta-data', {A + 'name': name, A + 'value': 'original'})
        ET.SubElement(app, 'activity', {A + 'name': 'Player', A + 'exported': 'false'})
        ET.SubElement(app, 'meta-data', {A + 'name': 'functional-setting', A + 'value': 'true'})
        merged = copy.deepcopy(original)
        del merged.attrib[A + 'requiredSplitTypes']
        del merged.attrib[A + 'splitTypes']
        merged_app = merged.find('application')
        for node in list(merged_app.findall('meta-data')):
            if node.get(A + 'name') in MERGE_METADATA:
                merged_app.remove(node)
        verify_manifest(original, merged, False)
        for mutate in (lambda root: root.set('package', 'changed'),
                       lambda root: root.find('application/activity').set(A + 'exported', 'true'),
                       lambda root: root.find('application/meta-data').set(A + 'value', 'false')):
            broken = copy.deepcopy(merged)
            mutate(broken)
            with self.assertRaisesRegex(AssertionError, 'Manifest changed'):
                verify_manifest(original, broken, False)



@unittest.skipUnless(os.environ.get('VIDEOLAND_ORIGINAL') and os.environ.get('VIDEOLAND_SUBSCRIPTION'),
                     'Provide independently decoded original and subscription candidate roots')
class VideolandSubscriptionArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.before = methods(os.environ['VIDEOLAND_ORIGINAL'])
        cls.after = methods(os.environ['VIDEOLAND_SUBSCRIPTION'])
        cls.keys = [c['owner'] + '->' + c['signature'] for c in SUBSCRIPTION_CONTRACTS]

    def test_actual_candidate_preserves_all_original_methods(self):
        self.assertEqual(verify_methods(self.before, self.after, False, False, True), 140770)

    def test_subscription_effects_rejected_when_unselected(self):
        with self.assertRaisesRegex(AssertionError, 'Unrelated'):
            verify_methods(self.before, self.after, False, False)

    def test_wrong_insertion_or_branch_destination_rejected(self):
        for key, index in ((self.keys[0], 2), (self.keys[1], 115)):
            with self.subTest(key=key):
                changed = dict(self.after)
                changed[key] = list(changed[key])
                changed[key][index] = changed[key][index].split('@')[0] + '@1'
                with self.assertRaisesRegex(AssertionError, 'subscription effect'):
                    verify_methods(self.before, changed, False, False, True)

    def test_accessor_and_same_count_original_seam_changes_rejected(self):
        for key, index in ((self.keys[2], 1), (self.keys[1], 114)):
            with self.subTest(key=key):
                before = dict(self.before)
                before[key] = list(before[key])
                before[key][index] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'original subscription contract'):
                    verify_methods(before, self.after, False, False, True)

    def test_account_and_drm_mutations_rejected(self):
        for fragment in ('/WidevineDrmTodayMediaDrmCallback;', 'Lei/a;->invokeSuspend'):
            key = next(k for k, rows in self.after.items() if fragment in k and len(rows) > 2)
            with self.subTest(key=key):
                changed = dict(self.after)
                changed[key] = list(changed[key])
                changed[key][1] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'Unrelated'):
                    verify_methods(self.before, changed, False, False, True)

    def test_missing_routing_method_rejected(self):
        before, after = dict(self.before), dict(self.after)
        del before[self.keys[1]]
        del after[self.keys[1]]
        with self.assertRaisesRegex(AssertionError, 'contracts'):
            verify_methods(before, after, False, False, True)

if __name__ == '__main__':
    unittest.main()
