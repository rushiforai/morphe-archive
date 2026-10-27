#!/usr/bin/env python3
"""Read-only regression checks on ZenSmsDex JSON from ORIGINAL and PATCHED APKs.
Compile ZenSmsDex.java with Morphe Desktop + Gson, then dump each APK using
regex 'L(com/zensms/app/domain/premium/PremiumManager|app/patchlab/extension/rtl/.*|z/(lY|Md));.*'.
Usage: verify_zensms.py original.json patched.json [premium|otp|rtl|all]
Static checks do not substitute for Android/Compose device tests.
"""
import json
import sys


def check(ok, message):
    assert ok, message
    print('PASS', message)


def instructions(data, key):
    return data['methods'][key]['instructions']


def select(data, prefix):
    result = [k for k in data['methods'] if k.startswith(prefix)]
    assert len(result) == 1, (prefix, result)
    return result[0]


def premium(original, patched):
    owner = 'Lcom/zensms/app/domain/premium/PremiumManager;->'
    direct = instructions(patched, owner + 'hasPremium()Z')
    check([i['op'] for i in direct] == ['CONST_4', 'RETURN'] and direct[0]['NarrowLiteral'] == 1,
          'synchronous premium returns true')
    key = select(patched, owner + 'isPremium()')
    flow = instructions(patched, key)
    check([i['op'] for i in flow] == ['SGET_OBJECT', 'INVOKE_STATIC', 'MOVE_RESULT_OBJECT', 'RETURN_OBJECT'],
          'reactive premium creates an enabled flow')
    check(flow[0]['Reference'] == 'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;', 'reactive value is TRUE')
    factory = flow[1]['Reference']
    check(factory in original['methods'], 'flow factory resolves in original app')
    check(factory.endswith('(Ljava/lang/Object;)Lkotlinx/coroutines/flow/m;'), 'factory has audited StateFlow implementation result')
    interface = key.split(')')[1]
    todo = ['Lkotlinx/coroutines/flow/m;']; seen = set()
    while todo:
        c = todo.pop()
        if c in seen or c not in original['classes']:
            continue
        seen.add(c)
        parent, interfaces, _ = original['classes'][c]
        todo.extend([parent] + interfaces)
    check(interface in seen, 'returned flow implements declared reactive interface')


def otp(original, patched):
    owner = 'Lz/lY;' if 'Lz/lY;->t(Ljava/lang/String;)Ljava/lang/String;' in original['methods'] else 'Lz/Md;'
    extractor = owner + ('->t' if owner == 'Lz/lY;' else '->s') + '(Ljava/lang/String;)Ljava/lang/String;'
    validator = select(original, owner + ('->K(' if owner == 'Lz/lY;' else '->C('))
    before, after = instructions(original, extractor), instructions(patched, extractor)
    check(len(before) == len(after), 'OTP extractor instruction count preserved')
    changes = [(a, b) for a, b in zip(before, after) if a != b]
    check(len(changes) == 3 and all(a['op'] == b['op'] == 'CONST_STRING' and a['RegisterA'] == b['RegisterA'] for a, b in changes),
          'exactly three stock regex literals changed without register/control-flow edits')
    check(all('تخفیف' in b['Reference'] and '{4,10}' in b['Reference'] for _, b in changes), 'expanded regexes retain Persian discount exclusion')
    a, b = instructions(original, validator), instructions(patched, validator)
    changes = [(x, y) for x, y in zip(a, b) if x != y]
    check(len(a) == len(b) and len(changes) == 1, 'validator has exactly one edit')
    x, y = changes[0]
    check(x['NarrowLiteral'] == 8 and y['NarrowLiteral'] == 10 and x['RegisterA'] == y['RegisterA'], 'only audited maximum length changes 8 to 10')


def rtl(original, patched):
    appearance = 'Lcom/zensms/app/ui/settings/SettingsScreenKt$SettingsScreen$24$1$4;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;'
    bridge = 'Lapp/patchlab/extension/rtl/RtlSmsLayout;->'
    settings = [i for i in instructions(patched, appearance) if i.get('Reference', '').startswith(bridge)]
    check(len(settings) == 1 and 'renderSettings' in settings[0]['Reference'], 'exactly one Appearance settings hook')
    latest = 'Lz/lY;->t(Ljava/lang/String;)Ljava/lang/String;' in original['methods']
    check(settings[0]['RegisterC'] == 5, 'settings hook uses live final-item Composer (not initial cast v6)')
    row = select(original, 'Lcom/zensms/app/ui/conversations/b;->f(')
    a, b = instructions(original, row), instructions(patched, row)
    hooks = [i for i in b if i.get('Reference', '').startswith(bridge)]
    check(len(hooks) == 6, 'row has exactly six scoped RTL bridge calls')
    check(all(i.get('RegisterC') == (11 if latest else 12) for i in hooks if i['Reference'].endswith('(Ljava/lang/Object;)V')), 'row hooks use live Composer')
    titles = [n for n, i in enumerate(b) if 'Text-IbK3jfQ(' in i.get('Reference', '')]
    check(len(titles) == (2 if latest else 1), 'stock annotated Text calls preserved')
    title = titles[0]
    check('conversationLabelTextAlign' in b[title-3].get('Reference', '') and b[title-1]['op'] == 'CHECK_CAST', 'title receives explicit physical right alignment')
    check('endDirectionProvider' in b[title+1].get('Reference', ''), 'title LTR provider closes immediately after title')
    if latest:
        check(not any(i.get('Reference', '').startswith(bridge) for i in b[titles[1]-6:titles[1]+2]), 'annotated message preview is not mistaken for title')
    callback = 'Lapp/patchlab/extension/rtl/RtlSmsLayout$ToggleCallback;'
    parent, interfaces, _ = patched['classes'][callback]
    check(parent == 'Lkotlin/jvm/internal/Lambda;', 'settings callback retains required Lambda superclass')
    check(interfaces == [('Lz/bn;' if latest else 'Lz/gk;')], 'callback implements exact app Function1 ABI')
    check(all(x in original['classes'] for x in interfaces), 'no missing callback interfaces')
    reflection = instructions(patched, bridge + 'ensureSettingsReflection()V')
    strings = {i.get('Reference') for i in reflection if i.get('ReferenceType') == 0}
    check({'com.zensms.app.ui.settings.' + ('q' if latest else 'p'), 'z.' + ('bn' if latest else 'gk'), 'z.' + ('fn' if latest else 'kk')} <= strings,
          'reflective SettingsSwitch class and Function1/2 linkage match target')


def main():
    original, patched = [json.load(open(p)) for p in sys.argv[1:3]]
    mode = sys.argv[3] if len(sys.argv) > 3 else 'all'
    if mode in ('premium', 'all'):
        premium(original, patched)
    if mode in ('otp', 'all'):
        otp(original, patched)
    if mode in ('rtl', 'all'):
        rtl(original, patched)


if __name__ == '__main__':
    main()
