"""Only FCM measurement regions; functional messaging methods stay original."""
from tvgids_sdk_contracts import SDK_TARGETS

FIREBASE_EDITS = []
for name, replacement in {
    'fcm_export': ['const/4 v0, 0x0', 'return v0'],
    'fcm_eligible': ['const/4 v0, 0x0', 'return v0'],
    'fcm_received': ['return-void'],
    'fcm_scion': ['return-void'],
    'fcm_opened': ['return-void'],
}.items():
    owner, signature = SDK_TARGETS[name]
    FIREBASE_EDITS.append(dict(owner=owner, signature=signature, index=0, original=[], replacement=replacement))
FIREBASE_EDITS.append(dict(owner='Lpu1;', signature='run()V', index=85, original=[], replacement=['const/4 p0, 0x0']))


def restore_firebase_resources(manifest):
    ns = '{http://schemas.android.com/apk/res/android}'
    name = 'delivery_metrics_exported_to_big_query_enabled'
    app = manifest.find('application')
    matches = [m for m in app.findall('meta-data') if m.get(ns+'name') == name]
    assert len(matches) == 1 and matches[0].get(ns+'value') == 'false', 'Missing FCM export policy flag'
    app.remove(matches[0])
