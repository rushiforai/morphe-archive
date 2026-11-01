"""Original ad-widget and startup closures, executed through the CPU harness.

The VM owns allocation, constant-pool objects and runApp. Their identities and
helper bodies are pinned separately. This does not simulate widget rendering or
the full Sentry initializer; it checks the actual callers and their frame exits.
"""
import json
import hashlib
from pathlib import Path

from tvgids_native_vm import Boundary, DartMachine, FunctionRange


RANGES = json.loads(Path(__file__).with_name('tvgids_native_ranges.json').read_text())
SLOT_LAYOUT = {
    'arm64-v8a': dict(argument='x1', count='x1', closure_function='x1', context='x2',
                      consumer_type='x1', field=0xf, closure_field=0x13,
                      empty_pool=0x8630, closure_pool=0x2ed00, type_pool=0x26488),
    'armeabi-v7a': dict(argument='r1', count='r1', closure_function='r1', context='r2',
                        consumer_type='r3', field=0xb, closure_field=0xf,
                        empty_pool=0x44e0, closure_pool=0x19358, type_pool=0x1455c),
    'x86_64': dict(argument='rdi', count='r10', closure_function='rbx', context='rdx',
                   consumer_type='rdx', field=0xf, closure_field=0x13,
                   empty_pool=0x86c0, closure_pool=0x2ee60, type_pool=0x265e8),
}


def function(abi, key):
    return FunctionRange(name=key, **RANGES[abi][key])


BOX_BUILDERS = ('slot', 'growable', 'sticky', 'failure', 'nlziet', 'sliverDelegate')


def verify_empty_boxes(abi, original, output):
    """Execute each complete edited entry, with valid and stale/null state inputs.

    The verifier must first prove that output differs only at declared policy
    edits. This fixture then tests those actual output instructions, rather than
    treating a replacement-byte match as proof of a returned widget.
    """
    from tvgids_native_contracts import executable_offset, native_layout
    layout = native_layout(output, abi)
    assertions = 0
    for key in BOX_BUILDERS:
        owner = function(abi, key)
        offset = executable_offset(layout, owner.address, owner.size)
        assert hashlib.sha256(original[offset:offset+owner.size]).hexdigest() == owner.sha256
        observed_owner = FunctionRange(key, owner.address, owner.size,
                                      hashlib.sha256(output[offset:offset+owner.size]).hexdigest())
        for state_kind in ('cached', 'missing-config', 'no-fill', 'disposed', 'null'):
            vm = DartMachine(abi, output, [observed_owner])
            empty = vm.heap+0x4001
            vm.objects[empty] = ('SizedBox', 0.0, 0.0)
            vm.pool(SLOT_LAYOUT[abi]['empty_pool'], empty)
            state = vm.null if state_kind == 'null' else vm.heap+0x2001
            vm.register(SLOT_LAYOUT[abi]['argument'], state)
            # Poison the original context/widget fields: a removed placement
            # must not need an ad configuration, view, loader or failed creative.
            vm.pointer(vm.heap+0x2001+SLOT_LAYOUT[abi]['field'], vm.null, 4)
            before = bytes(vm.uc.mem_read(vm.heap+0x2000, 0x100))
            returned = vm.run(owner.address)
            assert vm.objects.get(returned) == ('SizedBox', 0.0, 0.0), (abi, key, state_kind)
            assert vm.calls == [], f'{abi}: {key} admitted an allocation, SDK or network call'
            assert bytes(vm.uc.mem_read(vm.heap+0x2000, 0x100)) == before, 'Ad state was mutated'
            assertions += 3
    return assertions


def run_slot(abi, image, has_widget):
    layout = SLOT_LAYOUT[abi]

    def context(vm):
        assert vm.register(layout['count']) == 1, 'Unexpected context variable count'
        address = vm.heap+0x3001
        vm.objects[address] = 'Context[1]'
        vm.return_call(address)

    def closure(vm):
        assert vm.register(layout['closure_function']) == vm.heap+0x8001, 'Unexpected closure function identity'
        assert vm.objects.get(vm.register(layout['context'])) == 'Context[1]', 'Closure lost state context'
        address = vm.heap+0x5001
        vm.objects[address] = 'AdvertisementSlot.builder closure'
        vm.return_call(address)

    def consumer(vm):
        assert vm.register(layout['consumer_type']) == vm.heap+0x7001, 'Unexpected Consumer type arguments'
        address = vm.heap+0x6001
        vm.objects[address] = 'Consumer<AdsProvider>'
        vm.return_call(address)

    vm = DartMachine(abi, image, [function(abi, 'slot')],
                     [Boundary(function(abi, name), callback) for name, callback in
                      [('context', context), ('closure', closure), ('consumer', consumer)]])
    state, widget = vm.heap+0x2001, vm.heap+0x9001
    vm.objects.update({state: 'AdvertisementSlotState', widget: 'AdvertisementSlot',
                       vm.heap+0x4001: 'SizedBox', vm.heap+0x7001: '<AdsProvider>',
                       vm.heap+0x8001: 'AdvertisementSlot.builder function'})
    vm.register(layout['argument'], state)
    vm.pointer(state+layout['field'], widget if has_widget else vm.null, 4)
    vm.pool(layout['empty_pool'], vm.heap+0x4001)
    vm.pool(layout['closure_pool'], vm.heap+0x8001)
    vm.pool(layout['type_pool'], vm.heap+0x7001)
    result = vm.run(function(abi, 'slot').address)
    assert vm.pointer(vm.heap+0x3001+layout['field'], size=4) == state & 0xffffffff, 'Context did not retain the real state argument'
    kind = vm.objects.get(result)
    assert kind in ('SizedBox', 'Consumer<AdsProvider>'), f'Unmodeled returned widget: {result:#x}'
    if kind == 'Consumer<AdsProvider>':
        assert vm.pointer(result+layout['closure_field'], size=4) == (vm.heap+0x5001) & 0xffffffff, 'Consumer lost its builder closure'
    # Actual metadata: original pooled SizedBox has width/height Double(0),
    # at ARM64/x64 offsets 0x10/0x14 and native ARM32 offsets 0xc/0x10.
    return dict(widget=kind, width=0 if kind == 'SizedBox' else None,
                height=0 if kind == 'SizedBox' else None, calls=vm.calls)


def run_app_runner(abi, image):
    def run_app(vm):
        vm.return_call(vm.null)

    vm = DartMachine(abi, image, [function(abi, 'appRunner')],
                     [Boundary(function(abi, 'runApp'), run_app)])
    result = vm.run(function(abi, 'appRunner').address)
    return dict(calls=vm.calls, returned_null=result == vm.null)


SLIVER_LAYOUT = {
    'arm64-v8a': dict(tail=0x77d7c0, frame_slots=(0x50, 0x68, 0x60, 0x58),
                      extent_fields=(7, 0xf, 0x17, 0x1f), child_field=0x27, header_field=0xb),
    'armeabi-v7a': dict(tail=0x9053b8, frame_slots=(0x2c, 0x44, 0x3c, 0x34),
                        extent_fields=(3, 0xb, 0x13, 0x1b), child_field=0x23, header_field=7),
    'x86_64': dict(tail=0x8309a7, frame_slots=(0x50, 0x68, 0x60, 0x58),
                   extent_fields=(7, 0xf, 0x17, 0x1f), child_field=0x27, header_field=0xb),
}


def run_sliver_extents(abi, original, output, extents):
    """Execute the shipped delegate/header construction tail with typed allocators.

    Entry is the original delegate-allocation call, after its existing frame and
    locals have been established. This covers native field stores, exact helper
    calls and the real frame exit; it does not execute the preceding state update
    or Flutter's rendering engine. No allocation call or safepoint is relocated.
    """
    import struct
    from tvgids_native_contracts import native_layout, executable_offset
    layout = SLIVER_LAYOUT[abi]
    owner = function(abi, 'sliverBuild')
    offset = executable_offset(native_layout(output, abi), owner.address, owner.size)
    assert hashlib.sha256(original[offset:offset+owner.size]).hexdigest() == owner.sha256
    observed = FunctionRange(owner.name, owner.address, owner.size,
                             hashlib.sha256(output[offset:offset+owner.size]).hexdigest())

    def allocate_delegate(vm):
        address = vm.heap+0x5001
        vm.objects[address] = '_SliverStickyAdDelegate'
        vm.return_call(address)

    def allocate_header(vm):
        address = vm.heap+0x6001
        vm.objects[address] = 'SliverPersistentHeader'
        vm.return_call(address)

    vm = DartMachine(abi, output, [observed],
                     [Boundary(function(abi, 'sliverDelegateAlloc'), allocate_delegate),
                      Boundary(function(abi, 'sliverHeaderAlloc'), allocate_header)])
    frame = vm.initial_sp-(8 if abi == 'x86_64' else 2*vm.word)
    vm.register('fp', frame)
    vm.register('sp', frame-0x80)
    vm.pointer(frame, 0)
    vm.pointer(frame+vm.word, vm.EXIT)
    child = vm.heap+0x7001
    vm.objects[child] = 'GrowableAdvertisementSlot subtree'
    vm.pointer(frame-vm.word, child)
    for slot, value in zip(layout['frame_slots'], extents):
        vm.uc.mem_write(frame-slot, struct.pack('<d', value))
    for at, value in ((0x48, vm.null+0x10), (0x4c, vm.null+0x20)) if vm.word == 4 else ((0x98, vm.null+0x20), (0xa0, vm.null+0x30)):
        vm.pointer(vm.THREAD+at, value)
    result = vm.run(layout['tail'])
    assert vm.objects.get(result) == 'SliverPersistentHeader', 'Ad removal returned a box where a sliver is required'
    delegate = vm.pointer(result+layout['header_field'], size=4)
    if vm.word == 8:
        delegate |= vm.heap & ~0xffffffff
    assert vm.objects.get(delegate) == '_SliverStickyAdDelegate'
    assert vm.calls == ['sliverDelegateAlloc', 'sliverHeaderAlloc'], vm.calls
    observed_extents = tuple(struct.unpack('<d', vm.uc.mem_read(delegate+field, 8))[0]
                             for field in layout['extent_fields'])
    assert vm.pointer(delegate+layout['child_field'], size=4) == child & 0xffffffff
    return observed_extents


def run_absent_ad_future(abi, original, output, cached):
    """Execute the actual async entry and its original typed null-return tail."""
    from tvgids_native_contracts import native_layout, executable_offset
    from tvgids_tracking_vm import VmFuture
    owner = function(abi, 'adsFetch')
    offset = executable_offset(native_layout(output, abi), owner.address, owner.size)
    assert hashlib.sha256(original[offset:offset+owner.size]).hexdigest() == owner.sha256
    observed = FunctionRange(owner.name, owner.address, owner.size,
                             hashlib.sha256(output[offset:offset+owner.size]).hexdigest())

    def initialize(vm):
        assert vm.register('result') == vm.null, 'Ad Future lost original dynamic type arguments'
        frame = vm.register('fp')
        assert vm.pointer(frame-vm.word) == vm.null, 'Missing original async state slot'
        future, state = vm.heap+0x11001, vm.heap+0x10001
        vm.objects[future] = VmFuture('dynamic')
        vm.objects[state] = {'kind': 'SuspendState', 'future': future}
        vm.pointer(frame-vm.word, state)
        vm.return_call(state)

    def complete(vm):
        frame = vm.register('fp')
        state = vm.objects.get(vm.pointer(frame-vm.word))
        assert isinstance(state, dict) and state['kind'] == 'SuspendState'
        future = vm.objects[state['future']]
        assert isinstance(future, VmFuture) and future.type_argument == 'dynamic'
        assert vm.register('result') == vm.null, 'Disabled ad request fabricated a result'
        future.complete(vm.null)
        old_frame, caller = vm.pointer(frame), vm.pointer(frame+vm.word)
        vm.register('fp', old_frame)
        if abi == 'x86_64':
            vm.register('sp', frame+vm.word)
            vm.return_call(state['future'])
        else:
            vm.register('sp', frame+2*vm.word)
            vm.register('lr', caller)
            vm.return_call(state['future'])

    vm = DartMachine(abi, output, [observed],
                     [Boundary(function(abi, 'initAsync'), initialize),
                      Boundary(function(abi, 'returnAsync'), complete)])
    provider, request = vm.heap+0x2001, vm.heap+0x3001
    args = ('x1', 'x2') if abi == 'arm64-v8a' else ('r1', 'r2') if abi == 'armeabi-v7a' else ('rdi', 'rsi')
    vm.register(args[0], provider)
    vm.register(args[1], request)
    vm.pointer(request-1, 0x259 << 12)
    vm.uc.mem_write(provider, bytes([0xa5 if cached else 0])*128)
    before = bytes(vm.uc.mem_read(provider, 128))
    result = vm.run(owner.address)
    future = vm.objects.get(result)
    assert isinstance(future, VmFuture), 'Ad fetch returned a raw value instead of a Future'
    assert future.completed and future.completion_count == 1 and future.value == vm.null
    assert vm.calls == ['initAsync', 'returnAsync'], 'Disabled ad fetch admitted work'
    assert bytes(vm.uc.mem_read(provider, 128)) == before, 'Ad cache changed during disabled fetch'
    return 5


HOME_LAYOUT = {
    'arm64-v8a': dict(classify=0x6dc25c, element='x3', context='x2',
                      saved_context=0x20, saved_element=0x10, brand_field=0xf,
                      parent=0xb, state=0xf, build_context=0x13, width=0x1b,
                      double_value=7, child=0xb, alignment_pool=0x19da8,
                      card_args=('x1','x2','x3')),
    'armeabi-v7a': dict(classify=0x8a0164, element='r0', context='r2',
                        saved_context=0x14, saved_element=8, brand_field=0xb,
                        parent=7, state=0xb, build_context=0xf, width=0x17,
                        double_value=3, child=7, alignment_pool=0xdd40,
                        card_args=('r1','r2','r3')),
    'x86_64': dict(classify=0x7ca1bd, element='rax', context='rdx',
                   saved_context=0x20, saved_element=0x10, brand_field=0xf,
                   parent=0xb, state=0xf, build_context=0x13, width=0x1b,
                   double_value=7, child=0xb, alignment_pool=0x19ed0,
                   card_args=('rdi','rsi','rdx')),
}


def run_home_factory(abi, original, output, branded):
    """Run the real typed branch and its return/wrapper path after list lookup.

    The frame/located element are seeded at the original branded-flag load. The
    real comparison, branch, field stores and epilogue execute. The unmodified
    editorial renderer and VM wrapper allocation are explicit typed boundaries.
    """
    import struct
    from tvgids_native_contracts import native_layout, executable_offset
    layout = HOME_LAYOUT[abi]
    owner = function(abi, 'homeItemFactory')
    offset = executable_offset(native_layout(output, abi), owner.address, owner.size)
    assert hashlib.sha256(original[offset:offset+owner.size]).hexdigest() == owner.sha256
    observed = FunctionRange(owner.name, owner.address, owner.size,
                             hashlib.sha256(output[offset:offset+owner.size]).hexdigest())

    def render_card(vm):
        expected = (vm.heap+0x22001, vm.heap+0x2001, vm.heap+0x23001)
        assert tuple(vm.register(name) for name in layout['card_args']) == expected, 'Editorial arguments/identity changed'
        vm.return_call(vm.heap+0x8001)

    def wrapper(vm):
        address = vm.heap+0x6001
        vm.objects[address] = 'FractionallySizedBox'
        vm.return_call(address)

    # The same dispatcher has a separate, owned adslot branch. The whole-image
    # verifier has already restored/checked that ownership before this fixture.
    card_owner = function(abi, 'homeCard')
    card_offset = executable_offset(native_layout(output, abi), card_owner.address, card_owner.size)
    assert hashlib.sha256(original[card_offset:card_offset+card_owner.size]).hexdigest() == card_owner.sha256
    card_owner = FunctionRange(card_owner.name, card_owner.address, card_owner.size,
                               hashlib.sha256(output[card_offset:card_offset+card_owner.size]).hexdigest())
    vm = DartMachine(abi, output, [observed],
                     [Boundary(card_owner, render_card),
                      Boundary(function(abi, 'fractionalBoxAlloc'), wrapper)])
    frame = vm.initial_sp-(8 if abi == 'x86_64' else 2*vm.word)
    vm.register('fp', frame)
    vm.register('sp', frame-0x80)
    vm.pointer(frame, 0)
    vm.pointer(frame+vm.word, vm.EXIT)
    element, context, outer, state, build_context, width = (vm.heap+x for x in
        (0x2001, 0x3001, 0x21001, 0x22001, 0x23001, 0x24001))
    true = vm.null+(0x10 if vm.word == 4 else 0x20)
    false = vm.null+(0x20 if vm.word == 4 else 0x30)
    vm.pointer(element+layout['brand_field'], true if branded else false, 4)
    vm.pointer(context+layout['parent'], outer, 4)
    vm.pointer(outer+layout['state'], state, 4)
    vm.pointer(context+layout['build_context'], build_context, 4)
    vm.pointer(context+layout['width'], width, 4)
    vm.uc.mem_write(width+layout['double_value'], struct.pack('<d', 0.93))
    vm.pointer(frame-layout['saved_context'], context)
    vm.pointer(frame-layout['saved_element'], element)
    vm.register(layout['element'], element)
    vm.register(layout['context'], context)
    if abi == 'armeabi-v7a':
        vm.register('r4', true)
    empty = vm.heap+0x4001
    vm.objects[empty] = 'SizedBox'
    vm.objects[vm.heap+0x8001] = 'original editorial widget'
    vm.pool(SLOT_LAYOUT[abi]['empty_pool'], empty)
    vm.pool(layout['alignment_pool'], vm.heap+0x25001)
    unchanged = bytes(vm.uc.mem_read(element, 0x100))
    result = vm.run(layout['classify'])
    assert bytes(vm.uc.mem_read(element, 0x100)) == unchanged, 'Original home item mutated'
    kind = vm.objects.get(result)
    if branded:
        assert kind == 'SizedBox' and vm.calls == [], 'Branded promotion still reached its renderer or wrapper'
    else:
        assert kind == 'FractionallySizedBox' and vm.calls == ['homeCard', 'fractionalBoxAlloc']
        child = vm.pointer(result+layout['child'], size=4)
        if vm.word == 8:
            child |= vm.heap & ~0xffffffff
        assert child == vm.heap+0x8001, 'Original editorial widget identity changed'
    return 5


HOME_AD_LAYOUT = {
    'arm64-v8a': dict(branch=0x6dc9c0, result='x0', saved_context=0x28, saved_self=8,
                      item_field=0xf, config_field=0x17),
    'armeabi-v7a': dict(branch=0x8a08f4, result='r0', saved_context=0x14, saved_self=4,
                        item_field=0xb, config_field=0x13),
    'x86_64': dict(branch=0x7ca963, result='rax', saved_context=0x28, saved_self=8,
                   item_field=0xf, config_field=0x17),
}


def run_home_adslot(abi, original, output, has_config):
    """Execute the original successful adslot type-comparison continuation.

    Inputs are the original type comparison's true result and native context/
    fields. No creative, loader or fixed-height wrapper may be allocated.
    """
    from tvgids_native_contracts import native_layout, executable_offset
    layout = HOME_AD_LAYOUT[abi]
    owner = function(abi, 'homeCard')
    offset = executable_offset(native_layout(output, abi), owner.address, owner.size)
    assert hashlib.sha256(original[offset:offset+owner.size]).hexdigest() == owner.sha256
    observed = FunctionRange(owner.name, owner.address, owner.size,
                             hashlib.sha256(output[offset:offset+owner.size]).hexdigest())
    vm = DartMachine(abi, output, [observed])
    frame = vm.initial_sp-(8 if abi == 'x86_64' else 2*vm.word)
    vm.register('fp', frame)
    vm.register('sp', frame-0x80)
    vm.pointer(frame, 0)
    vm.pointer(frame+vm.word, vm.EXIT)
    context, element, state, config = (vm.heap+x for x in (0x2001,0x3001,0x4001,0x5001))
    vm.pointer(frame-layout['saved_context'], context)
    vm.pointer(frame-layout['saved_self'], state)
    vm.pointer(context+layout['item_field'], element, 4)
    vm.pointer(element+layout['config_field'], config if has_config else vm.null, 4)
    true = vm.null+(0x10 if vm.word==4 else 0x20)
    if vm.word==4:
        vm.pointer(vm.THREAD+0x48,true)
    vm.register(layout['result'],true)
    empty = vm.heap+0x6001
    vm.objects[empty] = ('SizedBox',0,0)
    vm.pool(SLOT_LAYOUT[abi]['empty_pool'],empty)
    result = vm.run(layout['branch'])
    assert vm.objects.get(result)==('SizedBox',0,0), 'Home adslot retained a wrapper or space'
    assert vm.calls==[], 'Home adslot admitted a loader or creative'
    return 3
