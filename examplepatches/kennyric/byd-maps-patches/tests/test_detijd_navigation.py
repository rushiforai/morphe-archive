"""Exercise emitted-byte navigation and Moments gates, including unselected behavior."""
import json
from pathlib import Path
import unittest

from detijd_navigation import verify_account_tabs, verify_moments_gate
from detijd_shortcuts import verify_newspaper_shortcut
from detijd_shortcuts import OFFSET as SHORTCUT_OFFSET

EDITS = json.loads(Path(__file__).with_name('detijd_hermes_edits.json').read_text())


def model_image(function_id, selected):
    row = next(x for x in EDITS if x['id'] == function_id)
    prefix = bytes.fromhex(row['after' if selected else 'before'] + row['modeled_original_tail'])
    data = bytearray(row['offset'] + len(prefix))
    data[row['offset']:] = prefix
    return data


class DeTijdNavigationTests(unittest.TestCase):
    def test_newspaper_shortcut_is_removed_without_blank_slots_or_other_card_changes(self):
        for selected in (False, True):
            with self.subTest(hidden=selected):
                self.assertEqual(verify_newspaper_shortcut(model_image(33434, selected), selected), 4)

    def test_newspaper_shortcut_removal_rejects_a_blank_first_slot(self):
        data = model_image(33434, True)
        data[SHORTCUT_OFFSET + 189] = 1
        with self.assertRaisesRegex(AssertionError, 'No blank shortcut slots'):
            verify_newspaper_shortcut(data, True)

    def test_mijn_tijd_filter_preserves_other_tabs_indexes_and_weekend_labels(self):
        for selected in (False, True):
            with self.subTest(expert=selected):
                self.assertEqual(verify_account_tabs(model_image(33218, selected), selected), 504)

    def test_anonymous_moments_feed_preserves_empty_and_weekend_paths(self):
        for selected in (False, True):
            with self.subTest(reading=selected):
                self.assertEqual(verify_moments_gate(model_image(23982, selected), selected), 16)

    def test_wrong_hidden_tab_is_rejected(self):
        data = model_image(33218, True)
        data[7114322 + 80:7114322 + 82] = (34803).to_bytes(2, 'little')
        with self.assertRaises(AssertionError):
            verify_account_tabs(data, True)


if __name__ == '__main__':
    unittest.main()
