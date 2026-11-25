"""Mutating the actual filter output must fail independent verification."""
import os
import unittest
from atv_smali import methods
from verify_videoland_atv import verify_methods, UNAVAILABLE_CONTRACTS, declaration_shape


class DeclarationTests(unittest.TestCase):
    def test_only_equivalent_encoded_defaults_normalize(self):
        self.assertEqual(declaration_shape('.field public static flag:Z = false'), declaration_shape('.field public static flag:Z'))
        self.assertNotEqual(declaration_shape('.field public static flag:Z = true'), declaration_shape('.field public static flag:Z'))
        self.assertNotEqual(declaration_shape('.field public source:Lraw;'), declaration_shape('.field public source:Lchanged;'))


@unittest.skipUnless(os.environ.get('VIDEOLAND_ORIGINAL') and os.environ.get('VIDEOLAND_UNAVAILABLE'),
                     'Set original and unavailable decoded roots')
class UnavailableArtifactTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.before = methods(os.environ['VIDEOLAND_ORIGINAL'])
        cls.after = methods(os.environ['VIDEOLAND_UNAVAILABLE'])
        cls.hooks = [c['owner'] + '->' + c['signature'] for c in UNAVAILABLE_CONTRACTS]

    def test_every_original_method_preserved_except_owned_hooks(self):
        self.assertEqual(verify_methods(self.before, self.after, False, False, unavailable=True), 140770)

    def test_helpers_rejected_without_selection(self):
        with self.assertRaises(AssertionError):
            verify_methods(self.before, self.after, False, False)

    def test_changed_hook_and_original_branch_rejected(self):
        for key in self.hooks:
            with self.subTest(key=key):
                changed = dict(self.after)
                changed[key] = list(changed[key])
                changed[key][1] = 'nop'
                with self.assertRaisesRegex(AssertionError, 'availability effect'):
                    verify_methods(self.before, changed, False, False, unavailable=True)

    def test_compose_guard_wrong_cleanup_branch_rejected(self):
        for contract in UNAVAILABLE_CONTRACTS:
            if contract['kind'] != 'compose_empty':
                continue
            key = contract['owner'] + '->' + contract['signature']
            changed = dict(self.after)
            changed[key] = list(changed[key])
            index = contract['insertion'] + 3
            changed[key][index] = changed[key][index].split('@')[0] + '@1'
            with self.assertRaisesRegex(AssertionError, 'availability effect'):
                verify_methods(self.before, changed, False, False, unavailable=True)

    def test_unrelated_method_change_rejected(self):
        key = next(k for k in self.before if k not in self.hooks and len(self.before[k]) > 2)
        changed = dict(self.after)
        changed[key] = changed[key] + ['nop']
        with self.assertRaisesRegex(AssertionError, 'Unrelated'):
            verify_methods(self.before, changed, False, False, unavailable=True)

    def test_changed_helper_effect_rejected(self):
        key = 'Lpatches/videoland/Availability;->keep(Ljava/lang/Object;)Z'
        changed = dict(self.after)
        changed[key] = list(changed[key])
        changed[key][1] = 'nop'
        with self.assertRaisesRegex(AssertionError, 'helper effect'):
            verify_methods(self.before, changed, False, False, unavailable=True)

    def test_stub_or_additional_method_rejected(self):
        changed = dict(self.after)
        changed['Lstub;->wrong()V'] = ['.locals 0', 'return-void']
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_methods(self.before, changed, False, False, unavailable=True)


if __name__ == '__main__':
    unittest.main()
