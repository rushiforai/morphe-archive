"""Adversarial controls for the independent Medium artifact verifier."""
import copy
import json
import os
from pathlib import Path
import unittest

from atv_smali import classes, class_methods, graph
from verify_medium import (TRACKING, PROMOTIONS, READER, WEB_CLIENTS, replacements,
                           insertions, verify_methods, wrappers)

SELECTED = {TRACKING, PROMOTIONS, READER}


class MediumVerifierTests(unittest.TestCase):
    def test_empty_or_missing_selected_inventory_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'Empty'):
            verify_methods({}, {}, set())
        before = {'Laccount;->login()V': graph('.locals 0\nreturn-void')}
        with self.assertRaisesRegex(AssertionError, 'Missing Medium effect'):
            verify_methods(before, before, {TRACKING})

    def test_unselected_original_methods_are_preserved(self):
        before = {'Laccount;->login()V': graph('.locals 0\nreturn-void')}
        self.assertEqual(verify_methods(before, before, set()), 1)
        after = {'Laccount;->login()V': graph('.locals 0\nnop\nreturn-void')}
        with self.assertRaisesRegex(AssertionError, 'changed original'):
            verify_methods(before, after, set())

    def test_injected_unowned_method_is_rejected(self):
        before = {'Laccount;->login()V': graph('.locals 0\nreturn-void')}
        after = before | {'Laccount;->exfiltrate()V': graph('.locals 0\nreturn-void')}
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_methods(before, after, set())


@unittest.skipUnless(os.environ.get('MEDIUM_ORIGINAL') and os.environ.get('MEDIUM_COMBINED'),
                     'Provide independently decoded publisher and combined Medium APKs')
class MediumArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        contracts = json.loads(Path(__file__).with_name('medium_original_contracts.json').read_text())
        owners = {key.split('->')[0] for key in contracts} | set(WEB_CLIENTS)
        cls.before, cls.after = {}, {}
        for env, destination in [('MEDIUM_ORIGINAL', cls.before), ('MEDIUM_COMBINED', cls.after)]:
            decoded = classes(os.environ[env])
            for owner in owners:
                destination.update(class_methods(decoded[owner]))

    def test_all_selected_effects_and_original_tails(self):
        verify_methods(self.before, self.after, SELECTED)

    def test_removing_each_replacement_or_insertion_is_rejected(self):
        for key in replacements(SELECTED).keys() | insertions(SELECTED).keys():
            with self.subTest(key=key):
                altered = self.after | {key: self.before[key]}
                with self.assertRaisesRegex(AssertionError, 'Incorrect Medium effect'):
                    verify_methods(self.before, altered, SELECTED)

    def test_same_size_original_mutation_is_rejected(self):
        for key in replacements(SELECTED).keys() | insertions(SELECTED).keys():
            with self.subTest(key=key):
                changed = list(self.before[key])
                changed[1] = 'nop' if changed[1] != 'nop' else 'return-void'
                with self.assertRaisesRegex(AssertionError, 'original contract'):
                    verify_methods(self.before | {key: changed}, self.after, SELECTED)

    def test_renamed_original_tails_and_wrapper_delegation_are_required(self):
        renamed, added = wrappers(self.before, SELECTED)
        for key in renamed.keys() | added.keys():
            with self.subTest(key=key):
                changed = copy.deepcopy(self.after[key])
                changed[-1] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'Incorrect Medium effect'):
                    verify_methods(self.before, self.after | {key: changed}, SELECTED)

    def test_selection_isolation(self):
        for selected in [{TRACKING}, {PROMOTIONS}, {READER}, set()]:
            with self.subTest(selected=selected), self.assertRaises(AssertionError):
                verify_methods(self.before, self.after, selected)


if __name__ == '__main__':
    unittest.main()
