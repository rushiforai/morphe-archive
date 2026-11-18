#!/usr/bin/env python3
"""Check the supported input and, optionally, Morphe's patched output.

Requires androguard 4.1.4. No APKs or account data are uploaded.
"""
import argparse
import hashlib
import io
from pathlib import Path
from zipfile import ZipFile

from loguru import logger
logger.remove()
from androguard.core.apk import APK
from androguard.core.dex import DEX
from androguard.core.axml import AXMLPrinter


def read_apk(path):
    data = Path(path).read_bytes()
    with ZipFile(io.BytesIO(data)) as archive:
        if 'AndroidManifest.xml' not in archive.namelist():
            data = archive.read('pl.mapa_turystyczna.app.apk')
    return data


def methods(data):
    result = {}
    with ZipFile(io.BytesIO(data)) as archive:
        for name in archive.namelist():
            if name.endswith('.dex'):
                for cls in DEX(archive.read(name)).get_classes():
                    for method in cls.get_methods():
                        key = (cls.get_name(), method.get_name(), method.get_descriptor())
                        result[key] = method
    return result


def instructions(method):
    return [(i.get_name(), i.get_output()) for i in method.get_instructions()]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', help='Original XAPK or base APK')
    parser.add_argument('--patched', help='APK produced by Morphe, using FULL bytecode mode')
    parser.add_argument('--hidden-prompts', action='store_true', help='Also check Hide Premium prompts')
    args = parser.parse_args()
    data = read_apk(args.input)
    apk = APK(data, raw=True)
    assert apk.get_package() == 'pl.mapa_turystyczna.app', 'Wrong package'
    assert apk.get_androidversion_name() == '1.16.6', 'Wrong version'
    assert apk.get_androidversion_code() == '153', 'Wrong version code'
    original = methods(data)
    access_key = ('Lzj4;', 'b', '()Z')
    flow_key = ('Ljq;', 'j', '(Ljava/lang/Object; Lft0;)Ljava/lang/Object;')
    info = instructions(original[('Lzh4;', 'toString', '()Ljava/lang/String;')])
    assert any('PremiumInfo(currentOrder=' in value for _, value in info)
    assert any(', isTrialUsed=' in value for _, value in info)
    access = original[access_key]
    assert access.get_access_flags_string() == 'public final'
    assert access.get_code().get_registers_size() >= 2
    assert sum('Lzh4;->a()Z' in value for _, value in instructions(access)) == 1
    flow = instructions(original[flow_key])
    calls = [i for i, (_, value) in enumerate(flow) if 'Lzh4;->a()Z' in value]
    assert len(calls) == 1, 'Ambiguous flow check'
    index = calls[0]
    assert flow[index + 1][0] == 'move-result'
    assert 'Ljava/lang/Boolean;->valueOf(Z)' in flow[index + 2][1]
    assert not any(k[0].startswith('Lcom/pairip/') for k in original)
    activity_key = ('Lpl/mapa_turystyczna/app/MapActivity;', 'onCreate', '(Landroid/os/Bundle;)V')
    activity = instructions(original[activity_key])
    gate = [i for i, (_, v) in enumerate(activity) if 'show_what_is_new_notification' in v]
    assert len(gate) == 1
    assert 'SharedPreferences;->getBoolean' in activity[gate[0] + 1][1]
    assert activity[gate[0] + 2][0] == 'move-result'
    assert activity[gate[0] + 3][0] == 'if-eqz'
    print('Input OK: 1.16.6 (153); both feature checks matched; no PairIP classes')
    print('Base APK SHA-256:', hashlib.sha256(data).hexdigest())

    if args.patched:
        patched = methods(read_apk(args.patched))
        assert instructions(patched[access_key]) == [('const/4', 'v0, 1'), ('return', 'v0')]
        output_flow = instructions(patched[flow_key])
        output_calls = [i for i, (_, v) in enumerate(output_flow) if 'Lzh4;->a()Z' in v]
        assert len(output_calls) == 1
        replacement = output_flow[output_calls[0] + 1]
        assert replacement == ('const/16', flow[index + 1][1] + ', 1'), replacement
        for key, method in original.items():
            if key[0] in ('Lzh4;', 'Lni4;', 'Lci4;', 'Lri4;', 'Lxj4;',
                          'Lpl/mapa_turystyczna/shared/premium/data/network/PremiumOrderResource;'):
                assert instructions(method) == instructions(patched[key]), f'Account/order code changed: {key}'
        print('Output OK: both local checks patched; account/order model and repository unchanged')
        if args.hidden_prompts:
            output_activity = instructions(patched[activity_key])
            output_gate = [i for i, (_, v) in enumerate(output_activity)
                           if 'show_what_is_new_notification' in v]
            assert len(output_gate) == 1
            assert output_activity[output_gate[0] + 2] == (
                'const/16', activity[gate[0] + 2][1] + ', 0')
            assert output_activity[5] == ('const/16', 'v1, 102')
            assert 'NotificationManager;->cancel(I)V' in output_activity[6][1]
            # No changes to any method outside the two checks and onCreate.
            changed = {key for key in original
                       if instructions(original[key]) != instructions(patched[key])}
            assert changed == {access_key, flow_key, activity_key}, changed
            with ZipFile(args.patched) as archive:
                menu = AXMLPrinter(archive.read('res/menu/navigation.xml')).get_xml_obj()
            android = '{http://schemas.android.com/apk/res/android}'
            # aapt stores resource references as numeric IDs in compiled XML.
            premium_id = apk.get_android_resources().get_res_id_by_key(
                'pl.mapa_turystyczna.app', 'id', 'action_premium')
            entries = [item for item in menu.iter('item')
                       if int(item.get(android + 'id').lstrip('@'), 16) == premium_id]
            assert len(entries) == 1
            assert entries[0].get(android + 'visible') == 'false'
            print('Prompts OK: trial notification disabled and cancelled; Premium menu hidden; '
                  'all other methods unchanged')


if __name__ == '__main__':
    main()
