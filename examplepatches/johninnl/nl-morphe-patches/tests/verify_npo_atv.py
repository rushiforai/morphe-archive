"""Inspect NPO TV output while retaining every original method outside exact prefixes."""
import argparse
from bisect import bisect_left
import json
import re
from pathlib import Path
from atv_smali import classes, class_methods, instructions, without_prefix, graph


def split_catches(rows):
    """Normalize metadata placement while preserving every protected range and target."""
    positions = [i for i, row in enumerate(rows) if row.startswith(('.catch ', '.catchall '))]
    def rebase(row):
        parts = re.split(r'("(?:\\.|[^"\\])*")', row)
        return ''.join(part if i % 2 else re.sub(r'@(\d+)',
            lambda match: '@' + str(int(match[1]) - bisect_left(positions, int(match[1]))), part)
            for i, part in enumerate(parts))
    return ([rebase(row) for i, row in enumerate(rows) if i not in positions],
            [rebase(rows[i]) for i in positions])


def verify_callback(before, after, prefix):
    original, original_catches = split_catches(before)
    actual, actual_catches = split_catches(after)
    expected, expected_catches = split_catches(graph(before[0] + '\n' + prefix))
    assert not original_catches, 'Protected callback tail layout changed'
    count = len(expected) - 1
    assert actual[:count + 1] == expected, 'Restored callback instructions/control flow differ'
    assert actual_catches == expected_catches, 'Restored callback exception scopes differ'
    assert without_prefix(actual, count) == original, 'Original callback tail changed'


def descriptor(name):
    return {'boolean': 'Z', 'byte': 'B', 'char': 'C', 'short': 'S', 'int': 'I',
            'long': 'J', 'float': 'F', 'double': 'D'}.get(name,
            name.replace('.', '/') if name.startswith('[') else 'L' + name.replace('.', '/') + ';')


def initializer_writes(rows):
    """Execute the emitted straight-line constant/reflective registration program."""
    registers, writes, result = {}, {}, None
    primitives = dict(Boolean='Z', Byte='B', Character='C', Short='S', Integer='I', Long='J', Float='F', Double='D')
    for line in instructions(rows):
        op, _, arguments = line.partition(' ')
        if op in ('const-string', 'const-string/jumbo'):
            register, literal = arguments.split(', ', 1)
            registers[register] = json.loads(literal.replace("\\'", "'"))
        elif op == 'const-class':
            register, value = arguments.split(', ', 1)
            registers[register] = value
        elif op in ('const/4', 'const/16'):
            register, value = arguments.split(', ', 1)
            registers[register] = int(value, 0)
        elif op == 'new-array':
            target, size, kind = arguments.split(', ')
            assert kind == '[Ljava/lang/Class;'
            registers[target] = [None] * registers[size]
        elif op == 'aput-object':
            value, array, index = arguments.split(', ')
            registers[array][registers[index]] = registers[value]
        elif op == 'sget-object':
            register, field = arguments.split(', ', 1)
            match = re.fullmatch(r'Ljava/lang/(\w+);->TYPE:Ljava/lang/Class;', field)
            assert match, line
            registers[register] = primitives[match[1]]
        elif op == 'invoke-virtual':
            assert arguments.endswith('Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;')
            params = arguments.split('}', 1)[0].lstrip('{').split(', ')
            result = (registers[params[0]], registers[params[1]], list(registers[params[2]]))
        elif op == 'move-result-object':
            registers[arguments] = result
        elif op == 'sput-object':
            register, field = arguments.split(', ', 1)
            assert field not in writes, 'Duplicate startup assignment: ' + field
            writes[field] = registers[register]
        else:
            assert op == 'return-void', 'Unsupported startup instruction: ' + line
    return writes


def verify_embedded_helpers(embedded_original, after_classes):
    """Retain the complete independently decoded helper method graphs."""
    for owner, original_path in classes(embedded_original).items():
        assert owner in after_classes, 'Original embedded lifecycle helper removed: ' + owner
        assert class_methods(after_classes[owner]) == class_methods(original_path), \
            'Original embedded lifecycle helper method graph changed: ' + owner


def verify(original, patched, ads, tracking, startup_data=None, embedded_original=None, phone=False):
    before_classes, after_classes = classes(original), classes(patched)
    contracts = json.loads(Path(__file__).with_name('npo_phone_contracts.json' if phone else 'npo_atv_contracts.json').read_text())
    edits = {x['owner'] + '->' + x['signature']: x['prefix'] for x in contracts
             if (ads if x['selection'] == 'ads' else tracking)}
    callbacks = {}
    added_initializers = set()
    if startup_data:
        from run_npo_runtime import prefixes
        from run_npo_token import prefix as token_prefix
        if phone:
            source = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/npostarttv/PhoneRuntimeCallbacks.kt'
            restored = prefixes(source, ('phoneAppAuthDiscoveryCode', 'phoneReceiverCode'))
            callbacks = {
                'Lnl/npo/player/library/j9/e2;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': restored['phoneReceiverCode'],
                'Lnl/npo/player/library/ru/k;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;': restored['phoneAppAuthDiscoveryCode'],
            }
            bitmap_source = source.with_name('PhoneBitmapFetch.kt')
            callbacks['Lnl/npo/player/library/ll/c;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;'] = prefixes(bitmap_source, ('phoneBitmapFetchCode',))['phoneBitmapFetchCode']
            indicator_source = source.with_name('PhoneRouteIndicator.kt')
            callbacks['Lnl/npo/player/library/m9/a;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;'] = prefixes(indicator_source, ('phoneRouteIndicatorCode',))['phoneRouteIndicatorCode']
        else:
            restored = prefixes()
            callbacks = {
                'Lnl/npo/player/library/l6/v;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': restored['networkAudioReceiverCode'],
                'Lnl/npo/player/library/zt/j;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;': restored['appAuthDiscoveryCode'],
                'Lnl/npo/player/library/zt/i;->doInBackground([Ljava/lang/Object;)Ljava/lang/Object;': token_prefix(),
            }
        edits['Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V'] = ['return-void']
        edits['Lcom/pairip/StartupLauncher;->launch()V'] = ['return-void']
        captured = json.loads(Path(startup_data).read_text())
        added_initializers = {owner + '-><clinit>()V' for owner in captured['strings']}
        added_initializers.update(field.split('->')[0] + '-><clinit>()V' for field in captured['methods'])
        assert embedded_original, 'Independent original embedded helpers are required'
        assert set(after_classes) == set(before_classes) | set(classes(embedded_original)), 'Unexpected injected NPO classes'
    else:
        assert set(after_classes) == set(before_classes), 'Unexpected added NPO classes'
    count = 0
    for owner, path in before_classes.items():
        assert owner in after_classes, 'Original NPO class removed: ' + owner
        before, after = class_methods(path), class_methods(after_classes[owner])
        assert set(after) == set(before) | {key for key in added_initializers if key.startswith(owner + '->')}, 'Unexpected added NPO methods: ' + owner
        for key, body in before.items():
            count += 1
            assert key in after, 'Original NPO method removed: ' + key
            if key in callbacks:
                verify_callback(body, after[key], callbacks[key])
            elif key in edits:
                prefix = edits[key]
                assert instructions(after[key])[:len(prefix)] == prefix, 'Missing NPO control: ' + key
                assert without_prefix(after[key], len(prefix)) == body, 'NPO retained body changed: ' + key
            else:
                assert after[key] == body, 'Unrelated NPO method changed: ' + key
    if startup_data:
        assert len(captured['strings']) == 32 and sum(map(len, captured['strings'].values())) == (1494 if phone else 1437)
        for owner, fields in captured['strings'].items():
            writes = initializer_writes(class_methods(after_classes[owner])[owner + '-><clinit>()V'])
            assert writes == {owner + '->' + name + ':Ljava/lang/String;': value for name, value in fields.items()}, owner
        grouped = {}
        for field, info in captured['methods'].items():
            owner = field.split('->')[0]
            grouped.setdefault(owner, {})[field + ':Ljava/lang/reflect/Method;'] = (
                descriptor(info['helper']), info['name'], [descriptor(p) for p in info['parameters']])
        assert sum(map(len, grouped.values())) == (10 if phone else 9)
        for owner, expected in grouped.items():
            assert initializer_writes(class_methods(after_classes[owner])[owner + '-><clinit>()V']) == expected, owner
        assert embedded_original, 'Independent original embedded helpers are required'
        verify_embedded_helpers(embedded_original, after_classes)
    if tracking:
        from npo_manifest import load_manifest, verify_manifest
        verify_manifest(load_manifest(original), load_manifest(patched))
    return count


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--phone', action='store_true')
    parser.add_argument('--startup-data')
    parser.add_argument('--embedded-original')
    args = parser.parse_args()
    print('PASS: NPO effects and', verify(args.original, args.patched, args.ads, args.tracking,
          args.startup_data, args.embedded_original, args.phone), 'original method contracts')
