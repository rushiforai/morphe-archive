"""Observed Manager error formats must still name an actually selected patch."""
import unittest

from manager_fault import selected_failure


class SelectedFailureTests(unittest.TestCase):
    def test_legacy_dialog(self):
        self.assertEqual(selected_failure(['Failed to apply Song artist order'], ['Song artist order']),
                         'Song artist order')

    def test_diagnostics_table(self):
        labels = ['Diagnostics', 'Patches', '1', 'Failed patch', 'Fix track alphabet navigation',
                  'Source', 'Penguin Patches 1.2.0-candidate', 'Error log', 'Patching failed', 'Close']
        self.assertEqual(selected_failure(labels, ['Fix track alphabet navigation']), 'Fix track alphabet navigation')

    def test_unknown_or_unselected_is_not_attribution(self):
        for name in ['Unknown', 'Song artist order']:
            with self.subTest(name=name), self.assertRaises(AssertionError):
                selected_failure(['Failed patch', name], ['Fix track alphabet navigation'])

    def test_conflicting_formats_fail_closed(self):
        with self.assertRaises(AssertionError):
            selected_failure(['Failed patch', 'Song artist order', 'Failed to apply Fix track alphabet navigation'],
                             ['Song artist order', 'Fix track alphabet navigation'])
