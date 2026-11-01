"""Keep density-split symbol normalization narrower than functional changes."""
import unittest
import xml.etree.ElementTree as ET

from west_resources import A, manifest_digest


class WestResourceTests(unittest.TestCase):
    def manifest(self, reference):
        root = ET.Element('manifest', {'package': 'nl.omroepwest.android'})
        app = ET.SubElement(root, 'application')
        ET.SubElement(app, 'meta-data', {A + 'name': 'com.google.firebase.messaging.default_notification_icon',
                                       A + 'value': reference})
        ET.SubElement(app, 'meta-data', {A + 'name': 'androidx.media3.session.MediaNotification.SmallIcon',
                                       A + 'resource': reference})
        ET.SubElement(app, 'service', {A + 'name': 'nl.stichtingrpo.news.tv_radio.audio_player.AudioPlayerService'})
        return root

    def test_full_split_resolution_preserves_both_original_icon_references(self):
        self.assertEqual(manifest_digest(self.manifest('@null')),
                         manifest_digest(self.manifest('@drawable/ic_notification')))

    def test_another_icon_or_a_functional_service_change_is_rejected(self):
        with self.assertRaisesRegex(AssertionError, 'notification icon changed'):
            manifest_digest(self.manifest('@drawable/some_other_icon'))
        changed = self.manifest('@drawable/ic_notification')
        changed.find('application/service').set(A + 'enabled', 'false')
        self.assertNotEqual(manifest_digest(self.manifest('@null')), manifest_digest(changed))
