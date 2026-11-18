#!/usr/bin/env python3
"""Run the real plist/import code with KXML and cross-check exports with plistlib."""
from pathlib import Path
from datetime import datetime
import os
import plistlib
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
EXT = ROOT / 'extensions/extension/src/main/java'
JDK = Path(os.environ.get('JDK', '/usr/lib/jvm/java-17-openjdk-amd64'))
ANDROID = Path(os.environ.get('ANDROID_JAR', str(Path.home() / 'Android/Sdk/platforms/android-36/android.jar')))
sources = sorted((Path.home() / 'Android/Sdk/sources').glob('android-*/com/android/internal/util/FastXmlSerializer.java'))
SERIALIZER = Path(os.environ['ANDROID_SERIALIZER']) if 'ANDROID_SERIALIZER' in os.environ else (sources[-1] if sources else None)
if SERIALIZER is None or not SERIALIZER.is_file():
    raise SystemExit('Install Android SDK sources or set ANDROID_SERIALIZER to its FastXmlSerializer.java for persistence checks.')
cached = sorted((Path.home() / '.gradle/caches/modules-2/files-2.1/net.sf.kxml/kxml2').glob('*/*/kxml2-*.jar'))
KXML = Path(os.environ['KXML_JAR']) if 'KXML_JAR' in os.environ else (cached[-1] if cached else None)
if KXML is None or not KXML.is_file():
    raise SystemExit('Set KXML_JAR to kxml2 (the Android XML pull parser) to run these tests.')

def archive(channels, binary=True):
    gray = 'UIWhite' in channels
    color = {'$class': plistlib.UID(2) if binary else {'CF$UID': 2}, 'NSColorSpace': 3 if gray else 2, 'UIColorComponentCount': 2 if gray else 4, **channels}
    root = {'$archiver': 'NSKeyedArchiver', '$version': 100000,
            '$objects': ['$null', color, {'$classes': ['UIColor', 'NSObject'], '$classname': 'UIColor'}],
            '$top': {'root': plistlib.UID(1) if binary else {'CF$UID': 1}}}
    return plistlib.dumps(root, fmt=plistlib.FMT_BINARY if binary else plistlib.FMT_XML)

def binary_objects(objects):
    data = bytearray(b'bplist00'); offsets = []
    for value in objects:
        offsets.append(len(data)); data.extend(value)
    table = len(data)
    width = max(1, (table.bit_length() + 7) // 8)
    for offset in offsets: data.extend(offset.to_bytes(width, 'big'))
    data.extend(b'\0' * 6 + bytes([width, 1]) + len(objects).to_bytes(8, 'big') + (0).to_bytes(8, 'big') + table.to_bytes(8, 'big'))
    return bytes(data)

with tempfile.TemporaryDirectory(prefix='afterglow-preferences-test-') as directory:
    temp = Path(directory)
    theme = {'format': 'YTAfterglowTheme', 'version': 1, 'identifier': 'custom-transfer-fixture',
             'name': 'Transfer 🌙', 'colors': {'background': [.25, .5, .75, .5], 'primaryText': [1., 1., 1., 1.]}}
    preferences = {'advancedMode': True, 'hideShortsPlayerLayer': True, 'negative': -42,
                   'precise': .123456789012345, 'big': 2**63 + 17,
                   'unicode': 'café 🌙 & <test>\r\n' * 20,
                   'theme_background': archive({'UIRed': .25, 'UIGreen': .5, 'UIBlue': .75, 'UIAlpha': .5}),
                   'theme_glowColor': archive({'UIWhite': .18, 'UIAlpha': .5}, False),
                   'activeTabs': ['FEwhat_to_watch', 'FEshorts', 'FElibrary'],
                   'theme_savedThemes': [theme],
                   'theme_semanticTheme': {'version': 1, 'identifier': 'custom-transfer-fixture', 'name': 'Transfer 🌙',
                                           'colors': {'elevatedSurface': [.1, .2, .3, 1.]},
                                           'legacySnapshot': {'theme_background': [.25, .5, .75, .5]}},
                   'unknownDate': datetime(2026, 11, 14, 12, 34, 56), 'unknownBlob': bytes(range(256)),
                   'unknownNested': {'list': [True, 8, 1.25, datetime(2025, 1, 2), b'opaque']}}
    payload = {'format': 'YTAfterglowPreferences', 'version': 1, 'exportedAt': 0., 'preferences': preferences}
    for name, fmt in [('xml', plistlib.FMT_XML), ('binary', plistlib.FMT_BINARY)]:
        (temp / ('input-' + name + '.plist')).write_bytes(plistlib.dumps(payload, fmt=fmt))
    for name, data in {
        'empty': b'', 'truncated': b'<plist><dict><key>x</key>',
        'duplicate': b'<plist><dict><key>x</key><true/><key>x</key><false/></dict></plist>',
        'dangling': b'<plist><dict><key>x</key></dict></plist>',
        'extra-root': b'<plist><dict/></plist><dict/>',
        'bad-data': b'<plist><dict><key>x</key><data>!!!!</data></dict></plist>',
        'unknown-tag': b'<plist><dict><key>x</key><surprise/></dict></plist>',
        'non-dict': b'<plist><array/></plist>',
        'missing-preferences': b'<plist><dict><key>format</key><string>YTAfterglowPreferences</string></dict></plist>',
        'external-entity': ('<!DOCTYPE plist [<!ENTITY leak SYSTEM "file://' + str(temp / 'canary.txt') + '">]><plist><dict><key>x</key><string>&leak;</string></dict></plist>').encode(),
        'deep': b'<plist>' + b'<array>' * 40 + b'<true/>' + b'</array>' * 40 + b'</plist>',
        'binary-truncated': (temp / 'input-binary.plist').read_bytes()[:-10],
    }.items():
        (temp / ('invalid-' + name + '.plist')).write_bytes(data)
    (temp / 'canary.txt').write_text('MUST NOT BE IMPORTED')
    for name, objects in {
        'cycle': [b'\xa1\x00'], 'reference': [b'\xa1\x01'], 'unicode': [b'\x61\xd8\x00'],
        'nonstring-key': [b'\xd1\x01\x02', b'\x10\x01', b'\x09'],
        'duplicate-binary-key': [b'\xd2\x01\x01\x02\x03', b'\x51x', b'\x08', b'\x09'],
        'overflow-length': [b'\x4f\x13' + b'\xff' * 8],
        'binary-depth': [b'\xa1' + bytes([index + 1]) for index in range(40)] + [b'\xd0'],
        'expanded-graph': [b'\xd1\x01\x02', b'\x57unknown'] + [b'\xaf\x10\x14' + bytes([index + 3]) * 20 for index in range(9)] + [b'\x09'],
    }.items():
        (temp / ('invalid-' + name + '.plist')).write_bytes(binary_objects(objects))
    bad_width = bytearray((temp / 'input-binary.plist').read_bytes()); bad_width[-26] = 0
    (temp / 'invalid-offset-width.plist').write_bytes(bad_width)
    xml = temp / 'Xml.java'
    xml.write_text('package android.util; public final class Xml { public static org.xmlpull.v1.XmlPullParser newPullParser() { return new org.kxml2.io.KXmlParser(); } }')
    annotation = temp / 'UnsupportedAppUsage.java'
    annotation.write_text('package android.compat.annotation; public @interface UnsupportedAppUsage {}')
    out = temp / 'classes'; out.mkdir()
    classpath = os.pathsep.join(map(str, [ANDROID, KXML]))
    subprocess.run([str(JDK / 'bin/javac'), '-encoding', 'UTF-8', '-classpath', classpath,
                    '-sourcepath', str(EXT), '-d', str(out), str(xml), str(annotation), str(SERIALIZER),
                    str(ROOT / 'tools/jvm/PreferencesTransferTest.java')], check=True)
    subprocess.run([str(JDK / 'bin/java'), '-cp', os.pathsep.join(map(str, [out, KXML, ANDROID])),
                    'app.afterglow.extension.settings.PreferencesTransferTest', str(temp)], check=True, timeout=90)
    for name in ['xml', 'binary']:
        exported = plistlib.loads((temp / ('roundtrip-' + name + '.plist')).read_bytes())
        assert exported['format'] == payload['format'] and exported['version'] == 1
        expected = plistlib.loads((temp / ('input-' + name + '.plist')).read_bytes())['preferences']
        assert exported['preferences'] == expected, name
    edited = plistlib.loads((temp / 'edited.plist').read_bytes())['preferences']
    assert isinstance(edited['theme_savedThemes'], list) and edited['theme_savedThemes'][0]['name'] == 'Edited on Android'
    assert isinstance(edited['theme_semanticTheme'], dict)
    color = plistlib.loads(edited['theme_background'])
    assert color['$archiver'] == 'NSKeyedArchiver' and color['$top']['root']['CF$UID'] == 1
    assert color['$objects'][1]['UIRed'] == 0xaa / 255
    assert edited['precise'] == .875 and not any(key.startswith('__afterglow_android_') for key in edited)
    print('PASS independent plistlib comparison: XML/binary inputs, exact preserved values and edited Android exports')
