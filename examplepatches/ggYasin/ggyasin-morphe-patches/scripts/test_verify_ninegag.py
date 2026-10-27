#!/usr/bin/env python3
"""Unit regressions for the real-APK verifier's XML comparison."""
import unittest
import xml.etree.ElementTree as ET
from verify_ninegag import canonical


class CanonicalXmlTests(unittest.TestCase):
    def test_inline_text_tail_change_is_detected(self):
        original = ET.fromstring('<string>Read <b>this</b> safe</string>')
        changed = ET.fromstring('<string>Read <b>this</b> CHANGED</string>')
        self.assertNotEqual(canonical(original), canonical(changed))

    def test_formatting_only_tail_whitespace_is_ignored(self):
        original = ET.fromstring('<resources><string name="x">value</string></resources>')
        formatted = ET.fromstring('<resources>\n  <string name="x">value</string>\n</resources>')
        self.assertEqual(canonical(original), canonical(formatted))


if __name__ == '__main__':
    unittest.main()
