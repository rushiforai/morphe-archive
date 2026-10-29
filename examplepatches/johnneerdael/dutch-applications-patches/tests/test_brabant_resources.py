"""Manifest proof retains functional state outside explicit policy/packaging edits."""
import unittest
import xml.etree.ElementTree as ET
from brabant_resources import manifest_digest


class BrabantResourceTests(unittest.TestCase):
    def test_packaging_and_measurement_flags_do_not_mask_functional_state(self):
        original = ET.fromstring('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app">
            <application><service android:name="app.Push" android:enabled="true" /></application>
        </manifest>''')
        selected = ET.fromstring('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app" android:splitTypes="">
            <application><service android:name="app.Push" android:enabled="true" />
            <meta-data android:name="firebase_analytics_collection_enabled" android:value="false" />
            </application></manifest>''')
        self.assertEqual(manifest_digest(original), manifest_digest(selected))
        selected.find('application/service').set('{http://schemas.android.com/apk/res/android}enabled', 'false')
        self.assertNotEqual(manifest_digest(original), manifest_digest(selected))

    def test_unexpected_permission_removal_is_detected(self):
        original = ET.fromstring('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app">
            <uses-permission android:name="android.permission.POST_NOTIFICATIONS" /><application />
        </manifest>''')
        selected = ET.fromstring('<manifest package="app"><application /></manifest>')
        self.assertNotEqual(manifest_digest(original), manifest_digest(selected))
