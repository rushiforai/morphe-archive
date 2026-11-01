"""Portable negative checks for the emitted listening guard verifier."""
import unittest

from ad_onboarding import parse
from hln_listening import RENDERER, array_payloads, original_body


class HlnListeningTests(unittest.TestCase):
    def test_array_data_values_are_not_lost_in_control_flow_pins(self):
        text = ':data\n.array-data 1\n 0x1t\n -0x1t\n.end array-data\n'
        self.assertEqual(array_payloads(text), [[1, ['0x1t', '-0x1t']]])
        self.assertNotEqual(array_payloads(text), array_payloads(text.replace('0x1t', '0x2t')))

    def renderer(self, prefix=''):
        return parse('.method public static final ' + RENDERER[1] + '\n.locals 20\n' + prefix +
                     'const/4 v0, 0x1\nreturn-void\n.end method', RENDERER[1])

    def test_loading_returns_and_populated_history_retains_original_body(self):
        original = self.renderer()
        guarded = self.renderer('if-eqz p4, :original\nreturn-void\n:original\n')
        self.assertEqual(original_body(guarded, True), original.canonical())
        self.assertNotEqual(original_body(guarded, False), original.canonical())

    def test_wrong_flag_reversed_branch_and_skipped_original_are_rejected(self):
        for prefix in ['if-eqz p2, :original\nreturn-void\n:original\n',
                       'if-nez p4, :original\nreturn-void\n:original\n',
                       'if-eqz p4, :original\n:original\nreturn-void\n']:
            with self.subTest(prefix=prefix), self.assertRaises(AssertionError):
                original_body(self.renderer(prefix), True)
