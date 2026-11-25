"""Execute Comscore's Android bridge; SDK and messenger calls are boundaries.

This checks collector admission and real Flutter end-of-stream framing. It does
not execute the Comscore SDK, Flutter engine, or Android thread scheduler.
"""
from rtl_vm import Reference, is_zero
from tvgids_android_vm import AdViewFixture
from tvgids_comscore_contracts import COMSCORE_CONTRACTS

ANALYTICS = 'Lcom/comscore/flutter/AnalyticsMethodCallHandler;'
CONFIG = 'Lcom/comscore/flutter/ConfigurationMethodCallHandler;'
STREAM = 'Lcom/comscore/flutter/ConfigurationMethodCallHandler$1;'
LISTENER = 'Lcom/comscore/flutter/ConfigurationMethodCallHandler$FlutterCrossPublisherUniqueDeviceIdChangeListener;'
METHOD = 'onMethodCall(Lin3;Lln3;)V'
VOID_METHODS = ('start', 'notifyEnterForeground', 'notifyExitForeground',
    'notifyUxActive', 'notifyUxInactive', 'notifyViewEvent', 'notifyHiddenEvent',
    'notifyDistributedContentViewEvent', 'flushOfflineCache', 'clearOfflineCache',
    'clearInternalData', 'setLogLevel')


class NativeComscoreAdmission(Exception):
    pass


class ComscoreFixture(AdViewFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in COMSCORE_CONTRACTS})
        self.native.update(r[:2] for r in COMSCORE_CONTRACTS)
        self.admissions = []
        self.messages = []
        self.jobs = []
        if 'morpheEndOfStream()V' in self.declarations.classes['Luj1;'].methods:
            self.rows['Luj1;', 'morpheEndOfStream()V'] = ()
            self.native.add(('Luj1;', 'morpheEndOfStream()V'))
        # Args identities are explicit VM constants; no publisher values or
        # real SDK execution is supplied at this boundary.
        for name in ('DISTRIBUTOR_PARTNER_ID', 'DISTRIBUTOR_CONTENT_ID', 'EVENT_INFO_REF_ID', 'LABELS'):
            self.memory.statics['Lcom/comscore/flutter/Args;->'+name+':Ljava/lang/String;'] = name

    def invoke(self, target, args):
        owner, sig = target.split('->', 1)
        if owner.startswith('Lcom/comscore/') and '/flutter/' not in owner:
            self.admissions.append(target)
            raise NativeComscoreAdmission(target)
        if target == 'Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;':
            return Reference(args[0], 'Ljava/lang/Integer;')
        if target == 'Ljava/lang/Integer;->intValue()I':
            return args[0].value
        if target == 'Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':
            return Reference(bool(args[0]), 'Ljava/lang/Boolean;')
        if owner in ('Ljw1;', 'Lln3;') and sig == 'error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V':
            args[0].value['results'].append(('error', *args[1:])); return None
        if owner in ('Ljw1;', 'Lln3;') and sig == 'success(Ljava/lang/Object;)V':
            args[0].value['results'].append(('success', args[1])); return None
        if target == 'Lcom/comscore/flutter/Args;->getArgValue(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;':
            return args[0].value.get(args[1], 0) if isinstance(args[0], Reference) else 0
        if owner == 'Lcom/comscore/flutter/ObjTracker;' and sig in (
                'getTrackedObjFromArguments(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;',
                'getTrackedObjFromArguments(Ljava/lang/Object;)Ljava/lang/Object;'):
            return self.new('Lcom/comscore/PublisherConfiguration;') if len(args) == 1 else 0
        if target == 'Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z':
            return int(args[0].value)
        if target == 'Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z':
            old = int(args[0].value)
            if old != args[1]: return 0
            args[0].value = args[2]; return 1
        if target == 'Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;':
            return args[0].value
        if target == 'Li20;->c(Ljava/lang/String;Ljava/nio/ByteBuffer;)V':
            self.messages.append((args[1], args[2])); return None
        if target == 'Lnn3;->k(Ljava/lang/Object;)Ljava/nio/ByteBuffer;':
            return Reference(('success-envelope', args[1]), 'Ljava/nio/ByteBuffer;')
        if target == 'Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z':
            self.jobs.append(args[1]); return 1
        if owner in ('Lcom/comscore/flutter/a;', 'Lcom/comscore/flutter/b;') and sig.startswith('<init>('):
            args[0].value = tuple(args[1:]); return None
        if target == 'Ljava/util/List;->add(Ljava/lang/Object;)Z':
            args[0].value.append(args[1]); return 1
        if target == 'Ljava/util/List;->iterator()Ljava/util/Iterator;':
            return Reference(list(args[0].value), 'Ljava/util/Iterator;')
        if target == 'Ljava/util/Iterator;->hasNext()Z': return int(bool(args[0].value))
        if target == 'Ljava/util/Iterator;->next()Ljava/lang/Object;': return args[0].value.pop(0)
        if target == 'Ljava/util/List;->clear()V': args[0].value.clear(); return None
        return super().invoke(target, args)

    def channel(self, owner, name):
        handler = self.new(owner)
        payload = Reference(0, 'Ljava/lang/Integer;') if name == 'setLogLevel' else Reference({}, 'Ljava/util/HashMap;')
        call = self.new('Lin3;', {'Lin3;->a:Ljava/lang/String;': name, 'Lin3;->b:Ljava/lang/Object;': payload})
        reply = self.new('Ljw1;', {'results': []})
        self.run(owner, METHOD, (handler, call, reply))
        return reply.value['results']

    def stream(self, active=True):
        messenger = self.new('Lkt8;')
        event_channel = self.new('Lwj1;', {'Lwj1;->a:Li20;': messenger,
            'Lwj1;->b:Ljava/lang/String;': 'fixture-comscore-ids', 'Lwj1;->c:Lnn3;': self.new('Lki5;')})
        ref = Reference(0, 'Ljava/util/concurrent/atomic/AtomicReference;')
        handler = self.new('Lli9;', {'Lli9;->b:Ljava/lang/Object;': ref, 'Lli9;->c:Ljava/lang/Object;': event_channel})
        ended = Reference(False, 'Ljava/util/concurrent/atomic/AtomicBoolean;')
        sink = self.new('Luj1;', {'Luj1;->a:Ljava/util/concurrent/atomic/AtomicBoolean;': ended, 'Luj1;->b:Lli9;': handler})
        ref.value = sink if active else self.new('Luj1;')
        parent = self.new(CONFIG, {CONFIG+'->attachEvent:Ltj1;': sink,
            CONFIG+'->lock:Ljava/lang/Object;': self.new('Ljava/lang/Object;'),
            CONFIG+'->pendingOnCrossPublisherUniqueDeviceIdChanged:Ljava/util/List;': Reference(['fixture-old-id'], 'Ljava/util/ArrayList;'),
            CONFIG+'->mainThreadHandler:Landroid/os/Handler;': self.new('Landroid/os/Handler;')})
        stream = self.new(STREAM, {STREAM+'->this$0:'+CONFIG: parent})
        listener = self.new(LISTENER, {LISTENER+'->this$0:'+CONFIG: parent})
        return parent, stream, listener, sink, ended


def verify_comscore_android(f, disabled, group):
    if group == 'channels':
        for owner, name in [(ANALYTICS, n) for n in (*VOID_METHODS, 'getVersion', 'getLogLevel')] + [
                (CONFIG, n) for n in ('addClient', 'isEnabled', 'addCrossPublisherUniqueDeviceIdChangeListener')]:
            f.admissions.clear()
            try: replies = f.channel(owner, name)
            except NativeComscoreAdmission:
                assert not disabled and len(f.admissions) == 1; continue
            assert disabled and not f.admissions and len(replies) == 1
            reply = replies[0]
            if name == 'getVersion': assert reply == ('success', '')
            elif name in ('getLogLevel', 'isEnabled'):
                assert reply[0] == 'success' and isinstance(reply[1], Reference)
                assert reply[1].descriptor == ('Ljava/lang/Integer;' if name == 'getLogLevel' else 'Ljava/lang/Boolean;')
                assert reply[1].value == 0
            else: assert reply[0] == 'error' and reply[1] == 'tracking_disabled'
    elif group == 'stream':
        for active in (True, False):
            f.messages.clear(); f.jobs.clear()
            parent, stream, listener, sink, ended = f.stream(active)
            for _ in range(2): f.run(STREAM, 'onListen(Ljava/lang/Object;Ltj1;)V', (stream, 0, sink))
            if disabled:
                assert ended.value and not f.jobs
                assert f.messages == ([('fixture-comscore-ids', 0)] if active else [])
                f.run('Luj1;', 'a(Ljava/lang/Object;)V', (sink, 'fixture-late-id'))
                assert f.messages == ([('fixture-comscore-ids', 0)] if active else [])
            else: assert not ended.value and len(f.jobs) == 2 and not f.messages
    elif group == 'late':
        parent, stream, listener, sink, _ = f.stream()
        f.messages.clear(); f.run(STREAM, 'lambda$onListen$0()V', (stream,))
        assert len(f.messages) == (0 if disabled else 1)
        f.messages.clear(); f.jobs.clear()
        f.run(LISTENER, 'lambda$onCrossPublisherUniqueDeviceIdChanged$0(Ljava/lang/String;)V', (listener, 'fixture-id'))
        assert len(f.messages) == (0 if disabled else 1)
        f.run(LISTENER, 'onCrossPublisherUniqueDeviceIdChanged(Ljava/lang/String;)V', (listener, 'fixture-id'))
        assert len(f.jobs) == (0 if disabled else 1)
        parent.value[CONFIG+'->attachEvent:Ltj1;'] = 0
        pending = parent.value[CONFIG+'->pendingOnCrossPublisherUniqueDeviceIdChanged:Ljava/util/List;'].value
        before = list(pending)
        f.run(LISTENER, 'onCrossPublisherUniqueDeviceIdChanged(Ljava/lang/String;)V', (listener, 'fixture-id-2'))
        assert pending == (before if disabled else before+['fixture-id-2'])
    elif group == 'cancel':
        parent, stream, *_ = f.stream()
        try: f.run(STREAM, 'onCancel(Ljava/lang/Object;)V', (stream, 0))
        except NativeComscoreAdmission: assert not disabled; return
        assert disabled and is_zero(parent.value[CONFIG+'->attachEvent:Ltj1;']) and not f.admissions
    else: raise AssertionError('Unknown Comscore proof group')
    print('PASS Comscore Android', group, 'disabled' if disabled else 'original')
