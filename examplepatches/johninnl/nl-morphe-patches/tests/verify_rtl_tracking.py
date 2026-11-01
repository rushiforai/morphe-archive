"""Execute emitted RTL telemetry gates with typed SDK/IO fixture boundaries.

This is bytecode execution, not Android/device or captured-network evidence.
Collections, JSON and external storage/schedulers are modeled explicitly.
Native result constructors, callbacks, branches and retained bodies are real.
"""
import json

from rtl_contracts import CONTRACTS, MEASUREMENT_TRANSPORTS
from rtl_ads_contracts import ADS_CONTRACTS
from rtl_tracking_contracts import TRACKING_CONTRACTS, DISABLED_GETTER_EDITS
from rtl_tracking_effects import HELPERS, POLICIES, basic_prefix, SWRVE
from rtl_vm import Reference, VmThrown, is_zero
from rtl_vm import parse
from verify_rtl_ads import AdsFixture, VM

STORE = 'Lcom/swrve/sdk/localstorage/LocalStorage;'
SNOWPLOW = 'Lcom/snowplowanalytics/snowplow/network/'
SEND_EVENTS = 'sendEvents(Ljava/util/LinkedHashMap;)I'
SWRVE_RESPONSE = 'lambda$sendEvents$0(Ljava/util/LinkedHashMap;ZLcom/swrve/sdk/rest/RESTResponse;Ljava/lang/String;)V'
CCT = 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'


class TrackingFixture(AdsFixture):
    def __init__(self, source, declarations, sdk_read):
        super().__init__(source, declarations, sdk_read)
        self.rows.update({(r[0], r[1]): r for r in TRACKING_CONTRACTS})
        self.rows.update({key: (*key, 9, locals_, 0, '') for key, locals_ in HELPERS.items()})
        self.native_helpers |= set(HELPERS)
        self.native_helpers |= {(r[0], r[1]) for r in CONTRACTS + TRACKING_CONTRACTS
                                if r[1].startswith('<init>(') and r[0] in {
                                    'Lwui;', 'Lwka;', 'Luka;', 'Lp9h;', 'Lft4;', 'Lul0;', 'Lhf9;', 'Lgm2;', 'Lic2;'}}
        self.native_helpers |= {('Lwui;', sig) for sig in (
            'p(Ljava/lang/Object;)V', 't()V', 'l()Z', 'm()Z', 'k()Ljava/lang/Object;')}
        self.native_helpers |= {('Lzdc;', 'P(Ljava/lang/Object;)Lwui;'),
                                ('Lcp;', 'X(Ljava/lang/Object;)V'), ('Ldsg;', 'a(ILjava/io/IOException;[BLjava/util/Map;)V')}
        self.native_helpers |= {(e['owner'], e['signature']) for e in DISABLED_GETTER_EDITS}
        self.native_helpers |= {(r[0], r[1]) for r in CONTRACTS + TRACKING_CONTRACTS
                                if r[0] in {'Lnl/rtl/videoplayer/analytics/tracker/MultiSessionTrackerFactory;',
                                            'Lnl/rtl/videoplayer/analytics/tracker/SessionTrackerCollection;'}}
        self.native_helpers |= {(r[0], r[1]) for r in TRACKING_CONTRACTS if r[0].startswith(SNOWPLOW)}
        self.native_helpers.add((SNOWPLOW + 'OkHttpNetworkConnection;', 'requestSender(Luha;)I'))
        self.statics.update({'Lk9d;->a:Lk9d;': Reference({}, 'Lk9d;'),
                             'Lpw3;->h:Lpw3;': Reference({}, 'Lpw3;'),
                             'Ls65;->a:I': 12451000})
        self.emit_suspended = False
        self.sent_batches, self.deletions, self.callbacks, self.sql, self.scheduled = [], [], [], [], []

    def invoke(self, caller, target, args):
        owner, signature = target.split('->', 1)
        if owner == 'Lwui;' and signature == '<init>()V':
            args[0].value.update({'Lwui;->c:Z': 0, 'Lwui;->d:Z': 0, 'Lwui;->f:Ljava/lang/Exception;': 0})
        if (owner, signature) in self.native_helpers:
            return self.run(owner, signature, args)[0]
        if owner in {'Ljava/lang/Throwable;', 'Ljava/io/IOException;'} and signature == '<init>(Ljava/lang/String;)V':
            args[0].value['message'] = args[1]
            return None
        if signature in {'<init>()V', '<init>(I)V'} and owner == 'Lelb;':
            args[0].value['listeners'] = []
            return None
        if target == 'Lelb;->z(Lodc;)V':
            assert args[0].value['listeners'] == []
            self.events.append(('completed-task-dispatch', args[1]))
            return None
        if target == 'Ljr8;->B(ZLjava/lang/String;)V':
            assert args[0], args[1]
            return None
        if target == 'Ljr8;->y(Ljava/lang/Object;)V':
            assert not is_zero(args[0]), 'Native SDK null-reference check'
            return None
        if target == 'Lf6c;-><init>(ILui2;)V':
            args[0].value.update(arity=args[1], completion=args[2])
            return None
        if target == 'Lw3h;->A(Lzk2;Llk2;Lcl2;Lrw4;I)Lmwb;':
            self.scheduled.append(args[3])
            return Reference({}, 'Lmwb;')  # Coroutine scheduler is an external boundary.
        if owner == 'Ls65;' and signature == 'c(ILandroid/content/Context;)I':
            return 0  # Exercise the original "services available" branch.
        if target.startswith('Lloc;->e('):
            self.events.append(('native-log',))
            return None
        if target == 'Ltgb;->emit(Ljava/lang/Object;Lui2;)Ljava/lang/Object;':
            args[0].value['emitted'].append(args[1])
            return self.memory.static('Lal2;->h:Lal2;') if self.emit_suspended else self.memory.static('Lk9d;->a:Lk9d;')
        if owner in {'Ljava/util/ArrayList;', 'Ljava/util/LinkedHashMap;', 'Ljava/util/HashMap;'} and signature in {'<init>()V', '<init>(I)V'}:
            args[0].value = [] if owner.endswith('ArrayList;') else {}
            return None
        if signature == 'iterator()Ljava/util/Iterator;' and owner in {
                'Ljava/util/ArrayList;', 'Ljava/lang/Iterable;', 'Ljava/util/Collection;', 'Ljava/util/Set;'}:
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if owner == 'Ljava/util/Iterator;':
            state = args[0].value
            if signature == 'hasNext()Z': return int(state['index'] < len(state['items']))
            if signature == 'next()Ljava/lang/Object;':
                value = state['items'][state['index']]
                state['index'] += 1
                return value
        if owner in {'Ljava/util/ArrayList;', 'Ljava/util/AbstractMap;', 'Ljava/util/LinkedHashMap;', 'Ljava/util/Map;'}:
            value = args[0].value
            if signature == 'isEmpty()Z': return int(len(value) == 0)
            if signature == 'size()I': return len(value)
            if signature == 'add(Ljava/lang/Object;)Z': value.append(args[1]); return 1
            if signature == 'get(Ljava/lang/Object;)Ljava/lang/Object;': return value.get(args[1])
            if signature == 'put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':
                previous = value.get(args[1]); value[args[1]] = args[2]; return previous
            if signature == 'putAll(Ljava/util/Map;)V': value.update(args[1].value); return None
            if signature == 'keySet()Ljava/util/Set;': return Reference(list(value), 'Ljava/util/Set;')
            if signature == 'entrySet()Ljava/util/Set;':
                return Reference([Reference((key, item), 'Ljava/util/Map$Entry;') for key, item in value.items()], 'Ljava/util/Set;')
        if owner == 'Ljava/util/Map$Entry;':
            if signature == 'getKey()Ljava/lang/Object;': return args[0].value[0]
            if signature == 'getValue()Ljava/lang/Object;': return args[0].value[1]
        if target == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z':
            return int(isinstance(args[1], str) and args[0] == args[1])
        if target == 'Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;': return args[0] + args[1]
        if owner == 'Lorg/json/JSONObject;':
            if signature == '<init>(Ljava/lang/String;)V':
                try:
                    value = json.loads(args[1])
                    if not isinstance(value, dict): raise ValueError('Not an object')
                    args[0].value = value
                except (ValueError, TypeError):
                    raise VmThrown(Reference({}, 'Lorg/json/JSONException;'))
                return None
            if signature == 'optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;':
                value = args[0].value.get(args[1], args[2])
                return args[2] if value is None else str(value)
        if target == STORE + '->removeEvents(Ljava/lang/String;Ljava/util/Collection;)V':
            if args[0].value.get('fail'):
                raise VmThrown(Reference({}, 'Landroid/database/sqlite/SQLiteException;'))
            ids = list(args[2].value)
            self.deletions.append((args[0], args[1], ids))
            for key in ids: args[0].value['events'].pop(key, None)
            return None
        if owner == 'Lcom/swrve/sdk/SwrveLogger;':
            self.events.append(('swrve-log', signature, args[0]))
            return None
        if target.startswith('Lcom/swrve/sdk/EventHelper;->eventsAsBatch('):
            # Serialization/HTTP are boundaries. Retain actual arguments and objects.
            self.sent_batches.append((dict(args[0].value), tuple(args[1:])))
            return 'fixture-wire-body'
        if target.startswith(SWRVE + '->postBatchRequest('):
            self.callbacks.append((args[0], args[4]))
            return None
        if target in {'Lvwh;->h(Lj4i;)V', 'Lvwh;->f(Lb3;)V'}: return None
        if target == 'Lcvh;->l3(Ljava/lang/Runnable;)V':
            self.scheduled.append(args[1]); return None
        if target in {'Lkch;->b(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V',
                      'Lk9i;->b(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V'}:
            self.callbacks.append(tuple(args[1:])); return None
        if target == 'Lzsa;->D(Ld7c;)Ljava/lang/Object;':
            self.scheduled.append(args[1])
            if args[1].descriptor == 'Lhf9;':
                return self.run('Lhf9;', 'execute()Ljava/lang/Object;', [args[1]])[0]
            return None
        if target == 'Lzsa;->H(Ljava/lang/Iterable;)Ljava/lang/String;':
            return '(' + ','.join(str(item.value['id']) for item in args[0].value) + ')'
        if target == 'Lzsa;->k()Landroid/database/sqlite/SQLiteDatabase;':
            return Reference({}, 'Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;':
            self.sql.append(args[1]); return Reference({}, 'Landroid/database/sqlite/SQLiteStatement;')
        if target == 'Landroid/database/sqlite/SQLiteStatement;->execute()V': return None
        if target == 'Lqvg;->Z(Lpm0;IZ)V':
            self.events.append(('retry', *args[1:])); return None
        if target == 'Lb70;->w0([Ljava/lang/Object;)Ljava/util/List;':
            return Reference(list(args[0].value), 'Ljava/util/ArrayList;')
        if target == 'Ltz1;->o0(Ljava/lang/Iterable;I)I': return len(args[0].value)
        if target == 'Ljava/util/ArrayList;->get(I)Ljava/lang/Object;' or target == 'Ljava/util/List;->get(I)Ljava/lang/Object;':
            return args[0].value[args[1]]
        if target == 'Ljava/lang/Number;->intValue()I': return args[0].value
        if target == 'Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;':
            if args[0].value.get('failure'): raise VmThrown(args[0].value['failure'])
            return args[0].value['result']
        if target == 'Ljava/lang/Throwable;->getMessage()Ljava/lang/String;': return args[0].value['message']
        if owner == 'Lmi7;': self.events.append(('snowplow-log',)); return None
        return super().invoke(caller, target, args)


def verify_basic_results(f):
    for (owner, signature), policy in POLICIES.items():
        prefix = basic_prefix(policy, signature)
        if prefix is None: continue
        row = f.rows[owner, signature]
        # Arguments are explicit words; reference-preserving hooks receive real objects.
        args = [Reference({}, 'Ljava/lang/Object;') for _ in range(20)]
        if policy.startswith('FORCE_'):
            _, frame = f.run(owner, signature, args, stop_at={len(prefix)})
            parameter = 'v' + str(row[3] + (0 if policy == 'FORCE_STATIC_P0_FALSE' else 1))
            assert is_zero(frame[parameter]) or frame[parameter] is f.false
            continue
        output = f.run(owner, signature, args)[0]
        if policy.startswith('STOP_VOID'): assert output is None
        elif policy.startswith('UNIT_'): assert output is f.statics['Lk9d;->a:Lk9d;']
        elif policy.startswith('EMPTY_STRING'): assert output == ''
        elif policy.startswith('EMPTY_MAP'): assert output is f.statics['Lpw3;->h:Lpw3;']
        elif policy.startswith('FALSE'): assert is_zero(output)
        elif policy == 'TRUE_PERMANENT_MEASUREMENT_DEACTIVATION': assert output == 1
        elif policy == 'RETURN_ORIGINAL_P0_PLAYER_OR_SOURCE': assert output is args[0]
        elif policy == 'COMPLETED_TASK_NULL_Lzdc_P':
            assert f.memory.instance_of(output, 'Lodc;')
            assert f.run('Lwui;', 'l()Z', [output])[0] == 1
            assert f.run('Lwui;', 'm()Z', [output])[0] == 1
            assert is_zero(f.run('Lwui;', 'k()Ljava/lang/Object;', [output])[0])
        elif policy == 'NATIVE_NULL_JSON_FAILURE': assert is_zero(output)
        elif policy == 'NATIVE_FAILURE_INT_MINUS1': assert output == -1
        elif policy == 'BOXED_TRUE': assert output is f.true
        elif policy == 'BOXED_FALSE_SUSPEND_RESULT': assert output is f.false
        else: raise AssertionError('Uncovered RTL result policy: ' + policy)


def verify_identifiers_and_consent(f, consent):
    callbacks = []
    callback = Reference(lambda value: callbacks.append(value), 'Lkotlin/jvm/functions/Function1;')
    f.run('Lsy5;', 'a(Ljava/util/Map;Lkotlin/jvm/functions/Function1;)V', [None, None, callback])
    assert len(callbacks) == 1 and callbacks[0].descriptor == 'Lwka;'
    failure = f.memory.get(callbacks[0], 'Lwka;->h:Ljava/lang/Object;')
    assert failure.descriptor == 'Luka;'
    throwable = f.memory.get(failure, 'Luka;->h:Ljava/lang/Throwable;')
    assert throwable.descriptor == 'Ljava/lang/Throwable;'
    try: f.run('Lcp;', 'X(Ljava/lang/Object;)V', [failure])
    except VmThrown as caught: assert caught.value is throwable
    else: raise AssertionError('Native boxed DMOI failure must remain failure')
    for suspended in (False, True):
        f.emit_suspended = suspended
        flow = Reference({'emitted': []}, 'Ltgb;')
        va = Reference({'Lva;->a:Landroid/content/Context;': None, 'Lva;->c:Ltgb;': flow}, 'Lva;')
        coroutine = Reference({'Lua;->v:Lva;': va, 'Lua;->u:I': 0}, 'Lua;')
        result = f.run('Lua;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', [coroutine, None])[0]
        assert len(flow.value['emitted']) == 1 and is_zero(flow.value['emitted'][0])
        assert coroutine.value['Lua;->u:I'] == 2
        expected = 'Lal2;->h:Lal2;' if suspended else 'Lk9d;->a:Lk9d;'
        assert result is f.statics[expected]
        if suspended:
            assert f.run('Lua;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', [coroutine, None])[0] is f.statics['Lk9d;->a:Lk9d;']
            assert len(flow.value['emitted']) == 1
    if consent:
        busy, ready = Reference({'value': f.true}, 'Ldyb;'), Reference({'value': f.false}, 'Ldyb;')
        state = Reference({'Lkc2;->i:Ldyb;': busy, 'Lkc2;->j:Ldyb;': ready,
                           'Lkc2;->f:Loi2;': Reference({}, 'Loi2;')}, 'Lkc2;')
        keys = dict(state.value)
        before = len(f.scheduled)
        f.run('Lkc2;', 'd(Landroidx/fragment/app/s;Z)V', [state, None, 0])
        assert busy.value['value'] is f.false and ready.value['value'] is f.true
        assert state.value == keys and len(f.scheduled) == before
        activity = Reference({}, 'Landroidx/fragment/app/s;')
        f.run('Lkc2;', 'd(Landroidx/fragment/app/s;Z)V', [state, activity, 1])
        task = f.scheduled[-1]
        assert task.descriptor == 'Lic2;' and task.value['Lic2;->w:Z'] == 1
        assert task.value['Lic2;->x:Ljava/lang/Object;'] is state and task.value['Lic2;->y:Ljava/lang/Object;'] is activity


def verify_video_tracking(f):
    signature = f.method(VM, 'createSessionConsumerFactory(')
    config = Reference({}, 'Lnl/rtl/videoplayer/config/VideoAnalyticsConfig;')
    factory = f.run(VM, signature, [None, None, config, *(['metadata'] * 7)])[0]
    owner = 'Lnl/rtl/videoplayer/analytics/tracker/MultiSessionTrackerFactory;'
    assert factory.value[owner + '->factories:Ljava/util/List;'].value == []
    tracker = f.run(owner, 'create(Landroid/content/Context;)Lnl/rtl/videoplayer/analytics/tracker/SessionTracker;',
                    [factory, Reference({}, 'Landroid/content/Context;')])[0]
    assert tracker.descriptor == 'Lnl/rtl/videoplayer/analytics/tracker/SessionTrackerCollection;'
    before = len(f.events)
    f.run(tracker.descriptor, 'onPlay()V', [tracker])
    f.run(tracker.descriptor, 'onDestroy()V', [tracker])
    assert len(f.events) == before


def verify_cct(f):
    gate = ('Lgcd;', CCT)
    retained = [Reference({'Lbm0;->a:Ljava/lang/String;': name}, 'Lbm0;') for name in ('FUNCTIONAL', None, 'UNKNOWN_NEW_NAME')]
    measurement = [Reference({'Lbm0;->a:Ljava/lang/String;': name}, 'Lbm0;') for name in MEASUREMENT_TRANSPORTS]
    for items in ([], measurement, retained, measurement[:4] + retained + measurement[4:]):
        original = Reference(items, 'Ljava/util/ArrayList;')
        actual = f.run(*gate, [original])[0]
        expected = [item for item in items if item not in measurement]
        assert actual.value == expected and all(a is b for a, b in zip(actual.value, expected))
        assert original.value is items
    # All filtered, including appended GDT metrics, executes native fatal/deletion.
    database = Reference({}, 'Lzsa;')
    uploader = Reference({'Lgcd;->c:Li34;': database}, 'Lgcd;')
    persisted = Reference([Reference({'id': n}, 'Llm0;') for n in (11, 25, 90)], 'Ljava/util/ArrayList;')
    extras = Reference(b'original-extras', '[B')
    frame = {'p0': uploader, 'p1': Reference({}, 'Lpm0;'), 'p2': 3,
             'v1': uploader, 'v2': extras, 'v3': Reference({}, 'Lpm0;'), 'v4': 45, 'v5': 0,
             'v6': Reference({}, 'Luo1;'), 'v7': Reference({}, 'Lax3;'), 'v8': Reference({}, 'Ljava/lang/Object;'),
             'v10': database, 'v12': persisted, 'v14': Reference(measurement, 'Ljava/util/ArrayList;')}
    result, output = f.run('Lgcd;', 'a(Lpm0;I)V', start=107, stop_at={12}, registers=frame)
    assert result == 12 and f.sql[-1] == 'DELETE FROM events WHERE _id in (11,25,90)'
    assert output['v9'].value['Lul0;->a:I'] == 3 and output['v9'].value['Lul0;->b:J'] == -1
    assert output['v2'] is extras and output['v4'] == 45
    assert not any(e[0] == 'retry' for e in f.events)
    # Actual retained HTTP outcome still chooses retry rather than fake success.
    uploader.value['Lgcd;->d:Lc6e;'] = Reference({}, 'Lqvg;')
    retry = Reference({'Lul0;->a:I': 2, 'Lul0;->b:J': -1}, 'Lul0;')
    frame.update({'v9': retry, 'v1': 2, 'v30': extras, 'v31': 45, 'v32': 0})
    f.run('Lgcd;', 'a(Lpm0;I)V', start=524, registers=frame)
    assert f.events[-1][0] == 'retry' and f.events[-1][2:] == (4, 1)


def verify_swrve(f):
    helper = next(sig for owner, sig in HELPERS if owner == SWRVE)
    user = 'actual-user'
    manager = Reference({SWRVE + '->userId:Ljava/lang/String;': user,
                         SWRVE + '->appVersion:Ljava/lang/String;': 'actual-version',
                         SWRVE + '->sessionToken:Ljava/lang/String;': 'actual-session',
                         SWRVE + '->deviceId:Ljava/lang/String;': 'actual-device',
                         SWRVE + '->profileManager:Lcom/swrve/sdk/SwrveProfileManager;': 0}, SWRVE)
    source = {1: '{"type":"event"}', 2: '{"type":"user"}', 3: '{"type":"session_start"}',
              4: '{"type":"device_update"}', 5: 'malformed', 6: '{"type":"future_event"}'}
    store = Reference({'events': dict(source)}, STORE)
    original = Reference({store: Reference(dict(source), 'Ljava/util/LinkedHashMap;')}, 'Ljava/util/LinkedHashMap;')
    filtered = f.run(SWRVE, helper, [manager, original])[0]
    assert list(filtered.value[store].value) == [2, 4, 5, 6]
    assert all(filtered.value[store].value[k] is source[k] for k in (2, 4, 5, 6))
    assert f.deletions[-1] == (store, user, [1, 3]) and list(store.value['events']) == [2, 4, 5, 6]
    assert list(original.value[store].value) == list(source)
    # Native send counts/merges only kept records; genuine rejected response retains them.
    f.run(SWRVE, SEND_EVENTS, [manager, filtered])
    batch, identity = f.sent_batches[-1]
    assert list(batch) == [2, 4, 5, 6] and identity == (user, 'actual-version', 'actual-session', 'actual-device')
    listener = f.callbacks[-1][1]
    assert listener.value['Lhf9;->j:Ljava/lang/Object;'] is not original
    response = Reference({}, 'Lcom/swrve/sdk/rest/RESTResponse;')
    before = len(f.deletions)
    f.run(SWRVE, SWRVE_RESPONSE, [manager, filtered, 0, response, user])
    assert len(f.deletions) == before
    f.run(SWRVE, SWRVE_RESPONSE, [manager, filtered, 1, response, user])
    assert f.deletions[-1] == (store, user, [2, 4, 5, 6]) and not store.value['events']
    # Empty/all-measurement, multiple independent stores, and native store failure.
    first = Reference({'events': {7: '{"type":"event"}'}}, STORE)
    second = Reference({'events': {8: '{"type":"session_start"}'}}, STORE)
    items = Reference({first: Reference(dict(first.value['events']), 'Ljava/util/LinkedHashMap;'),
                       second: Reference(dict(second.value['events']), 'Ljava/util/LinkedHashMap;')}, 'Ljava/util/LinkedHashMap;')
    count = len(f.sent_batches)
    assert f.run(SWRVE, SEND_EVENTS, [manager, items])[0] == 0 and len(f.sent_batches) == count
    assert not first.value['events'] and not second.value['events']
    failed = Reference({'events': {9: '{"type":"event"}'}, 'fail': True}, STORE)
    items = Reference({failed: Reference(dict(failed.value['events']), 'Ljava/util/LinkedHashMap;')}, 'Ljava/util/LinkedHashMap;')
    assert f.run(SWRVE, SEND_EVENTS, [manager, items])[0] == 0 and 9 in failed.value['events']
    assert f.events[-1][0] == 'swrve-log' and 'Unable to generate' in f.events[-1][2]


def verify_measurement_callbacks(f):
    scheduler = Reference({}, 'Lcvh;')
    core = Reference({'Lvwh;->n:Lcvh;': scheduler}, 'Lvwh;')
    helper = 'morpheFailMeasurement(Ldsg;)Z'
    for discriminator in (0, 7):
        assert f.run('Ldsg;', helper, [Reference({'Ldsg;->h:I': discriminator}, 'Ldsg;')])[0] == 0
    for discriminator, owner_type, callback_type, runnable_type in (
            (1, 'Lydh;', 'Lkch;', 'Lp9h;'), (2, 'Lt9i;', 'Lk9i;', 'Lft4;')):
        callback = Reference({}, callback_type)
        task = Reference({'Ldsg;->h:I': discriminator, 'Ldsg;->l:Ljava/lang/Object;': 'real-app-id',
                          'Ldsg;->k:Ljava/lang/Object;': callback,
                          'Ldsg;->n:Ljava/lang/Object;': Reference({'Lb3;->i:Ljava/lang/Object;': core}, owner_type)}, 'Ldsg;')
        f.run('Ldsg;', 'run()V', [task])
        runnable = f.scheduled[-1]
        assert runnable.descriptor == runnable_type
        f.run(runnable_type, 'run()V', [runnable])
        identity, status, failure, data, headers = f.callbacks[-1]
        assert identity == 'real-app-id' and status == 0 and failure.descriptor == 'Ljava/io/IOException;'
        assert is_zero(data) and is_zero(headers)


def verify_snowplow_future_results(f):
    owner = SNOWPLOW + 'OkHttpNetworkConnection;'
    connection = Reference({owner + '->emitTimeout:I': 5, owner + '->TAG:Ljava/lang/String;': 'network'}, owner)
    method = 'getRequestCallable$lambda$6(' + owner + 'Luha;)Ljava/lang/Integer;'
    boxed_failure = f.run(owner, method, [connection, Reference({}, 'Luha;')])[0]
    assert boxed_failure.descriptor == 'Ljava/lang/Integer;' and boxed_failure.value == -1
    event_ids = Reference([101, 203], 'Ljava/util/ArrayList;')
    request_owner = SNOWPLOW + 'Request;'
    request = Reference({request_owner + '->oversize:Z': 0,
                         request_owner + '->emitterEventIds:Ljava/util/List;': event_ids}, request_owner)
    # The scheduler is modeled; real native Future.get/error/result constructors run.
    for failure in (None, 'TimeoutException', 'ExecutionException', 'InterruptedException'):
        task = Reference({'result': boxed_failure}, 'Ljava/util/concurrent/Future;')
        if failure:
            package = 'Ljava/lang/' if failure == 'InterruptedException' else 'Ljava/util/concurrent/'
            task.value['failure'] = Reference({'message': 'fixture failure'}, package + failure + ';')
        results = Reference([], 'Ljava/util/ArrayList;')
        output, _ = f.run(owner, 'sendRequests(Ljava/util/List;)Ljava/util/List;', start=42,
                          registers={'p0': connection, 'p1': Reference([request], 'Ljava/util/ArrayList;'),
                                     'v0': Reference([task], 'Ljava/util/ArrayList;'), 'v1': results})
        assert output is results and len(results.value) == 1
        result = results.value[0]
        assert result.value[SNOWPLOW + 'RequestResult;->statusCode:I'] == -1
        assert result.value[SNOWPLOW + 'RequestResult;->eventIds:Ljava/util/List;'] is event_ids


def verify_tracking(source, declarations, sdk_read, consent):
    expected_handlers = [(2, 4, 'Ljava/lang/Exception;', 53),
                         (13, 34, 'Lorg/json/JSONException;', 29),
                         (34, 52, 'Lorg/json/JSONException;', 53)]
    assert parse(source.body(SWRVE, SEND_EVENTS)).handlers == expected_handlers, 'Preserve native Swrve error boundaries'
    for owner, signature in HELPERS:
        expected = [(37, 53, 'Ljava/lang/Exception;', 54)] if owner == SWRVE else []
        assert parse(source.body(owner, signature)).handlers == expected, 'RTL queue helper catch boundary'
    f = TrackingFixture(source, declarations, sdk_read)
    verify_basic_results(f)
    verify_identifiers_and_consent(f, consent)
    verify_video_tracking(f)
    verify_cct(f)
    verify_swrve(f)
    verify_measurement_callbacks(f)
    verify_snowplow_future_results(f)
