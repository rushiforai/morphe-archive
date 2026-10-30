"""Execute Comscore app caller policies, with pinned VM/SDK boundaries.

The constructor fixture starts at its unchanged startup call after field/map
initialization, using the original frame ABI. It does not simulate those maps or
the complete Flutter runtime. The unchanged constructor prefix remains pinned.
"""
import hashlib
import json
from pathlib import Path
from tvgids_ads_vm import function
from tvgids_native_vm import Boundary,DartMachine,FunctionRange
from tvgids_native_contracts import native_layout,executable_offset
from tvgids_tracking_vm import VmFuture

RANGES=json.loads(Path(__file__).with_name('tvgids_comscore_ranges.json').read_text())
ARGUMENT={'arm64-v8a':'x1','armeabi-v7a':'r1','x86_64':'rdi'}
DESCRIPTOR={'arm64-v8a':'x4','armeabi-v7a':'r4','x86_64':'r10'}

class ComscoreAdmission(Exception):pass


def machine(abi,original,output,owners,initialized=False,started=False,cached=False):
    spec=RANGES[abi];layout=native_layout(output,abi)
    def observed(key):
        role=spec[key];offset=executable_offset(layout,role['address'],role['size'])
        assert hashlib.sha256(original[offset:offset+role['size']]).hexdigest()==role['sha256']
        return FunctionRange(key,role['address'],role['size'],hashlib.sha256(output[offset:offset+role['size']]).hexdigest())
    def initialize(vm):
        assert vm.objects.get(vm.register('result'))=='<void?>'
        frame=vm.register('fp');assert vm.pointer(frame-vm.word)==vm.null
        n=sum(isinstance(v,VmFuture) for v in vm.objects.values());state=vm.heap+0x10001+n*0x2000;future=state+0x1000
        vm.objects[state]={'kind':'SuspendState','future':future};vm.objects[future]=VmFuture('void?')
        vm.pointer(frame-vm.word,state);vm.return_call(state)
    def complete(vm):
        frame=vm.register('fp');state=vm.objects.get(vm.pointer(frame-vm.word))
        assert isinstance(state,dict) and state.get('kind')=='SuspendState'
        future=vm.objects.get(state['future']);assert isinstance(future,VmFuture) and future.type_argument=='void?'
        assert vm.register('result')==vm.null
        future.complete(vm.null);old,caller=vm.pointer(frame),vm.pointer(frame+vm.word);vm.register('fp',old)
        if abi=='x86_64':vm.register('sp',frame+vm.word);vm.return_call(state['future'])
        else:vm.register('sp',frame+2*vm.word);vm.register('lr',caller);vm.return_call(state['future'])
    def admission(key):
        def callback(vm):raise ComscoreAdmission(key)
        return callback
    boundaries=[Boundary(function(abi,'initAsync'),initialize),Boundary(function(abi,'returnAsync'),complete)]
    boundaries += [Boundary(observed(key),admission(key)) for key in ('init','fpid','analyticsStart','micros','array') if key not in owners]
    vm=DartMachine(abi,output,[observed(key) for key in owners],boundaries)
    receiver,empty,type_arg=vm.heap+0x2001,vm.heap+0x4001,vm.heap+0x5001
    vm.objects[receiver]='ComscoreService';vm.objects[empty]='';vm.objects[type_arg]='<void?>'
    vm.pool(spec['emptyPool'],empty);vm.pool(0x28 if abi=='armeabi-v7a' else 0x50,type_arg)
    delta=4 if abi=='armeabi-v7a' else 0
    true=vm.null+(0x10 if delta else 0x20);false=vm.null+(0x18 if delta else 0x30)
    vm.pointer(receiver+0xb-delta,true if initialized else false,4)
    vm.pointer(receiver+0xf-delta,true if started else false,4)
    old_id=vm.heap+0x6001;vm.objects[old_id]='fixture-cached-fpid'
    vm.pointer(receiver+0x13-delta,old_id if cached else vm.null,4)
    vm.register(ARGUMENT[abi],receiver)
    # VM argument descriptor for a page call with no named arguments. Constant
    # names/list identities are supplied by the VM; their contents are not read
    # before the first metadata-allocation boundary.
    descriptor=vm.heap+0x8001
    for offset in range(3,0x40,4):vm.pointer(descriptor+offset,vm.null,4)
    vm.pointer(descriptor+(0xf if delta else 0x13),2,4)
    vm.register(DESCRIPTOR[abi],descriptor)
    for n,offset in enumerate(spec['pagePools']):
        pointer=vm.heap+0x20001+n*0x100;vm.objects[pointer]='page constant '+hex(offset);vm.pool(offset,pointer)
    return vm,receiver


def verify_comscore_callers(abi,original,output,disabled):
    spec=RANGES[abi];assertions=0
    # Both a new object and a previously initialized object must stay quiet.
    for initialized,started in ((False,False),(True,False),(True,True)):
        vm,_=machine(abi,original,output,('start',),initialized,started)
        try:result=vm.run(spec['start']['address'])
        except ComscoreAdmission:
            assert not disabled;assertions+=1;continue
        assert disabled or (initialized and started),'Original startup unexpectedly omitted the SDK'
        future=vm.objects.get(result)
        assert isinstance(future,VmFuture) and future.completed and future.completion_count==1
        assert vm.calls==['initAsync','returnAsync'];assertions+=3
    vm,_=machine(abi,original,output,('init',))
    try:result=vm.run(spec['init']['address'])
    except ComscoreAdmission:assert not disabled;assertions+=1
    else:
        assert disabled,'Original init omitted FPID/client creation'
        future=vm.objects.get(result);assert isinstance(future,VmFuture) and future.completed and future.completion_count==1
        assert vm.calls==['initAsync','returnAsync'];assertions+=3
    for cached in (False,True):
        vm,_=machine(abi,original,output,('fpid',),cached=cached)
        try:result=vm.run(spec['fpid']['address'])
        except ComscoreAdmission:assert not disabled and not cached;assertions+=1;continue
        assert vm.objects.get(result)==('' if disabled else 'fixture-cached-fpid')
        assert vm.calls==[];assertions+=2
    vm,_=machine(abi,original,output,('page',),True,True,True)
    try:result=vm.run(spec['page']['address'])
    except ComscoreAdmission:assert not disabled;assertions+=1
    else:assert disabled and result==vm.null and vm.calls==[];assertions+=2
    # Continue the real constructor at its automatic start call. Its field/maps
    # prefix is unchanged; the nested start must return its initialized Future
    # to this caller, and this caller must restore its own original frame too.
    vm,_=machine(abi,original,output,('ctor','start'))
    frame=vm.initial_sp-(vm.word if abi=='x86_64' else 2*vm.word)
    vm.pointer(frame,0);vm.pointer(frame+vm.word,vm.EXIT);vm.register('fp',frame);vm.register('sp',frame-spec['ctorStack'])
    try:result=vm.run(spec['ctorCall'])
    except ComscoreAdmission:assert not disabled;assertions+=1
    else:
        assert disabled and result==vm.null
        futures=[v for v in vm.objects.values() if isinstance(v,VmFuture)]
        assert len(futures)==1 and futures[0].completed and futures[0].completion_count==1
        assert vm.calls==['initAsync','returnAsync'];assertions+=3
    return assertions
