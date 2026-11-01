"""Actual CCT metric append, outgoing batch and native storage outcome paths.

Input batch loading, wire encoding, metadata decoration and retry-time storage
are declared SDK boundaries. This executes no HTTP and claims no live upload.
"""
import re
from brabant_smali import canonical
from rtl_vm import Reference, execute
from tvgids_firebase_vm import FirebaseFixture
from tvgids_persisted_contracts import PERSISTED_CONTRACTS
from verify_dumpert import absolute_registers, audit_call

UPLOADER = 'La83;'
UPLOAD = 'm(Lny;I)V'
FILTER = 'morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'
TRANSPORTS = ('FCM_CLIENT_EVENT_LOGGING', 'GDT_CLIENT_METRICS')


class PersistedFixture(FirebaseFixture):
    def __init__(self, *args):
        super().__init__(*args)
        self.rows.update({r[:2]: r for r in PERSISTED_CONTRACTS})
        self.native.update(r[:2] for r in PERSISTED_CONTRACTS if r[0] != UPLOADER and r[1] != 'apply(Ljava/lang/Object;)Ljava/lang/Object;')
        self.native.update({('Lda;', '<init>(ILjava/lang/Object;Ljava/lang/Object;)V'), ('Lda;', 'execute()Ljava/lang/Object;')})
        if FILTER in self.declarations.classes[UPLOADER].methods:
            method = self.declarations.classes[UPLOADER].methods[FILTER]
            body = self.source.body(UPLOADER, FILTER); local = int(re.search(r'\.locals (\d+)', body)[1])
            assert method.access_flags == 9 and local == 5, 'Persisted measurement filter ABI changed'
            self.rows[UPLOADER, FILTER] = (UPLOADER, FILTER, 9, 6, 0, '')
            self.native.add((UPLOADER, FILTER))
        self.memory.statics['Lsl4;->a:Lfm4;'] = self.new('Lfm4;')
        self.sql = []; self.storage_calls = []

    def segment(self, start, stops, registers, uploader, context):
        body = self.source.body(UPLOADER, UPLOAD)
        local = int(re.search(r'\.locals (\d+)', body)[1])
        p = canonical(body).program
        p.instructions = [absolute_registers(line, local) for line in p.instructions]
        registers.update({'v'+str(local): uploader, 'v'+str(local+1): context, 'v'+str(local+2): 2})
        reached = execute(p, registers, self.invoke, start=start, stop_at=stops, memory=self.memory,
            trace=lambda line: audit_call(line, UPLOADER, self.declarations, self.sdk))
        return reached

    def invoke(self, target, args):
        owner, sig = target.split('->', 1)
        if sig == 'iterator()Ljava/util/Iterator;' and owner in ('Ljava/util/ArrayList;', 'Ljava/lang/Iterable;'):
            return Reference({'items': list(args[0].value), 'index': 0}, 'Ljava/util/Iterator;')
        if target == 'Ljava/util/Iterator;->hasNext()Z': return int(args[0].value['index'] < len(args[0].value['items']))
        if target == 'Ljava/util/Iterator;->next()Ljava/lang/Object;':
            iterator = args[0].value; item = iterator['items'][iterator['index']]; iterator['index'] += 1; return item
        if target == 'Ljava/util/ArrayList;->isEmpty()Z': return int(not args[0].value)
        if target == 'Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;': args[0].value.append(chr(args[1])); return args[0]
        if target == 'Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;': return Reference(args[0], 'Ljava/lang/Long;')
        if target == 'Ljava/lang/Long;->longValue()J': return args[0].value
        if target == 'Loh0;->t()J': return 42
        if target == 'Ljava/io/ByteArrayOutputStream;-><init>()V': return None
        if target == 'Lfm4;->v(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V': return None
        if target == 'Ljava/io/ByteArrayOutputStream;->toByteArray()[B': return Reference(b'fixture-client-metrics', '[B')
        if target == 'Lvc0;->a(Lux;)Lux;': return args[1]
        if target == 'Lro5;->execute()Ljava/lang/Object;':
            task = args[0]
            if task.descriptor == 'Lo76;': return self.new('Lgh0;')
            assert (task.descriptor, sig) in self.native, 'Unknown storage callback'
            return self.run(task.descriptor, sig, args)
        if target == 'Lo76;-><init>(Lyy4;I)V': args[0].value['fixture-store'] = args[1]; return None
        if target == 'Lyy4;->b()Landroid/database/sqlite/SQLiteDatabase;': return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target == 'Lyy4;->d(Lwy4;)Ljava/lang/Object;': self.storage_calls.append(('retry-time', args[1])); return None
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;': return Reference(args[1], 'Landroid/database/sqlite/SQLiteStatement;')
        if target == 'Landroid/database/sqlite/SQLiteStatement;->execute()V': self.sql.append(args[0].value); return None
        if target in ('Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V', 'Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V', 'Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V'): return None
        if target == 'Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;': return self.new('Landroid/database/Cursor;')
        if target == 'Landroid/database/Cursor;->moveToNext()Z': return 0
        if target == 'Landroid/database/Cursor;->close()V': return None
        if target == 'Lyn8;->Q(Lny;IZ)V': self.storage_calls.append(('retry', args[1], args[2], args[3])); return None
        if target == 'Ljava/lang/Math;->max(JJ)J': return max(args[0], args[2])
        return super().invoke(target, args)


def verify_persisted(f, disabled):
    code = canonical(f.source.body(UPLOADER, UPLOAD)).code
    backend = code.index('check-cast v0, Lvc0;')
    dispatch = next(i for i, line in enumerate(code) if line == 'iget v0, v8, Lpx;->a:I')
    loop = code.index('new-instance v0, Lq76;')
    clock = f.new('Loh0;')
    database = f.new('Lyy4;', {'Lyy4;->b:Loh0;': clock, 'Lyy4;->c:Loh0;': clock})
    uploader = f.new(UPLOADER, {UPLOADER+'->'+field+':Ljava/lang/Object;': value for field, value in
        [('c', database), ('f', database), ('i', database), ('g', clock), ('h', clock), ('d', f.new('Lyn8;'))]})
    sdk_backend = f.new('Lvc0;')
    measurement = [f.new('Lux;', {'Lux;->a:Ljava/lang/String;': name}) for name in TRANSPORTS]
    keep = [f.new('Lux;', {'Lux;->a:Ljava/lang/String;': name}) for name in ('FUNCTIONAL', 0, 'UNKNOWN_NEW_NAME', 'fcm_client_event_logging', 'FIREBASE_CRASHLYTICS_REPORT')]
    failures = []
    for metrics in (False, True):
        for items in (measurement, keep, measurement[:1]+keep+measurement[1:]):
            stored = Reference([f.new('Lfy;', {'Lfy;->a:J': i+11, 'Lfy;->c:Lux;': event}) for i, event in enumerate(items)], 'Ljava/util/ArrayList;')
            extras = Reference(b'original-extras', '[B') if metrics else 0
            context = f.new('Lny;', {'Lny;->a:Ljava/lang/String;': 'cct', 'Lny;->b:[B': extras})
            before = len(f.sql); f.storage_calls.clear()
            frame = {'v1': uploader, 'v2': extras, 'v3': context, 'v4': 45, 'v5': 0, 'v6': database,
                'v9': sdk_backend, 'v10': 0, 'v11': 1, 'v12': stored}
            reached = f.segment(47, (backend, dispatch), frame, uploader, context)
            expected = [event for event in items if not disabled or event not in measurement]
            if metrics and not disabled:
                metric = frame['v8'].value[-1]
                assert metric.value['Lux;->a:Ljava/lang/String;'] == 'GDT_CLIENT_METRICS'
                expected.append(metric)
            if expected:
                if reached != backend or frame['v8'].value != expected or not all(a is b for a, b in zip(frame['v8'].value, expected)):
                    failures.append('outgoing batch; metrics='+str(metrics))
                assert len(f.sql) == before, 'Retained batch deleted before a real transport result'
                assert frame['v2'] is extras and frame['v3'] is context and frame['v9'] is sdk_backend
            else:
                if reached != dispatch:
                    failures.append('all-measurement batch admitted; metrics='+str(metrics)); continue
                outcome = frame['v8'].value
                assert outcome['Lpx;->a:I'] == 3 and outcome['Lpx;->b:J'] == -1, 'Privacy discard fabricated send success'
                assert len(f.sql) == before
                assert f.segment(dispatch, (loop,), frame, uploader, context) == loop
                assert f.sql[before:] == ['DELETE FROM events WHERE _id in ('+','.join(str(i+11) for i in range(len(items)))+')']
                assert not f.storage_calls and frame['v4'] == 45 and frame['v2'] is extras
            assert [row.value['Lfy;->c:Lux;'] for row in stored.value] == items
    # The empty loaded batch returns before metrics are generated.
    before = len(f.sql); f.storage_calls.clear()
    frame = {'v12': Reference([], 'Ljava/util/ArrayList;')}
    assert f.segment(29, (), frame, uploader, context) is None
    assert len(f.sql) == before and not f.storage_calls
    if (UPLOADER, FILTER) in f.rows:
        assert f.run(UPLOADER, FILTER, (Reference([], 'Ljava/util/ArrayList;'),)).value == []
    # Real outcomes remain original: a transient failure retains records and
    # backs off, success deletes with the real server wait, fatal discards.
    # These are scoped native continuations, not fabricated HTTP responses.
    for status in (1, 2, 3):
        for metrics in (False, True):
            before = len(f.sql); f.storage_calls.clear()
            frame = {'v8': f.new('Lpx;', {'Lpx;->a:I': status, 'Lpx;->b:J': 90}), 'v1': 2,
                'v12': stored, 'v6': database, 'v31': extras if metrics else 0, 'v32': 45, 'v33': 0}
            reached = f.segment(dispatch, (loop,), frame, uploader, context)
            if status == 2:
                assert reached is None and f.storage_calls[-1] == ('retry', context, 3, 1)
                assert any('num_attempts = num_attempts + 1' in q for q in f.sql[before:])
                assert not any(q.startswith('DELETE FROM events WHERE _id in') for q in f.sql[before:])
            else:
                assert reached == loop and frame['v4'] == (90 if status == 1 else 45)
                assert f.sql[before] == 'DELETE FROM events WHERE _id in ('+','.join(str(i+11) for i in range(len(stored.value)))+')'
                assert not f.storage_calls
                assert any('last_metrics_upload_ms' in q for q in f.sql[before:]) == bool(status == 1 and metrics)
    assert not failures, 'TVgids persisted measurement remains: '+'; '.join(failures)
    print('PASS persisted CCT', 'disabled' if disabled else 'original')
