"""Sentry disabled branches and app runner, using shipped machine instructions.

VM allocation, dispatch identities and async suspension/resumption are explicit
boundaries. Futures must already be completed before this fixture resumes an
await. It does not execute the Dart event loop or the Android app's full startup.
The Flutter prefix retains its real frame, then models options construction up
to the native-support call; the core initializer is executed separately in full.
"""
import hashlib
import json
from pathlib import Path
from tvgids_ads_vm import function
from tvgids_native_vm import Boundary, DartMachine, FunctionRange
from tvgids_native_contracts import native_layout, executable_offset
from tvgids_tracking_vm import VmFuture

RANGES = json.loads(Path(__file__).with_name('tvgids_sentry_ranges.json').read_text())
ARGUMENTS = {'arm64-v8a': ('x1', 'x2', 'x3'), 'armeabi-v7a': ('r1', 'r2', 'r3'), 'x86_64': ('rdi', 'rsi', 'rdx')}


class SentryAdmission(Exception):
    pass


def machine(abi, original, output, owners, *, empty=False):
    spec = RANGES[abi]
    layout = native_layout(output, abi)

    def observed(key):
        row = spec[key]
        offset = executable_offset(layout, row['address'], row['size'])
        assert hashlib.sha256(original[offset:offset+row['size']]).hexdigest() == row['sha256']
        return FunctionRange(key, row['address'], row['size'], hashlib.sha256(output[offset:offset+row['size']]).hexdigest())

    def context(vm):
        count = vm.register('r10' if abi == 'x86_64' else ARGUMENTS[abi][0])
        assert count in (1, 2)
        address = vm.heap+0x10001
        vm.objects[address] = ('Context', count)
        vm.return_call(address)

    def initialize(vm):
        kind = vm.objects.get(vm.register('result'))
        assert kind in ('void?', 'bool'), 'Unknown async type argument'
        frame = vm.register('fp')
        assert vm.pointer(frame-vm.word) == vm.null
        n = sum(isinstance(v, VmFuture) for v in vm.objects.values())
        state = vm.heap+0x40001+n*0x1000
        future = state+0x800
        vm.objects[state] = {'kind': 'SuspendState', 'future': future}
        vm.objects[future] = VmFuture(kind)
        vm.pointer(frame-vm.word, state)
        vm.return_call(state)

    def complete(vm):
        frame = vm.register('fp')
        state = vm.objects.get(vm.pointer(frame-vm.word))
        assert isinstance(state, dict) and state.get('kind') == 'SuspendState'
        future = vm.objects[state['future']]
        value = vm.register('result')
        assert value in (vm.true, vm.false) if future.type_argument == 'bool' else value == vm.null
        future.complete(value)
        old, caller = vm.pointer(frame), vm.pointer(frame+vm.word)
        vm.register('fp', old)
        if abi == 'x86_64':
            vm.register('sp', frame+vm.word)
        else:
            vm.register('sp', frame+2*vm.word)
            vm.register('lr', caller)
        vm.return_call(state['future'])

    def await_completed(vm):
        argument = vm.register('rcx' if abi == 'x86_64' else ARGUMENTS[abi][0])
        future = vm.objects.get(argument)
        if isinstance(future, VmFuture):
            assert future.completed and future.completion_count == 1, 'Await resumed a pending or duplicate Future'
            value = future.value
        else:
            assert argument == vm.null, 'Unmodeled FutureOr value'
            value = vm.null
        if abi == 'x86_64':
            # The x64 await site has an unwind epilogue followed by its resume
            # continuation. Model an immediate resume on the same saved frame.
            resume = vm.pointer(vm.register('sp'))
            assert bytes(vm.uc.mem_read(resume, 5)) == bytes.fromhex('4889ec5dc3')
            vm.return_call(value)
            vm.register('pc', resume+5)
        else:
            vm.return_call(value)

    def admission(key):
        def call(vm): raise SentryAdmission(key)
        return call

    def enabled(vm):
        # The original SDK starts with a NoOpHub; the real close path below
        # replaces the static hub with the actual modeled NoOpHub identity.
        assert vm.pointer(vm.fields+vm.hub_slot) == vm.noop
        vm.return_call(vm.false)

    def run_app(vm):
        vm.app_runs += 1
        vm.return_call(vm.null)

    def get_integrations(vm):
        assert vm.register(ARGUMENTS[abi][0]) == vm.options
        vm.return_call(vm.list)

    boundaries = [Boundary(function(abi, 'context'), context),
        Boundary(function(abi, 'initAsync'), initialize), Boundary(function(abi, 'returnAsync'), complete),
        Boundary(observed('await'), await_completed), Boundary(observed('hubEnabled'), enabled),
        Boundary(observed('getIntegrations'), get_integrations),
        Boundary(function(abi, 'runApp'), run_app)]
    boundaries += [Boundary(observed(key), admission(key)) for key in ('parseDsn', 'iterator', 'createBinding') if key not in owners]
    owned = [function(abi, 'appRunner') if key == 'appRunner' else observed(key) for key in owners]
    vm = DartMachine(abi, output, owned, boundaries)
    vm.true = vm.null+(0x10 if vm.word == 4 else 0x20)
    vm.false = vm.null+(0x18 if vm.word == 4 else 0x30)
    vm.app_runs = 0
    vm.fields, vm.noop = vm.heap+0x70000, vm.heap+0x9001
    vm.hub_slot = 0x14a8 if vm.word == 4 else 0x2950
    vm.pointer(vm.THREAD+(0x38 if vm.word == 4 else 0x78), vm.fields)
    vm.pointer(vm.fields+vm.hub_slot, vm.noop)
    vm.pointer(vm.fields+(0x1510 if vm.word == 4 else 0x2a20), vm.noop)
    vm.pointer(vm.noop-1, 1025 << 12)
    if abi == 'armeabi-v7a':
        vm.pointer(vm.THREAD+0x48, vm.true)
        vm.pointer(vm.THREAD+0x4c, vm.false)
    if abi == 'x86_64':
        vm.pointer(vm.THREAD+0x98, vm.true)
        vm.pointer(vm.THREAD+0xa0, vm.false)
    # VM-supplied dispatch tables. The concrete NoOpHub.close and List iterator
    # targets are pinned original code, not behavior inferred from a name.
    dispatch = 0x32010000
    vm.uc.mem_map(0x32000000, 0x100000)
    if abi == 'arm64-v8a': vm.register('x21', dispatch)
    elif abi == 'armeabi-v7a': vm.register('r7', dispatch)
    else: vm.pointer(vm.THREAD+0x70, dispatch)
    close_bias = {'arm64-v8a': -0xffe*8, 'armeabi-v7a': -0xfbc, 'x86_64': 0xa28}[abi]
    iterator_bias = {'arm64-v8a': 0xb441*8, 'armeabi-v7a': 0x2a898, 'x86_64': 0x4d258}[abi]
    vm.pointer(dispatch+1025*vm.word+close_bias, spec['noopClose']['address'])
    vm.list = vm.heap+0xa001
    vm.pointer(vm.list-1, 95 << 12)
    vm.pointer(dispatch+95*vm.word+iterator_bias, spec['iterator']['address'])
    vm.options, blank, dsn, void_type, bool_type, runner = (vm.heap+n for n in (0x2001, 0x3001, 0x4001, 0x5001, 0x6001, 0x8001))
    vm.objects.update({vm.options: 'SentryOptions', blank: '', dsn: 'fixture-dsn',
        void_type: 'void?', bool_type: 'bool', vm.noop: 'NoOpHub', vm.list: 'List<Integration>', runner: 'app runner closure'})
    vm.pointer(blank+7, 0, 4)
    vm.pointer(dsn+7, 22, 4)
    vm.pointer(vm.options+(3 if vm.word == 4 else 7), blank if empty else dsn, 4)
    vm.pointer(vm.options+(7 if vm.word == 4 else 0xb), vm.null, 4)
    vm.pool(spec['emptyPool'], blank)
    vm.pool(0x28 if vm.word == 4 else 0x50, void_type)
    vm.pool({'arm64-v8a': 0x1658, 'armeabi-v7a': 0xb2c, 'x86_64': 0x1660}[abi], bool_type)
    vm.pool(0x90 if vm.word == 8 else 0x48, vm.heap+0xb001)
    vm.pointer(runner+(0x1b if vm.word == 4 else 0x1f), function(abi, 'appRunner').address)
    for register, value in zip(ARGUMENTS[abi], (vm.options, runner, vm.false)):
        vm.register(register, value)
    return vm


def verify_sentry_callers(abi, original, output, disabled):
    spec = RANGES[abi]
    assertions = 0
    vm = machine(abi, original, output, ('supports', 'simpleFalse'))
    assert vm.run(spec['supports']['address']) == (vm.false if disabled else vm.true)
    assertions += 1
    assertions += verify_sentry_native_prefix(abi, original, output, disabled)
    # Genuine original empty-DSN configuration closes to NoOpHub. A nonempty
    # original DSN reaches parsing; the policy must use that same close branch.
    for empty in (True, False):
        vm = machine(abi, original, output, ('config', 'close', 'noopClose'), empty=empty)
        before = bytes(vm.uc.mem_read(vm.options, 32))
        try: result = vm.run(spec['config']['address'])
        except SentryAdmission as e:
            assert not disabled and not empty and str(e) == 'parseDsn'
            assertions += 1; continue
        assert empty or disabled
        future = vm.objects[result]
        assert isinstance(future, VmFuture) and future.type_argument == 'bool' and future.value == vm.false
        futures = [v for v in vm.objects.values() if isinstance(v, VmFuture)]
        assert len(futures) == 3 and all(v.completed and v.completion_count == 1 for v in futures)
        assert vm.pointer(vm.fields+vm.hub_slot) == vm.noop and vm.app_runs == 0
        assert bytes(vm.uc.mem_read(vm.options, 32)) == before, 'Disabled validation modified shared options'
        assertions += 4
    vm = machine(abi, original, output, ('integrations',))
    vm.register(ARGUMENTS[abi][0], vm.list)
    try: result = vm.run(spec['integrations']['address'])
    except SentryAdmission as e:
        assert not disabled and str(e) == 'iterator'; assertions += 1
    else:
        future = vm.objects[result]
        assert disabled and future.type_argument == 'void?' and future.completed and future.value == vm.null
        assert vm.calls == ['initAsync', 'returnAsync']; assertions += 2
    vm = machine(abi, original, output, ('core', 'config', 'close', 'noopClose', 'integrations', 'appRunner'))
    try: result = vm.run(spec['core']['address'])
    except SentryAdmission as e:
        assert not disabled and str(e) == 'parseDsn'; assertions += 1
    else:
        assert disabled and vm.app_runs == 1
        future = vm.objects[result]
        assert future.type_argument == 'void?' and future.completed and future.value == vm.null
        futures = [v for v in vm.objects.values() if isinstance(v, VmFuture)]
        assert len(futures) == 5 and all(v.completed and v.completion_count == 1 for v in futures)
        assert vm.pointer(vm.fields+vm.hub_slot) == vm.noop
        assertions += 4
    return assertions


def verify_sentry_native_prefix(abi, original, output, disabled):
    spec = RANGES[abi]
    vm = machine(abi, original, output, ('flutterInit', 'supports', 'simpleFalse'))
    vm.uc.emu_start(spec['flutterInit']['address'], spec['flutterInitAfterInit'], count=1000)
    if vm.fault: raise vm.fault
    assert vm.register('pc') == spec['flutterInitAfterInit']
    frame = vm.register('fp')
    # Options construction between these points is modeled, not executed.
    vm.pointer(frame-(8 if vm.word == 4 else 0x10), vm.options)
    vm.register(ARGUMENTS[abi][0], vm.heap+0xc001)
    vm.uc.emu_start(spec['nativeCall'], spec['afterBinding'], count=1000)
    if vm.fault:
        assert not disabled and isinstance(vm.fault, SentryAdmission) and str(vm.fault) == 'createBinding'
        return 2
    assert disabled and vm.register('pc') == spec['afterBinding']
    assert vm.register('fp') == frame and vm.register('sp') == frame-spec['flutterStack']
    futures = [v for v in vm.objects.values() if isinstance(v, VmFuture)]
    assert len(futures) == 1 and futures[0].type_argument == 'void?' and not futures[0].completed
    assert vm.calls == ['context', 'initAsync']
    return 4
