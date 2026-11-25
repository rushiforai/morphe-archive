"""Protect functional components and exact captured NPO startup constants."""
import copy
from pathlib import Path
import tempfile
import unittest
import xml.etree.ElementTree as ET

from npo_manifest import A, AD_PERMISSIONS, FLAGS, PERFORMANCE_PROVIDER
from verify_npo import startup_constants, verify_manifest


class NpoOutputTests(unittest.TestCase):
    def test_publisher_capture_counts_and_reflective_descriptors(self):
        for phone, strings, methods in [(False, 1437, 9), (True, 1494, 10)]:
            captured = startup_constants(phone)
            self.assertEqual(len(captured['strings']), 32)
            self.assertEqual(sum(map(len, captured['strings'].values())), strings)
            self.assertEqual(len(captured['methods']), methods)
            for method in captured['methods'].values():
                self.assertTrue(method['helper'].startswith(('nl.', 'net.')))
                self.assertNotIn(';', method['helper'])
                self.assertIn(method['name'], {'onCreate', 'onStart', 'onResume', 'onPause', 'onStop', 'onDestroy', 'onStartCommand'})

    def manifests(self):
        before = ET.Element('manifest', {A + 'requiredSplitTypes': 'base__abi', A + 'splitTypes': ''})
        ET.SubElement(before, 'uses-sdk', {A + 'minSdkVersion': '29'})
        for name in sorted(AD_PERMISSIONS):
            ET.SubElement(before, 'uses-permission', {A + 'name': name})
        app = ET.SubElement(before, 'application')
        ET.SubElement(app, 'service', {A + 'name': 'functional.MediaSessionService', A + 'exported': 'false'})
        ET.SubElement(app, 'provider', {A + 'name': PERFORMANCE_PROVIDER})
        after = copy.deepcopy(before)
        after.attrib.clear()
        for node in list(after.findall('uses-permission')):
            after.remove(node)
        app = after.find('application')
        app.remove(app.find('provider'))
        for name, value in FLAGS.items():
            ET.SubElement(app, 'meta-data', {A + 'name': name, A + 'value': value})
        return before, after

    def test_all_privacy_effects_preserve_sdk_and_functional_components(self):
        before, after = self.manifests()
        verify_manifest(before, after, True)
        self.assertEqual(after.find('uses-sdk').get(A + 'minSdkVersion'), '29')

    def test_functional_component_sdk_permission_and_flag_mutations_rejected(self):
        before, after = self.manifests()
        mutations = []
        changed = copy.deepcopy(after)
        changed.find('application/service').set(A + 'exported', 'true')
        mutations.append(changed)
        changed = copy.deepcopy(after)
        changed.find('uses-sdk').set(A + 'minSdkVersion', '24')
        mutations.append(changed)
        changed = copy.deepcopy(after)
        ET.SubElement(changed, 'uses-permission', {A + 'name': 'com.google.android.gms.permission.AD_ID'})
        mutations.append(changed)
        changed = copy.deepcopy(after)
        changed.find('application/meta-data').set(A + 'value', 'true')
        mutations.append(changed)
        for changed in mutations:
            with self.assertRaisesRegex(AssertionError, 'outside selected'):
                verify_manifest(before, changed, True)

    def test_unselected_privacy_effects_rejected(self):
        before, after = self.manifests()
        with self.assertRaisesRegex(AssertionError, 'outside selected'):
            verify_manifest(before, after, False)

    def test_generated_resource_alias_retains_exact_numeric_identity(self):
        before, after = self.manifests()
        before.find('application').set(A + 'fullBackupContent', '@xml/backup_rules')
        after.find('application').set(A + 'fullBackupContent', '@xml/xml_0x7f160000')
        with tempfile.TemporaryDirectory() as scratch:
            roots = [Path(scratch) / 'before', Path(scratch) / 'after']
            for root, name in zip(roots, ['backup_rules', 'xml_0x7f160000']):
                (root / 'res/values').mkdir(parents=True)
                (root / 'res/values/public.xml').write_text(
                    f'<resources><public type="xml" name="{name}" id="0x7f160000"/></resources>')
            verify_manifest(before, after, True, *roots)
            (roots[1] / 'res/values/public.xml').write_text(
                '<resources><public type="xml" name="xml_0x7f160000" id="0x7f160001"/></resources>')
            with self.assertRaisesRegex(AssertionError, 'outside selected'):
                verify_manifest(before, after, True, *roots)


if __name__ == '__main__':
    unittest.main()
