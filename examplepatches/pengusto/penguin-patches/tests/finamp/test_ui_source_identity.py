"""Old native evidence cannot be labelled with the updated source matrix."""
import unittest

from ui_fixes_acceptance import native_profile


class CaptureIdentityTests(unittest.TestCase):
    def test_earlier_native_report_cannot_claim_the_reviewed_source(self):
        matrix = {'masks': {'32': {'commit': 'reviewed-final-source'}}}
        old = {'masks': {'32': {'source': 'earlier-source', 'native_sha256': 'old-native'}}}
        with self.assertRaisesRegex(ValueError, 'source differs'):
            native_profile(matrix, 32, old)
        current = {'masks': {'32': {'source': 'reviewed-final-source', 'native_sha256': 'new-native'}}}
        self.assertEqual(native_profile(matrix, 32, current), ('new-native', 'reviewed-final-source'))
