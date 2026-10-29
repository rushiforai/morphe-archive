"""RTL collection policy, retained components and bundled executable/config assets."""
import hashlib
import xml.etree.ElementTree as ET

from rtl_resource_contracts import ORIGINAL_METADATA, RETAINED_COMPONENTS, ASSETS
from rtl_expert_contracts import EXPERT_COMPONENTS
from verify_dumpert import xml_digest

A = '{http://schemas.android.com/apk/res/android}'
METADATA = {'firebase_analytics_collection_deactivated': True,
            'firebase_analytics_collection_enabled': False,
            'google_analytics_adid_collection_enabled': False,
            'google_analytics_automatic_screen_reporting_enabled': False,
            'firebase_crashlytics_collection_enabled': False,
            'firebase_performance_collection_deactivated': True,
            'firebase_performance_collection_enabled': False,
            'firebase_performance_logcat_enabled': False,
            'firebase_sessions_enabled': False,
            'delivery_metrics_exported_to_big_query_enabled': False}
PERMISSIONS = {'com.google.android.gms.permission.AD_ID',
               'android.permission.ACCESS_ADSERVICES_AD_ID',
               'android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
               'android.permission.ACCESS_ADSERVICES_TOPICS',
               'android.permission.AD_SERVICES_CONFIG'}


def verify_resources(root, tracking, expert=False):
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    app = manifest.find('application')
    metadata = {n.get(A + 'name'): n.get(A + 'value') for n in app.findall('meta-data')}
    expected = {name: str(value).lower() for name, value in METADATA.items()} if tracking else ORIGINAL_METADATA
    for name in METADATA:
        assert metadata.get(name) == expected.get(name), 'RTL collection metadata: ' + name
    assert metadata.get('firebase_messaging_auto_init_enabled') == ('false' if expert else None), 'Expert FCM automatic registration default'
    permissions = {n.get(A + 'name') for n in manifest.findall('uses-permission')}
    assert (permissions & PERMISSIONS) == (set() if tracking else PERMISSIONS), 'RTL optional ad permissions'
    for tag, name, digest in RETAINED_COMPONENTS:
        nodes = [n for n in app.findall(tag) if n.get(A + 'name') == name]
        assert len(nodes) == 1, 'Unique RTL initialized component: ' + name
        if expert and (tag, name) in EXPERT_COMPONENTS:
            assert nodes[0].get(A + 'enabled') == 'false', 'Expert push component disabled: ' + name
            del nodes[0].attrib[A + 'enabled']
        assert xml_digest(nodes[0]) == digest, 'Retain RTL initialized component: ' + name
    actual_assets = {str(p.relative_to(root)) for p in (root / 'assets').rglob('*')
                     if p.is_file() and 'dexopt' not in p.parts}
    assert actual_assets == {name for name, _ in ASSETS}, 'RTL asset inventory'
    for name, digest in ASSETS:
        assert hashlib.sha256((root / name).read_bytes()).hexdigest() == digest, 'Retain RTL media/config asset: ' + name
