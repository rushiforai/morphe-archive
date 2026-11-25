"""Original OSB closure instructions with explicit VM/URL boundaries.

These fixtures execute the native frame, captured arguments, forceCmp branches
and typed async completion. Saved-choice identities are opaque inputs, not real
parsed TCF strings. VM helpers, remote CMP and the Dart event loop are outside
this bounded CPU fixture. Manual storage is tested by tvgids_consent_vm.py.
"""
import hashlib
import json
from pathlib import Path

from tvgids_native_contracts import executable_offset, native_layout
from tvgids_native_vm import Boundary, DartMachine, FunctionRange
from tvgids_tracking_vm import VmFuture

RANGES = json.loads(Path(__file__).with_name('tvgids_consent_native_ranges.json').read_text())


class ConsentUrlAdmission(Exception):
    """The original CMP URL helper was reached, without requesting a real URL."""


class ManualCmpAdmission(Exception):
    """The original manual route was reached, without displaying a real CMP."""


def function(abi, image, name):
    row = RANGES[abi][name]
    offset = executable_offset(native_layout(image, abi), row['address'], row['size'])
    assert hashlib.sha256(image[offset:offset+row['size']]).hexdigest() == row['sha256'], name+' owner changed'
    return FunctionRange(name, row['address'], row['size'], row['sha256'])


def observed_closure(abi, original, image):
    owner = function(abi, original, 'closure')
    offset = executable_offset(native_layout(image, abi), owner.address, owner.size)
    return FunctionRange('closure', owner.address, owner.size, hashlib.sha256(image[offset:offset+owner.size]).hexdigest())


def verify_cave_ingress(abi, original):
    from capstone import Cs, CS_ARCH_ARM, CS_ARCH_ARM64, CS_ARCH_X86, CS_MODE_ARM, CS_MODE_64, CS_GRP_JUMP, CS_OP_IMM
    spec = RANGES[abi]
    owner = function(abi, original, 'closure')
    offset = executable_offset(native_layout(original, abi), owner.address, owner.size)
    cpu = Cs(*{'arm64-v8a': (CS_ARCH_ARM64, CS_MODE_ARM),
               'armeabi-v7a': (CS_ARCH_ARM, CS_MODE_ARM),
               'x86_64': (CS_ARCH_X86, CS_MODE_64)}[abi])
    cpu.detail = True
    incoming = []
    for instruction in cpu.disasm(original[offset:offset+owner.size], owner.address):
        if instruction.group(CS_GRP_JUMP) and instruction.operands and instruction.operands[-1].type == CS_OP_IMM:
            target = instruction.operands[-1].imm
            if spec['cave'] <= target < spec['cave']+spec['caveSize']:
                incoming.append((instruction.address, target))
    assert incoming == [(spec['originalCaveIngress'], spec['cave'])], 'Unexpected original trampoline ingress'


def run_consent_closure(abi, original, image, force_cmp, onboarding, saved_choice):
    def context(vm):
        argument = 'r10' if abi == 'x86_64' else 'x1' if abi == 'arm64-v8a' else 'r1'
        assert vm.register(argument) == 1
        vm.return_call(vm.heap+0x4001)

    def initialize(vm):
        frame = vm.register('fp')
        assert vm.objects[vm.register('result')] == 'Null?'
        assert vm.pointer(frame-vm.word) == vm.null
        state, future = vm.heap+0x6001, vm.heap+0x7001
        assert state not in vm.objects and future not in vm.objects
        vm.objects[state] = {'future': future}
        vm.objects[future] = VmFuture('Null?')
        vm.pointer(frame-vm.word, state)
        vm.return_call(state)

    def complete(vm):
        frame = vm.register('fp')
        state = vm.objects[vm.pointer(frame-vm.word)]
        future = vm.objects[state['future']]
        assert future.type_argument == 'Null?' and vm.register('result') == vm.null
        future.complete(vm.null)
        old_frame, caller = vm.pointer(frame), vm.pointer(frame+vm.word)
        vm.register('fp', old_frame)
        if abi == 'x86_64':
            vm.register('sp', frame+vm.word)
        else:
            vm.register('sp', frame+2*vm.word)
            vm.register('lr', caller)
        vm.return_call(state['future'])

    def url(vm):
        argument = 'rdi' if abi == 'x86_64' else 'x1' if abi == 'arm64-v8a' else 'r1'
        assert vm.register(argument) == vm.heap+0x3001, 'Manual CMP lost original OSB argument'
        raise ConsentUrlAdmission()

    vm = DartMachine(abi, image, [observed_closure(abi, original, image)],
                     [Boundary(function(abi, image, name), callback) for name, callback in
                      [('allocate', context), ('init', initialize), ('return', complete), ('url', url)]])
    parent, closure = vm.heap+0x2001, vm.heap+0x1001
    true, false = vm.null+0x20, vm.null+0x30
    argument = vm.null if saved_choice == 'unset' else vm.heap+{
        'cached-grant': 0x9001, 'cached-reject': 0xa001, 'malformed': 0xb001}[saved_choice]
    if abi == 'armeabi-v7a':
        vm.pointer(vm.THREAD+0x48, true)
        vm.pointer(vm.THREAD+0x4c, false)
        fields = [(closure+0x13, parent), (parent+0xb, vm.heap+0x3001),
                  (parent+0x13, true if force_cmp else false), (parent+0x17, true if onboarding else false)]
        for at, value in fields:
            vm.pointer(at, value)
        vm.pointer(vm.initial_sp+4, closure)
        vm.pointer(vm.initial_sp, argument)
        vm.pool(0x334, vm.heap+0x8001)
    else:
        fields = [(closure+0x17, parent), (parent+0xf, vm.heap+0x3001),
                  (parent+0x17, true if force_cmp else false), (parent+0x1b, true if onboarding else false)]
        for at, value in fields:
            vm.pointer(at, value, 4)
        delta = 8 if abi == 'x86_64' else 0
        vm.pointer(vm.initial_sp+delta+8, closure)
        vm.pointer(vm.initial_sp+delta, argument)
        vm.pool(0x668, vm.heap+0x8001)
    vm.objects[vm.heap+0x8001] = 'Null?'
    try:
        result = vm.run(RANGES[abi]['closure']['address'])
    except ConsentUrlAdmission:
        assert vm.calls == ['allocate', 'init', 'url']
        outcome = 'CMP URL'
    else:
        future = vm.objects.get(result)
        assert isinstance(future, VmFuture), 'Automatic consent returned raw value instead of Future'
        assert future.completed and future.completion_count == 1 and future.value == vm.null
        assert vm.calls == ['allocate', 'init', 'return']
        outcome = 'completed Future'
    captured = vm.heap+0x4001+(0xb if abi == 'armeabi-v7a' else 0xf)
    assert vm.pointer(captured, size=4) == (argument & 0xffffffff), 'Saved consent callback input changed'
    return outcome


def verify_manual_branch(abi, original, image):
    """Execute the original later forceCmp-true branch into original openCmp.

    This starts from a declared post-parse frame snapshot. Parsing/await is not
    synthesized as a full execution. It proves the cave cannot be re-entered by
    the manual forceCmp decision and retains real navigation arguments.
    """
    spec = RANGES[abi]

    def open_cmp(vm):
        registers = {'arm64-v8a': ('x1', 'x2', 'x3'),
                     'armeabi-v7a': ('r1', 'r2', 'r3'),
                     'x86_64': ('rdi', 'rsi', 'rdx')}[abi]
        assert [vm.register(r) for r in registers] == [vm.heap+0x3001, vm.heap+0x5001, vm.heap+0x9001]
        assert not any(spec['cave'] <= at < spec['cave']+spec['caveSize'] for at in vm.trace), 'Manual route entered automatic trampoline'
        raise ManualCmpAdmission()

    vm = DartMachine(abi, image, [observed_closure(abi, original, image)],
                     [Boundary(function(abi, image, 'openCmp'), open_cmp)])
    parent, true = vm.heap+0x2001, vm.null+0x20
    frame = vm.initial_sp-0x100
    vm.register('fp', frame)
    vm.register('sp', frame-0xc8)
    if abi == 'armeabi-v7a':
        vm.pointer(vm.THREAD+0x48, true)
        vm.register('r4', parent)
        vm.register('r3', true)
        for at, value in [(parent+0xb, vm.heap+0x3001), (parent+0xf, vm.heap+0x5001),
                          (parent+0x13, true), (frame-0x4c, vm.heap+0x9001)]:
            vm.pointer(at, value)
    else:
        vm.register('x3' if abi == 'arm64-v8a' else 'rax', parent)
        for at, value in [(parent+0xf, vm.heap+0x3001), (parent+0x13, vm.heap+0x5001), (parent+0x17, true)]:
            vm.pointer(at, value, 4)
        vm.pointer(frame-0x98, vm.heap+0x9001)
        vm.pool(0xa40, vm.heap+0xd001)
    try:
        vm.run(spec['manualBranch'])
    except ManualCmpAdmission:
        return 1
    raise AssertionError('Manual consent branch did not reach original openCmp')


def verify_consent_callers(abi, original, image, skipped):
    verify_cave_ingress(abi, original)
    assertions = 1
    for force_cmp in (False, True):
        for onboarding in (False, True):
            for saved_choice in ('unset', 'cached-grant', 'cached-reject', 'malformed'):
                outcome = run_consent_closure(abi, original, image, force_cmp, onboarding, saved_choice)
                expected = 'completed Future' if skipped and not force_cmp else 'CMP URL'
                assert outcome == expected, ('Automatic CMP URL admission remains' if skipped and not force_cmp
                                            else 'Manual/original consent route changed', abi, force_cmp, onboarding, saved_choice)
                assertions += 1
    return assertions + verify_manual_branch(abi, original, image)


def verify_consent_mutations(abi, original, image):
    """Prove restored hooks, missing trampolines and raw returns cannot pass."""
    spec = RANGES[abi]
    layout = native_layout(image, abi)
    rows = json.loads(Path(__file__).with_name('tvgids_consent_native_edits.json').read_text())[abi]
    mutations = []
    for row in rows:
        changed = bytearray(image)
        before = bytes.fromhex(row['before'])
        offset = executable_offset(layout, row['at'], len(before))
        changed[offset:offset+len(before)] = before
        mutations.append(('missing hook' if row['at'] == spec['hook'] else 'missing trampoline', changed))
    changed = bytearray(image)
    raw_return = bytes.fromhex({'arm64-v8a': 'c0035fd6', 'armeabi-v7a': '1eff2fe1', 'x86_64': 'c3'}[abi])
    offset = executable_offset(layout, spec['hook'], len(raw_return))
    changed[offset:offset+len(raw_return)] = raw_return
    mutations.append(('raw return', changed))
    for name, changed in mutations:
        try:
            verify_consent_callers(abi, original, bytes(changed), True)
        except AssertionError:
            continue
        raise AssertionError('Consent verifier accepted '+name)
    return len(mutations)
