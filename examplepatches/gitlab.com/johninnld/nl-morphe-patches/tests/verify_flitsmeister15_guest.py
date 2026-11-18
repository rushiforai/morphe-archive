"""Verify guest entry against independent 15.0 publisher DEX and resource contracts."""
import argparse
import hashlib
from itertools import product
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from rtl_vm import Memory, Program, Reference, execute
from verify_flitsmeister import canonical, digest, method

LANDING = 'Lkad;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;'
GATE = 'Lbji;->a(Lun4;)Ljava/lang/Object;'
BANNER = 'Lovb;->b(Ls39;Landroidx/compose/runtime/Composer;I)V'
BUTTON = 'Lv98;->b(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Modifier;Ljava/lang/String;Lny1;Loy1;Landroidx/compose/foundation/shape/CornerSize;ZZLs39;Landroidx/compose/runtime/Composer;II)V'
ORIGINAL_LANDING = '5c14860bba5f5848dac0d79fc85154ac222157140164edff822cabeaa5356b31'
ORIGINAL_GATE = 'de7b145eb4f633588d3bd9854e435d4848fb655d848883c5b4b507d6d34966ca'
ORIGINAL_BANNER = 'c5f37fa58c5a2d0bf69b14cf62ed9dbfb6e5ccb8890cf1689fa0b170564a9193'
RETAINED = {'Lecd;->invoke()Ljava/lang/Object;': '9191b363a8a3359e7b03deca1db1df8404de217f70d982f0fbaea2c9befb8c0f',
 'Lg1c;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': 'ba8bdb28b9e8707ba749da93b17716cd9f0cba44de922fe0dc9e6bf0edc3f61d',
 'Lnl/flitsmeister/account/data/DefaultAccountRepository;->loginWithGoogleSignInCredentials-gIAlu-s(Ljava/lang/String;Lsn4;)Ljava/lang/Object;': 'eae398779e6261f74d2c572712fb15ba4584469dbb63ee92adb66cf4aaa0e5c9',
 'Lnl/flitsmeister/features/onboarding/composables/OnboardingActivity;->u()V': 'd18933d8cb31979d99f33e4bad5b8ff43eb95b0a9638e5b0c96f75a659927089',
 'Lovb;->a(Ljava/lang/String;Ljava/lang/String;Lczb;Ljava/lang/String;Ls39;Landroidx/compose/runtime/Composer;I)V': '3debe11a41d9fe0fc8f0b242c07ca7c7046e1b7bb3e79a2f7a62e68fe1d026c9',
 'Lovb;->c(Lzyb;Lu39;Landroidx/compose/runtime/Composer;I)V': '72ba8f5cf2d1e24fb6f5ef040209660acd6f7c01dec9fd51c0efc4b78f03f0bc',
 'Lued;->a(Landroid/content/Context;)V': '7b98a00adb9500e14adbf42e900a05725ed911d271799af3fa18e38ccca581e9'}


# Native button API/defaults must remain unchanged while the guest call is added.
RETAINED[BUTTON] = 'c68d2a30242803880d55c5009b8e88b0b491c0b06ffdf618f1853661f2f87ea8'

def hash_code(instructions):
    return hashlib.sha256('\n'.join(instructions).encode()).hexdigest()


def gate_result(root, finished, previous, signed_in, dash, resume=0):
    """Execute the whole emitted coroutine; preference reads are explicit boundaries."""
    context = Reference({}, 'Landroid/content/Context;')
    box = lambda value: Reference(bool(value), 'Ljava/lang/Boolean;')
    history = Reference({}, 'Ljie;')
    account = Reference({}, 'Lnl/flitsmeister/models/data/account/UserAccountFM;') if signed_in else 0
    repository = Reference({'Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;': account}, 'Lgb;')
    owner = Reference({
        'Lbji;->a:Landroid/content/Context;': context,
        'Lbji;->b:Lfje;': Reference({'Lfje;->U:Ljie;': history}, 'Lfje;'),
    }, 'Lbji;')
    statics = {
        'Lsuh;->t0:Ltuh;': Reference({}, 'Ltuh;'),
        'Lgb;->j:Lgb$a;': Reference({}, 'Lgb$a;'),
        'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;': box(False),
        'Ls45;->a:Ls45;': Reference({}, 'Ls45;'),
    }
    for suffix in 'abc':
        name = f'Lbji$a${suffix};'
        statics[name + '->a:' + name] = Reference(suffix, name)
    memory = Memory(statics=statics)
    continuation = 0
    if resume:
        continuation = Reference({'Lcji;->c:I': -2147483648 + resume,
                                  'Lcji;->a:Ljava/lang/Object;': box(previous if resume == 1 else dash)}, 'Lcji;')

    def invoke(target, args):
        if target == 'Lcji;-><init>(Lbji;Lun4;)V':
            args[0].value.update({'Lcji;->c:I': 0, 'Lcji;->a:Ljava/lang/Object;': 0})
        elif target == 'Lhof;->b(Ljava/lang/Object;)V':
            return None
        elif target == 'Ltuh;->a(Landroid/content/Context;)Z':
            return int(finished)
        elif target == 'Landroid/content/Context;->getApplicationContext()Landroid/content/Context;':
            return context
        elif target == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            return Reference({}, 'Ljava/lang/Class;')
        elif target == 'Lig0;->getInstance(Landroid/content/Context;)Ljava/lang/Object;':
            return repository
        elif target == 'Ljie;->d(Lsn4;)Ljava/lang/Object;':
            assert args[0] is history
            return box(previous)
        elif target == 'Ljava/lang/Boolean;->booleanValue()Z':
            return int(args[0].value)
        elif target == 'Lbji;->b(Lun4;)Ljava/lang/Object;':
            return box(dash)
        else:
            raise AssertionError('Unexpected guest gate side effect: ' + target)

    result = execute(Program(canonical(method(root, GATE)), {}, {}),
                     {'v5': owner, 'v6': continuation}, invoke, memory=memory)
    assert repository.value['Lgb;->b:Lnl/flitsmeister/models/data/account/UserAccountFM;'] is account
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
    callback = Reference({}, 'Ls39;')
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
    callback = Reference({}, 'Ls39;')
    composer = Reference({}, 'Landroidx/compose/runtime/Composer;')
    size = Reference({}, 'Loy1;')
    owner = Reference({'Lkad;->d:Ls39;': callback}, 'Lkad;')
    registers = {'v28': owner, 'v4': size, 'v10': composer, 'v16': composer}
    seen = []

    def invoke(target, args):
        if target == 'Lqia;->b(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;':
            assert args == [ids[0], composer, 0]
            return 'Continue as guest'
        assert target == BUTTON, 'Unexpected side effect in guest button: ' + target
        assert args[2] == 'Continue as guest'
        assert args[4] is size and args[8] is callback and args[9] is composer
        assert args[11] == 0xe3, 'Native button defaults changed'
        seen.append(args)

    memory = Memory(statics={'Lny1$f;->a:Lny1$f;': Reference({}, 'Lny1;')})
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
