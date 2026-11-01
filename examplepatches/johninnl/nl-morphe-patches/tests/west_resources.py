"""West original manifest, executable assets and installed native split payloads."""
import hashlib
import xml.etree.ElementTree as ET

from brabant_resources import FLAGS, PERMISSIONS, COMPONENT_ENABLED, manifest_digest as common_manifest_digest

A = '{http://schemas.android.com/apk/res/android}'


def manifest_digest(root):
    # Base-only apktool decoding prints @null for this density-split resource.
    # Both original/output binary manifests reference exactly 0x7f080321; the
    # original xxxhdpi split names that ID drawable/ic_notification. Normalize
    # only those two proven symbol-resolution differences, never other values.
    icons = {'com.google.firebase.messaging.default_notification_icon': 'value',
             'androidx.media3.session.MediaNotification.SmallIcon': 'resource'}
    for node in root.findall('application/meta-data'):
        name = node.get(A + 'name')
        if name in icons:
            attribute = A + icons[name]
            assert node.get(attribute) in {'@null', '@drawable/ic_notification'}, 'West notification icon changed'
            node.set(attribute, '@null')
    return common_manifest_digest(root)

BASE_SHA256 = '03763df28de7dbdf39e8b2018c4b4850788ab9865e6c55f48d3167bf8783c02f'
ORIGINAL_FLAGS = {'firebase_analytics_collection_enabled': 'false', 'delivery_metrics_exported_to_big_query_enabled': 'true'}
MANIFEST_SHA256 = 'ca8a1b61fb749fb92ad8c0dfe2b8d99ac2d8f22241a81074e07224539219e4e8'
ASSETS = {'assets/blank.mp3': '31f6ce047962f58d1a2817565159dd865db9cb2422208b0a1610d99c9f8c1fff', 'assets/omsdk-v1.js': '8ad3d79d11dbf5bc19d8e7959234cd89937bb7ec3c00f0fb66a796d5d0456ff0', 'assets/margins.js': '89467058cf1e93f890f3ff02025dc9dbe114997b509ee3b6936a67c091b82b7f', 'assets/ad.html': '3d21709aae93a6714b8144923ae45ace4887f02900c932ef7f0b0074e8762d8c', 'assets/gambling.js': '2658645bd7c9651497695495ca278331bf7ab0ea5f526b428b381532bacf64f4', 'assets/dexopt/baseline.profm': '2129282389542ae9e147179dcf7ebeff9d582cf6e4a95eb18437b1a4ade97f17', 'assets/dexopt/baseline.prof': '9b2a8cc06d6e84ab295b363a2720d0725f26fd81cbd74c0fac51a8e716eb0428'}
NATIVE_LIBRARIES = {'lib/arm64-v8a/libandroidx.graphics.path.so': '41e9a793c43a0f4fddb19e33f346bace464f30f888ba7b9eaf96294ea115bfb6', 'lib/arm64-v8a/libdatastore_shared_counter.so': 'd3e48717c9aa147e0ab21063ba0e8e0211cabf8bf40b222640829519edbf58e1', 'lib/arm64-v8a/libsqliteJni.so': '65f87fcc609bf2af4bcf13035ad0b4a4a095d96c4bd96735f80f699f7474772c'}


def verify_resources(root, ads, tracking):
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'nl.omroepwest.android', 'West package identity'
    app = manifest.find('application')
    for name, value in FLAGS.items():
        nodes = [n for n in app.findall('meta-data') if n.get(A + 'name') == name]
        expected = value if tracking else ORIGINAL_FLAGS.get(name)
        assert len(nodes) == int(expected is not None), 'West collection flag presence: ' + name
        if nodes:
            assert nodes[0].get(A + 'value') == expected, 'West collection flag value: ' + name
    for permission in PERMISSIONS:
        nodes = [n for n in manifest.findall('uses-permission') if n.get(A + 'name') == permission]
        assert len(nodes) == int(not tracking), 'West optional advertising permission: ' + permission
    for (tag, name), enabled in COMPONENT_ENABLED.items():
        nodes = [n for n in app.findall(tag) if n.get(A + 'name') == name]
        assert len(nodes) == 1, 'West ad component declaration: ' + name
        assert nodes[0].get(A + 'enabled') == ('false' if ads else enabled), 'West ad component state: ' + name
    assert manifest_digest(manifest) == MANIFEST_SHA256, 'West retained functional manifest'
    assert {str(p.relative_to(root)) for p in (root / 'assets').rglob('*') if p.is_file()} == set(ASSETS), 'West asset inventory'
    for name, expected in ASSETS.items():
        assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected, 'West retained asset: ' + name
    actual_libs = {str(p.relative_to(root)) for p in (root / 'lib').rglob('*') if p.is_file()}
    # The untouched base has no libraries; FULL APKS output must carry the native split.
    if ads:
        assert actual_libs == set(NATIVE_LIBRARIES), 'West complete merged native split'
    for name in actual_libs:
        assert name in NATIVE_LIBRARIES and hashlib.sha256((root / name).read_bytes()).hexdigest() == NATIVE_LIBRARIES[name], 'West retained native library: ' + name
