"""Native ThreatMetrix opt-out and unchanged request/header boundaries."""
from brabant_smali import canonical
from marktplaats_sdk_entries_vm import SdkEntryFixture
from rtl_vm import Reference,VmThrown,is_zero

SECURITY='Lcom/horizon/android/core/networking/threatmetrix/a;'
NETWORK_CONFIG='Lcom/horizon/android/core/networking/config/a;'
SWITCH='Lcom/horizon/android/core/networking/config/FeatureSwitches;'
BLOCKING='Lcom/horizon/android/core/networking/threatmetrix/ThreatMetrixWrapper$getSessionIdBlocking$1;'
INITIALIZE='d('+SECURITY+'Lcom/horizon/android/HorizonApplication;)V'


class SecurityFixture(SdkEntryFixture):
    def __init__(self,*args):
        super().__init__(*args)
        owners={SECURITY,BLOCKING,'Lcom/horizon/android/core/networking/threatmetrix/ThreatMetrixWrapper$crashReporter$1;',
                'Lcom/horizon/android/core/networking/threatmetrix/ThreatMetrixWrapper$generateNewSessionId$1;','Ldhd;'}
        self.native.update(key for key in self.rows if key[0] in owners or key==(NETWORK_CONFIG,'m()Z'))
        self.now=1000;self.security_kill=0
        self.security_flag=self.new(SWITCH);self.statics[SWITCH+'->THREATMETRIX_KILL_SWITCH:'+SWITCH]=self.security_flag
        self.security_config=self.new(NETWORK_CONFIG,{'La2;->a:Ljava/lang/Object;':self.new('Lktc;')})
        for owner,name,kind in [('Lkotlin/time/InstantJvmKt;','a','Lkotlin/time/Clock;'),('Llz9;','a','Llz9;'),
                               ('Lnn4;','a','Lkb4;'),('Lo94;','b','Lo94;')]:self.statics[owner+'->'+name+':'+kind]=self.new(kind)
        self.statics['Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;']=self.new('Lkotlin/LazyThreadSafetyMode;')
        self.statics['Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;']=self.new('Lkotlin/coroutines/EmptyCoroutineContext;')
        self.deferred_result='sdk-reported-fixture-session'

    def wrapper(self):
        instance=self.new(SECURITY);self.run(SECURITY,'<init>()V',(instance,))
        self.statics[SECURITY+'->j:'+SECURITY]=instance
        return instance

    def invoke(self,target,args):
        if target=='Ljava/lang/String;->length()I':return len(args[0])
        if target=='Lktc;->a(Lrp5;)Z' and args[1] is self.security_flag:return self.security_kill
        if target=='Lkotlin/time/Clock;->a()Lkotlin/time/Instant;':return Reference({'epoch':self.now},'Lkotlin/time/Instant;')
        if target=='Lkotlin/time/Instant;->toEpochMilliseconds()J':return args[0].value['epoch']
        if target=='Lkotlin/LazyKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;':return Reference({'value':self.security_config},'Lkotlin/Lazy;')
        if target=='Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;' and 'fixture-allowed' in args[0].value:return Reference(args[0].value['fixture-allowed'],'Ljava/lang/Boolean;')
        if target=='Ljava/util/List;->contains(Ljava/lang/Object;)Z':return int(args[1] in args[0].value)
        if target=='Lcr1;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;':
            self.events.append(('security-blocking',));return self.run(BLOCKING,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(args[1],self.unit))[0]
        if target=='Lkotlinx/coroutines/g;->A(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;':
            self.events.append(('security-await',))
            if isinstance(self.deferred_result,VmThrown):raise self.deferred_result
            return self.deferred_result
        if target=='Lu3k;->b()Lmlf;':return self.new('Lmlf;')
        if target=='Lkotlin/coroutines/CoroutineContext$Element$DefaultImpls;->d(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext$Element;)Lkotlin/coroutines/CoroutineContext;':return args[0]
        if target=='Lip3;->a(Lkotlin/coroutines/CoroutineContext;)Lpk3;':return self.new('Lpk3;')
        if target=='Lbr1;->a(Lhp3;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;I)Lkotlinx/coroutines/c;':
            self.events.append(('security-profile-job',));return self.new('Lkotlinx/coroutines/c;')
        if target=='Llpa;->o(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;':return Reference({args[0]:args[1]},'Ljava/util/Map;')
        return super().invoke(target,args)


def verify_security(f,expert):
    failures=[];wrapper=f.wrapper()
    assert wrapper.value[SECURITY+'->b:Z']==0,'Fresh security wrapper initialized profiling'
    assert is_zero(wrapper.value[SECURITY+'->a:Lcom/lexisnexisrisk/threatmetrix/TMXProfiling;'])
    code=canonical(f.source.body(SECURITY,INITIALIZE)).code
    boundary=next(i for i,l in enumerate(code) if 'TMXProfiling;->getInstance()' in l)
    result=f.run(SECURITY,INITIALIZE,(wrapper,f.firebase_context),stop_at=(boundary,))[0]
    if result!=(None if expert else boundary):failures.append('SDK initialization')
    assert wrapper.value[SECURITY+'->b:Z']==0
    for killed in (0,1,0):
        f.security_kill=killed
        for sdk_allowed in (False,True):
            wrapper.value[SECURITY+'->g:Lkotlin/jvm/functions/Function0;']=Reference({'fixture-allowed':sdk_allowed},'Lkotlin/jvm/functions/Function0;')
            wanted=int(not expert and not killed and sdk_allowed)
            actual=f.run(SECURITY,'e()Z',(wrapper,))[0]
            if actual!=wanted:failures.append('enable predicate')
            for initialized in (0,1):
                wrapper.value[SECURITY+'->b:Z']=initialized
                for age in (0,50000000):
                    for method in ('POST','PUT','GET','DELETE'):
                        wrapper.value[SECURITY+'->c:J']=f.now-age
                        wrapper.value[SECURITY+'->d:Lkotlinx/coroutines/c;']=f.new('Lkotlinx/coroutines/c;')
                        body=f.new('Lkxc;');headers=f.new('Lhu6;')
                        request=f.new('Lcxc;',{'Lcxc;->b:Ljava/lang/String;':method,'Lcxc;->c:Lhu6;':headers,'Lcxc;->d:Lkxc;':body})
                        before=dict(request.value);f.events.clear()
                        result=f.run(SECURITY,'b(Lcxc;)Ljava/util/Map;',(wrapper,request))[0]
                        assert isinstance(result,Reference) and isinstance(result.value,dict)
                        if wanted and initialized and method in ('POST','PUT'):
                            assert list(result.value.values())==[f.deferred_result] and len(result.value)==1,'Native SDK-supplied header changed'
                            assert ('security-await',) in f.events
                            assert sum(e[0]=='security-profile-job' for e in f.events)==int(age>43200000),'Native refresh path changed'
                        else:
                            if result.value or f.events:failures.append('header fallback/profiling/wait')
                        assert request.value==before and request.value['Lcxc;->c:Lhu6;'] is headers and request.value['Lcxc;->d:Lkxc;'] is body,'Request/auth/body mutated'
    # Existing SDK failures remain real failures in ordinary mode. The expert
    # mode never awaits that SDK and produces only the native empty-header map.
    f.security_kill=0;wrapper.value[SECURITY+'->b:Z']=1
    wrapper.value[SECURITY+'->g:Lkotlin/jvm/functions/Function0;']=Reference({'fixture-allowed':True},'Lkotlin/jvm/functions/Function0;')
    wrapper.value[SECURITY+'->c:J']=f.now
    failure=VmThrown(f.new('Ljava/lang/IllegalStateException;'));f.deferred_result=failure
    request=f.new('Lcxc;',{'Lcxc;->b:Ljava/lang/String;':'POST'})
    try:
        result=f.run(SECURITY,'b(Lcxc;)Ljava/util/Map;',(wrapper,request))[0]
        assert expert and result.value=={},'Security SDK error was fabricated into a successful outcome'
    except VmThrown as caught:
        assert caught.value is failure.value
        if expert:failures.append('expert still awaited a failing SDK task')
    f.deferred_result='sdk-reported-fixture-session'
    # Execute the real header interceptor with the native empty-map outcome.
    # Request URL/method/auth headers/body remain the original objects.
    if not failures:
        old_kill=f.security_kill
        if not expert:f.security_kill=1
        headers=f.new('Ldu6;');body=f.new('Lkxc;');url=f.new('Lr27;')
        builder=f.new('Lvwc;',{'Lvwc;->a:Lr27;':url,'Lvwc;->b:Ljava/lang/String;':'POST',
                              'Lvwc;->c:Ldu6;':headers,'Lvwc;->d:Lkxc;':body})
        before=dict(builder.value)
        f.run('Lble;','b(Lvwc;Lcxc;)V',(f.new('Lble;'),builder,request))
        assert builder.value==before,'Security opt-out modified ordinary URL/auth/body state'
        f.security_kill=old_kill
    # The original null-request validation still precedes the empty-map path.
    try:f.run(SECURITY,'b(Lcxc;)Ljava/util/Map;',(wrapper,0));raise AssertionError('Native request validation skipped')
    except VmThrown as caught:assert caught.value.descriptor=='Ljava/lang/NullPointerException;'
    assert not failures,'Marktplaats expert security opt-out missing: '+'; '.join(sorted(set(failures)))
