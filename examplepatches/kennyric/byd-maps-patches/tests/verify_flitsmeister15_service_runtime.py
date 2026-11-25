"""Check restored service bodies against publisher DEX and protected asset data.

Run before integrating/building with an apktool-decoded original 15.0 package.
This verifies reference/linkage contracts and native string records; Android
runtime acceptance remains a separate check.
"""
import argparse
import hashlib
from pathlib import Path
import re

SERVICE = 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;'
SOURCE = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/flitsmeister/ServiceRuntime15.kt'
ASSETS = {
    'Fxz6YV9Xh1xFSXmr': '2f33fea294a28558543446582d1515a16ec041fc7ca8d86fe1670c0e63b96500',
    '1UkEu2lRMiAKdriN': 'b3a9b7dbc243929b70232c578d3905033d2c5a84d0a697d225b8914fcc260563',
}
NATIVE_STRINGS = {
    'Fxz6YV9Xh1xFSXmr': [(0x2DA5B, 148, 't1'), (0xABD0, 144, 'tef'), (0x56F84, 114, '(Ltef;)Lsef;')],
    '1UkEu2lRMiAKdriN': [(0x93E3, 99, 'fp7'), (0x1BED5, 100, 't1'), (0x16D7, 108, 'B1')],
}
# Independently bound to exact class-name records in the protected programs.
# Pin register, operation and type together: member existence cannot detect a
# cast/allocation of an unrelated class that retained an old obfuscated name.
NATIVE_TYPE_RECORDS = {'Fxz6YV9Xh1xFSXmr': [(327615, 121, 'android/net/ConnectivityManager'),
                      (354316, 94, 'android/net/NetworkRequest'),
                      (50293, 26, 'com/google/gson/Gson'),
                      (68630, 205, 'd4e'),
                      (332570, 20, 'dh8'),
                      (65227, 55, 'eh8'),
                      (331142, 235, 'evc'),
                      (267138, 53, 'fh8'),
                      (429153, 132, 'gb'),
                      (243096, 41, 'gh6'),
                      (417732, 58, 'hh8'),
                      (163250, 117, 'ile'),
                      (373297, 93, 'java/lang/Number'),
                      (264754, 25, 'java/lang/String'),
                      (174290, 77, 'java/lang/StringBuilder'),
                      (266697, 143, 'java/util/ArrayList'),
                      (312048, 149, 'java/util/Date'),
                      (68553, 74, 'java/util/HashMap'),
                      (74216, 202, 'jz0'),
                      (243212, 75, 'kotlin/Pair'),
                      (360736, 96, 'lh7'),
                      (20938, 148, 'lh8'),
                      (338403, 104, 'n91'),
                      (168883, 239, 'nfe'),
                      (267284, 206, 'nl/flitsmeister/fmcore/data/model/StringParam'),
                      (241083, 119, 'nl/flitsmeister/managers/ble/BleDeviceType'),
                      (357932, 84, 'nl/flitsmeister/models/clients/EarlyWarningClientImpl'),
                      (128297, 58, 'nl/flitsmeister/services/base/FlitsmeisterBaseService$f'),
                      (15801, 171, 'nl/flitsmeister/services/base/FlitsmeisterBaseService$g'),
                      (421783, 14, 'qsf'),
                      (43984, 144, 'tef'),
                      (62666, 138, 'v71'),
                      (224266, 193, 'wd0'),
                      (162221, 102, 'xe3'),
                      (423012, 189, 'xia')],
 '1UkEu2lRMiAKdriN': [(21665, 187, 'android/net/ConnectivityManager'),
                      (168696, 90, 'c86'),
                      (90897, 197, 'dh8'),
                      (208001, 144, 'evc'),
                      (37859, 99, 'fp7'),
                      (254156, 90, 'h0a'),
                      (186037, 118, 'java/lang/Iterable'),
                      (245175, 8, 'java/lang/StringBuilder'),
                      (270305, 119, 'java/util/LinkedHashMap'),
                      (156802, 181, 'lii'),
                      (34517, 183, 'nl/flitsmeister/fmcore/data/model/StringParam'),
                      (84843, 6, 'nl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager'),
                      (118253, 74, 'nl/flitsmeister/services/base/FlitsmeisterBaseService$c'),
                      (1286, 46, 'nl/flitsmeister/services/base/FlitsmeisterBaseService$d'),
                      (67186, 90, 'nl/flitsmeister/services/base/FlitsmeisterBaseService$e'),
                      (181159, 44, 'qr7'),
                      (27003, 88, 'sa1'),
                      (228281, 220, 'sd1'),
                      (114950, 167, 'uxi'),
                      (75902, 235, 'wd0')]}
TYPE_OPERATIONS = {'onStartCommand': [('new-instance', 'v3', 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService$f;'),
                    ('check-cast', 'v0', 'Lnl/flitsmeister/managers/ble/BleDeviceType;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ltef;'),
                    ('check-cast', 'v9', 'Llh7;'),
                    ('new-instance', 'v10', 'Lnl/flitsmeister/models/clients/EarlyWarningClientImpl;'),
                    ('check-cast', 'v10', 'Lile;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v3', 'Ldh8;'),
                    ('check-cast', 'v0', 'Levc;'),
                    ('check-cast', 'v3', 'Landroid/net/ConnectivityManager;'),
                    ('check-cast', 'v8', 'Landroid/net/NetworkRequest;'),
                    ('new-instance', 'v8', 'Ljava/lang/StringBuilder;'),
                    ('new-instance', 'v10', 'Ljava/util/Date;'),
                    ('new-instance', 'v4', 'Lnl/flitsmeister/fmcore/data/model/StringParam;'),
                    ('new-instance', 'v0', 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService$g;'),
                    ('check-cast', 'v4', 'Lgb;'),
                    ('new-instance', 'v4', 'Ljava/util/ArrayList;'),
                    ('new-instance', 'v7', 'Ljava/util/ArrayList;'),
                    ('check-cast', 'v8', 'Ljava/lang/String;'),
                    ('new-instance', 'v3', 'Lkotlin/Pair;'),
                    ('check-cast', 'v7', 'Ljava/lang/Number;'),
                    ('check-cast', 'v4', 'Lv71;'),
                    ('new-instance', 'v3', 'Lxia;'),
                    ('new-instance', 'v3', 'Leh8;'),
                    ('check-cast', 'v7', 'Llh8;'),
                    ('check-cast', 'v7', 'Ljz0;'),
                    ('check-cast', 'v7', 'Lnfe;'),
                    ('check-cast', 'v7', 'Lqsf;'),
                    ('check-cast', 'v4', 'Ln91;'),
                    ('check-cast', 'v3', 'Lgb;'),
                    ('new-instance', 'v3', 'Lfh8;'),
                    ('new-instance', 'v0', 'Lcom/google/gson/Gson;'),
                    ('new-instance', 'v8', 'Lcom/google/gson/Gson;'),
                    ('new-instance', 'v5', 'Lcom/google/gson/Gson;'),
                    ('new-instance', 'v4', 'Lcom/google/gson/Gson;'),
                    ('check-cast', 'v4', 'Ljava/util/HashMap;'),
                    ('new-instance', 'v0', 'Ljava/lang/StringBuilder;'),
                    ('new-instance', 'v5', 'Ld4e;'),
                    ('check-cast', 'v0', 'Lgh6;'),
                    ('check-cast', 'v0', 'Lwd0;'),
                    ('new-instance', 'v3', 'Lhh8;'),
                    ('new-instance', 'v1', 'Lxe3;'),
                    ('new-instance', 'v1', 'Ljava/lang/StringBuilder;')],
 'onDestroy': [('new-instance', 'v3', 'Lsd1;'),
               ('new-instance', 'v3', 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService$c;'),
               ('check-cast', 'v3', 'Lnl/flitsmeister/fmcore/managers/speedcam/SpeedCamUpdateManager;'),
               ('new-instance', 'v9', 'Lnl/flitsmeister/fmcore/data/model/StringParam;'),
               ('new-instance', 'v3', 'Lnl/flitsmeister/fmcore/data/model/StringParam;'),
               ('new-instance', 'v3', 'Ljava/util/LinkedHashMap;'),
               ('new-instance', 'v8', 'Lfp7;'),
               ('new-instance', 'v2', 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService$d;'),
               ('new-instance', 'v3', 'Ljava/lang/StringBuilder;'),
               ('check-cast', 'v6', 'Ljava/lang/Iterable;'),
               ('check-cast', 'v7', 'Ldh8;'),
               ('check-cast', 'v3', 'Lqr7;'),
               ('check-cast', 'v2', 'Lqr7;'),
               ('check-cast', 'v3', 'Ljava/lang/Iterable;'),
               ('check-cast', 'v6', 'Lsa1;'),
               ('new-instance', 'v7', 'Luxi;'),
               ('check-cast', 'v2', 'Levc;'),
               ('check-cast', 'v3', 'Landroid/net/ConnectivityManager;'),
               ('new-instance', 'v3', 'Lc86;'),
               ('new-instance', 'v6', 'Llii;'),
               ('check-cast', 'v2', 'Lh0a;'),
               ('check-cast', 'v2', 'Lwd0;'),
               ('new-instance', 'v2', 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService$e;')]}

METHOD = re.compile(r'^\.method[^\n]* ([^\s]+)\n(.*?)^\.end method', re.M | re.S)
NONSTATIC = re.compile(r'invoke-(?:virtual|interface|super)(?:/range)? [^\n]*, (L[^\n]+)')
REFERENCE = re.compile(r'L[A-Za-z0-9_$/]+;->[^\s,\n]+')


def read_bodies(source):
    text = source.read_text()
    bodies = {}
    for name in ('onStartCommand', 'onDestroy'):
        symbol = 'service' + name[0].upper() + name[1:] + '15'
        match = re.search(r'internal val ' + symbol + r' = """\n(.*?)\n"""', text, re.S)
        assert match, f'Missing {symbol}'
        bodies[name] = match[1].replace("${'$'}", '$')
    return bodies


def verify(decoded, source=SOURCE):
    originals = {name: (decoded / 'assets' / name).read_bytes() for name in ASSETS}
    for name, data in originals.items():
        assert hashlib.sha256(data).hexdigest() == ASSETS[name], f'Changed protected program: {name}'
    key = originals['Fxz6YV9Xh1xFSXmr'][0x2026C:0x2036C]
    assert hashlib.sha256(key).hexdigest() == '576ae8c04c641dae5864b64503b62b0a4cf3df5f4c5abe12f02a8830afdc28a1'
    native_records = {name: records + NATIVE_TYPE_RECORDS[name] for name, records in NATIVE_STRINGS.items()}
    for name, records in native_records.items():
        data = originals[name]
        for offset, phase, expected in records:
            length = (data[offset] ^ key[phase]) | ((data[offset + 1] ^ key[(phase + 1) % 256]) << 8)
            plaintext = bytes(data[offset + i] ^ key[(phase + i) % 256] for i in range(2, length + 2))
            assert plaintext == expected.encode(), f'Changed native binding {name}:{offset:x}'

    bodies = read_bodies(source)
    for name, expected in TYPE_OPERATIONS.items():
        actual = re.findall(r'\b(check-cast|new-instance) (\w+), (L[^;]+;)', bodies[name])
        assert actual == expected, f'Changed native cast/allocation identities in {name}'
    production = source.read_text()
    assert 'serviceOnStartCommandRegisterCount15 = 41' in production
    assert 'serviceOnDestroyRegisterCount15 = 13' in production
    service = next(decoded.glob('smali*/' + SERVICE[1:-1] + '.smali')).read_text()
    accessors = {}
    for signature, body in METHOD.findall(service):
        if '$' not in signature:
            continue
        calls = NONSTATIC.findall(body)
        if calls:
            assert len(calls) == 1, f'Changed accessor {signature}'
            accessors[signature.split('(')[0]] = calls[0]

    taken = set()
    calls = NONSTATIC.findall(bodies['onStartCommand'])
    assert len(calls) == 197, 'Changed start call count'
    for index, reference in enumerate(calls, 1):
        name = reference.split('->')[1].split('(')[0] + f'${index:03}'
        assert accessors.get(name) == reference, f'Start accessor mismatch {name}: {reference}'
        taken.add(name)
    calls = NONSTATIC.findall(bodies['onDestroy'])
    assert len(calls) == 109, 'Changed destroy call count'
    index = 0
    for reference in calls:
        index += 1
        prefix = reference.split('->')[1].split('(')[0]
        while prefix + f'${index:03}' in taken:
            index += 1
        name = prefix + f'${index:03}'
        assert accessors.get(name) == reference, f'Destroy accessor mismatch {name}: {reference}'
    assert index == 115, 'Changed destroy accessor collision sequence'

    cache = {}

    def class_text(cls):
        if cls not in cache:
            matches = list(decoded.glob('smali*/' + cls[1:-1] + '.smali'))
            assert len(matches) <= 1, f'Ambiguous publisher class {cls}'
            cache[cls] = matches[0].read_text() if matches else None
        return cache[cls]

    def member_exists(cls, signature, seen=()):
        if cls in seen:
            return False
        text = class_text(cls)
        if text is None:
            return False
        kind = 'method' if '(' in signature else 'field'
        if re.search(r'^\.' + kind + r'[^\n]* ' + re.escape(signature) + r'(?:\s|$)', text, re.M):
            return True
        return any(member_exists(parent, signature, seen + (cls,)) for parent in
                   re.findall(r'^\.(?:super|implements) (L[^;]+;)', text, re.M))

    # Check the providers behind all four report-manager lazy fields. The
    # native type oracle and the chosen R8 discriminator must agree.
    from verify_flitsmeister import canonical, run_fragment
    report_constructor = next(body for signature, body in METHOD.findall(class_text('Ly81;'))
                              if signature == '<init>(Landroid/content/Context;)V')
    for field, provider, case, target in [('f', 'v81', 0, 'lh8'), ('g', 'i5', 1, 'jz0'),
                                          ('h', 'j5', 1, 'nfe'), ('i', 'w81', 0, 'qsf')]:
        region = report_constructor.split(f'new-instance p1, L{provider};', 1)[1]
        region = region.split(f'iput-object', 1)[0]
        expected_register = 'v0' if case == 0 else 'v1'
        assert f'invoke-direct {{p1, p0, {expected_register}}}, L{provider};-><init>(Ljava/lang/Object;I)V' in region
        assert f'Ly81;->{field}:Lfti;' in report_constructor
        delegate = next(body for signature, body in METHOD.findall(class_text(f'L{provider};'))
                        if signature == 'invoke()Ljava/lang/Object;')
        locals_count = int(re.search(r'\.locals (\d+)', delegate)[1])
        owner = {'Ly81;->a:Landroid/content/Context;': 'context'}
        instance = {f'L{provider};->a:I': case, f'L{provider};->b:Ljava/lang/Object;': owner}
        def singleton_call(reference, values):
            assert reference == 'Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;'
            assert values[1] == 'context'
            return values[0]
        actual = run_fragment(canonical(delegate), 0, {f'v{locals_count}': instance}, calls=singleton_call)
        assert actual.startswith(f'L{target};->'), f'Wrong report lazy provider {field}: {actual}'
        assert '.super Ln91;' in class_text(f'L{target};')
    assert '.implements Lnl/flitsmeister/route_guidance/logger/RouteGuidanceLogger;' in class_text('Lhh8;')

    references = set()
    for body in bodies.values():
        assert 'Lcom/pairip/VMRunner;' not in body
        for reference in REFERENCE.findall(body):
            cls, signature = reference.split('->')
            external = class_text(cls) is None and cls.startswith(('Ljava/', 'Landroid/', 'Lorg/slf4j/'))
            assert external or member_exists(cls, signature), f'Unresolved publisher member: {reference}'
            references.add(reference)
    # The v15 helper performs the same report Flow reset at both old reset sites.
    assert bodies['onDestroy'].count('invoke-static {}, Lhff;->a()V') == 2
    assert bodies['onDestroy'].count('"end_of_trip"') == 1
    assert 'new-instance v8, Lfp7;' in bodies['onDestroy']
    assert 'invoke-super {p0}, Landroid/app/Service;->onDestroy()V' in bodies['onDestroy']
    assert 'invoke-direct {v3, v6}, Lsd1;-><init>(I)V' in bodies['onDestroy']
    assert 'const/4 v6, 0x2' in bodies['onDestroy']
    assert '"15.0"' in bodies['onStartCommand'] and '0x509' in bodies['onStartCommand']
    assert SERVICE + '->t1:Z' in bodies['onStartCommand']
    assert SERVICE + '->t1:Z' in bodies['onDestroy']
    return {'native_strings': sum(map(len, native_records.values())),
            'type_operations': sum(map(len, TYPE_OPERATIONS.values())),
            'start_calls': 197, 'destroy_calls': 109, 'resolved_references': len(references)}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--source', type=Path, default=SOURCE)
    args = parser.parse_args()
    print(verify(args.decoded, args.source))
