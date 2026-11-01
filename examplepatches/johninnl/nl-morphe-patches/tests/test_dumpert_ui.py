import unittest

from verify_dumpert import absolute_registers
from verify_dumpert_ui import UI_EDITS, restore_ui, verify_ui_resources


class DumpertUiVerificationTest(unittest.TestCase):
    def fixture(self, policy):
        code = ['unchanged'] * (max(UI_EDITS[policy]) + 1)
        for position, (_, selected) in UI_EDITS[policy].items():
            code[position] = selected
        return code

    def test_restores_exact_display_footprint_without_mutating_input(self):
        for policy in UI_EDITS:
            code = self.fixture(policy)
            result = restore_ui(code, policy, 69, absolute_registers)
            for i, line in enumerate(result):
                self.assertEqual(line, UI_EDITS[policy][i][0] if i in UI_EDITS[policy] else 'unchanged')
            self.assertEqual(code, self.fixture(policy))

    def test_rejects_old_free_label_and_wrong_resource_owner_or_register(self):
        for policy, edits in UI_EDITS.items():
            for position, (original, selected) in edits.items():
                code = self.fixture(policy)
                for bad in {original, selected.replace('v1', 'v2').replace('v7', 'v8'),
                            selected.replace('Lnl/livewall/dumpert/R$string;', 'Lnl/livewall/dumpert/premium/R$string;')} - {selected}:
                    code[position] = bad
                    with self.assertRaisesRegex(AssertionError, 'Missing .* display change'):
                        restore_ui(code, policy, 69, absolute_registers)

    def test_accepts_equivalent_parameter_aliases(self):
        code = self.fixture('AD_UI_HEADER')
        code[234] = code[234].replace('v7', 'p0')
        restore_ui(code, 'AD_UI_HEADER', 7, absolute_registers)

    def test_resource_fields_allow_patcher_removing_final(self):
        class Resources:
            def text(self, owner):
                return ('.field public static purchase_screen_title:I = 0x7f120395\n'
                        '.field public static premium_account:I = 0x7f12038b\n')
        verify_ui_resources(Resources())


if __name__ == '__main__':
    unittest.main()
