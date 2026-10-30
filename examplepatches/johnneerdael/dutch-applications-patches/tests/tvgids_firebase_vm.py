"""Execute scoped FCM measurement paths and retained local messaging controls.

Platform storage, Firebase registry, task waiting and SDK scheduling are explicit
boundaries. No messages are delivered and no network is performed by this model.
The shipped artifact has no Analytics connector; registry absence is preserved.
"""
from rtl_vm import Reference, VmThrown, is_zero
from tvgids_sdk_vm import SdkFixture, SdkAdmission

FCM = 'Lcom/google/firebase/messaging/FirebaseMessaging;'
PREFS = 'com.google.firebase.messaging'
EXPORT = 'export_to_big_query'
METADATA = 'delivery_metrics_exported_to_big_query_enabled'


class FirebaseFixture(SdkFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.native.update({(FCM, 'k()Z'), (FCM, 'j(Z)V'), ('Lxs8;', 'g()Z'),
            ('Lgm1;', '<init>(Ljava/lang/String;I)V')})
        self.measurement_calls = []; self.messaging_calls = []; self.metadata = {}
        self.registry = self.new('Lpl0;')
        self.firebase = self.new('Loq1;', {'Loq1;->a:Landroid/content/Context;': self.context,
            'Loq1;->d:Lpl0;': self.registry})
        self.messaging = self.new(FCM, {FCM+'->a:Loq1;': self.firebase,
            FCM+'->b:Landroid/content/Context;': self.context, FCM+'->c:Lyh2;': self.new('Lyh2;'),
            FCM+'->i:Lus9;': self.new('Lus9;', {'Lus9;->b:Lmq0;': self.new('Lmq0;')})})
        self.auto_init = self.new('Lxs8;', {'Lxs8;->c:Ljava/lang/Object;': 0,
            'Lxs8;->d:Ljava/lang/Object;': Reference(True, 'Ljava/lang/Boolean;'),
            'Lxs8;->e:Ljava/lang/Object;': self.messaging})
        self.messaging.value[FCM+'->f:Lxs8;'] = self.auto_init
        self.transport = self.new('Lkm4;')
        self.memory.statics[FCM+'->n:Lkm4;'] = self.transport
        self.memory.statics['Lmq5;->a:Ly92;'] = self.new('Ly92;')

    def intent(self, analytics=False, *, action='fixture-action', opened=False):
        data = {'google.c.a.e': '1' if analytics else '0', 'google.c.a.tc': '0', 'google.message_id': 'fixture-message'}
        extras = self.new('Landroid/os/Bundle;', data)
        if opened:
            extras = self.new('Landroid/os/Bundle;', {'google.message_id': 'fixture-message', 'gcm.n.analytics_data': extras})
        return self.new('Landroid/content/Intent;', {'extras': extras, 'action': action})

    def invoke(self, target, args):
        owner, sig = target.split('->', 1)
        if target == 'Loq1;->d()Loq1;': self.measurement_calls.append('firebase-instance'); return self.firebase
        if target == 'Loq1;->a()V': return None
        if target == 'Lgl0;->a(Ljava/lang/Class;)Ljava/lang/Object;':
            assert args[0] is self.registry and args[1].value == 'Ldf;'
            self.measurement_calls.append('analytics-connector-lookup'); return 0
        if target == 'Lkm4;->get()Ljava/lang/Object;' and args[0] is self.transport:
            raise SdkAdmission('FCM delivery metrics transport factory')
        if target == 'Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;': return self.new('Landroid/content/pm/PackageManager;')
        if target == 'Landroid/content/Context;->getPackageName()Ljava/lang/String;': return 'nl.tvgids'
        if target == 'Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;':
            return self.new('Landroid/content/pm/ApplicationInfo;', {'Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;': self.new('Landroid/os/Bundle;', dict(self.metadata))})
        if target == 'Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z': return int(args[1] in args[0].value)
        if owner in ('Landroid/os/Bundle;', 'Landroid/os/BaseBundle;'):
            if sig == '<init>()V': args[0].value = {}; return None
            if sig == 'containsKey(Ljava/lang/String;)Z': return int(args[1] in args[0].value)
            if sig.startswith(('getString(', 'getBundle(')): return args[0].value.get(args[1], 0)
            if sig == 'getBoolean(Ljava/lang/String;Z)Z': return args[0].value.get(args[1], args[2])
            if sig.startswith(('putString(', 'putInt(')): args[0].value[args[1]] = args[2]; return None
        if target == 'Landroid/content/Intent;->getExtras()Landroid/os/Bundle;': return args[0].value['extras']
        if target == 'Landroid/content/Intent;->getAction()Ljava/lang/String;': return args[0].value['action']
        if target == 'Landroid/app/Activity;->getIntent()Landroid/content/Intent;': return args[0].value['intent']
        if target == 'Ljava/util/ArrayDeque;->contains(Ljava/lang/Object;)Z': return int(args[1] in args[0].value)
        if target == 'Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z': args[0].value.append(args[1]); return 1
        if target == 'Lg87;->v(Landroid/os/Bundle;)Z': return 0
        if target == FCM+'->d()'+FCM: return self.messaging
        if target == 'Lhg;->o(Landroid/content/Context;)V': self.messaging_calls.append('delegate-init'); return None
        if target == 'Lhg;->q(Landroid/content/Context;)Z': return 1
        if target == 'Lbx2;->H(Landroid/content/Context;Lyh2;Z)V': self.messaging_calls.append(('proxy-retention', args[2])); return None
        if target == 'Lkq5;->b(Ljava/lang/Object;)V': args[0].value['results'].append(('success', args[1])); return None
        if target == 'Lkq5;->a(Ljava/lang/Exception;)V': args[0].value['results'].append(('error', args[1])); return None
        if target == 'Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;':
            if is_zero(args[0]): raise VmThrown(self.new('Ljava/lang/NullPointerException;'))
            return args[0]
        if target == 'Lxs8;->f()V': self.messaging_calls.append('auto-init-cache'); return None
        if target == FCM+'->l()V': self.messaging_calls.append('auto-init-start'); return None
        if target == 'Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;': args[0].value[args[1]] = args[2]; return None
        if target == 'Lp86;->b0(Ljava/util/Map;)Lcom/google/firebase/messaging/RemoteMessage;':
            assert args[0].value == {'fixture': 'message'}; return self.new('Lcom/google/firebase/messaging/RemoteMessage;', dict(args[0].value))
        if target == FCM+'->i(Lcom/google/firebase/messaging/RemoteMessage;)V': self.messaging_calls.append(('send-message', args[1].value)); return None
        if target == 'Lus9;-><init>()V': args[0].value = {}; return None
        if target == 'Loa9;-><init>(Ljava/util/concurrent/Executor;Lrm5;Lus9;)V':
            args[0].value = {'job': args[2], 'task': args[3]}; return None
        if target == 'Lmq0;->j(Lim9;)V': self.messaging_calls.append(('topic-job', dict(args[1].value['job'].value))); return None
        if target == 'Lus9;->q()V': self.messaging_calls.append('task-update'); return None
        if target == 'Lrq5;->a(Liq5;)Ljava/lang/Object;': self.messaging_calls.append('task-await'); return 0
        return super().invoke(target, args)

    def runner(self, kind, args, *, success=True):
        task = self.new('Lkq5;', {'results': []})
        runner = self.new('Lpu1;', {'Lpu1;->a:I': kind, 'Lpu1;->b:Ljava/util/Map;': Reference(args, 'Ljava/util/HashMap;'),
            'Lpu1;->c:Lkq5;': task})
        self.role('fcm_set_export', (runner,))
        assert len(task.value['results']) == 1 and task.value['results'][0][0] == ('success' if success else 'error'), 'Native task did not complete once'
        return task.value['results'][0][1]


def verify_firebase(f, disabled, group):
    if group == 'flags':
        for stored in (None, False, True):
            for metadata in (None, False, True):
                f.prefs = {PREFS: {EXPORT: bool(stored)}} if stored is not None else {}
                f.metadata = {METADATA: bool(metadata)} if metadata is not None else {}
                f.measurement_calls.clear(); f.osb_calls.clear()
                before = {k: dict(v) for k, v in f.prefs.items()}
                expected = False if disabled else bool(stored if stored is not None else metadata)
                assert f.role('fcm_export') == int(expected)
                if disabled: assert not f.measurement_calls and not f.osb_calls
                # Reading the original path may create an empty local fixture preference map.
                assert all(f.prefs[k] == value for k, value in before.items())
        for enabled in (False, True):
            assert f.role('fcm_eligible', (f.intent(enabled),)) == int(enabled and not disabled)
        assert f.role('fcm_eligible', (0,)) == 0
        assert f.role('fcm_eligible', (f.intent(True, action='com.google.firebase.messaging.RECEIVE_DIRECT_BOOT'),)) == 0
    elif group == 'received':
        f.prefs = {PREFS: {EXPORT: True}}
        for enabled in (False, True):
            f.measurement_calls.clear()
            try: f.role('fcm_received', (f.intent(enabled),))
            except SdkAdmission as e: assert not disabled and str(e) == 'FCM delivery metrics transport factory'
            else: assert disabled
            if disabled: assert not f.measurement_calls
            elif enabled: assert 'analytics-connector-lookup' in f.measurement_calls
        f.measurement_calls.clear()
        f.role('fcm_received', (f.intent(True, action='com.google.firebase.messaging.RECEIVE_DIRECT_BOOT'),))
        assert not f.measurement_calls
    elif group == 'events':
        for name in ('_nr', '_nf', '_no', '_nd'):
            f.measurement_calls.clear()
            f.role('fcm_scion', (name, f.new('Landroid/os/Bundle;', {'google.c.a.e': '1'})))
            assert ('analytics-connector-lookup' in f.measurement_calls) == (not disabled)
        f.measurement_calls.clear(); queue = Reference([], 'Ljava/util/ArrayDeque;')
        listener = f.new('Lnn1;', {'Lnn1;->a:Ljava/util/ArrayDeque;': queue})
        activity = f.new('Landroid/app/Activity;', {'intent': f.intent(True, opened=True)})
        for _ in range(2): f.role('fcm_opened', (listener, activity, 0))
        assert queue.value == ([] if disabled else ['fixture-message'])
        assert f.measurement_calls.count('analytics-connector-lookup') == (0 if disabled else 1)
    elif group == 'export':
        for requested in (False, True):
            f.messaging_calls.clear(); f.prefs = {PREFS: {EXPORT: True, 'auto_init': True}}
            f.runner(1, {'enabled': Reference(requested, 'Ljava/lang/Boolean;')})
            expected = int(requested and not disabled)
            assert f.prefs[PREFS] == {EXPORT: expected, 'auto_init': True}
            assert ('proxy-retention', expected) in f.messaging_calls
            assert f.role('fcm_export') == expected
        # The real invalid-input exception path completes once and does not
        # claim that a preference was written or update proxy retention.
        f.messaging_calls.clear(); f.prefs = {PREFS: {EXPORT: True}}
        error = f.runner(1, {}, success=False)
        assert error.descriptor == 'Ljava/lang/NullPointerException;'
        assert f.prefs[PREFS] == {EXPORT: True} and not f.messaging_calls
    elif group == 'functional':
        for requested in (False, True):
            f.messaging_calls.clear()
            result = f.runner(2, {'enabled': Reference(requested, 'Ljava/lang/Boolean;')})
            assert f.prefs[PREFS]['auto_init'] == int(requested)
            assert result.value['isAutoInitEnabled'].value == requested
            assert ('auto-init-start' in f.messaging_calls) == requested
        for kind in (0, 3):
            f.messaging_calls.clear(); f.runner(kind, {'topic': 'fixture-topic'})
            jobs = [call for call in f.messaging_calls if isinstance(call, tuple) and call[0] == 'topic-job']
            assert len(jobs) == 1 and jobs[0][1]['Lgm1;->b:Ljava/lang/String;'] == 'fixture-topic'
            assert f.messaging_calls.count('task-await') == 1
        f.messaging_calls.clear(); f.runner(4, {'fixture': 'message'})
        assert len(f.messaging_calls) == 1 and f.messaging_calls[0][0] == 'send-message'
        assert f.messaging_calls[0][1]['fixture'] == 'message'
    else: raise AssertionError('Unknown Firebase group')
    print('PASS Firebase', group, 'disabled' if disabled else 'original')
