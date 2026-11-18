"""Execute emitted privacy policies with explicit SDK/IO boundaries.

Native instructions/results/callbacks/queue decisions run here. Android UI,
network/storage and worker scheduling are modeled, not captured device traffic.
Unknown calls fail closed; retained bodies are independently hash-pinned.
"""
import re

from brabant_vm import Fixture
from brabant_tracking_contracts import TRACKING_CONTRACTS
from brabant_tracking_edits import TRACKING_EDITS, HELPERS, MEASUREMENT_TRANSPORTS
from rtl_vm import Reference, is_zero, VmThrown

MEASUREMENT = 'Lcom/google/android/gms/measurement/internal/'
CCT = 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'


class TrackingFixture(Fixture):
    def __init__(self, source, declarations, sdk_read):
        super().__init__(source, declarations, sdk_read)
        self.rows.update({r[:2]: r for r in TRACKING_CONTRACTS})
        self.rows.update({key: (*key, 9, locals_, 0, '') for key, locals_ in HELPERS.items()})
        self.native |= set(HELPERS)
        self.native |= {(o, sig) for o, sig in self.rows if o in {
            'Lp58;', 'Lgd0;', 'Lnf0;', 'Lij0;', 'Ljb2;', 'Lw07;',
            'Lnl/omroepbrabant/android/data/room/entity/DBArticleReadEntity;',
            MEASUREMENT+'zzlm;', MEASUREMENT+'zzgx;'} and sig.startswith('<init>(')}
        self.native.add(('Lij0;', 'execute()Ljava/lang/Object;'))
        self.native |= {(e['owner'], e['signature']) for e in TRACKING_EDITS if e['index'] == 0 and not e['original']}
        self.native.add(('Lq58;', 'a(Ljava/lang/Object;)Ljava/lang/Throwable;'))
        self.native.add((MEASUREMENT+'zzpj;', 'zzc()J'))
        self.native |= {(o,sig) for o,sig in self.rows if o == MEASUREMENT+'zzlr;' or (o == MEASUREMENT+'zzaf;' and sig.startswith('<init>('))}
        self.native.add(('Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;', 'getOpenMeasurementManager()Lpt6;'))
        self.native |= {(MEASUREMENT+'zzln;', sig) for o, sig in self.rows if o == MEASUREMENT+'zzln;' and sig.startswith(('zzb(', 'zza('))}
        self.native.add(('Lcom/google/android/gms/internal/pal/zzil;', 'zze()Lcom/google/android/gms/internal/pal/zzil;'))
        self.scheduled, self.callbacks, self.sql, self.retry = [], [], [], []
        self.db_suspends = False
        self.now_ms = 1800000000000
        self.piano_rows, self.piano_deletes, self.piano_db_failure = {}, [], None
        self.statics['Llz9;->a:Llz9;'] = Reference({}, 'Llz9;')
        self.statics['Lsr1;->a:Lsr1;'] = Reference({}, 'Lsr1;')

    def invoke(self, target, args):
        owner, signature = target.split('->', 1)
        if (owner, signature) in self.native:
            return self.run(owner, signature, args)[0]
        if target == 'Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;':
            assert not is_zero(args[0]), 'Native Google callback null check'
            return args[0]
        if target == 'Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V' or target == 'Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V': return None
        if target == 'Ljava/io/IOException;-><init>(Ljava/lang/String;)V':
            args[0].value['message'] = args[1]; return None
        if target == 'Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V':
            args[0].value = {'first': args[1], 'second': args[2]}; return None
        if target == 'Lab9;->getValue()Ljava/lang/Object;':
            self.events.append(('lazy-value', args[0])); return args[0].value['value']
        if target == 'Ljava/lang/String;->charAt(I)C': return ord(args[0][args[1]])
        if owner == 'Ljava/lang/StringBuilder;':
            if signature.startswith('<init>('): args[0].value = args[1] if len(args)>1 else ''; return None
            if signature.startswith('append('): args[0].value += str(args[1]); return args[0]
            if signature == 'toString()Ljava/lang/String;': return args[0].value
        if target == 'Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;': return Reference(args[0], 'Ljava/lang/Integer;')
        if target == 'Ljava/lang/Integer;->intValue()I': return args[0].value
        if target == 'Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;': return Reference(args[0], 'Ljava/lang/Long;')
        if target == 'Ljava/lang/String;->valueOf(I)Ljava/lang/String;': return str(args[0])
        if target == 'Ljava/lang/String;->valueOf(J)Ljava/lang/String;': return str(args[0])
        if target == 'Ljava/util/concurrent/TimeUnit;->toMillis(J)J':
            assert args[0] is self.statics['Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;']
            return args[1]*86400000
        if target == 'Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;': return 'null' if is_zero(args[0]) else str(args[0])
        if target == 'Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;': return Reference(args[0].split(args[1]), '[Ljava/lang/String;')
        if target == 'Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;': return Reference(list(args[0].value), 'Ljava/util/ArrayList;')
        if target == 'Ljava/util/List;->contains(Ljava/lang/Object;)Z': return int(args[1] in args[0].value)
        if target == 'Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V': args[0].value = bytes(args[1].value).decode(); return None
        if target == 'Ljava/lang/String;->length()I': return len(args[0].value if isinstance(args[0], Reference) else args[0])
        if target == 'Ljava/lang/String;->substring(II)Ljava/lang/String;': return args[0].value[args[1]:args[2]]
        if target == 'Ljava/lang/Math;->min(II)I': return min(args)
        if target == 'Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V':
            args[0].value['value'] = args[1]; self.events.append(('waiter-set', args[0], args[1])); return None
        if target == 'Ljava/lang/Object;->notifyAll()V': self.events.append(('waiter-notify', args[0])); return None
        if target == 'Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I': return args[0].value.get(args[1], args[2])
        if owner == 'Ljava/util/HashMap;' and signature in {'get(Ljava/lang/Object;)Ljava/lang/Object;', 'remove(Ljava/lang/Object;)Ljava/lang/Object;'}:
            return args[0].value.get(args[1], 0) if signature.startswith('get(') else args[0].value.pop(args[1], 0)
        if target == 'Ljava/lang/String;->isEmpty()Z': return int(not args[0])
        if owner == MEASUREMENT+'zzic;' and signature == 'zzaX()'+MEASUREMENT+'zzhz;':
            return args[0].value['worker']
        if owner == MEASUREMENT+'zzhz;' and signature == 'zzj(Ljava/lang/Runnable;)V':
            self.scheduled.append(args[1]); return None
        if owner == MEASUREMENT+'zzf;' and signature == 'zzg()V': return None
        if owner in {MEASUREMENT+'zzic;',MEASUREMENT+'zzpg;'} and signature == 'zzaW()'+MEASUREMENT+'zzgu;': return self.new(MEASUREMENT+'zzgu;')
        if owner == MEASUREMENT+'zzgu;' and signature in {'zze()'+MEASUREMENT+'zzgs;', 'zzk()'+MEASUREMENT+'zzgs;', 'zzh()'+MEASUREMENT+'zzgs;'}: return self.new(MEASUREMENT+'zzgs;')
        if owner == MEASUREMENT+'zzgs;': self.events.append(('measurement-log',signature)); return None
        if owner == MEASUREMENT+'zzfx;' and signature == 'zzb(Ljava/lang/Object;)Ljava/lang/Object;': return '429,503'
        if owner == MEASUREMENT+'zzic;' and signature == 'zzt()'+MEASUREMENT+'zznl;': return self.new(MEASUREMENT+'zznl;')
        if owner == MEASUREMENT+'zznl;' and signature == 'zzy('+MEASUREMENT+'zzaf;)V': self.events.append(('status-row',args[1])); return None
        if owner == MEASUREMENT+'zzpg;' and signature in {'zzaM()V','zzaN()V'}:
            self.events.append(('measurement-lifecycle',signature)); return None
        if owner == MEASUREMENT+'zzpg;' and signature == 'zzj()'+MEASUREMENT+'zzaw;': return args[0].value['database']
        if owner == MEASUREMENT+'zzpg;' and signature == 'zzba()Lcom/google/android/gms/common/util/Clock;': return Reference({},'Lcom/google/android/gms/common/util/Clock;')
        if owner == 'Lcom/google/android/gms/common/util/Clock;' and signature == 'currentTimeMillis()J': return 1234567
        if owner == MEASUREMENT+'zzhe;' and signature == 'zzb(J)V': args[0].value['timestamp'] = args[1]; return None
        if owner == MEASUREMENT+'zzaw;' and signature in {'zzJ(Ljava/util/List;)V', 'zzK(Ljava/lang/Long;)V'}:
            self.events.append(('measurement-retry-rows',signature,args[1])); return None
        if owner in {MEASUREMENT+'zzll;', MEASUREMENT+'zzgw;'} and signature == 'zza(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V':
            self.callbacks.append(tuple(args)); return None
        if target == 'Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V':
            self.events.append(('previous-handler', *args)); return None
        if owner == 'Ljava/util/ArrayList;' and signature in {'<init>()V', '<init>(I)V'}:
            args[0].value = []; return None
        if signature == 'iterator()Ljava/util/Iterator;' and owner in {'Ljava/util/ArrayList;', 'Ljava/lang/Iterable;'}:
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if owner == 'Ljava/util/Iterator;':
            state = args[0].value
            if signature == 'hasNext()Z': return int(state['index'] < len(state['items']))
            if signature == 'next()Ljava/lang/Object;':
                item = state['items'][state['index']]; state['index'] += 1; return item
        if owner == 'Ljava/util/ArrayList;':
            if signature == 'isEmpty()Z': return int(len(args[0].value) == 0)
            if signature == 'add(Ljava/lang/Object;)Z': args[0].value.append(args[1]); return 1
        if target in {'Ljava/lang/String;->equals(Ljava/lang/Object;)Z', 'Ljava/lang/Object;->equals(Ljava/lang/Object;)Z'}:
            return int(isinstance(args[0], str) and args[0] == args[1]) if isinstance(args[0], str) else int(args[0] is args[1])
        if target == 'Lq98;->u(Lza9;)Ljava/lang/Object;':
            self.events.append(('transaction', args[1]))
            if args[1].descriptor == 'Lij0;': return self.run('Lij0;', 'execute()Ljava/lang/Object;', [args[1]])[0]
            return None
        if target == 'Lq98;->A(Ljava/lang/Iterable;)Ljava/lang/String;':
            return '(' + ','.join(str(x.value['Lnf0;->a:J']) for x in args[0].value) + ')'
        if target == 'Lq98;->b()Landroid/database/sqlite/SQLiteDatabase;': return Reference({}, 'Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;':
            self.sql.append(args[1]); return Reference({}, 'Landroid/database/sqlite/SQLiteStatement;')
        if target == 'Landroid/database/sqlite/SQLiteStatement;->execute()V': return None
        if target == 'Le42;->B(Lag0;IZ)V': self.retry.append(tuple(args[1:])); return None
        if target == 'Ljava/lang/System;->currentTimeMillis()J': return self.now_ms
        if target == 'Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;': return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I':
            _, table, where, params = args; assert table == 'events'
            self.piano_deletes.append((table,where,list(params.value)))
            if self.piano_db_failure: raise VmThrown(self.piano_db_failure)
            if where == 'time < ?':
                ids=[key for key,row in self.piano_rows.items() if row['time']<int(params.value[0])]
            else:
                assert where == 'isSent = 0 AND _id <= (SELECT _id FROM events WHERE isSent = 0 ORDER by _id DESC LIMIT 1 OFFSET ?)'
                pending=sorted((key for key,row in self.piano_rows.items() if not row['isSent']),reverse=True)
                offset=int(params.value[0]); boundary=pending[offset] if len(pending)>offset else -1
                ids=[key for key,row in self.piano_rows.items() if not row['isSent'] and key<=boundary]
            for key in ids:del self.piano_rows[key]
            return len(ids)
        if target == 'Lla;->f([Lnl/omroepbrabant/android/data/room/entity/DBArticleReadEntity;Lhp1;)Ljava/lang/Object;':
            self.events.append(('read-db', args[1], args[2]))
            return self.statics['Lsr1;->a:Lsr1;'] if self.db_suspends else self.statics['Llz9;->a:Llz9;']
        if target == 'Lmu;->O(Ljava/lang/Object;)V':
            if isinstance(args[0], Reference) and args[0].descriptor == 'Lp58;': raise VmThrown(args[0].value['Lp58;->a:Ljava/lang/Throwable;'])
            return None
        if target == 'Lyh0;->g(Ljava/lang/String;Ljava/util/Map;)V':
            # The actual builder's initialized player and unchanged arguments;
            # g's real option-copy/TCF/statistics code is executed separately.
            self.events.append(('native-player-ready',*args)); return None
        if target == 'Lal5;->Z(Ljava/util/Map;)Ljava/util/Map;': return Reference(dict(args[0].value), 'Ljava/util/LinkedHashMap;')
        if target == 'Lal5;->O([Lw07;)Ljava/util/Map;':
            return Reference({x.value['Lw07;->a:Ljava/lang/Object;']:x.value['Lw07;->b:Ljava/lang/Object;'] for x in args[0].value}, 'Ljava/util/LinkedHashMap;')
        if target == 'Lqw2;->d(Lfy2;Ljava/util/Map;)V': self.events.append(('native-player-event',*args)); return None
        return super().invoke(target, args)


def arguments(f, key):
    row = f.rows[key]
    params = re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', key[1].split('(', 1)[1].split(')', 1)[0])
    return ([] if row[2] & 8 else [f.new(key[0])]) + [
        Reference({}, p) if p.startswith(('L', '[')) else 0 for p in params]


def verify_basic(f, consent):
    # Repeated calls also cover warmed/cached collector objects: no sink runs.
    simple = [e for e in TRACKING_EDITS if e['index'] == 0 and not e['original']
              and e['replacement'] == ['return-void']]
    for e in simple:
        key = e['owner'], e['signature']; args = arguments(f, key)
        before = len(f.events), len(f.scheduled)
        for _ in range(2): assert f.run(*key, args)[0] is None
        assert before == (len(f.events), len(f.scheduled))
    for owner, prefix in [('Lt77;', 'a('), ('Lvd5;', 'b(')]:
        key = owner, f.method(owner, prefix)
        assert f.run(*key, arguments(f, key))[0] is f.false
    for owner, prefix, expected in [('Luy1;', 'a(', 0), ('Lew9;', 'N(', 0), (MEASUREMENT+'zzal;', 'zzt(', 1)]:
        key = owner, f.method(owner, prefix); assert f.run(*key, arguments(f, key))[0] == expected
    for owner, prefix in [('Lw56;', 'F0('), ('Lrt6;', 'a('), ('Lrt6;', 'b(')]:
        key = owner, f.method(owner, prefix); result = f.run(*key, arguments(f, key))[0]
        assert result.descriptor == 'Lp58;'
        assert result.value['Lp58;->a:Ljava/lang/Throwable;'].descriptor == 'Ljava/lang/IllegalStateException;'
    key = 'Lw56;', f.method('Lw56;', 'x0('); assert is_zero(f.run(*key, arguments(f, key))[0])
    if consent:
        key = 'Lrq7;', f.method('Lrq7;', 'H('); assert f.run(*key, arguments(f, key))[0] is f.false
    # Piano crash suppression still delegates the original handler exactly once.
    handler = f.new('Lyr1;'); fields = [x for x in handler.value if x.endswith(':Ljava/lang/Thread$UncaughtExceptionHandler;')]
    assert len(fields) == 1
    previous = Reference({}, 'Ljava/lang/Thread$UncaughtExceptionHandler;'); handler.value[fields[0]] = previous
    thread, failure = Reference({}, 'Ljava/lang/Thread;'), Reference({}, 'Ljava/lang/Throwable;')
    before = len(f.events); f.run('Lyr1;', f.method('Lyr1;', 'uncaughtException('), [handler, thread, failure])
    assert f.events[before:] == [('previous-handler', previous, thread, failure)]


def verify_identifiers(f):
    for owner, prefix in [('Lnv3;', 'y('), ('Lm74;', 'a('), ('Lm74;', 'y('),
                          ('Lcom/google/ads/interactivemedia/v3/internal/zzeo;', 'zza('),
                          ('Lcom/google/android/gms/internal/pal/zzay;', 'zzf('),
                          ('Lcom/google/android/gms/internal/consent_sdk/zza;', 'zza(')]:
        key = owner, f.method(owner, prefix)
        assert is_zero(f.run(*key, arguments(f, key))[0]), 'Expected native optional ID absence'
    for owner in ('Lnv3;', 'Lm74;'):
        key = owner, 't()Z'; assert f.run(*key, arguments(f, key))[0] == 1
    key = 'Ldf2;', f.method('Ldf2;', 'invokeSuspend(')
    assert f.run(*key, arguments(f, key))[0] is f.statics['Llz9;->a:Llz9;']
    for owner, prefix in [(MEASUREMENT+'zzhh;', 'zzb('), (MEASUREMENT+'zznn;', 'zzc('), (MEASUREMENT+'zznn;', 'zzd(')]:
        key = owner, f.method(owner, prefix); value = f.run(*key, arguments(f, key))[0]
        assert value.descriptor == 'Landroid/util/Pair;' and value.value == {'first': '', 'second': f.false}
    key = MEASUREMENT+'zznn;', f.method(MEASUREMENT+'zznn;', 'zzf(')
    assert f.run(*key, arguments(f, key))[0] == ''
    for owner in ('Lcom/google/android/gms/internal/pal/zzax;', 'Lcom/google/android/gms/internal/pal/zzay;'):
        key = owner, f.method(owner, 'zza('); value = f.run(*key, arguments(f, key))[0]
        assert value.descriptor == 'Lcom/google/android/gms/internal/pal/zzif;'
    # Both new requests and previously cached optional associations are omitted.
    startapp = f.new('Lcom/startapp/sdk/internal/e2;', {'Lcom/startapp/sdk/internal/e2;->k:Ljava/lang/String;': 'cached-appset'})
    f.run(startapp.descriptor, 'a(Landroid/content/Context;Lcom/startapp/sdk/adsbase/model/AdPreferences;)V',
          start=20, stop_at={41}, registers={'p0': startapp, 'p1': f.new('Landroid/content/Context;')})
    assert is_zero(startapp.value['Lcom/startapp/sdk/internal/e2;->k:Ljava/lang/String;'])
    outbrain = f.new('Lh98;', {'Lh98;->m:Ljava/lang/String;': 'cached-gaid'})
    task = f.new('Lc98;', {'Lc98;->a:I': 0, 'Lc98;->b:Lh98;': outbrain, 'Lc98;->c:Landroid/content/Context;': f.new('Landroid/content/Context;')})
    f.run('Lc98;', 'run()V', [task], stop_at={21})
    assert is_zero(outbrain.value['Lh98;->m:Ljava/lang/String;'])
    ump = 'Lcom/google/android/gms/internal/consent_sdk/'
    f.run(ump+'zzx;', f.method(ump+'zzx;', 'zzb('), start=2, stop_at={14})
    _, frame = f.run(ump+'zzn;', f.method(ump+'zzn;', 'zzd('), start=9, stop_at={20})
    assert frame['v4'] == 0  # Native non-debug request construction follows.


def verify_native_consumers(f):
    # NMO cached absence flows through the real wrapper to its nullable caller.
    cache = f.new('Llc2;', {'Llc2;->b:Ljava/lang/Object;': f.new('Lw56;')})
    value, _ = f.run('Llc2;', 'H(Lhp1;)Ljava/lang/Object;', start=29,
                     registers={'p0': cache, 'p1': 0, 'v0': f.new('Lws3;'), 'v3': f.statics['Lsr1;->a:Lsr1;'], 'v5': 1})
    assert is_zero(value)
    # The real Piano caller consumes Boolean.FALSE and terminates with its Unit;
    # no NMO lookup, event queueing or continuation remains unresolved.
    piano = f.new('Lt77;')
    value,_ = f.run('Lt77;', f.method('Lt77;', 'g('), start=34, registers={
        'p0':piano, 'p1':f.new('Lk87;'), 'p2':0, 'v0':f.new('Ls77;'),
        'v2':f.statics['Llz9;->a:Llz9;'], 'v3':1, 'v6':f.statics['Lsr1;->a:Lsr1;']})
    assert value is f.statics['Llz9;->a:Llz9;']
    failure = f.run('Lw56;', f.method('Lw56;', 'F0('), [f.new('Lw56;'), 0])[0]
    assert f.run('Lq58;', 'a(Ljava/lang/Object;)Ljava/lang/Throwable;', [failure])[0] is failure.value['Lp58;->a:Ljava/lang/Throwable;']
    # The real OM failure consumer chooses null session and releases its monitor.
    bridge_type = 'Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;'
    manager = f.new('Lrt6;')
    bridge = f.new(bridge_type, {bridge_type+'->b:Ljava/lang/Object;': Reference({}, 'Ljava/lang/Object;'),
                               bridge_type+'->m:Lw8;': f.new('Lw8;'),
                               bridge_type+'->k:Lab9;': Reference({'value': manager}, 'Lab9;')})
    f.run(bridge_type, f.method(bridge_type, 'i('), start=153, registers={'p0': bridge, 'p1': 0})
    assert is_zero(bridge.value[bridge_type+'->n:Lot6;'])


def verify_history(f):
    unit, suspended = f.statics['Llz9;->a:Llz9;'], f.statics['Lsr1;->a:Lsr1;']
    repo = f.new('Lnt;', {'Lnt;->i:Ljava/lang/Object;': f.new('Lla;')})
    signature = 'k(Ljava/lang/String;Lhp1;)Ljava/lang/Object;'
    for suspend in (False, True):
        f.db_suspends = suspend; continuation = f.new('Lkz;')
        before = len(f.events)
        result, frame = f.run('Lnt;', signature, start=72, registers={
            'p0': repo, 'p1': 'actual-article-id', 'v0': continuation, 'v3': 2, 'v6': suspended})
        assert result is (suspended if suspend else unit)
        event = f.events[before:]; assert len(event) == 1 and event[0][0] == 'read-db'
        entity = event[0][1].value[0]
        assert entity.value['Lnl/omroepbrabant/android/data/room/entity/DBArticleReadEntity;->articleId:Ljava/lang/String;'] == 'actual-article-id'
        if suspend:
            continuation.value.update({'Lkz;->d:I': -0x7ffffffe,
                                       'Lkz;->b:Ljava/lang/Object;': f.new('Lq58;', {'Lq58;->a:Ljava/lang/Object;': unit})})
            before = len(f.events)
            assert f.run('Lnt;', signature, [repo, 'ignored', continuation])[0] is unit
            assert len(f.events) == before  # No duplicate local write or resumed ID/network read.
    # The existing cleanup method remains functional on empty initialized maps.
    controller = f.new('Lfd4;', {'Lfd4;->a:Ljava/lang/Object;': Reference({}, 'Ljava/util/HashMap;'),
                                'Lfd4;->b:Ljava/lang/Object;': Reference({}, 'Ljava/util/HashMap;')})
    cleanup = f.new('Lnt;', {'Lnt;->b:Ljava/lang/Object;': 'previous-article', 'Lnt;->g:Ljava/lang/Object;': controller})
    f.run('Lnt;', 'l()V', [cleanup])
    assert all(is_zero(cleanup.value['Lnt;->'+name+':Ljava/lang/Object;']) for name in ('b','c','h','i'))
    # Native coroutine resume skips only ContentInsights activation, returning Unit.
    cont = f.new('Ljx;', {'Ljx;->d:I': -0x7fffffff, 'Ljx;->a:Lpz;': f.new('Lpz;')})
    assert f.run('Lnt;', f.method('Lnt;', 'n('), [cleanup, f.new('Lpz;'), 0, cont])[0] is unit


def verify_piano_cleanup(f):
    day=86400000
    f.piano_rows={key:{'time':f.now_ms-day,'isSent':0} for key in range(1,2006)}
    f.piano_rows[1]['time']=f.now_ms-8*day
    f.piano_rows[3001]={'time':f.now_ms-8*day,'isSent':1}
    f.piano_rows[3002]={'time':f.now_ms-day,'isSent':1}
    worker=f.new('Lkj8;',{'Lkj8;->a:Lan3;':f.new('Lan3;',{'Lan3;->c:Ljava/lang/Object;':f.new('Ll38;')}),
                          'Lkj8;->b:Lue2;':f.new('Lue2;',{'Lue2;->b:Ljava/lang/Object;':f.new('Lv02;')})})
    before=len(f.piano_deletes)
    f.run('Lkj8;','run()V',[worker])
    assert len(f.piano_deletes)==before+2, 'Piano native expiry/cap cleanup skipped'
    assert f.piano_deletes[before][2]==[str(f.now_ms-7*day)] and f.piano_deletes[before+1][2]==['2000']
    assert set(f.piano_rows)==set(range(6,2006))|{3002}
    assert all(row['isSent']==int(key==3002) for key,row in f.piano_rows.items())
    # Local failure retains the original thrown outcome; it is not delivery.
    failure=Reference({},'Landroid/database/sqlite/SQLiteException;');f.piano_db_failure=failure
    before=len(f.piano_deletes)
    try:f.run('Lkj8;','run()V',[worker])
    except VmThrown as error:assert error.value is failure
    else:raise AssertionError('Native Piano DB failure was swallowed')
    finally:f.piano_db_failure=None
    assert len(f.piano_deletes)==before+1


def verify_video_stats(f):
    key = 'Lyh0;', 'g(Ljava/lang/String;Ljava/util/Map;)V'
    for bits in ('11111111', '00000000'):
        original = Reference({'noStats_content': f.false, 'noStats_commercial': f.false}, 'Ljava/util/LinkedHashMap;')
        sink = f.new('Lfd4;'); player = f.new('Lyh0;', {'Lyh0;->h:Lfd4;': sink, 'Lyh0;->m1:Z': 1})
        _, frame = f.run(*key, [player, 'actual-content-url', original], stop_at={16})
        frame.update({'v2': Reference({}, 'Landroid/content/SharedPreferences;'), 'v6': bits, 'v7': bits, 'v9': '\n', 'v10': 'BBNativePlayerView'})
        f.run(*key, start=166, stop_at={274}, registers=frame)
        output = sink.value['Lfd4;->f:Ljava/lang/Object;']
        assert output.value['noStats_content'] is f.true and output.value['noStats_commercial'] is f.true
        assert output.value['canRequestAds'] is f.false and original.value['noStats_content'] is f.false
    # The independent late statistics fence retains the native player event bus.
    bus = f.new('Lqw2;'); source = f.new('Lla;', {'Lla;->b:Ljava/lang/Object;':bus})
    sender = f.new('Lwp0;', {'Lwp0;->e:Lla;':source, 'Lwp0;->y:Ljava/lang/String;':'actual-player-session'})
    params = Reference({'ev':'media.play','original-marker':'retained'}, 'Ljava/util/LinkedHashMap;')
    before = len(f.events)
    f.run('Lwp0;', 'k(Ljava/util/Map;)V', start=78, registers={'p0':sender,'p1':params})
    events = f.events[before:]; assert len(events) == 1 and events[0][0] == 'native-player-event' and events[0][1] is bus
    copied = events[0][3].value
    assert copied['ident'] == 'actual-player-session' and copied['ev'] == 'media.play' and copied['aux'].value == params.value
    assert params.value == {'ev':'media.play','original-marker':'retained'}


def verify_http_callbacks(f):
    core = f.new(MEASUREMENT+'zzic;', {'worker': f.new(MEASUREMENT+'zzhz;')})
    for owner, parent_type, callback_type, runnable_type in (
            ('zzln;', 'zzlo;', 'zzll;', 'zzlm;'), ('zzgy;', 'zzgz;', 'zzgw;', 'zzgx;')):
        owner, parent_type, callback_type, runnable_type = [MEASUREMENT+x for x in (owner, parent_type, callback_type, runnable_type)]
        parent = f.new(parent_type, {MEASUREMENT+'zzje;->zzu:'+MEASUREMENT+'zzic;': core})
        callback = f.new(callback_type)
        # Exact native fields differ between these two SDK runnables.
        fields = {owner+'->zza:'+parent_type: parent}
        if owner.endswith('zzln;'):
            fields.update({owner+'->zze:Ljava/lang/String;': 'real-app-id', owner+'->zzd:'+callback_type: callback})
        else:
            fields.update({owner+'->zze:Ljava/lang/String;': 'real-app-id', owner+'->zzd:'+callback_type: callback})
        task = f.new(owner, fields); before = len(f.scheduled)
        f.run(owner, 'run()V', [task]); assert len(f.scheduled) == before + 1
        queued = f.scheduled[-1]; assert queued.descriptor == runnable_type
        before = len(f.callbacks); f.run(runnable_type, 'run()V', [queued]); assert len(f.callbacks) == before + 1
        actual_callback, app, status, failure, data, headers = f.callbacks[-1]
        assert actual_callback is callback and app == 'real-app-id' and status == 0
        assert failure.descriptor == 'Ljava/io/IOException;' and is_zero(data) and is_zero(headers)


def verify_measurement_waiters(f):
    # Real enum construction and result getter, not a synthesized success object.
    f.run(MEASUREMENT+'zzlr;', '<clinit>()V')
    result = f.statics[MEASUREMENT+'zzlr;->zzc:'+MEASUREMENT+'zzlr;']
    core = f.new(MEASUREMENT+'zzic;')
    service = f.new(MEASUREMENT+'zzlj;', {MEASUREMENT+'zzje;->zzu:'+MEASUREMENT+'zzic;': core})
    waiter = Reference({}, 'Ljava/util/concurrent/atomic/AtomicReference;')
    callback = f.new(MEASUREMENT+'zzkz;', {MEASUREMENT+'zzkz;->zza:'+MEASUREMENT+'zzlj;': service,
                    MEASUREMENT+'zzkz;->zzb:Ljava/util/concurrent/atomic/AtomicReference;': waiter,
                    MEASUREMENT+'zzkz;->zzc:'+MEASUREMENT+'zzom;': f.new(MEASUREMENT+'zzom;')})
    failure = f.callbacks[-1][3]
    before = len(f.events)
    f.run(MEASUREMENT+'zzkz;', f.method(MEASUREMENT+'zzkz;', 'zza('), [callback,'actual-app',0,failure,0,0])
    assert waiter.value['value'] is result
    assert [(e[0],e[1]) for e in f.events[before:] if e[0].startswith('waiter-')] == [('waiter-set',waiter),('waiter-notify',waiter)]
    assert not any(e[0] == 'status-row' and e[1].value[MEASUREMENT+'zzaf;->zzb:I'] == 1 for e in f.events[before:])
    # Existing persisted-upload failure restores original row identities and
    # clears the busy flag through the native branch, then settles lifecycle.
    rows = Reference([11,25,90], 'Ljava/util/ArrayList;')
    provider = f.new(MEASUREMENT+'zznn;', {MEASUREMENT+'zznn;->zze:'+MEASUREMENT+'zzhe;': f.new(MEASUREMENT+'zzhe;')})
    uploader = f.new(MEASUREMENT+'zzpg;', {MEASUREMENT+'zzpg;->zzz:Ljava/util/List;': rows,
                    MEASUREMENT+'zzpg;->zzv:Z': 1, MEASUREMENT+'zzpg;->zzk:'+MEASUREMENT+'zznn;': provider,
                    'database': f.new(MEASUREMENT+'zzaw;')})
    before = len(f.events)
    f.run(MEASUREMENT+'zzpg;', f.method(MEASUREMENT+'zzpg;', 'zzW('), start=25, registers={
        'p1': 1, 'v0': 0, 'v1': uploader, 'v2': failure, 'v3': Reference(b'', '[B'), 'v9': 0, 'v10': 0})
    assert is_zero(uploader.value[MEASUREMENT+'zzpg;->zzz:Ljava/util/List;']) and uploader.value[MEASUREMENT+'zzpg;->zzv:Z'] == 0
    after = f.events[before:]
    assert any(e[0] == 'measurement-retry-rows' and e[2] is rows for e in after)
    assert [e[1] for e in after if e[0] == 'measurement-lifecycle'] == ['zzaM()V','zzaN()V']
    row = f.new(MEASUREMENT+'zzpj;', {MEASUREMENT+'zzpj;->zza:J':54321})
    uploader.value[MEASUREMENT+'zzpg;->zzv:Z'] = 1
    f.run(MEASUREMENT+'zzpg;', f.method(MEASUREMENT+'zzpg;', 'zzQ('), start=65,
          registers={'p0':uploader,'p5':row,'v0':0})
    assert uploader.value[MEASUREMENT+'zzpg;->zzv:Z'] == 0
    assert any(e[0] == 'measurement-retry-rows' and e[1].startswith('zzK(') and e[2].value == 54321 for e in f.events)
    uploader.value[MEASUREMENT+'zzpg;->zzu:Z'] = 1
    f.run(MEASUREMENT+'zzpg;', f.method(MEASUREMENT+'zzpg;', 'zzY('), start=184, registers={'p0':uploader,'v0':0})
    assert uploader.value[MEASUREMENT+'zzpg;->zzu:Z'] == 0 and f.events[-1] == ('measurement-lifecycle','zzaN()V')


def verify_automatic_consent(f, consent):
    if not consent: return
    options = Reference({'manual-choice': 'retained'}, 'Ljava/util/LinkedHashMap;')
    player = f.new('Lyh0;', {'Lyh0;->n1:Z': 1, 'Lyh0;->m1:Z': 1,
                            'Lyh0;->h1:Lcom/google/android/gms/internal/consent_sdk/zzl;': f.new('Lcom/google/android/gms/internal/consent_sdk/zzl;')})
    before = len(f.events)
    result,_ = f.run('Lwqa;', f.method('Lwqa;', 'p('), start=289,
                    registers={'v2': player, 'p1':'actual-content-url', 'p2':options})
    assert result is player and options.value == {'manual-choice':'retained'}
    assert f.events[before:] == [('native-player-ready',player,'actual-content-url',options)]
    assert player.value['Lyh0;->m1:Z'] == 1  # Stored/SDK state was not fabricated.


def verify_cct_filter(f):
    retained = [f.new('Lye0;', {'Lye0;->a:Ljava/lang/String;': name}) for name in ('FUNCTIONAL', 0, 'UNKNOWN_NEW_NAME')]
    measurement = [f.new('Lye0;', {'Lye0;->a:Ljava/lang/String;': name}) for name in sorted(MEASUREMENT_TRANSPORTS)]
    for items in ([], measurement, retained, measurement[:2]+retained+measurement[2:]):
        original = Reference(items, 'Ljava/util/ArrayList;'); actual = f.run('Lif0;', CCT, [original])[0]
        expected = [x for x in items if x not in measurement]
        assert len(actual.value) == len(expected) and all(a is b for a, b in zip(actual.value, expected))
        assert original.value is items

    database = f.new('Lq98;')
    uploader = f.new('Lif0;', {'Lif0;->c:Ljava/lang/Object;': database,
                              'Lif0;->d:Ljava/lang/Object;': f.new('Le42;')})
    persisted = Reference([f.new('Lnf0;', {'Lnf0;->a:J': n}) for n in (11, 25, 90)], 'Ljava/util/ArrayList;')
    extras = Reference(b'original-extras', '[B'); context = f.new('Lag0;')
    frame = {'p0': uploader, 'p1': context, 'p2': 3, 'v1': uploader, 'v2': extras, 'v3': context,
             'v4': 45, 'v5': 0, 'v6': database, 'v8': Reference(measurement, 'Ljava/util/ArrayList;'),
             'v9': f.new('Lk41;'), 'v12': persisted}
    before = len(f.events), len(f.sql), len(f.retry)
    result, output = f.run('Lif0;', 'h(Lag0;I)V', start=112, stop_at={13}, registers=frame)
    assert result == 13 and f.sql[-1] == 'DELETE FROM events WHERE _id in (11,25,90)'
    assert output['v8'].value['Lgd0;->a:I'] == 3 and output['v8'].value['Lgd0;->b:J'] == -1
    assert output['v2'] is extras and output['v4'] == 45
    assert len(f.events) == before[0]+1 and len(f.sql) == before[1]+1 and len(f.retry) == before[2]
    # Retained/mixed send lists preserve native backend and bookkeeping inputs.
    frame['v8'] = Reference(measurement+retained, 'Ljava/util/ArrayList;')
    result, output = f.run('Lif0;', 'h(Lag0;I)V', start=112, stop_at={121}, registers=frame)
    assert result == 121 and all(a is b for a,b in zip(output['v8'].value, retained))
    assert output['v12'] is persisted and output['v2'] is extras and output['v0'] is frame['v9']
    # A real transient backend result still takes native retry, without deletion.
    retry = f.new('Lgd0;', {'Lgd0;->a:I': 2, 'Lgd0;->b:J': -1})
    frame.update({'v8': retry, 'v1': 2, 'v30': extras, 'v31': 45, 'v32': 0})
    before = len(f.sql), len(f.retry)
    f.run('Lif0;', 'h(Lag0;I)V', start=530, registers=frame)
    assert len(f.sql) == before[0] and len(f.retry) == before[1]+1 and f.retry[-1] == (context,4,1)


def verify_tracking(source, declarations, sdk_read, consent):
    f = TrackingFixture(source, declarations, sdk_read)
    verify_basic(f, consent)
    verify_piano_cleanup(f)
    verify_identifiers(f)
    verify_native_consumers(f)
    verify_history(f)
    verify_video_stats(f)
    verify_http_callbacks(f)
    verify_measurement_waiters(f)
    verify_automatic_consent(f, consent)
    verify_cct_filter(f)
