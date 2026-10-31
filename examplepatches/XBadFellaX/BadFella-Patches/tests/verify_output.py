"""Check the actual Morphe output, rather than a mocked patch context."""
import argparse
import json
import pathlib
import re
import struct
import subprocess
import zipfile
from collections import Counter

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('apk', type=pathlib.Path)
parser.add_argument('result', type=pathlib.Path)
parser.add_argument('build_tools', type=pathlib.Path)
args = parser.parse_args()
APK = args.apk
SDK = args.build_tools

result = json.loads(args.result.read_text())
assert result['success'] and not result['failedPatches'], result
expected_patches = 4
assert len(result['appliedPatches']) == expected_patches, result

manifest = subprocess.check_output(
    [str(SDK / 'aapt2.exe'), 'dump', 'xmltree', '--file', 'AndroidManifest.xml', str(APK)],
    text=True, encoding='utf-8', errors='replace')
assert 'app.badfella.extension.ticktick.BadFellaSettingsActivity' not in manifest, 'Removed settings activity remains'
assert 'app.badfella.extension.ticktick.LocalBackupJobService' not in manifest, 'Removed backup job remains'
for retained in ['com.google.firebase.provider.FirebaseInitProvider',
                 'com.google.firebase.messaging.FirebaseMessagingService',
                 'com.ticktick.task.push.PushMessagingService',
                 'android.permission.ACCESS_FINE_LOCATION',
                 'android.permission.RECORD_AUDIO',
                 'com.android.vending.BILLING',
                 'AppWidgetProviderAiAssistant',
                 'QuickSettingsCalendarTileService']:
    assert retained in manifest, f'Missing retained capability: {retained}'
for removed in ['com.google.android.gms.permission.AD_ID',
                'android.permission.ACCESS_ADSERVICES_AD_ID',
                'com.google.android.gms.analytics.AnalyticsService',
                'com.google.android.gms.measurement.AppMeasurementService',
                'com.bugsnag.android.internal.BugsnagContentProvider',
                'firebase_messaging_auto_init_enabled']:
    assert removed not in manifest, f'Unexpected disabled/removed item: {removed}'
for name, value in [('firebase_analytics_collection_enabled', 'false'),
                    ('firebase_analytics_collection_deactivated', 'true'),
                    ('firebase_crashlytics_collection_enabled', 'false')]:
    assert re.search(re.escape(f'"{name}"') + r'.*\n[^\n]*:value\([^)]*\)=' + value, manifest), name

classes = Counter()
reminder_guard_checked = False
legacy_analytics_checked = False
firebase_certificate_checked = False
with zipfile.ZipFile(APK) as archive:
    for name in archive.namelist():
        if not name.endswith('.dex'):
            continue
        data = archive.read(name)
        assert data.startswith(b'dex\n')
        _, string_offset = struct.unpack_from('<II', data, 56)
        _, type_offset = struct.unpack_from('<II', data, 64)
        class_count, class_offset = struct.unpack_from('<II', data, 96)

        def string(index):
            offset = struct.unpack_from('<I', data, string_offset + 4 * index)[0]
            while data[offset] & 128:
                offset += 1
            offset += 1
            return data[offset:data.index(0, offset)].decode('utf-8')

        for index in range(class_count):
            type_index = struct.unpack_from('<I', data, class_offset + index * 32)[0]
            string_index = struct.unpack_from('<I', data, type_offset + 4 * type_index)[0]
            descriptor = string(string_index)
            classes[descriptor] += 1
            if descriptor not in ['Ljd/d;', 'Lb7/a;', 'Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;']:
                continue

            # The runtime regression is in this scheduler's h()Z method in supported build 8240.
            offset = struct.unpack_from('<I', data, class_offset + index * 32 + 24)[0]

            def read_uleb(position):
                value = shift = 0
                while True:
                    byte = data[position]
                    position += 1
                    value |= (byte & 127) << shift
                    if not byte & 128:
                        return value, position
                    shift += 7
                    assert shift < 35, 'Invalid DEX integer'

            counts = []
            for _ in range(4):
                value, offset = read_uleb(offset)
                counts.append(value)
            for _ in range(2 * (counts[0] + counts[1])):
                _, offset = read_uleb(offset)
            method_count, method_offset = struct.unpack_from('<II', data, 88)
            for count in counts[2:]:
                method_index = 0
                for _ in range(count):
                    delta, offset = read_uleb(offset)
                    method_index += delta
                    _, offset = read_uleb(offset)
                    code_offset, offset = read_uleb(offset)
                    name_index = struct.unpack_from('<I', data, method_offset + method_index * 8 + 4)[0]
                    if descriptor == 'Ljd/d;' and string(name_index) == 'h':
                        assert code_offset and data[code_offset + 16:code_offset + 20] == bytes([0x12, 0, 0x0f, 0]), 'Reminder guard must return false'
                        reminder_guard_checked = True
                    if descriptor == 'Lb7/a;' and string(name_index) == '<init>':
                        assert code_offset, 'Legacy analytics constructor has no code'
                        registers, incoming = struct.unpack_from('<HH', data, code_offset)
                        opcode, callee, arguments, end = struct.unpack_from('<HHHH', data, code_offset + 16)
                        assert opcode == 0x1070 and incoming == 1 and arguments == registers - 1 and end == 0x000e, 'Legacy analytics must return immediately after superclass initialization'
                        callee_class, _, callee_name = struct.unpack_from('<HHI', data, method_offset + callee * 8)
                        callee_type_name = struct.unpack_from('<I', data, type_offset + callee_class * 4)[0]
                        assert string(callee_type_name) == 'Ljava/lang/Object;' and string(callee_name) == '<init>', 'Wrong legacy analytics superclass constructor'
                        legacy_analytics_checked = True
                    if descriptor.endswith('/FirebaseInstallationServiceClient;') and string(name_index) == 'getFingerprintHashForPackage':
                        assert code_offset, 'Firebase certificate lookup has no code'
                        opcode, certificate_string, end = struct.unpack_from('<HHH', data, code_offset + 16)
                        assert opcode == 0x001a and end == 0x0011, 'Firebase certificate lookup must return the scoped certificate header'
                        assert string(certificate_string) == '6711DE2604B48FC736CBB9E29B8EB834651605B3', 'Unexpected Firebase certificate header'
                        firebase_certificate_checked = True

assert classes and all(count == 1 for count in classes.values()), 'Duplicate DEX classes'
assert reminder_guard_checked, 'Reminder guard was not checked'
assert legacy_analytics_checked, 'Legacy analytics initialization was not checked'
assert firebase_certificate_checked, 'Firebase certificate header was not checked'
assert 'Lapp/badfella/extension/ticktick/PushSignatureSpoof;' in classes
retired = ('LocalLists', 'LocalBackup', 'BadFellaSettingsActivity', 'TickTickBridge')
assert not any(name.startswith('Lapp/badfella/extension/ticktick/') and
               (name.startswith('Lapp/badfella/extension/ticktick/locallists/') or
                any(part in name for part in retired)) for name in classes), 'Retired local-list code remains in the APK'
assert not any(name.startswith('Lbin/mt/signature/') for name in classes)
assert not any(name.startswith('Lapp/paresh/extension/') for name in classes), 'Legacy extension namespace remains'
subprocess.run([str(SDK / 'zipalign.exe'), '-c', '4', str(APK)], check=True)
print(f'PASS: {expected_patches} patches, reminder guard, legacy analytics initialization, '
      f'Firebase certificate header, manifest privacy settings and retained capabilities, '
      f'{len(classes)} unique classes, ZIP alignment'
      )
