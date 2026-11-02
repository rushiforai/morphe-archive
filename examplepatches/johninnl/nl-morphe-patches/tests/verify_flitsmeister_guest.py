"""Verify guest entry against independent publisher DEX and resource contracts."""
import argparse
import hashlib
from itertools import product
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from rtl_vm import Memory, Program, Reference, execute
from verify_flitsmeister import canonical, digest, method

LANDING = 'Lu8d;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;'
GATE = 'Lcei;->a(Lvn4;)Ljava/lang/Object;'
BANNER = 'Lstb;->b(Lz39;Landroidx/compose/runtime/Composer;I)V'
BUTTON = 'Laa8;->b(Landroidx/compose/ui/Modifier;Ljava/lang/String;Luy1;Lvy1;Landroidx/compose/foundation/shape/CornerSize;ZZLz39;Landroidx/compose/runtime/Composer;II)V'
ORIGINAL_LANDING = 'db64fc556fe39bbffc4310733c799832bee478fde3728d3693b944bc291eb92b'
ORIGINAL_GATE = '56ec172c5711df15e75d0e306a3238235909b399b599298b60b5ac9708967a35'
ORIGINAL_BANNER = '340aa923d072ae65d012d1ec28959054523438cf92273a908d6dcf7154d8fce6'
RETAINED = {
    'Lstb;->a(Ljava/lang/String;Ljava/lang/String;Lkxb;Ljava/lang/String;Lz39;Landroidx/compose/runtime/Composer;I)V': 'fae411f6b87ab4dfa99e47bc22990835fbe1e0fc4b88b2c8c16f1ce23842b7cb',
    'Lstb;->c(Lhxb;Lb49;Landroidx/compose/runtime/Composer;I)V': '16787f75ecc7dd433c1091e3b41dcfcd9afee67070d684f17584d50312b1a13b',
    'Lkzb;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': '3457e5a9f6a3935faa8ffedc31dfbd6e818c44f518d2469f5220dbd9867f4bde',
    'Lnad;->invoke()Ljava/lang/Object;': 'ea22b79ae6f2a6cb8807e9e63c53166a4331677ab6a96315e2564b51bc297572',
    'Lcdd;->a(Landroid/content/Context;)V': '78c533b96a68273004ceabf97af5dd84d562a8c5b0a65dcdee8cf784f9173bf7',
    'Lnl/flitsmeister/features/onboarding/composables/OnboardingActivity;->u()V': '3b24338f81c62d6210fb1e98f8a14b1790c680b3fff1724d96f149c3e5f4c906',
    'Lnl/flitsmeister/account/data/DefaultAccountRepository;->loginWithGoogleSignInCredentials-gIAlu-s(Ljava/lang/String;Ltn4;)Ljava/lang/Object;': 'ce0ee09337efcdb151bb6c73f739609717031acc1379093515109c81daded8c4',
}


def hash_code(instructions):
    return hashlib.sha256('\n'.join(instructions).encode()).hexdigest()


def gate_result(root, finished, previous, signed_in, dash, resume=0):
    """Execute the whole emitted coroutine; preference reads are explicit boundaries."""
    context = Reference({}, 'Landroid/content/Context;')
    box = lambda value: Reference(bool(value), 'Ljava/lang/Boolean;')
    history = Reference({}, 'Lcge;')
    account = Reference({}, 'Lnl/flitsmeister/models/data/account/UserAccountFM;') if signed_in else 0
    repository = Reference({'Lib;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;': account}, 'Lib;')
    owner = Reference({
        'Lcei;->a:Landroid/content/Context;': context,
        'Lcei;->b:Ldhe;': Reference({'Ldhe;->U:Lcge;': history}, 'Ldhe;'),
    }, 'Lcei;')
    statics = {
        'Lkph;->t0:Llph;': Reference({}, 'Llph;'),
        'Lib;->j:Lib$a;': Reference({}, 'Lib$a;'),
        'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;': box(False),
        'Lb55;->a:Lb55;': Reference({}, 'Lb55;'),
    }
    for suffix in 'abc':
        name = f'Lcei$a${suffix};'
        statics[name + '->a:' + name] = Reference(suffix, name)
    memory = Memory(statics=statics)
    continuation = 0
    if resume:
        continuation = Reference({'Ldei;->c:I': -2147483648 + resume,
                                  'Ldei;->a:Ljava/lang/Object;': box(previous if resume == 1 else dash)}, 'Ldei;')

    def invoke(target, args):
        if target == 'Ldei;-><init>(Lcei;Lvn4;)V':
            args[0].value.update({'Ldei;->c:I': 0, 'Ldei;->a:Ljava/lang/Object;': 0})
        elif target == 'Lijf;->b(Ljava/lang/Object;)V':
            return None
        elif target == 'Llph;->a(Landroid/content/Context;)Z':
            return int(finished)
        elif target == 'Landroid/content/Context;->getApplicationContext()Landroid/content/Context;':
            return context
        elif target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            return Reference({}, 'Ljava/lang/Class;')
        elif target == 'Lgg0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;':
            return repository
        elif target == 'Lcge;->d(Ltn4;)Ljava/lang/Object;':
            assert args[0] is history
            return box(previous)
        elif target == 'Ljava/lang/Boolean;->booleanValue()Z':
            return int(args[0].value)
        elif target == 'Lcei;->b(Lvn4;)Ljava/lang/Object;':
            return box(dash)
        else:
            raise AssertionError('Unexpected guest gate side effect: ' + target)

    result = execute(Program(canonical(method(root, GATE)), {}, {}),
                     {'v5': owner, 'v6': continuation}, invoke, memory=memory)
    assert repository.value['Lib;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;'] is account
    return result.value


def verify_gate(root, enabled):
    body = method(root, GATE)
    instructions = canonical(body)
    if enabled:
        assert instructions[56] == 'goto @58', 'Guest mode must bypass only the previous-login redirect'
        instructions[56] = 'if-eqz v6, @58'
        assert hash_code(instructions) == ORIGINAL_GATE, 'Unrelated startup or coroutine logic changed'
    else:
        assert digest(body) == ORIGINAL_GATE
    for finished, previous, signed_in, dash in product((False, True), repeat=4):
        expected = 'a' if not finished or (previous and not signed_in and not enabled) else 'b' if dash else 'c'
        assert gate_result(root, finished, previous, signed_in, dash) == expected
    for previous, dash in product((False, True), repeat=2):
        expected = 'a' if previous and not enabled else 'b' if dash else 'c'
        assert gate_result(root, True, previous, False, dash, resume=1) == expected
        assert gate_result(root, True, previous, False, dash, resume=2) == ('b' if dash else 'c')


def resource(root, directory, name):
    matches = []
    for path in (root / 'res' / directory).glob('*.xml'):
        matches.extend(node.text for node in ET.parse(path).getroot().findall('string') if node.get('name') == name)
    assert len(matches) == 1, f'Expected one {directory}/{name} label'
    return matches[0]


def verify_banner(root, enabled):
    body = method(root, BANNER)
    if not enabled:
        assert digest(body) == ORIGINAL_BANNER
        return
    callback = Reference({}, 'Lz39;')
    composer = Reference({}, 'Landroidx/compose/runtime/Composer;')

    def invoke(target, args):
        if target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            return Reference({}, 'Ljava/lang/Class;')
        raise AssertionError('Guest mode must not render or dispatch the account sign-up card: ' + target)

    execute(Program(canonical(body), {}, {}),
            {'v8': callback, 'v9': composer, 'v10': 0}, invoke)
    assert callback.value == {} and composer.value == {}, 'Guest banner changed its arguments'


def verify_button(root, enabled):
    body = method(root, LANDING)
    instructions = canonical(body)
    if not enabled:
        assert digest(body) == ORIGINAL_LANDING
        return
    calls = [i for i, row in enumerate(instructions) if BUTTON in row]
    assert len(calls) == 1, 'Continue as guest button is missing or duplicated'
    start = next(i + 1 for i, row in enumerate(instructions) if '->startReplaceGroup(I)V' in row)
    end = next(i for i in range(start, len(instructions)) if '->endReplaceGroup()V' in instructions[i])
    assert start <= calls[0] < end, 'Guest button must be inside the existing Compose group'
    block = instructions[start:end]
    restored = instructions[:start] + instructions[end:]
    count = end - start

    def rebase(match):
        target = int(match[1])
        assert not start <= target < end, 'Original branch entered injected code'
        return '@' + str(target - count if target >= end else target)

    restored = [re.sub(r'@(\d+)', rebase, row) for row in restored]
    assert hash_code(restored) == ORIGINAL_LANDING, 'Guest button changed existing login UI or callbacks'
    assert resource(root, 'values', 'morphe_continue_as_guest') == 'Continue as guest'
    assert resource(root, 'values-nl', 'morphe_continue_as_guest') == 'Doorgaan als gast'
    public = ET.parse(root / 'res/values/public.xml').getroot()
    ids = [int(n.get('id'), 16) for n in public if n.get('type') == 'string' and n.get('name') == 'morphe_continue_as_guest']
    assert len(ids) == 1
    callback = Reference({}, 'Lz39;')
    composer = Reference({}, 'Landroidx/compose/runtime/Composer;')
    size = Reference({}, 'Lvy1;')
    owner = Reference({'Lu8d;->d:Lz39;': callback}, 'Lu8d;')
    registers = {'v27': owner, 'v4': size, 'v10': composer, 'v16': composer}
    seen = []

    def invoke(target, args):
        if target == 'Lria;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;':
            assert args == [ids[0], composer, 0]
            return 'Continue as guest'
        assert target == BUTTON, 'Unexpected side effect in guest button: ' + target
        assert args[1] == 'Continue as guest'
        assert args[3] is size and args[7] is callback and args[8] is composer
        assert args[10] == 0x71, 'Native button defaults changed'
        seen.append(args)

    memory = Memory(statics={'Luy1$f;->a:Luy1$f;': Reference({}, 'Luy1;')})
    execute(Program(block + ['return-void'], {}, {}), registers, invoke, memory=memory)
    assert len(seen) == 1 and registers['v10'] is composer


def verify(root, enabled):
    verify_gate(root, enabled)
    verify_button(root, enabled)
    verify_banner(root, enabled)
    for descriptor, expected in RETAINED.items():
        assert digest(method(root, descriptor)) == expected, 'Native account/permission/completion path changed: ' + descriptor


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--enabled', action='store_true')
    args = parser.parse_args()
    verify(args.decoded, args.enabled)
    print('PASS: guest entry, startup decisions, and native account/completion contracts')
