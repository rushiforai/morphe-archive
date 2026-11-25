"""Actual Marktplaats CCT metric append, privacy discard and outcome dispatch."""
import re
from brabant_smali import canonical
from marktplaats_firebase_vm import FirebaseFixture
from rtl_vm import Reference

UPLOADER='Lnw0;'
UPLOAD='b(Ldy0;I)V'
FILTER='morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'
STATUS='Lcom/google/android/datatransport/runtime/backends/BackendResponse$Status;'
TRANSPORTS=('FIREBASE_CRASHLYTICS_REPORT','FIREBASE_APPQUALITY_SESSION','FCM_CLIENT_EVENT_LOGGING','GDT_CLIENT_METRICS',
            'FIREPERF','FIREPERF_AUTOPUSH','FIREPERF_INTERNAL_LOW','FIREPERF_INTERNAL_HIGH')


class PersistedFixture(FirebaseFixture):
    def __init__(self,*args):
        super().__init__(*args)
        owners={'Lvv0;','Lqt0;','Lr40;','Lv4h;','Luxc;','Lwe4;','Lhse;','Le65;','Lz45;','Lddd;'}
        self.native.update(key for key in self.rows if key[0] in owners and key[1].split('(')[0] in {'<init>','d','f'})
        self.native.add(('Lhdd;','s(Ljava/lang/Iterable;)Ljava/lang/String;'))
        if FILTER in self.declarations.classes[UPLOADER].methods:
            method=self.declarations.classes[UPLOADER].methods[FILTER]
            body=self.source.body(UPLOADER,FILTER);local=int(re.search(r'\.locals (\d+)',body)[1])
            assert method.access_flags==9 and local==5,'Marktplaats persisted filter ABI changed'
            self.rows[UPLOADER,FILTER]=(UPLOADER,FILTER,9,local,0,'');self.native.add((UPLOADER,FILTER))
        for status in ('OK','FATAL_ERROR','TRANSIENT_ERROR','INVALID_PAYLOAD'):
            self.statics[STATUS+'->'+status+':'+STATUS]=self.new(STATUS)
        self.statics['Lqac;->a:Lo1k;']=self.new('Lo1k;');self.sql=[]

    def invoke(self,target,args):
        if target=='Lhdd;->p(Lvuf;)Ljava/lang/Object;':
            task=args[1]
            if task.descriptor=='Lv4h;':return self.new('Lqy2;') # SDK storage aggregate, before native metric construction.
            assert (task.descriptor,'d()Ljava/lang/Object;') in self.native
            return self.run(task.descriptor,'d()Ljava/lang/Object;',(task,))[0]
        if target=='Lhdd;->f(Lfdd;)Ljava/lang/Object;':
            # Backoff storage boundary; native retry SQL and scheduling execute
            # on either side. Do not turn the operation into a send success.
            self.events.append(('db-transaction',args[1]));return None
        if target=='Lkz2;->b()J':return 42
        if target=='Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;':return Reference(args[0],'Ljava/lang/Long;')
        if target=='Ljava/lang/Long;->longValue()J':return args[0].value
        if target=='Ljava/io/ByteArrayOutputStream;-><init>()V':return None
        if target=='Lo1k;->b(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V':return None # Vendor wire encoder.
        if target=='Ljava/io/ByteArrayOutputStream;->toByteArray()[B':return Reference(b'fixture-metrics','[B')
        if target=='Lqn2;->a(Lvv0;)Lvv0;':return args[1] # Vendor device-metadata decorator; transport name is retained.
        if target=='Ljava/lang/String;->isEmpty()Z':return int(not args[0])
        if target=='Ljava/util/ArrayList;->isEmpty()Z':return int(not args[0].value)
        if target=='Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;':args[0].value['parts'].append(str(args[1]));return args[0]
        if target=='Lhdd;->a()Landroid/database/sqlite/SQLiteDatabase;':return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target=='Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;':return Reference(args[1],'Landroid/database/sqlite/SQLiteStatement;')
        if target=='Landroid/database/sqlite/SQLiteStatement;->execute()V':self.sql.append(args[0].value);return None
        if target in {'Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V','Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V','Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V'}:return None
        if target=='Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;':return self.new('Landroid/database/Cursor;')
        if target=='Landroid/database/Cursor;->moveToNext()Z':return 0
        if target=='Landroid/database/Cursor;->close()V':return None
        if target=='Lwt8;->J(Ldy0;IZ)V':self.events.append(('retry',args[1],args[2],args[3]));return None
        if target=='Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;':
            assert isinstance(args[0],Reference);return args[0]
        if target=='Ljava/lang/Math;->max(JJ)J':return max(args[0],args[2])
        return super().invoke(target,args)


def verify_persisted(f,disabled):
    code=canonical(f.source.body(UPLOADER,UPLOAD)).code
    backend=code.index('check-cast v8, Lqn2;')
    loop=code.index('new-instance v0, Lw4h;')
    dispatch=next(i for i,l in enumerate(code[:-1]) if l=='sget-object v1, '+STATUS+'->TRANSIENT_ERROR:'+STATUS
                  and code[i+1]=='iget-object v2, v0, Lqt0;->a:'+STATUS)
    keep=[f.new('Lvv0;',{'Lvv0;->a:Ljava/lang/String;':name}) for name in ('FUNCTIONAL',0,'UNKNOWN_NEW_NAME','firebase_crashlytics_report')]
    measurements=[f.new('Lvv0;',{'Lvv0;->a:Ljava/lang/String;':name}) for name in TRANSPORTS]
    failures=[]
    clock=f.new('Lkz2;');database=f.new('Lhdd;',{'Lhdd;->b:Lkz2;':clock});backend_sdk=f.new('Lqn2;')
    uploader=f.new(UPLOADER,{UPLOADER+'->d:Ljava/lang/Object;':database,UPLOADER+'->g:Ljava/lang/Object;':database,
        UPLOADER+'->j:Ljava/lang/Object;':database,UPLOADER+'->h:Ljava/lang/Object;':clock,
        UPLOADER+'->i:Ljava/lang/Object;':clock,UPLOADER+'->e:Ljava/lang/Object;':f.new('Lwt8;')})
    for metrics in (False,True):
        for items in (measurements,keep,measurements[:2]+keep+measurements[2:]):
            stored=Reference([f.new('Lww0;',{'Lww0;->a:J':i+11,'Lww0;->c:Lvv0;':event}) for i,event in enumerate(items)],'Ljava/util/ArrayList;')
            extras=Reference(b'original-extras','[B') if metrics else 0
            context=f.new('Ldy0;',{'Ldy0;->a:Ljava/lang/String;':'cct','Ldy0;->b:[B':extras})
            before=len(f.sql);f.events.clear()
            registers={'v1':uploader,'v2':extras,'v3':context,'v4':45,'v5':0,'v6':database,'v9':backend_sdk,
                       'v10':0,'v11':1,'v12':stored,'v13':-1,'v14':-1}
            reached,frame=f.run(UPLOADER,UPLOAD,(uploader,context,2),start=48,stop_at=(backend,dispatch),registers=registers)
            expected=[event for event in items if not disabled or event not in measurements]
            if metrics and not disabled:expected.append(frame['v0'].value[-1])
            if expected:
                if reached!=backend or frame['v0'].value!=expected or not all(a is b for a,b in zip(frame['v0'].value,expected)):
                    failures.append('outgoing measurement batch, metrics='+str(metrics))
                assert len(f.sql)==before,'Retained batch deleted before genuine transport result'
                assert frame['v2'] is extras and frame['v9'] is backend_sdk and frame['v3'] is context
            else:
                if reached!=dispatch:failures.append('all-measurement batch reached backend, metrics='+str(metrics));continue
                assert len(f.sql)==before,'Privacy discard deleted rows before native outcome dispatch'
                outcome=frame['v0'].value
                assert outcome['Lqt0;->a:'+STATUS] is f.statics[STATUS+'->FATAL_ERROR:'+STATUS] and outcome['Lqt0;->b:J']==-1,'Privacy discard fabricated send success'
                reached,frame=f.run(UPLOADER,UPLOAD,(uploader,context,2),start=dispatch,stop_at=(loop,),registers=frame)
                assert reached==loop
                assert f.sql[-1]=='DELETE FROM events WHERE _id in ('+','.join(str(i+11) for i in range(len(items)))+')'
                assert frame['v2'] is extras and frame['v3'] is context and frame['v4']==45
                assert not any(e[0]=='retry' for e in f.events),'Privacy discard started a retry loop'
            assert [row.value['Lww0;->c:Lvv0;'] for row in stored.value]==items,'Persisted event identity changed'
    if disabled and (UPLOADER,FILTER) in f.rows:
        empty=Reference([],'Ljava/util/ArrayList;')
        assert f.run(UPLOADER,FILTER,(empty,))[0].value==[]
    # A genuinely empty loaded batch returns before generating client metrics.
    before=len(f.sql);f.events.clear()
    assert f.run(UPLOADER,UPLOAD,(uploader,context,2),start=31,registers={'v12':Reference([],'Ljava/util/ArrayList;')})[0] is None
    assert len(f.sql)==before and not f.events
    # Actual native result dispatch retains success deletion/wait and genuine
    # transient retry, using the original persisted objects and transport context.
    for status in ('TRANSIENT_ERROR','OK'):
        outcome=f.new('Lqt0;',{'Lqt0;->a:'+STATUS:f.statics[STATUS+'->'+status+':'+STATUS],'Lqt0;->b:J':90})
        for metrics in (False,True):
            before=len(f.sql);f.events.clear()
            registers={'v0':outcome,'v12':stored,'v6':database,'v30':extras if metrics else 0,'v31':45,'v32':0}
            reached,frame=f.run(UPLOADER,UPLOAD,(uploader,context,2),start=dispatch,stop_at=(loop,),registers=registers)
            if status=='TRANSIENT_ERROR':
                assert reached is None and f.events[-1]==('retry',context,3,1)
                assert not any(q.startswith('DELETE FROM events WHERE _id in') for q in f.sql[before:]),'Transient failure deleted retained rows'
                assert any('num_attempts' in q for q in f.sql[before:]),'Native retry accounting was skipped'
            else:
                assert reached==loop and frame['v4']==90,('Native successful-send wait changed',metrics,reached,loop,frame.get('v4'))
                assert f.sql[before]=='DELETE FROM events WHERE _id in ('+','.join(str(i+11) for i in range(len(stored.value)))+')'
                assert not any(e[0]=='retry' for e in f.events),'Real successful send retried'
    assert not failures,'Marktplaats persisted telemetry remains: '+'; '.join(failures)
