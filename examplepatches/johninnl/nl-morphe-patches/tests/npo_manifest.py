"""Check privacy flags while preserving every functional Android component."""
from pathlib import Path
import xml.etree.ElementTree as ET

A = '{http://schemas.android.com/apk/res/android}'
AD_PERMISSIONS = {'com.google.android.gms.permission.AD_ID', 'android.permission.ACCESS_ADSERVICES_AD_ID',
                  'android.permission.ACCESS_ADSERVICES_ATTRIBUTION', 'android.permission.AD_SERVICES_CONFIG'}
PERFORMANCE_PROVIDER = 'io.sentry.android.core.SentryPerformanceProvider'
FLAGS = {'io.sentry.auto-init': 'false', 'firebase_analytics_collection_deactivated': 'true',
         'firebase_analytics_collection_enabled': 'false', 'google_analytics_adid_collection_enabled': 'false',
         'firebase_crashlytics_collection_enabled': 'false', 'firebase_performance_collection_deactivated': 'true',
         'firebase_sessions_enabled': 'false', 'delivery_metrics_exported_to_big_query_enabled': 'false'}


def load_manifest(root):
    decoded = Path(root) / 'AndroidManifest.decoded.xml'
    source = decoded if decoded.exists() else Path(root) / 'AndroidManifest.xml'
    try:
        return ET.parse(source).getroot()
    except ET.ParseError as error:
        raise AssertionError('Need decoded manifest XML: use apktool --only-manifest and save '
                             'AndroidManifest.decoded.xml beside the decoded classes') from error


def digest(node):
    return node.tag, tuple(sorted(node.attrib.items())), tuple(digest(child) for child in node)


def verify_manifest(before, after):
    def permissions(root):
        return {n.get(A + 'name') for n in root.findall('uses-permission')}
    assert AD_PERMISSIONS <= permissions(before), 'Original advertising permission inventory changed'
    assert permissions(after) == permissions(before) - AD_PERMISSIONS, 'Privacy permission contract changed'
    original, patched = before.find('application'), after.find('application')
    assert original is not None and patched is not None
    def components(app):
        return {(n.tag, n.get(A + 'name')): digest(n) for n in app
                if n.tag in {'provider', 'activity', 'activity-alias', 'service', 'receiver'}}
    expected = components(original)
    assert expected.pop(('provider', PERFORMANCE_PROVIDER), None) is not None
    assert components(patched) == expected, 'Functional Android component declaration changed'
    metadata = {}
    for node in patched.findall('meta-data'):
        name = node.get(A + 'name')
        assert name not in metadata, 'Duplicate manifest metadata: ' + str(name)
        metadata[name] = node.get(A + 'value')
    for key, value in FLAGS.items():
        assert metadata.get(key) == value, 'Missing privacy metadata: ' + key
