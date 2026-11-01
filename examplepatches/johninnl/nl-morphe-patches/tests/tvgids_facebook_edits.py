"""Owned Facebook regions/resources, retaining SDK core and auth declarations."""
import xml.etree.ElementTree as ET
from tvgids_sdk_contracts import SDK_TARGETS

FB_EDITS = []
for name, replacement in {
    'fb_adid': ['const/4 v0, 0x0', 'return v0'],
    'fb_auto': ['const/4 v0, 0x0', 'return v0'],
    'fb_auto_remote': ['const/4 v0, 0x0', 'return v0'],
    'fb_guid': ['const-string v0, ""', 'return-object v0'],
    'fb_events': ['return-void'], 'fb_timers': ['return-void'],
    'fb_flush_job': ['return-void'], 'fb_flush': ['return-void'],
    'fb_send': ['const/4 v0, 0x0', 'return-object v0'], 'fb_install': ['return-void'],
}.items():
    owner, signature = SDK_TARGETS[name]
    FB_EDITS.append(dict(owner=owner, signature=signature, index=0, original=[], replacement=replacement))
for index, target in ((138, 145), (160, 170)):
    FB_EDITS.append(dict(owner='Lxn1;', signature='run()V', index=index, original=[], replacement=['goto/32 @'+str(target)]))

REMOVED_PERMISSIONS = [(7, {'{http://schemas.android.com/apk/res/android}name': 'com.google.android.gms.permission.AD_ID'}),
 (9, {'{http://schemas.android.com/apk/res/android}name': 'android.permission.ACCESS_ADSERVICES_ATTRIBUTION'}),
 (10, {'{http://schemas.android.com/apk/res/android}name': 'android.permission.ACCESS_ADSERVICES_AD_ID'}),
 (15, {'{http://schemas.android.com/apk/res/android}name': 'android.permission.ACCESS_ADSERVICES_TOPICS'}),
 (16, {'{http://schemas.android.com/apk/res/android}name': 'android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE'})]


def restore_facebook_resources(manifest):
    ns = '{http://schemas.android.com/apk/res/android}'
    app = manifest.find('application')
    for name in ('com.facebook.sdk.AutoLogAppEventsEnabled', 'com.facebook.sdk.AdvertiserIDCollectionEnabled'):
        matches = [m for m in app.findall('meta-data') if m.get(ns+'name') == name]
        assert len(matches) == 1 and matches[0].get(ns+'value') == 'false', 'Missing Facebook policy flag'
        app.remove(matches[0])
    names = {attrs[ns+'name'] for _, attrs in REMOVED_PERMISSIONS}
    assert not any(p.get(ns+'name') in names for p in manifest.findall('uses-permission')), 'Advertising permission remains'
    for index, attrs in REMOVED_PERMISSIONS:
        manifest.insert(index, ET.Element('uses-permission', attrs))
