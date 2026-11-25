"""Native Firebase product predicates, admission, settings and real URL reads."""
from brabant_smali import canonical
from marktplaats_marketing_vm import MarketingFixture,ROOT
from rtl_vm import Reference,VmThrown,is_zero

CRASH=ROOT+'core/tracking/crash/a;'
SESSIONS='Lcom/google/firebase/sessions/settings/'
REMOTE=SESSIONS+'a;'
RESUME=SESSIONS+'RemoteSettings$updateSettings$1;'
WORKER='Lcom/google/firebase/crashlytics/internal/concurrency/a;'
CHECKER='Lcom/google/firebase/crashlytics/internal/concurrency/CrashlyticsWorkers$Companion$checkBlockingThread$1;'
FIREBASE_VOID=[(CRASH,s) for s in ('b()V','c(Ljava/lang/String;)V','d(Ljava/lang/String;Ljava/lang/Throwable;)V','e(Ljava/lang/Throwable;)V')]+[
 ('Lupg;',s) for s in ('d(Lzf6;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V','e(Lajg;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V',
 'f(Llqb;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V','onUpdateAppState(Lcom/google/firebase/perf/v1/ApplicationProcessState;)V')]


class FirebaseFixture(MarketingFixture):
    def __init__(self,*args):
        super().__init__(*args)
        pairs={('Lh04;','f()Z'),('Lpfj;','z0()Z'),('Lpfj;','y0(Ljava/lang/String;)Ljava/lang/Boolean;'),
               ('Lfd3;','g()Ljava/lang/Boolean;'),('Lsw8;','a()Ljava/lang/Boolean;'),('Lad2;','c()Z'),('Lad2;','h(Z)V'),
               (SESSIONS+'b;','b()Z'),('Lhla;','R(Lzie;)Ljava/util/HashMap;'),(WORKER,'b()V'),('Lbs3;','b(Lbs3;)Z'),
               ('Lo5b;','b()Ljava/lang/Object;'),('Lo5b;','c()Z'),('Lyjk;','i(Ljava/lang/String;)V')}
        self.native.update(key for key in self.rows if key in pairs or key[0] in {CHECKER,RESUME})
        self.firebase_bundle=Reference({},'Landroid/os/Bundle;');self.firebase_preferences={};self.firebase_default=1
        self.firebase_context=self.new(ROOT+'HorizonApplication;')
        self.firebase_app=self.new('Lgu5;',{'Lgu5;->a:Landroid/content/Context;':self.firebase_context})
        self.perf_metadata={};self.perf_cache=None
        for o in ('Ltd3;','Lud3;'):self.statics[o+'->c:'+o]=0
        self.statics[WORKER+'->d:Lbs3;']=self.new('Lbs3;')

    def invoke(self,target,args):
        if target=='Ljava/lang/Boolean;->booleanValue()Z':return int(args[0].value)
        if target=='Lgu5;->e()Lgu5;':return self.firebase_app # Existing validated Firebase DI boundary.
        if target=='Lgu5;->b()V':return None
        if target=='Lgu5;->k()Z':return self.firebase_default
        if target=='Lh04;->g(Z)V':return None # Native method is diagnostic logging only.
        if target=='Lpfj;->x0()Landroid/os/Bundle;':return self.firebase_bundle # Package metadata boundary.
        if target in {'Lfd3;->h(Lxxk;)Lo5b;','Lfd3;->a(Lxxk;)Lo5b;'}:
            value=self.perf_cache if '->a(' in target else self.perf_metadata.get(args[1].descriptor)
            return self.new('Lo5b;',{'Lo5b;->a:Ljava/lang/Object;':0 if value is None else Reference(value,'Ljava/lang/Boolean;')})
        if target=='Lyie;->a()Ljava/lang/Boolean;' and args[0].descriptor==REMOTE:return Reference(True,'Ljava/lang/Boolean;')
        if target=='Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;':return Reference(self.firebase_preferences,'Landroid/content/SharedPreferences;')
        if target=='Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;':return self.new('Landroid/content/pm/PackageManager;')
        if target=='Landroid/content/Context;->getPackageName()Ljava/lang/String;':return 'fixture.marketplace'
        if target=='Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;':
            return self.new('Landroid/content/pm/ApplicationInfo;',{'Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;':self.firebase_bundle})
        if target in {'Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z','Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z'}:return int(args[1] in args[0].value)
        if target in {'Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z','Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z'}:return int(args[0].value.get(args[1],args[2]))
        if target=='Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z':return int(args[0].value.get(args[1],False))
        if target=='Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;':return Reference(args[0].value,'Landroid/content/SharedPreferences$Editor;')
        if target=='Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;':args[0].value[args[1]]=bool(args[2]);return args[0]
        if target=='Landroid/content/SharedPreferences$Editor;->apply()V':return None
        if target=='Ljava/util/HashMap;-><init>()V':args[0].value={};return None
        if target=='Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':
            previous=args[0].value.get(args[1],0);args[0].value[args[1]]=args[2];return previous
        if target=='Ljava/lang/Integer;->toString(I)Ljava/lang/String;':return str(args[0])
        if target=='Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z':return int(is_zero(args[0]) or not args[0])
        if target=='Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V':
            args[0].value['Lkotlin/jvm/internal/CallableReference;->receiver:Ljava/lang/Object;']=args[2];return None
        if target=='Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;':return self.new('Ljava/lang/Thread;')
        if target=='Ljava/lang/Thread;->getName()Ljava/lang/String;':return 'fixture-worker'
        if target=='Lkgf;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z':return int(args[1] in args[0] if not args[2] else args[1].lower() in args[0].lower())
        if target=='Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z':return 0
        if target=='Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V':args[0].value={'parts':[args[1]]};return None
        if target in {'Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;','Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;'}:
            args[0].value['parts'].append(chr(args[1]) if target.endswith('(C)Ljava/lang/StringBuilder;') else args[1]);return args[0]
        if target=='Ljava/lang/StringBuilder;->toString()Ljava/lang/String;':return ''.join(args[0].value['parts'])
        if target=='Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V':self.defaults(args[0]);return None
        if target=='Lpeg;-><init>()V':return None # Clock primitive; unused by the uninitialized wrapper branch.
        if target=='Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z':return int(args[0].value)
        if target=='Ljava/net/URL;->openConnection()Ljava/net/URLConnection;':
            result=args[0].value['connection']
            if isinstance(result,VmThrown):raise result
            return result
        if target=='Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;':
            result=args[0].value['stream']
            if isinstance(result,VmThrown):raise result
            return result
        return super().invoke(target,args)


def verify_firebase(f,disabled):
    failures=[]
    for owner,sig in FIREBASE_VOID:
        code=canonical(f.source.body(owner,sig)).code;marker=len(code)-f.rows[owner,sig][4]
        if f.run(owner,sig,(),stop_at=(marker,))[0]!=(None if disabled else marker):failures.append('diagnostic admission '+owner+'->'+sig)
    code=canonical(f.source.body(CRASH,'<init>()V')).code;marker=code.index('new-instance v1, Lc67;')
    reporter=f.new(CRASH);_,frame=f.run(CRASH,'<init>()V',(reporter,),start=2,stop_at=(marker,))
    if reporter.value[CRASH+'->a:Z']!=(0 if disabled else 1):failures.append('app crash initial override')
    assert frame['v0']==1,'Crash constructor changed the genuine lazy-provider selector'
    for stored in (0,Reference(True,'Ljava/lang/Boolean;'),Reference(False,'Ljava/lang/Boolean;')):
        for default in (0,1):
            f.firebase_default=default
            arbiter=f.new('Lh04;',{'Lh04;->i:Ljava/lang/Object;':stored,'Lh04;->e:Ljava/lang/Object;':f.firebase_app})
            actual=f.run('Lh04;','f()Z',(arbiter,))[0]
            wanted=0 if disabled else (default if is_zero(stored) else int(stored.value))
            if actual!=wanted:failures.append('Crashlytics restored/runtime enablement')
    config=f.new('Lpfj;',{'Ln23;->b:Ljava/lang/Object;':f.new('Lmdk;')})
    for deactivated in (False,True,False):
        f.firebase_bundle.value={'firebase_analytics_collection_deactivated':deactivated}
        actual=f.run('Lpfj;','z0()Z',(config,))[0]
        if actual!=int(disabled or deactivated):failures.append('Analytics permanent deactivation')
        engine=f.new('Lmdk;',{'Lmdk;->d:Lpfj;':config})
        result=f.run('Lmdk;','d()I',(engine,),start=3,stop_at=(8,))[0]
        if result!=(1 if disabled or deactivated else 8):failures.append('Analytics native disable reason')
    for deactivated in (None,False,True):
        for cached in (None,False,True):
            f.perf_metadata={'Ltd3;':deactivated,'Lud3;':True};f.perf_cache=cached
            actual=f.run('Lfd3;','g()Ljava/lang/Boolean;',(f.new('Lfd3;'),))[0]
            wanted=False if disabled or deactivated else (True if cached is None else cached)
            if not isinstance(actual,Reference) or actual.value!=wanted:failures.append('Performance restored configuration')
    for local in (None,False,True):
        f.firebase_bundle.value={} if local is None else {'firebase_sessions_enabled':local}
        local_settings=f.new('Lsw8;',{'Lsw8;->a:Landroid/os/Bundle;':f.firebase_bundle})
        settings=f.new(SESSIONS+'b;',{SESSIONS+'b;->a:Lyie;':local_settings,SESSIONS+'b;->b:Lyie;':f.new(REMOTE)})
        actual=f.run(SESSIONS+'b;','b()Z',(settings,))[0]
        if actual!=(0 if disabled else int(True if local is None else local)):failures.append('Sessions local/remote enablement')
    for stored in (None,False,True):
        f.firebase_bundle.value={'delivery_metrics_exported_to_big_query_enabled':True}
        f.firebase_preferences.clear()
        if stored is not None:f.firebase_preferences['export_to_big_query']=stored
        actual=f.run('Lad2;','c()Z')[0]
        if actual!=(0 if disabled else int(True if stored is None else stored)):failures.append('FCM old export preference')
    for requested in (0,1,0,1):
        f.run('Lad2;','h(Z)V',(requested,))
        if f.firebase_preferences['export_to_big_query']!=bool(0 if disabled else requested):failures.append('FCM later export write')
        if f.run('Lad2;','c()Z')[0]!=(0 if disabled else requested):failures.append('FCM export after write')
    # The settings HTTP branch is one case of an R8-merged Callable. Keep the
    # original concurrency check and request parsing, and return native null.
    code=canonical(f.source.body('Llc3;','call()Ljava/lang/Object;')).code
    boundary=code.index('new-instance v8, Lgvg;')
    info=f.new('Lhla;',{'Lhla;->b:Ljava/lang/Object;':'fixture://settings'})
    settings_owner='Lcom/google/firebase/crashlytics/internal/settings/a;'
    settings=f.new(settings_owner,{settings_owner+'->e:Lhla;':info,settings_owner+'->b:Lzie;':f.new('Lzie;')})
    wrapper=f.new('Lr6d;',{'Lr6d;->c:Ljava/lang/Object;':settings})
    call=f.new('Llc3;',{'Llc3;->a:B':4,'Llc3;->b:Ljava/lang/Object;':wrapper})
    result=f.run('Llc3;','call()Ljava/lang/Object;',(call,),stop_at=(boundary,))[0]
    if not (is_zero(result) if disabled else result==boundary):failures.append('Crashlytics independent settings HTTP')
    settings.value[settings_owner+'->b:Lzie;']=0
    try:f.run('Llc3;','call()Ljava/lang/Object;',(call,),stop_at=(boundary,));raise AssertionError('Settings request validation was skipped')
    except VmThrown as failure:assert failure.value.descriptor=='Ljava/lang/NullPointerException;'
    for worker in (5,127):
        # Default cases return the original asset descriptor unchanged.
        value=f.new('Landroid/content/res/AssetFileDescriptor;')
        call=f.new('Llc3;',{'Llc3;->a:B':worker,'Llc3;->b:Ljava/lang/Object;':value})
        assert f.run('Llc3;','call()Ljava/lang/Object;',(call,))[0] is value,'Unrelated merged Callable case changed'
    code=canonical(f.source.body(REMOTE,'d(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;')).code
    boundary=code.index('iget-object v1, v0, '+REMOTE+'->f:Lkotlinx/coroutines/sync/a;')
    remote=f.new(REMOTE)
    result=f.run(REMOTE,'d(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',(remote,0),stop_at=(boundary,))[0]
    if not (result is f.unit if disabled else result==boundary):failures.append('Sessions settings job admission')
    failure=VmThrown(f.new('Ljava/io/IOException;'))
    continuation=f.new(RESUME,{RESUME+'->label:I':-2147483648,RESUME+'->result:Ljava/lang/Object;':failure})
    try:f.run(REMOTE,'d(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',(remote,continuation));raise AssertionError('Settings continuation failure was swallowed')
    except VmThrown as caught:assert caught.value is failure.value
    # Instrumentation must retain the real stream and original failures.
    f.statics['Lupg;->s:Lupg;']=f.new('Lupg;',{'Lupg;->c:Ljava/util/concurrent/atomic/AtomicBoolean;':Reference(False,'Ljava/util/concurrent/atomic/AtomicBoolean;')})
    owner='Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;';sig='openStream(Ljava/net/URL;)Ljava/io/InputStream;'
    stream=f.new('Ljava/io/ByteArrayInputStream;');connection=f.new('Ljava/net/URLConnection;',{'stream':stream});url=f.new('Ljava/net/URL;',{'connection':connection})
    assert f.run(owner,sig,(url,))[0] is stream,'Performance wrapper fabricated a stream'
    for stage in ('connection','stream'):
        failure=VmThrown(f.new('Ljava/io/IOException;'))
        original=url.value['connection'] if stage=='connection' else connection.value['stream']
        target=url if stage=='connection' else connection;key=stage
        target.value[key]=failure
        try:f.run(owner,sig,(url,));raise AssertionError('Performance wrapper swallowed a real network failure')
        except VmThrown as caught:assert caught.value is failure.value
        finally:target.value[key]=original
    assert not failures,'Marktplaats Firebase collection remains: '+'; '.join(failures)
