"""Assert emitted West collection boundaries against actual decoded methods."""
from pathlib import Path
import re
from brabant_smali import canonical
from verify_dumpert import Smali


def verify_tracking(root, declarations, sdk_read):
    source = root if isinstance(root, Smali) else Smali(Path(root))
    code = lambda owner, signature: canonical(source.body(owner, signature)).code
    assert code('Lxy5;', 'b([Lsd2;)V')[0] == 'return-void', 'Piano must not enqueue events'
    assert code('Lp08;', 'j(Ljava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V')[0] == 'return-void', 'App click collection must stop'
    assert code('Lcc5;', 'a()Ljava/lang/String;')[:2] == ['const-string v0, ""', 'return-object v0'], 'NMO lookup must not generate or load an identity'
    piano = code('Lsz6;', 'run()V')
    assert piano[36] == 'return-void', 'Piano must keep both native cleanups then stop before connectivity'
    assert sum('SQLiteDatabase;->delete' in s for s in piano[:36]) == 2
    assert 'invoke-static {v5}, Lv70;->morpheNoStats(Ljava/util/Map;)V' in code('Lv70;', 'l(Ljava/lang/String;Ljava/util/Map;)V'), 'Player statistics flags must be enforced after TCF'
    stats = code('Lre0;', 'n(Ljava/util/Map;)V')
    assert stats[79] == 'const/4 v0, 0x2' and stats[80].startswith('goto/32 '), 'Statistics network fence must keep event bus completion'
    verify_native_effects(source, declarations, sdk_read)
    print('PASS West tracking emitted collection boundaries and native fixtures')


from brabant_vm import Fixture
from rtl_vm import Reference, VmThrown, is_zero
from west_tracking_edits import TRACKING_CONTRACTS, HELPERS


class TrackingFixture(Fixture):
    """Run native policies with SQL, scheduler and network callback IO bounded."""
    def __init__(self, source, declarations, sdk_read):
        super().__init__(source, declarations, sdk_read)
        self.rows.update({row[:2]: row for row in TRACKING_CONTRACTS})
        self.rows.update({key: (*key, 9, locals_, 0, '') for key, locals_ in HELPERS.items()})
        self.native |= set(HELPERS)
        self.native |= {(o, s) for o, s in self.rows if o in {'Lim9;', 'Lyu;', 'Lwl9;', 'Lcc5;', 'Lg25;', 'Lca;', 'Lpo6;', 'Lbm5;', 'Lm30;', 'Lba8;', 'Lzu1;', 'Lvd1;', 'Lgs6;', 'Lwm4;', 'Ls62;', 'Lyx;', 'Lvs8;', 'Lhh;'}}
        self.scheduled, self.callbacks, self.deletes, self.player_events, self.logs = [], [], [], [], []
        self.now_ms = 1800000000000
        self.sql, self.retry, self.transactions, self.metric_resets, self.handoffs = [], [], [], [], []
        self.statics['Le88;->a:Le88;'] = self.new('Le88;')
        self.statics['Lxc1;->a:Lxc1;'] = self.new('Lxc1;')

    def invoke(self, target, args):
        owner, signature = target.split('->', 1)
        if (owner, signature) in self.native:
            return self.run(owner, signature, args)[0]
        if target == 'Lqe6;->n(Ljava/lang/Object;)V' or target == 'Lqo9;->m(Leq9;)V':
            assert not is_zero(args[0]); return None
        if target == 'Leo9;->T(Ljava/lang/Runnable;)V':
            self.scheduled.append(args[1]); return None
        if owner in {'Lfm9;', 'Lru9;'} and signature == 'c(Ljava/lang/String;ILjava/lang/Throwable;[BLjava/util/Map;)V':
            self.callbacks.append(tuple(args[1:])); return None
        if target == 'Ljava/io/IOException;-><init>(Ljava/lang/String;)V':
            args[0].value['message'] = args[1]; return None
        if target == 'Lbr3;->t(Ljava/lang/Object;)V':
            if isinstance(args[0], Reference) and args[0].descriptor == 'Lpo6;':
                raise VmThrown(args[0].value['Lpo6;->a:Ljava/lang/Throwable;'])
            return None
        if target == 'Lh23;->u(Ljava/lang/Throwable;)Ljava/lang/String;': return 'measurement disabled'
        if target == 'Lrj;->a(Ljd4;Ljava/lang/String;Ljava/lang/String;)V':
            self.logs.append(args[2]); return None
        if target == 'Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;':
            return 'null' if is_zero(args[0]) else str(args[0])
        if target == 'Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V':
            args[0].value = {'first': args[1], 'second': args[2]}; return None
        if target == 'Ljava/util/ArrayList;-><init>()V': args[0].value = []; return None
        if owner in {'Ljava/util/ArrayList;', 'Ljava/lang/Iterable;'} and signature == 'iterator()Ljava/util/Iterator;':
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if owner == 'Ljava/util/Iterator;':
            state = args[0].value
            if signature == 'hasNext()Z': return int(state['index'] < len(state['items']))
            if signature == 'next()Ljava/lang/Object;':
                item = state['items'][state['index']]; state['index'] += 1; return item
        if owner == 'Ljava/util/ArrayList;' and signature == 'add(Ljava/lang/Object;)Z':
            args[0].value.append(args[1]); return 1
        if target == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z': return int(args[0] == args[1])
        if target == 'Ljava/util/ArrayList;->isEmpty()Z': return int(not args[0].value)
        if target == 'Ljava/lang/System;->currentTimeMillis()J': return self.now_ms
        if target == 'Ljava/util/concurrent/TimeUnit;->toMillis(J)J': return args[1]*86400000
        if target in {'Ljava/lang/String;->valueOf(J)Ljava/lang/String;', 'Ljava/lang/String;->valueOf(I)Ljava/lang/String;'}: return str(args[0])
        if target == 'Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;':
            return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I':
            self.deletes.append((args[1], args[2], list(args[3].value))); return 0
        if target == 'Llr5;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V':
            args[0].value = {'a': args[1], 'b': args[2]}; return None
        if target == 'Lrh4;->R(Ljava/util/Map;)Ljava/util/Map;':
            return Reference(dict(args[0].value), 'Ljava/util/LinkedHashMap;')
        if target == 'Lrh4;->N([Llr5;)Ljava/util/Map;':
            return Reference({x.value['a']: x.value['b'] for x in args[0].value}, 'Ljava/util/LinkedHashMap;')
        if target == 'Lvd2;->d(Lse2;Ljava/util/Map;)V':
            self.player_events.append((args[1], args[2])); return None
        if target == 'Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V':
            self.logs.append(('previous-handler', args[1], args[2])); return None
        if target == 'Ljava/lang/Math;->max(JJ)J': return max(args[0], args[2])
        if owner == 'Ljava/lang/StringBuilder;':
            if signature.startswith('<init>('): args[0].value = args[1] if len(args) > 1 else ''; return None
            if signature.startswith('append('):
                args[0].value += chr(args[1]) if signature.startswith('append(C)') else str(args[1]); return args[0]
            if signature == 'toString()Ljava/lang/String;': return args[0].value
        if target == 'Ljava/util/HashMap;-><init>()V': args[0].value = {}; return None
        if target == 'Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z': return int(args[1] in args[0].value)
        if target == 'Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':
            old = args[0].value.get(args[1], 0); args[0].value[args[1]] = args[2]; return old
        if target == 'Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;': return args[0].value.get(args[1], 0)
        if target == 'Ljava/util/List;->add(Ljava/lang/Object;)Z': args[0].value.append(args[1]); return 1
        if target == 'Lgs6;->j(Lxp7;)Ljava/lang/Object;':
            closure = args[1]; self.transactions.append(closure)
            if closure.descriptor == 'Lba8;':
                assert closure.value['Lba8;->a:I'] == 0
                return self.false
            if closure.descriptor == 'Lxn4;': self.metric_resets.append(closure); return None
            return self.run(closure.descriptor, 'h()Ljava/lang/Object;', [closure])[0]
        if target == 'Lgs6;->b()Landroid/database/sqlite/SQLiteDatabase;': return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;':
            self.sql.append(args[1]); return self.new('Landroid/database/sqlite/SQLiteStatement;')
        if target in {'Landroid/database/sqlite/SQLiteStatement;->execute()V',
                      'Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V',
                      'Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V',
                      'Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V',
                      'Landroid/database/Cursor;->close()V'}: return None
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;':
            return self.new('Landroid/database/Cursor;')
        if target == 'Landroid/database/Cursor;->moveToNext()Z': return 0
        if target == 'Lsv0;->h()J': return 1000
        if target == 'Lgs6;->f(Les6;)Ljava/lang/Object;':
            assert args[1].descriptor == 'Lwm4;'; return None
        if target == 'Lfv0;->A(Lg60;IZ)V': self.retry.append(tuple(args[1:])); return None
        if target == 'Lxn4;-><init>(Ljava/lang/Object;I)V':
            args[0].value = {'owner': args[1], 'selector': args[2]}; return None
        if target == 'Lkc1;->A(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;':
            return re.sub(args[0], args[2], args[1])
        if target == 'Ltk7;->i1(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;':
            return Reference(args[0].split(args[1].value[0]), 'Ljava/util/ArrayList;')
        if target == 'Ljava/util/Collection;->size()I': return len(args[0].value)
        if target == 'Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;':
            return self.new('Ljava/util/regex/Pattern;')
        if target == 'Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;':
            return self.new('Ljava/util/regex/Matcher;')
        if target == 'Lzf0;->b(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lgi4;': return None
        if target == 'Lot4;->A(Ljava/lang/String;Ljz2;Lvy2;)V':
            self.handoffs.append(tuple(args[1:])); return None
        return super().invoke(target, args)


def verify_native_effects(source, declarations, sdk_read):
    f = TrackingFixture(source, declarations, sdk_read)
    # Filtering preserves order and identity, including unknown and null names.
    records = [f.new('Le50;', {'Le50;->a:Ljava/lang/String;': name}) for name in
               ['FIREBASE_CRASHLYTICS_REPORT', 'app-event', None, 'FCM_CLIENT_EVENT_LOGGING',
                'FIREBASE_APPQUALITY_SESSION', 'GDT_CLIENT_METRICS', 'app-event']]
    incoming = Reference(records, 'Ljava/util/ArrayList;')
    kept = f.run('Lo50;', 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;', [incoming])[0]
    assert kept.value == [records[1], records[2], records[6]] and incoming.value == records
    for rows in [[], [records[0]], records[:1]+records[3:6]]:
        assert not f.run('Lo50;', 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;',
                         [Reference(rows, 'Ljava/util/ArrayList;')])[0].value
    # Retained accepted/negative flags cannot win over the post-TCF handoff.
    option_map = Reference({'noStats_content': f.false, 'noStats_commercial': f.false, 'content': 'clip'}, 'Ljava/util/LinkedHashMap;')
    f.run('Lv70;', 'morpheNoStats(Ljava/util/Map;)V', [option_map])
    assert option_map.value == {'noStats_content': f.true, 'noStats_commercial': f.true, 'content': 'clip'}
    loader = f.new('Lix0;', {'Lix0;->b:Ljava/lang/Object;': 'https://cdn.example.com',
                             'Lix0;->d:Ljava/lang/Object;': f.new('Lp91;', {'Lp91;->a:Lot4;': f.new('Lot4;')})})
    player = f.new('Lv70;', {'Lv70;->h:Lix0;': loader})
    for accepted in [False, True]:
        options = Reference({'noStats_content': f.false, 'noStats_commercial': f.false,
                             'consent_string': 'accepted' if accepted else '', 'content': 'clip'}, 'Ljava/util/LinkedHashMap;')
        f.run('Lv70;', 'l(Ljava/lang/String;Ljava/util/Map;)V', [player, 'https://cdn.example.com', options], start=269,
              registers={'v0': player, 'v1': 'https://cdn.example.com', 'v5': options,
                         'v8': '', 'v9': '\n', 'v11': '/', 'v14': 2})
        assert options.value['noStats_content'] is f.true and options.value['noStats_commercial'] is f.true
        assert f.handoffs[-1][1].value['Ls62;->d:Ljava/util/LinkedHashMap;'] is options
    # SDK optionals return their real no-identity contracts without acquisition or cached lookup.
    for owner in ['Ly56;', 'Lyg3;']:
        client = f.new(owner)
        assert is_zero(f.run(owner, 'o()Ljava/lang/String;', [client])[0])
        assert f.run(owner, 'i()Z', [client])[0] == 1
    assert is_zero(f.run('Lyg3;', 'a()Lea;', [f.new('Lyg3;')])[0])
    for signature, args in [('a(Landroid/content/Context;)Lca;', [f.new('Landroid/content/Context;')]),
                            ('g()Lca;', [f.new('Lda;')])]:
        optional = f.run('Lda;', signature, args)[0]
        assert optional.value['Lca;->a:Ljava/lang/String;'] == '' and optional.value['Lca;->b:Z'] == 1
    for signature, args in [('P(Ljava/lang/String;)Landroid/util/Pair;', [f.new('Laz9;'), 'app']),
                            ('O(Lo5a;Lqq9;)Landroid/util/Pair;', [f.new('Laz9;'), f.new('Lo5a;'), f.new('Lqq9;')])]:
        pair = f.run('Laz9;', signature, args)[0]
        assert pair.value == {'first': '', 'second': f.false}
    assert f.run('Laz9;', 'Q(Lo5a;Lqq9;)Ljava/lang/String;', [f.new('Laz9;'), f.new('Lo5a;'), f.new('Lqq9;')])[0] == ''
    for signature, args in [('e(Landroid/webkit/WebView;Ljava/lang/String;Lq7;)Ljava/lang/Object;',
                             [f.new('Lvs8;'), f.new('Landroid/webkit/WebView;'), 'script', f.new('Lq7;')]),
                            ('m(Ljava/lang/String;Lta1;)Ljava/lang/Object;', [f.new('Lvs8;'), 'script', f.new('Lta1;')])]:
        failure = f.run('Lvs8;', signature, args)[0]
        assert failure.descriptor == 'Lpo6;' and failure.value['Lpo6;->a:Ljava/lang/Throwable;'].descriptor == 'Ljava/lang/IllegalStateException;'
    # The actual Pinch consumer maps Result.Failure to no session and releases its monitor.
    web = f.new('Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;', {
        'Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;->b:Ljava/lang/Object;': f.new('Ljava/lang/Object;'),
        'Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;->m:Lq7;': f.new('Lq7;'),
        'Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;->j:Lvs8;': f.new('Lvs8;')})
    assert f.run('Lhh;', 'c()Ljava/lang/Object;', [f.new('Lhh;')], start=117,
                 registers={'v0': web, 'v4': 0})[0] is f.statics['Le88;->a:Le88;']
    assert is_zero(web.value['Lnl/pinch/optoutadvertising/sdk/webview/OptOutBridgeWebView;->n:Lrj5;'])
    # Both merged HTTP workers queue exactly one real native failure callback.
    for kind in [0, 1]:
        scheduler = f.new('Leo9;')
        app = f.new('Lqo9;', {'Lqo9;->g:Leo9;': scheduler})
        network = f.new('Llm9;' if kind == 0 else 'Lyu9;', {'Lw69;->a:Ljava/lang/Object;': app})
        callback = f.new('Lfm9;' if kind == 0 else 'Lru9;')
        worker = f.new('Lim9;', {'Lim9;->a:I': kind, 'Lim9;->g:Lw69;': network,
                               'Lim9;->f:Ljava/lang/Object;': callback, 'Lim9;->d:Ljava/lang/String;': 'test-app'})
        before = len(f.scheduled)
        f.run('Lim9;', 'run()V', [worker])
        assert len(f.scheduled) == before+1
        queued = f.scheduled[-1]
        f.run(queued.descriptor, 'run()V', [queued])
        app_id, status, failure, body, headers = f.callbacks[-1]
        assert app_id == 'test-app' and status == 0 and failure.descriptor == 'Ljava/io/IOException;'
        assert is_zero(body) and is_zero(headers)
    # NMO new lookup emits no native UUID/storage calls, and sends fail inside the original catch.
    identity = f.new('Lcc5;')
    assert f.run('Lcc5;', 'a()Ljava/lang/String;', [identity])[0] == ''
    tracker = f.new('Lp08;', {'Lp08;->d:Lcc5;': identity})
    for state in [0, 1]:
        coroutine = f.new('Lg25;', {'Lg25;->f:I': state, 'Lg25;->g:Ljava/lang/Object;': tracker,
                                  'Lg25;->h:Ljava/lang/Object;': 'old-identifier'})
        value = f.statics['Le88;->a:Le88;']
        if state:
            failure = f.new('Ljava/lang/IllegalStateException;')
            value = f.new('Lpo6;', {'Lpo6;->a:Ljava/lang/Throwable;': failure})
        before = len(f.logs)
        assert f.run('Lg25;', 'A(Ljava/lang/Object;)Ljava/lang/Object;', [coroutine, value])[0] is f.statics['Le88;->a:Le88;']
        assert len(f.logs) == before+1 and 'Could not send NMO-Piano UUID' in f.logs[-1]
    # Original local queue expiry and cap cleanup remain; no connectivity/send dependency is invoked.
    store = f.new('Llk1;')
    dao = f.new('Lls8;', {'Lls8;->b:Ljava/lang/Object;': store})
    config = f.new('Lkp;', {'Lkp;->c:Ljava/lang/Object;': f.new('Lyl6;')})
    worker = f.new('Lsz6;', {'Lsz6;->a:Lkp;': config, 'Lsz6;->b:Lls8;': dao})
    f.run('Lsz6;', 'run()V', [worker])
    assert f.deletes == [('events', 'time < ?', [str(f.now_ms-7*86400000)]),
                         ('events', 'isSent = 0 AND _id <= (SELECT _id FROM events WHERE isSent = 0 ORDER by _id DESC LIMIT 1 OFFSET ?)', ['2000'])]
    # Independent sender fence reaches the original auxiliary event bus with the original copied map.
    bus = f.new('Lvd2;')
    holder = f.new('Lrr;', {'Lrr;->b:Ljava/lang/Object;': bus})
    stats = f.new('Lre0;', {'Lre0;->e:Lrr;': holder, 'Lre0;->y:Ljava/lang/String;': 'session'})
    payload = Reference({'ev': 'play', 'src': 'clip'}, 'Ljava/util/LinkedHashMap;')
    f.run('Lre0;', 'n(Ljava/util/Map;)V', [stats, payload], start=79, registers={'v1': 1, 'v4': 0})
    assert len(f.player_events) == 1
    event = f.player_events[0][1].value
    assert event['ident'] == 'session' and event['ev'] == 'play'
    assert event['aux'].value == payload.value and event['aux'] is not payload
    verify_cct_native_segments(f)
    # Crash collection leaves the prior uncaught-exception handler intact.
    prior = f.new('Ljava/lang/Thread$UncaughtExceptionHandler;')
    handler = f.new('Lhd1;', {'Lhd1;->a:Ljava/lang/Thread$UncaughtExceptionHandler;': prior})
    thread, failure = f.new('Ljava/lang/Thread;'), f.new('Ljava/lang/Throwable;')
    f.run('Lhd1;', 'uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V', [handler, thread, failure])
    assert f.logs[-1] == ('previous-handler', thread, failure)


def verify_cct_native_segments(f):
    signature = 'f(Lg60;I)V'
    code = canonical(f.source.body('Lo50;', signature)).code
    grouping = code.index('new-instance v8, Ljava/util/ArrayList;')
    completion = code.index('iget v0, v10, Lm30;->a:I')
    for extras in [0, Reference([1], '[B')]:
        for names in [['FIREBASE_CRASHLYTICS_REPORT', 'GDT_CLIENT_METRICS'],
                      ['FIREBASE_CRASHLYTICS_REPORT', 'app-event', None, 'app-event', 'GDT_CLIENT_METRICS']]:
            store = f.new('Lgs6;')
            uploader = f.new('Lo50;', {'Lo50;->c:Ljava/lang/Object;': store,
                                     'Lo50;->g:Ljava/lang/Object;': f.new('Lsv0;'),
                                     'Lo50;->d:Ljava/lang/Object;': f.new('Lfv0;')})
            context = f.new('Lg60;')
            records = [f.new('Le50;', {'Le50;->a:Ljava/lang/String;': n}) for n in names]
            pending = Reference([f.new('Lt50;', {'Lt50;->a:J': i+1, 'Lt50;->c:Le50;': row})
                                 for i, row in enumerate(records)], 'Ljava/util/ArrayList;')
            rows = Reference(records, 'Ljava/util/ArrayList;')
            frame = {'v0': 3, 'v1': uploader, 'v2': extras, 'v3': context, 'v4': 0,
                     'v5': 0, 'v6': store, 'v7': -1, 'v9': f.new('Lwp0;'), 'v12': pending, 'v14': rows}
            before_sql, before_retry, before_metrics = len(f.sql), len(f.retry), len(f.metric_resets)
            # Without extras, execute the actual original branch into the replaced anchor.
            result, retained = f.run('Lo50;', signature, [uploader, context, 2],
                                     start=62 if is_zero(extras) else 112,
                                     stop_at=(grouping,), registers=frame)
            mixed = any(name == 'app-event' for name in names)
            if not mixed:
                assert result is None
                assert f.sql[before_sql:] == ['DELETE FROM events WHERE _id in ('+','.join(str(i+1) for i in range(len(names)))+')']
                assert len(f.retry) == before_retry and len(f.metric_resets) == before_metrics
                continue
            assert result == grouping
            grouped = retained['v7'].value
            assert list(grouped) == ['app-event', 0] or list(grouped) == ['app-event', None]
            assert grouped['app-event'].value == [records[1], records[3]]
            assert grouped.get(None, grouped.get(0)).value == [records[2]]
            assert retained['v14'].value == [records[1], records[2], records[3]]
            # Model only backend IO/result; execute the original response/retry/deletion branches.
            for status in [1, 2]:
                response = f.new('Lm30;', {'Lm30;->a:I': status, 'Lm30;->b:J': 500})
                retained.update({'v10': response, 'v1': 2, 'v28': extras, 'v29': 0, 'v30': 0,
                                 'v6': store, 'v12': pending})
                before_sql, before_retry = len(f.sql), len(f.retry)
                f.run('Lo50;', signature, [uploader, context, 2], start=completion, registers=retained)
                sql = f.sql[before_sql:]
                if status == 1:
                    assert sql == ['DELETE FROM events WHERE _id in ('+','.join(str(i+1) for i in range(len(names)))+')']
                    assert len(f.retry) == before_retry
                else:
                    assert sql[0].startswith('UPDATE events SET num_attempts = num_attempts + 1 WHERE _id in ')
                    assert sql[1] == 'DELETE FROM events WHERE num_attempts >= 16'
                    assert f.retry[-1] == (context, 3, 1)


if __name__ == '__main__':
    import argparse
    from dex_declarations import DexDeclarations
    from verify_parool import sdk_classes

    parser = argparse.ArgumentParser()
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path, required=True)
    args = parser.parse_args()
    sdk_read, sdk_archive = sdk_classes()
    try:
        verify_tracking(args.root, DexDeclarations.from_apk(args.apk), sdk_read)
    finally:
        sdk_archive.close()
