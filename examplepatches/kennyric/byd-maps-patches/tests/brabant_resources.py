"""Original manifest and asset retention, excluding only declared policy edits."""
import hashlib
import json
import xml.etree.ElementTree as ET

FLAGS = {'firebase_analytics_collection_deactivated': 'true', 'firebase_analytics_collection_enabled': 'false', 'google_analytics_adid_collection_enabled': 'false', 'google_analytics_automatic_screen_reporting_enabled': 'false', 'firebase_crashlytics_collection_enabled': 'false', 'firebase_performance_collection_deactivated': 'true', 'firebase_performance_collection_enabled': 'false', 'firebase_performance_logcat_enabled': 'false', 'firebase_sessions_enabled': 'false', 'delivery_metrics_exported_to_big_query_enabled': 'false'}

PERMISSIONS = {'android.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_AD_ID', 'android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE', 'android.permission.AD_SERVICES_CONFIG', 'android.permission.ACCESS_ADSERVICES_TOPICS', 'android.permission.ACCESS_ADSERVICES_ATTRIBUTION', 'com.google.android.gms.permission.AD_ID'}

COMPONENT_ENABLED = {('service', 'com.startapp.sdk.cachedservice.BackgroundService'): None, ('service', 'com.startapp.sdk.jobs.SchedulerService'): None, ('receiver', 'com.startapp.sdk.adsbase.remoteconfig.BootCompleteListener'): None}

MANIFEST_SHA256 = '1d8ec1d5b4a75612dead5e446eab12ed1fec810196b60bc7ef41d5bf6eb50d9c'

ASSETS = {'assets/PublicSuffixDatabase.list': 'c75ab827afd7ffff59a51b14729c25dbfc3b45237eb40ccf02bec7b7d44304a4', 'assets/ad.html': '3d21709aae93a6714b8144923ae45ace4887f02900c932ef7f0b0074e8762d8c', 'assets/blank.mp3': '31f6ce047962f58d1a2817565159dd865db9cb2422208b0a1610d99c9f8c1fff', 'assets/dark.css': '724b7d66b7117b59efd9ea3acbe6e7dcac574b4472648f38f8bc3d929c4b5e01', 'assets/darkmode.css': '4ea0616fb048a1eb606d8b30651bd778b4db02e17c36f4bf17f4a4fb57f71f96', 'assets/dexopt/baseline.prof': 'f27d0aed01dc50dddb7d6e8af1b13d55e503cfaa2dfefc77ed1f8a11c4562447', 'assets/dexopt/baseline.profm': '5e4c9097ebd6c227e708e127b1bc5ac9a2bb4ef5d4ef01770407fd9b96702fdb', 'assets/gambling.js': '2658645bd7c9651497695495ca278331bf7ab0ea5f526b428b381532bacf64f4', 'assets/liveramp_configuration.json': 'dddaef2a211914a43976e05e894666fefd28941b95b9af90432cca09e1339288', 'assets/margins.js': '89467058cf1e93f890f3ff02025dc9dbe114997b509ee3b6936a67c091b82b7f', 'assets/omsdk-v1.js': '8ad3d79d11dbf5bc19d8e7959234cd89937bb7ec3c00f0fb66a796d5d0456ff0', 'assets/web.css': 'f7640305a2e60276bf3126a8ddaf6d8d22949afef8ec57f883dc43cdbb404225'}

def manifest_digest(root):
    android = '{http://schemas.android.com/apk/res/android}'
    # FULL APKS merging removes these two split declarations and five Play
    # packaging/stamp entries. They do not represent app privacy choices.
    for key in ('requiredSplitTypes', 'splitTypes'):
        root.attrib.pop(android + key, None)
    packaging = {'com.android.vending.splits.required', 'com.android.stamp.source',
                 'com.android.stamp.type', 'com.android.vending.splits', 'com.android.vending.derived.apk.id'}
    app = root.find('application')
    for node in list(app):
        name = node.get(android + 'name')
        if node.tag == 'meta-data' and name in set(FLAGS) | packaging:
            app.remove(node)
        if (node.tag, name) in COMPONENT_ENABLED:
            value = COMPONENT_ENABLED[node.tag, name]
            if value is None: node.attrib.pop(android + 'enabled', None)
            else: node.set(android + 'enabled', value)
    for node in list(root):
        if node.tag == 'uses-permission' and node.get(android + 'name') in PERMISSIONS:
            root.remove(node)
    def tree(node):
        return node.tag, sorted(node.attrib.items()), (node.text or '').strip(), [tree(child) for child in node]
    return hashlib.sha256(json.dumps(tree(root), separators=(',', ':')).encode()).hexdigest()


def verify_resources(root, ads, tracking):
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    android = '{http://schemas.android.com/apk/res/android}'
    app = manifest.find('application')
    for name, expected in FLAGS.items():
        matches = [n for n in app.findall('meta-data') if n.get(android + 'name') == name]
        assert len(matches) == int(tracking), 'Brabant measurement resource selection: ' + name
        if tracking: assert matches[0].get(android + 'value') == expected, 'Brabant measurement value: ' + name
    for name in PERMISSIONS:
        matches = [n for n in manifest.findall('uses-permission') if n.get(android + 'name') == name]
        assert len(matches) == int(not tracking), 'Brabant advertising permission: ' + name
    for (tag, name), enabled in COMPONENT_ENABLED.items():
        matches = [n for n in app.findall(tag) if n.get(android + 'name') == name]
        assert len(matches) == 1 and matches[0].get(android + 'enabled') == ('false' if ads else enabled), 'Brabant ad component: ' + name
    assert manifest_digest(manifest) == MANIFEST_SHA256, 'Brabant retained functional manifest'
    for name, expected in ASSETS.items():
        assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected, 'Brabant retained bundled asset: ' + name
