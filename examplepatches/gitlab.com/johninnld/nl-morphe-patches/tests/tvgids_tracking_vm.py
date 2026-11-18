"""Typed VM async boundaries around actual original Dart caller instructions.

Allocation, Future scheduling/completion and frame exit follow the shipped VM's
InitSuspendableFunction/Return stub interfaces. The helper bodies are hash pinned;
the full Dart event loop and the scheduled callback are outside this fixture.
"""
from dataclasses import dataclass

from tvgids_ads_vm import function
from tvgids_native_vm import Boundary, DartMachine


class BackgroundIdentifierAdmission(Exception):
    """An actual original call reached the identifier helper; not a VM fault."""


@dataclass
class VmFuture:
    type_argument: str
    completed: bool = False
    value: int | None = None
    completion_count: int = 0

    def complete(self, value):
        assert not self.completed, 'Future completed twice'
        self.completed, self.value = True, value
        self.completion_count += 1


ASYNC_LAYOUT = {
    'arm64-v8a': dict(argument='x1', result='x0', closure_function='x1', context='x2',
                      delay_type='x1', duration='x2', descriptor='x4', void_pool=0x50,
                      closure_pool=0x3d120, type_pool=0x668, duration_pool=0x8868, descriptor_pool=0x3e0),
    'armeabi-v7a': dict(argument='r1', result='r0', closure_function='r1', context='r2',
                        delay_type='r1', duration='r2', descriptor='r4', void_pool=0x28,
                        closure_pool=0x21804, type_pool=0x334, duration_pool=0x4614, descriptor_pool=0x1f0),
    'x86_64': dict(argument='rdi', result='rax', closure_function='rbx', context='rdx',
                   delay_type='rdi', duration='rsi', descriptor='r10', void_pool=0x50,
                   closure_pool=0x3d2b0, type_pool=0x668, duration_pool=0x88f8, descriptor_pool=0x3e0),
}


def run_empty_set(abi, image):
    layout = ASYNC_LAYOUT[abi]
    delays = []

    def initialize(vm):
        assert vm.objects.get(vm.register(layout['result'])) == '<void?>', 'Async type arguments changed'
        frame = vm.register('fp')
        assert vm.pointer(frame-vm.word) == vm.null, 'Original suspend-state slot was not initialized'
        future, state = vm.heap+0x11001, vm.heap+0x10001
        assert future not in vm.objects and state not in vm.objects, 'Repeated async initialization'
        vm.objects[future] = VmFuture('void?')
        vm.objects[state] = {'kind': 'SuspendState', 'future': future}
        vm.pointer(frame-vm.word, state)
        vm.return_call(state)

    def closure(vm):
        assert vm.register(layout['closure_function']) == vm.heap+0x8001, 'Unexpected delayed callback function'
        assert vm.register(layout['context']) == vm.null, 'Unexpected delayed closure context'
        address = vm.heap+0x5001
        vm.objects[address] = 'emptySet delayed callback'
        vm.return_call(address)

    def delayed(vm):
        assert vm.objects.get(vm.register(layout['delay_type'])) == '<Null?>', 'Future.delayed type arguments changed'
        assert vm.objects.get(vm.register(layout['duration'])) == ('Duration', 500000), 'Future.delayed duration identity changed'
        assert vm.objects.get(vm.register(layout['descriptor'])) == 'delayed arguments descriptor', 'Future.delayed arguments changed'
        assert vm.objects.get(vm.pointer(vm.register('sp')+(8 if abi == 'x86_64' else 0))) == 'emptySet delayed callback', 'Future.delayed callback argument changed'
        delays.append(500000)
        future = vm.heap+0x12001
        vm.objects[future] = VmFuture('Null?')
        vm.return_call(future)

    def complete(vm):
        frame = vm.register('fp')
        state = vm.objects.get(vm.pointer(frame-vm.word))
        assert isinstance(state, dict) and state.get('kind') == 'SuspendState', 'Return stub lost genuine async state'
        future = vm.objects.get(state['future'])
        assert isinstance(future, VmFuture) and future.type_argument == 'void?', 'Return stub lost typed Future'
        assert vm.register('result') == vm.null, 'Original async result changed'
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

    vm = DartMachine(abi, image, [function(abi, 'emptySet')],
                     [Boundary(function(abi, name), callback) for name, callback in
                      [('initAsync', initialize), ('closure', closure), ('delayed', delayed), ('returnAsync', complete)]])
    objects = {'void_pool': (0x7001, '<void?>'), 'closure_pool': (0x8001, 'emptySet callback function'),
               'type_pool': (0x9001, '<Null?>'), 'duration_pool': (0xa001, ('Duration', 500000)),
               'descriptor_pool': (0xb001, 'delayed arguments descriptor')}
    for key, (offset, value) in objects.items():
        address = vm.heap+offset
        vm.objects[address] = value
        vm.pool(layout[key], address)
    vm.register(layout['argument'], vm.heap+0x2001)
    result = vm.run(function(abi, 'emptySet').address)
    future = vm.objects.get(result)
    assert isinstance(future, VmFuture), 'Async function returned a raw value instead of its Future'
    return dict(completed=future.completed, completion_count=future.completion_count,
                value_is_null=future.value == vm.null, calls=vm.calls, delays=delays)


def run_background_continuation(abi, original, output):
    """Execute the real async entry, then the post-initialization continuation.

    The unchanged Firebase/options/cache prefix between those two points is
    source/whole-image pinned, not executed by this bounded fixture. VM async
    initialization/completion are explicit ABI boundaries. No identifier, HTTP
    request or real Firebase operation is performed here.
    """
    import hashlib
    import json
    from pathlib import Path
    from tvgids_native_vm import FunctionRange
    from tvgids_native_contracts import native_layout, executable_offset
    spec=json.loads(Path(__file__).with_name('tvgids_tracking_ranges.json').read_text())[abi]
    before=FunctionRange('background',**spec['background'])
    offset=executable_offset(native_layout(output,abi),before.address,before.size)
    assert hashlib.sha256(original[offset:offset+before.size]).hexdigest()==before.sha256
    observed=FunctionRange('background',before.address,before.size,
                           hashlib.sha256(output[offset:offset+before.size]).hexdigest())

    def initialize(vm):
        assert vm.objects.get(vm.register('result'))=='<void?>'
        frame=vm.register('fp');assert vm.pointer(frame-vm.word)==vm.null
        state,future=vm.heap+0x10001,vm.heap+0x11001
        vm.objects[state]={'kind':'SuspendState','future':future}
        vm.objects[future]=VmFuture('void?')
        vm.pointer(frame-vm.word,state);vm.return_call(state)

    def identifiers(vm):
        raise BackgroundIdentifierAdmission('Original background continuation requested a device identifier')

    def complete(vm):
        frame=vm.register('fp');state=vm.objects.get(vm.pointer(frame-vm.word))
        assert isinstance(state,dict) and state.get('kind')=='SuspendState'
        future=vm.objects.get(state['future'])
        assert isinstance(future,VmFuture) and future.type_argument=='void?'
        assert vm.register('result')==vm.null,'Background completion retained a measurement value'
        future.complete(vm.null)
        old_frame,caller=vm.pointer(frame),vm.pointer(frame+vm.word)
        vm.register('fp',old_frame)
        if abi=='x86_64':
            vm.register('sp',frame+vm.word);vm.return_call(state['future'])
        else:
            vm.register('sp',frame+2*vm.word);vm.register('lr',caller);vm.return_call(state['future'])

    vm=DartMachine(abi,output,[observed],[Boundary(function(abi,'initAsync'),initialize),
        Boundary(FunctionRange('backgroundDeviceId',**spec['getDeviceId']),identifiers),
        Boundary(function(abi,'returnAsync'),complete)])
    type_argument,message=vm.heap+0x7001,vm.heap+0x2001
    vm.objects[type_argument]='<void?>';vm.objects[message]='RemoteMessage'
    vm.pool(0x28 if abi=='armeabi-v7a' else 0x50,type_argument)
    vm.pointer(vm.initial_sp+(8 if abi=='x86_64' else 0),message)
    # Run the genuine prologue and InitAsync; then model the preserved shared
    # prefix having completed. Starting the second segment uses the same frame
    # and SuspendState, rather than manufacturing a raw return value/Future.
    vm.uc.emu_start(before.address,spec['afterInit'],count=1000)
    if vm.fault:raise vm.fault
    assert vm.register('pc')==spec['afterInit'] and vm.calls==['initAsync'] and not vm.finished
    result=vm.run(spec['gate'])
    future=vm.objects.get(result)
    assert isinstance(future,VmFuture),'Background returned a raw value instead of its initialized Future'
    assert future.completed and future.completion_count==1 and future.value==vm.null
    assert vm.calls==['initAsync','returnAsync'],'Background admitted metadata or network work'
    return 7
