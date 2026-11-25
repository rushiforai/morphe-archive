"""Verify eight restored receivers against publisher15 delegates and native records.

This checks genuine billing, Bluetooth/autostart and Nordic callback contracts.
It does not establish device/hardware or account/backend outcomes.
"""
import argparse
import hashlib
from pathlib import Path
import re
from verify_flitsmeister import digest

SOURCE = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/flitsmeister/ReceiverRuntime15.kt'
PROFILES = {'Lkjl;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (19, 'eipw0h0rNmETWOgv', 2), 'Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager$BluetoothDevicesReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (7, 'J3PpjrlwTuTi8Ay7', 0), 'Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (18, 'f84JbW2VkAlvaukk', 4), 'Lnl/flitsmeister/receivers/autostart/AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (4, 'wojvNhr4mTy8pcCh', 0), 'Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (6, 'S87ByAhlJV46n5Wl', 0), 'Lno/nordicsemi/android/ble/BleManagerHandler$b;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (9, 'hCAzd1cDreEHmbvI', 0), 'Lno/nordicsemi/android/dfu/DfuServiceListenerHelper$ProgressBroadcastsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (10, 'pitu1iGVj6HrulkI', 0), 'Lno/nordicsemi/android/support/v18/scanner/PendingIntentReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': (40, 'DD0nF2Z7yP6MIGB9', 6)}
TYPE_RECORDS = {'Lkjl;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'check-cast v8, Li2a;', 'record': [22244, 99, 'i2a']}, {'line': 'instance-of v12, v7, Ljava/lang/Integer;', 'record': [101397, 203, 'java/lang/Integer']}, {'line': 'check-cast v7, Ljava/lang/Integer;', 'record': [101397, 203, 'java/lang/Integer']}, {'line': 'check-cast v8, Li2a;', 'record': [22244, 99, 'i2a']}, {'line': 'check-cast v8, Li2a;', 'record': [22244, 99, 'i2a']}, {'line': 'check-cast v1, Lcom/google/android/gms/internal/play_billing/zziy;', 'record': [1884, 68, 'com/google/android/gms/internal/play_billing/zziy']}, {'line': 'check-cast v0, Lcom/google/android/gms/internal/play_billing/zzjz;', 'record': [102949, 36, 'com/google/android/gms/internal/play_billing/zzjz']}, {'line': 'check-cast v0, Lcom/google/android/gms/internal/play_billing/zzja;', 'record': [78736, 55, 'com/google/android/gms/internal/play_billing/zzja']}, {'line': 'check-cast v3, Lcom/google/android/gms/internal/play_billing/zzjr;', 'record': [87178, 10, 'com/google/android/gms/internal/play_billing/zzjr']}, {'line': 'check-cast v1, Lcom/google/android/gms/internal/play_billing/zzjp;', 'record': [114138, 85, 'com/google/android/gms/internal/play_billing/zzjp']}, {'line': 'check-cast v3, Lcom/google/android/gms/internal/play_billing/zzjr;', 'record': [87178, 10, 'com/google/android/gms/internal/play_billing/zzjr']}], 'Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager$BluetoothDevicesReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'instance-of v0, p2, Landroid/bluetooth/BluetoothDevice;', 'record': [39219, 94, 'android/bluetooth/BluetoothDevice']}, {'line': 'check-cast p1, Landroid/bluetooth/BluetoothDevice;', 'record': [39219, 94, 'android/bluetooth/BluetoothDevice']}, {'line': 'instance-of v0, p2, Landroid/bluetooth/BluetoothDevice;', 'record': [39219, 94, 'android/bluetooth/BluetoothDevice']}, {'line': 'check-cast p1, Landroid/bluetooth/BluetoothDevice;', 'record': [39219, 94, 'android/bluetooth/BluetoothDevice']}], 'Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'const-class v2, Landroid/bluetooth/BluetoothDevice;', 'record': [45370, 3, 'android/bluetooth/BluetoothDevice']}, {'line': 'check-cast v1, Landroid/bluetooth/BluetoothDevice;', 'record': [45370, 3, 'android/bluetooth/BluetoothDevice']}, {'line': 'new-instance v0, Lws0;', 'record': [45901, 11, 'ws0']}, {'line': 'new-instance v0, Lvs0;', 'record': [93473, 112, 'vs0']}, {'line': 'new-instance v3, Ljava/lang/StringBuilder;', 'record': [2563, 204, 'java/lang/StringBuilder']}, {'line': 'new-instance v3, Leof$a;', 'record': [43556, 127, 'eof$a']}], 'Lnl/flitsmeister/receivers/autostart/AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'new-instance p0, Ljava/lang/StringBuilder;', 'record': [27609, 12, 'java/lang/StringBuilder']}, {'line': 'new-instance p1, Ljava/lang/StringBuilder;', 'record': [27609, 12, 'java/lang/StringBuilder']}], 'Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'check-cast p2, Landroid/bluetooth/BluetoothManager;', 'record': [40725, 94, 'android/bluetooth/BluetoothManager']}, {'line': 'check-cast p0, Landroid/bluetooth/BluetoothManager;', 'record': [40725, 94, 'android/bluetooth/BluetoothManager']}], 'Lno/nordicsemi/android/ble/BleManagerHandler$b;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'check-cast p1, Landroid/bluetooth/BluetoothDevice;', 'record': [43007, 95, 'android/bluetooth/BluetoothDevice']}, {'line': 'new-instance v1, Lhk1;', 'record': [22583, 70, 'hk1']}], 'Lno/nordicsemi/android/dfu/DfuServiceListenerHelper$ProgressBroadcastsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'check-cast p0, Lno/nordicsemi/android/dfu/DfuProgressListener;', 'record': [26653, 146, 'no/nordicsemi/android/dfu/DfuProgressListener']}], 'Lno/nordicsemi/android/support/v18/scanner/PendingIntentReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': [{'line': 'check-cast v2, Landroid/app/PendingIntent;', 'record': [3339, 124, 'android/app/PendingIntent']}, {'line': 'check-cast v4, Landroid/bluetooth/le/ScanSettings;', 'record': [145835, 180, 'android/bluetooth/le/ScanSettings']}, {'line': 'check-cast v8, Lno/nordicsemi/android/support/v18/scanner/c;', 'record': [87925, 77, 'no/nordicsemi/android/support/v18/scanner/c']}, {'line': 'new-instance v9, Ljava/util/ArrayList;', 'record': [50462, 14, 'java/util/ArrayList']}, {'line': 'check-cast v10, Landroid/bluetooth/le/ScanFilter;', 'record': [74047, 112, 'android/bluetooth/le/ScanFilter']}, {'line': 'new-instance v11, Lno/nordicsemi/android/support/v18/scanner/ScanFilter$b;', 'record': [101913, 28, 'no/nordicsemi/android/support/v18/scanner/ScanFilter$b']}, {'line': 'new-instance v23, Lno/nordicsemi/android/support/v18/scanner/ScanFilter;', 'record': [92699, 75, 'no/nordicsemi/android/support/v18/scanner/ScanFilter']}, {'line': 'new-instance v7, Lno/nordicsemi/android/support/v18/scanner/ScanSettings;', 'record': [40073, 142, 'no/nordicsemi/android/support/v18/scanner/ScanSettings']}, {'line': 'new-instance v8, Lf8e;', 'record': [52722, 94, 'f8e']}, {'line': 'new-instance v23, Lno/nordicsemi/android/support/v18/scanner/c$a;', 'record': [102031, 209, 'no/nordicsemi/android/support/v18/scanner/c$a']}, {'line': 'new-instance v3, Ljava/util/ArrayList;', 'record': [50462, 14, 'java/util/ArrayList']}, {'line': 'check-cast v5, Landroid/bluetooth/le/ScanResult;', 'record': [52827, 70, 'android/bluetooth/le/ScanResult']}, {'line': 'check-cast v1, Lno/nordicsemi/android/support/v18/scanner/ScanResult;', 'record': [135494, 154, 'no/nordicsemi/android/support/v18/scanner/ScanResult']}]}

# Frozen after independent complete old-body, static-target and native-binding review.
BODY_HASHES = {'Lkjl;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': 'a9a48ff95ff95bf9cf2162678df5db9f0da8fd3c812bae253aa8aad307f61c20', 'Lnl/flitsmeister/managers/bluetooth/BluetoothDevicesManager$BluetoothDevicesReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': '3a42c86e1e670c3ae35e9032d9139ec5e276d33a722a48295278c6eba38879dd', 'Lnl/flitsmeister/receivers/autostart/AutoStartBluetoothEventReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': '796374981e9ce10d309f03e8503467f997bcbf0ec06cbc67b8261fd249d73d30', 'Lnl/flitsmeister/receivers/autostart/AutoStartBootCompletedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': '941a6e8b990454876e4b30535e8098a56415b02ba5a9e738900236986a8a2c84', 'Lnl/flitsmeister/receivers/bluetooth/BluetoothAdapterStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': '8325acb60d393ba504c9e5f407a0da4d0d37e83ba3a1cd8b373a3571467b5118', 'Lno/nordicsemi/android/ble/BleManagerHandler$b;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': 'a49271e448e31304ef3808de19a30f93846ff1f64fab2126034603bb377ee034', 'Lno/nordicsemi/android/dfu/DfuServiceListenerHelper$ProgressBroadcastsReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': 'dff5111b745c703e08cfdccb4dc6dfafdf441097c1e2fe71a230f9f2837f8fdd', 'Lno/nordicsemi/android/support/v18/scanner/PendingIntentReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': 'db56e0a26cec384cd6ff47dacd0022e621961536f23aced64192b917926d285a'}

METHOD = re.compile(r'^\.method[^\n]* ([^\s]+)\n(.*?)^\.end method', re.M | re.S)
CALL = re.compile(r'invoke-(?:virtual|interface|super)(?:/range)? [^\n]*, (L[^\n]+)')
REFERENCE = re.compile(r'L[\w/$]+;->[^\s,}]+')
TYPE = re.compile(r'\b(?:new-instance|check-cast|const-class|instance-of) [^;]+?, L[\w/$]+;')


def verify(decoded, source=SOURCE):
    key = (decoded / 'assets/Fxz6YV9Xh1xFSXmr').read_bytes()[0x2026c:0x2036c]
    assert hashlib.sha256(key).hexdigest() == '576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1'
    text = source.read_text()
    matches = re.findall(r'ReceiverBody15\(\s*"((?:\\.|[^"\\])*)", (\d+), "([^"\n]+)",\s*"""\n(.*?)\n\s*"""\.trimIndent\(\), (\d+),', text, re.S)
    assert len(matches) == len(PROFILES)
    cache = {}
    def cls_text(cls):
        if cls not in cache:
            paths = list(decoded.glob('smali*/' + cls[1:-1] + '.smali'))
            assert len(paths) <= 1
            cache[cls] = paths[0].read_text() if paths else None
        return cache[cls]
    def exists(cls, member, seen=()):
        if cls in seen: return False
        value = cls_text(cls)
        if value is None: return False
        kind = 'method' if '(' in member else 'field'
        if re.search(r'^\.' + kind + r'[^\n]* ' + re.escape(member) + r'(?:\s|$)', value, re.M): return True
        if member.startswith('<init>'): return False
        return any(exists(parent, member, seen + (cls,)) for parent in re.findall(r'^\.(?:super|implements) (L[^;]+;)', value, re.M))
    checked = total_calls = 0
    for descriptor, registers, program, body, handlers in matches:
        descriptor = descriptor.replace('\\$', '$');body = body.replace("${'$'}", '$')
        assert (int(registers), program, int(handlers)) == PROFILES[descriptor]
        assert 'Lcom/pairip/VMRunner;' not in body
        wrapped = '.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V\n.locals ' + str(int(registers) - 3) + '\n' + body + '\n.end method'
        assert digest(wrapped) == BODY_HASHES[descriptor], descriptor + ': complete branches, payloads and exception regions'
        assert len(re.findall(r'^\s*\.catch', body, re.M)) == int(handlers)
        cls, signature = descriptor.split('->');methods = dict(METHOD.findall(cls_text(cls)));wrapper = methods[signature]
        assert int(re.search(r'\.locals (\d+)', wrapper)[1]) + 3 == 8
        assert re.findall(r'const-string(?:/jumbo)? \w+, "([^"\n]+)"', wrapper) == [program]
        calls = CALL.findall(body)
        delegates = {}
        for sig, value in methods.items():
            ordinal = re.search(r'\$(\d{3})\(', sig)
            if ordinal:
                invocations = CALL.findall(value)
                if not invocations:
                    continue
                assert len(invocations) == 1, sig
                delegates[int(ordinal[1])] = invocations[0]
        assert sorted(delegates) == list(range(1, len(calls) + 1))
        assert calls == [delegates[i] for i in range(1, len(calls) + 1)], descriptor + ': ordered publisher contracts'
        total_calls += len(calls)
        actual_types = TYPE.findall(body)
        expected_types = [row['line'] for row in TYPE_RECORDS[descriptor]]
        assert actual_types == expected_types, descriptor + ': type operation contract'
        data = (decoded / 'assets' / program).read_bytes()
        for row in TYPE_RECORDS[descriptor]:
            offset, phase, expected = row['record']
            length = (data[offset] ^ key[phase]) | ((data[offset + 1] ^ key[(phase + 1) % 256]) << 8)
            actual = bytes(data[offset + i] ^ key[(phase + i) % 256] for i in range(2, length + 2))
            assert actual == expected.encode(), descriptor + ': native class binding'
            checked += 1
        for reference in set(REFERENCE.findall(body)):
            owner, member = reference.split('->')
            external = cls_text(owner) is None and owner.startswith(('Ljava/', 'Landroid/', 'Ljavax/', 'Lorg/slf4j/'))
            assert external or exists(owner, member), reference
    return {'receivers': len(matches), 'ordered_calls': total_calls, 'native_type_sites': checked}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    args = parser.parse_args()
    print(verify(args.decoded))
