import copy
import unittest
import xml.etree.ElementTree as ET
from npo_manifest import A, AD_PERMISSIONS, FLAGS, PERFORMANCE_PROVIDER, verify_manifest


class ManifestContractTests(unittest.TestCase):
    def setUp(self):
        self.before = ET.Element('manifest')
        for permission in AD_PERMISSIONS | {'android.permission.INTERNET'}:
            ET.SubElement(self.before, 'uses-permission', {A + 'name': permission})
        app = ET.SubElement(self.before, 'application')
        for kind, name in [('provider', PERFORMANCE_PROVIDER), ('provider', 'test.AuthenticationProvider'),
                           ('activity', 'test.Player'), ('service', 'test.MediaService'),
                           ('receiver', 'test.NetworkReceiver')]:
            ET.SubElement(app, kind, {A + 'name': name, A + 'exported': 'false'})
        self.after = copy.deepcopy(self.before)
        for node in list(self.after):
            if node.tag == 'uses-permission' and node.get(A + 'name') in AD_PERMISSIONS:
                self.after.remove(node)
        app = self.after.find('application')
        for node in list(app):
            if node.get(A + 'name') == PERFORMANCE_PROVIDER:
                app.remove(node)
        for key, value in FLAGS.items():
            ET.SubElement(app, 'meta-data', {A + 'name': key, A + 'value': value})

    def test_only_optional_performance_provider_and_ad_permissions_are_removed(self):
        verify_manifest(self.before, self.after)

    def test_authentication_provider_removal_is_rejected(self):
        app = self.after.find('application')
        app.remove(app.find('provider'))
        with self.assertRaises(AssertionError):
            verify_manifest(self.before, self.after)

    def test_removed_functional_permission_is_rejected(self):
        self.after.remove(self.after.find('uses-permission'))
        with self.assertRaises(AssertionError):
            verify_manifest(self.before, self.after)

    def test_changed_media_service_is_rejected(self):
        self.after.find('application/service').set(A + 'exported', 'true')
        with self.assertRaises(AssertionError):
            verify_manifest(self.before, self.after)

    def test_enabled_measurement_flag_is_rejected(self):
        self.after.find('application/meta-data').set(A + 'value', 'true')
        with self.assertRaises(AssertionError):
            verify_manifest(self.before, self.after)
