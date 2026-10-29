"""Failure fixtures for tracking edit ownership, routes and native fatal status."""
import unittest

from rtl_tracking_effects import CCT_GATE, CONSENT_PREFIX, restore_tracking
from rtl_tracking_effects import restore_switch_padding


class RtlTrackingEditsTest(unittest.TestCase):
    def test_switch_alignment_restores_only_terminal_padding_and_payload_address(self):
        body = '''
            packed-switch p0, :data
            return-void
            :case
            return-void
            :data
            .packed-switch 0x0
                :case
            .end packed-switch
        '''
        from verify_dumpert import canonicalize
        code = restore_switch_padding(body, canonicalize(body), 4, 0)
        self.assertEqual(code, ['packed-switch p0, @4', 'return-void', 'return-void', 'nop'])
        with self.assertRaisesRegex(AssertionError, 'alignment'):
            restore_switch_padding(body, canonicalize(body), 5, 0)

    def test_cct_preserves_incoming_gate_anchor_and_rebases_later_targets(self):
        code = ['nop'] * 107 + CCT_GATE + ['move-object v0, v6', 'return-void', 'return-void']
        code[5], code[6] = 'goto @107', 'goto @117'
        code[7] = 'const-string v1, "literal @117"'
        restored, position = restore_tracking('\n'.join(code), 'Lgcd;', 'a(Lpm0;I)V', 46, True, False)
        self.assertEqual(restored[5:8], ['goto @107', 'goto @109', 'const-string v1, "literal @117"'])
        self.assertEqual(restored[107], 'move-object v0, v6')
        self.assertEqual(position(117), 109)
        with self.assertRaisesRegex(AssertionError, 'gate interior'):
            position(111)

    def test_missing_fatal_reset_cannot_pass_as_delivery_success(self):
        code = ['nop'] * 107 + CCT_GATE + ['move-object v0, v6']
        code[112] = 'const/4 v0, 0x1'
        with self.assertRaisesRegex(AssertionError, 'complete post-metrics CCT gate'):
            restore_tracking('\n'.join(code), 'Lgcd;', 'a(Lpm0;I)V', 46, True, False)

    def test_automatic_privacy_prefix_is_selected_independently(self):
        body = '\n'.join(CONSENT_PREFIX + ['return-void'])
        code, position = restore_tracking(body, 'Lkc2;', 'd(Landroidx/fragment/app/s;Z)V', 6, True, True)
        self.assertEqual(code, ['return-void'])
        self.assertEqual(position(9), 0)
        untouched, _ = restore_tracking(body, 'Lkc2;', 'd(Landroidx/fragment/app/s;Z)V', 6, True, False)
        self.assertEqual(untouched, CONSENT_PREFIX + ['return-void'])
