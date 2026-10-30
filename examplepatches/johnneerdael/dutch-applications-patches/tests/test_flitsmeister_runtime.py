"""Keep the manifest oracle strict across decoder hex formatting changes."""
import unittest
from xml.etree import ElementTree as ET

from verify_flitsmeister import xml_digest


MANIFEST = '''<manifest xmlns:android="http://schemas.android.com/apk/res/android">
<uses-feature android:glEsVersion="0x00020000" android:required="true"/>
<uses-feature android:name="android.hardware.vulkan.version" android:version="0x00400003" android:required="false"/>
<application/></manifest>'''
EXPECTED_DIGEST = '73fad414238c9fb34fe777ca12d25912640e2e572a72804c90872b1485386f1d'


class ManifestNumericContractTests(unittest.TestCase):
    def test_equivalent_decoder_hex_width_preserves_feature_contract(self):
        padded = ET.fromstring(MANIFEST)
        compact = ET.fromstring(MANIFEST.replace('0x00020000', '0x20000').replace('0x00400003', '0x400003'))
        self.assertEqual(xml_digest(padded), EXPECTED_DIGEST)
        self.assertEqual(xml_digest(compact), EXPECTED_DIGEST)

    def test_feature_value_change_is_still_detected(self):
        changed = MANIFEST.replace('0x00020000', '0x00030000')
        self.assertNotEqual(xml_digest(ET.fromstring(MANIFEST)), xml_digest(ET.fromstring(changed)))

    def test_feature_requirement_change_is_still_detected(self):
        changed = MANIFEST.replace('required="true"', 'required="false"')
        self.assertNotEqual(xml_digest(ET.fromstring(MANIFEST)), xml_digest(ET.fromstring(changed)))

    def test_removed_feature_is_still_detected(self):
        changed = ET.fromstring(MANIFEST)
        changed.remove(changed.find('uses-feature'))
        self.assertNotEqual(xml_digest(ET.fromstring(MANIFEST)), xml_digest(changed))


class LayoutDimensionContractTests(unittest.TestCase):
    def layout(self, dimension='fill_parent', text='fixture'):
        return ET.fromstring('<View xmlns:android="http://schemas.android.com/apk/res/android" '
                             f'android:layout_width="{dimension}" android:layout_height="{dimension}" '
                             f'android:text="{text}"/>')

    def test_equivalent_parent_dimension_alias_preserves_layout(self):
        self.assertEqual(xml_digest(self.layout()), xml_digest(self.layout('match_parent')))

    def test_different_dimension_still_changes_contract(self):
        self.assertNotEqual(xml_digest(self.layout()), xml_digest(self.layout('wrap_content')))

    def test_text_is_not_treated_as_a_dimension_alias(self):
        self.assertNotEqual(xml_digest(self.layout(text='fill_parent')),
                            xml_digest(self.layout(text='match_parent')))
