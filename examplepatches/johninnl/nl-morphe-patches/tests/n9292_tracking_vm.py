"""9292 optional-measurement fixtures with explicit SDK/storage boundaries."""
from rtl_vm import Reference,VmThrown,is_zero
from n9292_vm import Fixture
from brabant_smali import canonical

ANALYTICS='Llq;'
IDENTITY='Lyz;'
MEASUREMENT='Lb4h;'
CONFIGURATION='Ljie;'
ARBITER='Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;'
SPI='Lcom/google/firebase/crashlytics/internal/settings/DefaultSettingsSpiCall;'
SETTINGS='invoke(Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;Z)Lorg/json/JSONObject;'
SUBSCRIBER='Lcom/google/firebase/crashlytics/internal/common/CrashlyticsAppQualitySessionsSubscriber;'
A='{http://schemas.android.com/apk/res/android}'
TRANSPORTS=('FIREBASE_CRASHLYTICS_REPORT','FIREBASE_APPQUALITY_SESSION','FCM_CLIENT_EVENT_LOGGING','GDT_CLIENT_METRICS')
UPLOADER='Lyx0;'
UPLOAD='v(Loy0;I)V'
FILTER='morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'


class TrackingFixture(Fixture):
    def __init__(self,source,declarations,sdk,manifest):
        super().__init__(source,declarations,sdk)
        self.metadata={n.get(A+'name'):n.get(A+'value')=='true' for n in manifest.find('application')
                       if n.tag=='meta-data' and n.get(A+'value') in {'true','false'}}
        self.native.update({(ANALYTICS,'f(Ljava/lang/String;Landroid/os/Bundle;)V'),
            (ANALYTICS,'j(Llq;Ljava/lang/String;Ljava/io/Serializable;I)V'),
            (IDENTITY,'<init>(Lqg9;Lru2;Llq;)V'),(IDENTITY,'a()Ljava/lang/String;'),
            (CONFIGURATION,'J3()Z'),(MEASUREMENT,'b()I'),('Lha7;','a()Ljava/lang/Boolean;')})
        self.statics['Lqg9;->z:[Ljl6;']=Reference([self.new('Ljl6;') for _ in range(2)],'[Ljl6;')
        self.uuid_counter=0;self.measurement_preferences={}
        self.native.update({(ARBITER,'isAutomaticDataCollectionEnabled()Z'),
            (ARBITER,'setCrashlyticsDataCollectionEnabled(Ljava/lang/Boolean;)V'),
            (SUBSCRIBER,'isDataCollectionEnabled()Z'),(SPI,SETTINGS)})
        self.statics['Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;']=Reference(False,'Ljava/lang/Boolean;')
        self.statics['Lc9d;->a:Lc9d;']=self.new('Lc9d;')
        self.settings_response=0;self.blocking_worker=True
        self.native.add(('Lbd1;','a(JLjava/lang/String;)V'))
        self.statics['Lrh7;->a:[I']=Reference([1,2],'[I')
        self.statics['Lksb;->SESSION_TIMESTAMP:Lksb;']=self.new('Lksb;')
        self.native.update({('Lix0;','<init>(Ll21;J)V'),('Lmq;','b()Ljava/lang/Object;'),
            ('Lmq;','<init>(ILjava/lang/Object;Ljava/lang/Object;)V'),('Lofa;','N(Ljava/lang/Iterable;)Ljava/lang/String;')})
        if FILTER in declarations.classes[UPLOADER].methods:
            method=declarations.classes[UPLOADER].methods[FILTER]
            assert method.access_flags==9 and '.locals 5' in source.body(UPLOADER,FILTER)
            self.rows[UPLOADER,FILTER]=(UPLOADER,FILTER,9,5,0,'')
            self.native.add((UPLOADER,FILTER))
        for status in ('OK','FATAL_ERROR','TRANSIENT_ERROR','INVALID_PAYLOAD'):
            self.statics['Ll21;->'+status+':Ll21;']=self.new('Ll21;')
        self.statics['Lpo9;->a:Le6g;']=self.new('Le6g;')
        self.sql=[]

    def arbiter(self,enabled=True,resolved=True):
        task=self.new('Ld5c;',{'fixture-complete':resolved})
        return self.new(ARBITER,{ARBITER+'->crashlyticsDataCollectionEnabled:Ljava/lang/Boolean;':Reference(enabled,'Ljava/lang/Boolean;'),
            ARBITER+'->taskLock:Ljava/lang/Object;':self.new('Ljava/lang/Object;'),
            ARBITER+'->sharedPreferences:Landroid/content/SharedPreferences;':Reference({},'Landroid/content/SharedPreferences;'),
            ARBITER+'->taskResolved:Z':int(resolved),ARBITER+'->dataCollectionEnabledTask:Ld5c;':task})

    def tracker(self):
        bridge=self.new('Lb2g;')
        analytics=self.new('Lcom/google/firebase/analytics/FirebaseAnalytics;',
                           {'Lcom/google/firebase/analytics/FirebaseAnalytics;->a:Lb2g;':bridge})
        return self.new(ANALYTICS,{ANALYTICS+'->b:Lcom/google/firebase/analytics/FirebaseAnalytics;':analytics,
            ANALYTICS+'->c:Lcom/google/firebase/crashlytics/FirebaseCrashlytics;':self.new('Lcom/google/firebase/crashlytics/FirebaseCrashlytics;')})

    def identity(self,existing=None):
        delegate=self.new('Le6;',{'fixture-value':0 if existing is None else existing})
        preferences=self.new('Lqg9;',{'Lqg9;->j:Le6;':delegate})
        value=self.new(IDENTITY)
        self.run(IDENTITY,'<init>(Lqg9;Lru2;Llq;)V',(value,preferences,self.new('Lru2;'),self.tracker()))
        return value,delegate

    def measurement_core(self,stored=None):
        self.measurement_preferences={} if stored is None else {'measurement_enabled':stored}
        core=self.new(MEASUREMENT,{MEASUREMENT+'->g:Ln2h;':self.new('Ln2h;'),
            MEASUREMENT+'->e:Lzrg;':self.new('Lzrg;'),MEASUREMENT+'->z:Z':1})
        configuration=self.new(CONFIGURATION,{'Lj1;->a:Ljava/lang/Object;':core})
        core.value[MEASUREMENT+'->d:Ljie;']=configuration
        return core,configuration

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if (owner,sig) in self.native:return self.run(owner,sig,args)[0]
        if owner in {'Ljlf;','Lsmf;'} and sig.startswith('<init>('):
            self.defaults(args[0]);args[0].value['fixture-arguments']=tuple(args[1:]);return None
        if target=='Lb2g;->c(Lfyf;)V':self.events.append(('analytics-enqueue',args[1]));return None
        if target in {'Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setUserId(Ljava/lang/String;)V',
                      'Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCustomKey(Ljava/lang/String;Ljava/lang/String;)V'}:
            self.events.append(('crash-identity-or-property',sig,tuple(args[1:])));return None
        if target=='Ljava/lang/Object;->toString()Ljava/lang/String;':
            assert isinstance(args[0],str);return args[0]
        if target=='Lb6;->o(Lav5;Ljl6;)Ljava/lang/Object;':return args[0].value.get('fixture-value',0)
        if target=='Lb6;->z(Lav5;Ljl6;Ljava/lang/Object;)V':
            args[0].value['fixture-value']=args[3];self.events.append(('preference-write',args[0],args[3]));return None
        if target=='Ljava/util/UUID;->randomUUID()Ljava/util/UUID;':
            self.uuid_counter+=1;return Reference(f'fixture-functional-uuid-{self.uuid_counter}','Ljava/util/UUID;')
        if target=='Ljava/util/UUID;->toString()Ljava/lang/String;':return args[0].value
        if target=='Ljie;->I3(Ljava/lang/String;)Ljava/lang/Boolean;':
            return Reference(self.metadata[args[1]],'Ljava/lang/Boolean;') if args[1] in self.metadata else 0
        if target in {'Lb4h;->h(Lxah;)V','Lb4h;->f(Lj1;)V'}:
            assert not is_zero(args[0]);return None
        if target in {'Ln2h;->j()V','Lj1;->j()V'}:return None  # fixture runs on the SDK worker context
        if target=='Lzrg;->A3()Landroid/content/SharedPreferences;':return Reference(self.measurement_preferences,'Landroid/content/SharedPreferences;')
        if target=='Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z':return int(args[1] in args[0].value)
        if target=='Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z':return int(args[0].value.get(args[1],bool(args[2])))
        if target=='Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z':return int(args[1] in args[0].value)
        if target=='Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z':return int(args[0].value.get(args[1],False))
        if target==ARBITER+'->logDataCollectionState(Z)V':return None
        if target==ARBITER+'->getDataCollectionValueFromManifest(Landroid/content/Context;)Ljava/lang/Boolean;':
            return Reference(self.metadata.get('firebase_crashlytics_collection_enabled',True),'Ljava/lang/Boolean;')
        if target==ARBITER+'->storeDataCollectionValueInSharedPreferences(Landroid/content/SharedPreferences;Ljava/lang/Boolean;)V':
            args[0].value['collection']=args[1];return None
        if target=='Ld5c;-><init>()V':self.defaults(args[0]);args[0].value['fixture-complete']=False;return None
        if target=='Ld5c;->d(Ljava/lang/Object;)V':args[0].value['fixture-complete']=True;return None
        if target=='Lyr4;->a()V':return None
        if target=='Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsWorkers;->checkBlockingThread()V':
            if not self.blocking_worker:raise VmThrown(Reference({},'Ljava/lang/IllegalStateException;'))
            return None
        if target=='Latd/bc/a;->c(Ljava/lang/String;)V':raise VmThrown(Reference({},'Ljava/lang/RuntimeException;'))
        if target==SPI+'->getQueryParamsFor(Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;)Ljava/util/Map;':return Reference({},'Ljava/util/Map;')
        if target==SPI+'->createHttpGetRequest(Ljava/util/Map;)Lcom/google/firebase/crashlytics/internal/network/HttpGetRequest;':
            return self.new('Lcom/google/firebase/crashlytics/internal/network/HttpGetRequest;')
        if target==SPI+'->applyHeadersTo(Lcom/google/firebase/crashlytics/internal/network/HttpGetRequest;Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;)Lcom/google/firebase/crashlytics/internal/network/HttpGetRequest;':return args[1]
        if target=='Lcom/google/firebase/crashlytics/internal/network/HttpGetRequest;->execute()Lcom/google/firebase/crashlytics/internal/network/HttpResponse;':
            self.events.append(('settings-http',))
            if isinstance(self.settings_response,VmThrown):raise self.settings_response
            return self.new('Lcom/google/firebase/crashlytics/internal/network/HttpResponse;')
        if target==SPI+'->handleResponse(Lcom/google/firebase/crashlytics/internal/network/HttpResponse;)Lorg/json/JSONObject;':return self.settings_response
        if owner=='Lcom/google/firebase/crashlytics/internal/Logger;' and sig.startswith(('d(','v(','e(')):return None
        if owner=='Ljava/lang/StringBuilder;':
            if sig.startswith('<init>('):args[0].value={'fixture-string':'' if len(args)==1 else str(args[1])};return None
            if sig.startswith('append('):args[0].value['fixture-string']+=chr(args[1]) if sig.startswith('append(C)') else str(args[1]);return args[0]
            if sig=='toString()Ljava/lang/String;':return args[0].value['fixture-string']
        if target in {'Ljava/util/ArrayList;-><init>()V','Ljava/util/HashMap;-><init>()V'}:
            args[0].value=[] if 'ArrayList' in target else {};return None
        if sig=='iterator()Ljava/util/Iterator;':return Reference(iter(args[0].value),'Ljava/util/Iterator;')
        if target=='Ljava/util/Iterator;->hasNext()Z':
            if not isinstance(args[0].value,dict):args[0].value={'iterator':args[0].value}
            if 'next' not in args[0].value:
                try:args[0].value['next']=next(args[0].value['iterator'])
                except StopIteration:return 0
            return 1
        if target=='Ljava/util/Iterator;->next()Ljava/lang/Object;':return args[0].value.pop('next')
        if sig=='isEmpty()Z':return int(not args[0].value)
        if target=='Ljava/util/Map;->values()Ljava/util/Collection;':return Reference(list(args[0].value.values()),'Ljava/util/ArrayList;')
        if target=='Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':args[0].value.append(args[1]);return 1
        if target=='Ljava/lang/Integer;-><init>(I)V':args[0].value=args[1];return None
        if target=='Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I':return 0
        if target=='Ly8a;->a(Ljava/lang/Object;)Ljava/lang/Throwable;':
            return args[0].value.get('Lt8a;->a:Ljava/lang/Throwable;',0) if isinstance(args[0],Reference) and args[0].descriptor=='Lt8a;' else 0
        if owner in {'Lad1;','Lc0;','Lxzb;','Lrg;','Lyh3;','Lvh3;'} and sig.startswith('<init>('):
            self.defaults(args[0]);return None
        if target=='Lyy3;->b(Lw55;)Lbdh;':self.events.append(('cmp-session-http',args[1]));return self.new('Lbdh;')
        if owner=='Lbdh;' and sig in {'A(Ll55;)V','y(Ll55;)V'}:return None
        if target=='Lksb;->a()Ljava/lang/String;':return 'fixture-session-timestamp'
        if target=='Ljava/lang/String;->valueOf(J)Ljava/lang/String;':return str(args[0])
        if target=='Li8b;->e(Ljava/lang/String;Ljava/lang/String;)V':self.events.append(('cmp-timestamp',args[1],args[2]));return None
        if target=='Lcg;->s(Ljava/lang/String;Lez2;)Ljava/lang/Object;':
            # Bound the unchanged original at its first asynchronous queue read;
            # selected code must return native Unit before reaching this boundary.
            boundary=next(i for i,line in enumerate(canonical(self.source.body(owner,sig)).code) if 'Lbof;->l(ILez2;)' in line)
            result=self.run(owner,sig,args,stop_at=(boundary,))[0]
            if result==boundary:
                self.events.append(('adyen-analytics-queue-read',args[1]));return self.statics['Lc9d;->a:Lc9d;']
            return result
        if target=='Lofa;->J(Lyyb;)Ljava/lang/Object;':
            task=args[1]
            if task.descriptor=='Lmq;':return self.run('Lmq;','b()Ljava/lang/Object;',(task,))[0]
            if task.descriptor=='Labd;':return self.new('Li72;')
            self.events.append(('queue-transaction',task));return None
        if owner in {'Ln9;','Labd;','Lad4;','Ldd4;','Le33;','Lpt4;'} and sig.startswith('<init>('):self.defaults(args[0]);return None
        if target=='Lp1b;->i()J':return 42
        if target=='Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;':return Reference(args[0],'Ljava/lang/Long;')
        if target=='Ljava/io/ByteArrayOutputStream;-><init>()V':return None
        if target=='Le6g;->i(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V':return None
        if target=='Ljava/io/ByteArrayOutputStream;->toByteArray()[B':return Reference(b'fixture-metrics','[B')
        if target=='Ln9;->e()Lpx0;':return self.new('Lpx0;',{'Lpx0;->a:Ljava/lang/String;':args[0].value['Ln9;->b:Ljava/lang/Object;']})
        if target=='Lkz1;->a(Lpx0;)Lpx0;':return args[1]
        if target=='Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;':return args[0]+args[1]
        if target=='Lofa;->a()Landroid/database/sqlite/SQLiteDatabase;':return self.new('Landroid/database/sqlite/SQLiteDatabase;')
        if target=='Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;':
            return Reference(args[1],'Landroid/database/sqlite/SQLiteStatement;')
        if target=='Landroid/database/sqlite/SQLiteStatement;->execute()V':self.sql.append(args[0].value);return None
        if target=='Le6g;->D(Loy0;IZ)V':self.events.append(('retry',args[1],args[2],args[3]));return None
        if target=='Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;':
            if is_zero(args[0]):raise VmThrown(Reference({},'Ljava/lang/NullPointerException;'))
            return args[0]
        if target=='Ljava/lang/Math;->max(JJ)J':return max(args[0],args[2])
        return super().invoke(target,args)


def verify_app_measurement(f,disabled):
    for existing in ('retained-functional-uuid','',None):
        f.events.clear();before=f.uuid_counter;value,prefs=f.identity(existing)
        identity=prefs.value['fixture-value']
        assert identity==(existing if existing is not None else f'fixture-functional-uuid-{before+1}')
        assert f.uuid_counter==before+int(existing is None),'9292 changed functional UUID creation'
        assert f.run(IDENTITY,'a()Ljava/lang/String;',(value,))[0]==identity
        assert f.uuid_counter==before+int(existing is None),'9292 regenerated retained API identity'
        assert sum(e[0]=='analytics-enqueue' for e in f.events)==int(not disabled),'9292 still links functional UUID to analytics'
        assert sum(e[0]=='crash-identity-or-property' for e in f.events)==int(not disabled),'9292 still links functional UUID to diagnostics'
    for broken in range(3):
        args=[f.new(IDENTITY),f.new('Lqg9;'),f.new('Lru2;'),f.tracker()];args[broken+1]=0;f.events.clear()
        try:f.run(IDENTITY,'<init>(Lqg9;Lru2;Llq;)V',args)
        except VmThrown as e:assert e.value.descriptor=='Ljava/lang/NullPointerException;'
        else:raise AssertionError('9292 lost identity-constructor argument validation')
        assert not f.events
    tracker=f.tracker();payload=Reference({'fixture':'page-context'},'Landroid/os/Bundle;')
    f.events.clear();f.run(ANALYTICS,'f(Ljava/lang/String;Landroid/os/Bundle;)V',(tracker,'fixture-page',payload))
    assert len(f.events)==int(not disabled),'9292 still dispatches app analytics events'
    f.events.clear();f.run(ANALYTICS,'j(Llq;Ljava/lang/String;Ljava/io/Serializable;I)V',(tracker,'fixture-property','fixture-value',12))
    assert sum(e[0]=='analytics-enqueue' for e in f.events)==int(not disabled)
    assert sum(e[0]=='crash-identity-or-property' for e in f.events)==int(not disabled)


def verify_measurement_metadata(f,disabled):
    for stored in (True,False,None):
        core,configuration=f.measurement_core(stored)
        assert f.run(CONFIGURATION,'J3()Z',(configuration,))[0]==int(disabled),'9292 Analytics permanent-deactivation flag changed'
        state=f.run(MEASUREMENT,'b()I',(core,))[0]
        assert state==(1 if disabled else 3 if stored is False else 0),'9292 Analytics restored opt-in bypasses deactivation'
    local=f.new('Lha7;',{'Lha7;->a:Landroid/os/Bundle;':Reference(f.metadata,'Landroid/os/Bundle;')})
    result=f.run('Lha7;','a()Ljava/lang/Boolean;',(local,))[0]
    assert (result.value if isinstance(result,Reference) else None)==(False if disabled else None),'9292 Sessions local collection flag changed'


def verify_crash_collection(f,disabled):
    getter='isAutomaticDataCollectionEnabled()Z';setter='setCrashlyticsDataCollectionEnabled(Ljava/lang/Boolean;)V'
    for restored in (False,True):
        arbiter=f.arbiter(restored,True)
        assert f.run(ARBITER,getter,(arbiter,))[0]==int(restored and not disabled),'9292 restored diagnostics opt-in remains active'
        for requested in (True,False,None):
            arbiter=f.arbiter(restored,True)
            app=f.new('Lyr4;',{'Lyr4;->a:Landroid/content/Context;':f.new('Landroid/content/Context;')})
            arbiter.value[ARBITER+'->firebaseApp:Lyr4;']=app
            f.run(ARBITER,setter,(arbiter,0 if requested is None else Reference(requested,'Ljava/lang/Boolean;')))
            wanted=not disabled and requested is not False
            assert f.run(ARBITER,getter,(arbiter,))[0]==int(wanted),'9292 manual diagnostics enable bypassed suppression'
            task=arbiter.value[ARBITER+'->dataCollectionEnabledTask:Ld5c;']
            assert task.value['fixture-complete']==wanted,'9292 diagnostics collection task completed while disabled'
    # Real Sessions subscriber gate runs before its settings refresh. Execute the
    # actual retained source loop until refresh or the native no-subscriber return.
    for restored in (False,True):
        subscriber=f.new(SUBSCRIBER,{SUBSCRIBER+'->dataCollectionArbiter:'+ARBITER:f.arbiter(restored)})
        registers={'v3':Reference({'crashlytics':subscriber},'Ljava/util/Map;'),
                   'v4':'Sessions','v6':f.new('Lft2;'),'v11':2}
        reached=f.run('Lft2;','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',start=490,stop_at=(514,553),registers=registers)[0]
        assert reached==(514 if restored and not disabled else 553),'9292 Sessions still reaches settings refresh'


def verify_crash_settings(f,disabled):
    spi=f.new(SPI,{SPI+'->logger:Lcom/google/firebase/crashlytics/internal/Logger;':f.new('Lcom/google/firebase/crashlytics/internal/Logger;'),SPI+'->url:Ljava/lang/String;':'https://fixture.invalid/settings'})
    request=f.new('Lcom/google/firebase/crashlytics/internal/settings/SettingsRequest;')
    for response in (0,Reference({'fixture':'settings'},'Lorg/json/JSONObject;'),VmThrown(Reference({},'Ljava/io/IOException;'))):
        f.settings_response=response;f.events.clear()
        value=f.run(SPI,SETTINGS,(spi,request,1))[0]
        assert value==(0 if disabled or isinstance(response,VmThrown) else response)
        assert sum(e[0]=='settings-http' for e in f.events)==int(not disabled),'9292 diagnostic settings request remains active'
    for blocking,token,exception in ((True,0,'Ljava/lang/RuntimeException;'),(False,1,'Ljava/lang/IllegalStateException;')):
        f.blocking_worker=blocking;f.events.clear()
        try:f.run(SPI,SETTINGS,(spi,request,token))
        except VmThrown as e:assert e.value.descriptor==exception
        else:raise AssertionError('9292 lost diagnostic settings validation')
        assert not f.events
    f.blocking_worker=True
    # Native unavailable-settings consumer completes without entering cache update.
    owner='Lcom/google/firebase/crashlytics/internal/settings/SettingsController$1;'
    signature='then(Ljava/lang/Void;)Lc5c;'
    reached=f.run(owner,signature,start=10,stop_at=(12,41),registers={'v'+str(f.rows[owner,signature][3]+1):0})[0]
    assert reached==41,'9292 unavailable diagnostic settings overwrote cached settings'


def verify_optional_services(f,disabled):
    for region in (0,1):
        sdk=f.new('Lfs5;',{'Lfs5;->c:Lyy3;':f.new('Lyy3;')})
        config=f.new('Lxc1;',{'Lxc1;->a:Lfs5;':sdk,'Lxc1;->c:Ljava/lang/String;':'fixture-app',
            'Lxc1;->b:Lsh7;':f.new('Lsh7;',{'Lsh7;->a:Ltc8;':f.new('Ltc8;',{'fixture-ordinal':region})})})
        pixel=f.new('Lbd1;',{'Lbd1;->c:Lxc1;':config,'Lbd1;->b:Ldw3;':f.new('Lycd;',{'Lycd;->e:Li8b;':f.new('Li8b;')})})
        f.events.clear();f.run('Lbd1;','a(JLjava/lang/String;)V',(pixel,12345,0,'fixture-settings'))
        assert sum(e[0]=='cmp-session-http' for e in f.events)==int(not disabled),'9292 independent CMP session pixel remains active'
        assert sum(e[0]=='cmp-timestamp' for e in f.events)==int(not disabled),'9292 records unsent CMP session as sent'
    verify_adyen_analytics(f,disabled)


def verify_adyen_analytics(f,disabled):
    # Execute the real checkout analytics consumer from its validated attempt-ID
    # branch, including its suspension discriminator and native Unit return.
    f.events.clear()
    analytics=f.new('Lcg;',{'Lcg;->b:Ljava/lang/Object;':f.new('Lbof;')})
    attempt=f.new('Ly22;',{'Ly22;->n:Ljava/lang/String;':'actual-checkout-attempt'})
    consumer=f.new('Lwh3;',{'Lwh3;->a:Lcg;':analytics})
    registers={'v10':consumer,'v11':attempt,'v1':f.new('Lvh3;'),'v8':1,
        'v0':f.statics['Lc9d;->a:Lc9d;'],'v2':f.suspended}
    result=f.run('Lwh3;','a(Lwh3;Lez2;)Ljava/lang/Object;',start=68,registers=registers)[0]
    assert result is f.statics['Lc9d;->a:Lc9d;'],'9292 optional Adyen track did not complete its real consumer'
    assert sum(e[0]=='adyen-analytics-queue-read' for e in f.events)==int(not disabled),'9292 optional Adyen analytics still reads its queue'


def verify_persisted_measurement(f,disabled):
    code=canonical(f.source.body(UPLOADER,UPLOAD)).code
    backend=next(i for i in range(114,len(code)) if code[i]=='check-cast v8, Lkz1;')
    retained=[f.new('Lpx0;',{'Lpx0;->a:Ljava/lang/String;':name}) for name in ('FUNCTIONAL',None,'UNKNOWN_NEW_NAME','firebase_crashlytics_report')]
    measurement=[f.new('Lpx0;',{'Lpx0;->a:Ljava/lang/String;':name}) for name in TRANSPORTS]
    for metrics in (False,True):
        for items in (measurement,retained,measurement[:2]+retained+measurement[2:]):
            database=f.new('Lofa;');backend_sdk=f.new('Lkz1;')
            uploader=f.new(UPLOADER,{UPLOADER+'->d:Ljava/lang/Object;':database,UPLOADER+'->j:Ljava/lang/Object;':database,
                UPLOADER+'->h:Ljava/lang/Object;':f.new('Lp1b;'),UPLOADER+'->i:Ljava/lang/Object;':f.new('Lp1b;')})
            persisted=Reference([f.new('Ldy0;',{'Ldy0;->a:J':i+11,'Ldy0;->c:Lpx0;':event}) for i,event in enumerate(items)],'Ljava/util/ArrayList;')
            context=f.new('Loy0;');extras=Reference(b'original-extras','[B') if metrics else 0
            registers={'v0':extras,'v1':uploader,'v2':backend_sdk,'v3':context,'v4':45,'v5':0,
                'v6':database,'v9':persisted,'v10':0,'v11':1,'v12':-1,'v13':-1}
            before=len(f.sql);f.events.clear()
            reached,frame=f.run(UPLOADER,UPLOAD,(uploader,context,2),start=48,stop_at=(backend,15),registers=registers)
            expected=[event for event in items if not disabled or event not in measurement]
            if metrics and not disabled:expected.append(frame['v14'].value[-1])
            if expected:
                assert reached==backend,'9292 discarded retained CCT events'
                assert frame['v14'].value==expected and all(a is b for a,b in zip(frame['v14'].value,expected)),'9292 queued measurements remain in outgoing batch'
                assert len(f.sql)==before,'9292 deleted batch before genuine transport outcome'
                assert frame['v0'] is extras and frame['v2'] is backend_sdk,'9292 changed transport extras/backend'
            else:
                assert reached==15,'9292 all-measurement batch reached backend'
                assert f.sql[-1]=='DELETE FROM events WHERE _id in ('+','.join(str(i+11) for i in range(len(items)))+')'
                outcome=frame['v10'].value
                assert outcome['Lix0;->a:Ll21;'] is f.statics['Ll21;->FATAL_ERROR:Ll21;'] and outcome['Lix0;->b:J']==-1,'9292 privacy discard fabricated a successful send'
                assert frame['v0'] is extras and frame['v2'] is backend_sdk and frame['v4']==45
                assert not any(e[0]=='retry' for e in f.events)
            assert [row.value['Ldy0;->c:Lpx0;'] for row in persisted.value]==items,'9292 changed persisted event identities'
    if disabled:
        # Empty helper input remains empty; malformed/unknown names retain native
        # semantics. Case-sensitive matching preserves future functional types.
        assert f.run(UPLOADER,FILTER,(Reference([],'Ljava/util/ArrayList;'),))[0].value==[]
    # Execute the unchanged native outcome dispatch with a genuine transient
    # result: it must retain the batch and schedule retry with the real context.
    uploader.value[UPLOADER+'->e:Ljava/lang/Object;']=f.new('Le6g;')
    dispatch=next(i for i,l in enumerate(code) if l=='sget-object v0, Ll21;->TRANSIENT_ERROR:Ll21;' and i>500)
    transient=f.new('Lix0;',{'Lix0;->a:Ll21;':f.statics['Ll21;->TRANSIENT_ERROR:Ll21;'],'Lix0;->b:J':-1})
    f.events.clear();before=len(f.sql)
    f.run(UPLOADER,UPLOAD,(uploader,context,2),start=dispatch,registers={'v10':transient,'v9':persisted,'v6':database,'v32':45,'v33':0})
    assert f.events[-1]==('retry',context,3,1) and len(f.sql)==before,'9292 changed native failed-send retry'
    for metrics in (False,True):
        success=f.new('Lix0;',{'Lix0;->a:Ll21;':f.statics['Ll21;->OK:Ll21;'],'Lix0;->b:J':90})
        f.events.clear();before=len(f.sql)
        reached,frame=f.run(UPLOADER,UPLOAD,(uploader,context,2),start=dispatch,stop_at=(15,),registers={
            'v10':success,'v9':persisted,'v6':database,'v30':extras if metrics else 0,
            'v31':backend_sdk,'v32':45,'v33':0})
        assert reached==15 and frame['v4']==90 and len(f.sql)==before+1,'9292 changed native successful-send wait/deletion'
        assert not any(e[0]=='retry' for e in f.events)
