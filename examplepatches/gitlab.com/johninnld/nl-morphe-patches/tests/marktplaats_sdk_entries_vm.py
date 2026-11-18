"""Native SDK background entries and payment analytics/attempt-ID separation."""
from brabant_smali import canonical
from marktplaats_persisted_vm import PersistedFixture
from rtl_vm import Reference,VmThrown,is_zero

ADJUST='Lcom/adjust/sdk/AdjustInstance;'
RECEIVER='Lcom/adjust/sdk/AdjustReferrerReceiver;'
MANAGER='Lcom/adyen/checkout/components/core/internal/analytics/a;'
LEVEL='Lcom/adyen/checkout/components/core/internal/ui/model/AnalyticsParamsLevel;'
INITIALIZE='Lcom/adyen/checkout/components/core/internal/analytics/DefaultAnalyticsManager$initialize$2;'
SEND='Lcom/adyen/checkout/components/core/internal/analytics/DefaultAnalyticsManager$sendEvents$1;'
SDK_VOID=[(ADJUST,s) for s in ('initSdk(Lcom/adjust/sdk/AdjustConfig;)V','onResume()V',
 'trackEvent(Lcom/adjust/sdk/AdjustEvent;)V','sendReferrer(Ljava/lang/String;Landroid/content/Context;)V')]+[
 (RECEIVER,'onReceive(Landroid/content/Context;Landroid/content/Intent;)V'),
 ('Ltz8;','i()V'),('La0;','a()V'),('Ldp7;','b()V'),
 ('Lsok;','k(Ljava/lang/String;Lorg/json/JSONArray;Lfp6;)V'),('Lsok;','q(Ljava/lang/String;Ljava/lang/String;)V')]


class SdkEntryFixture(PersistedFixture):
    def __init__(self,*args):
        super().__init__(*args)
        native_owners={LEVEL,'Lpt2;',INITIALIZE,SEND,
                       'Lcom/adyen/checkout/components/core/internal/analytics/DefaultAnalyticsManager$trackEvent$2;',
                       'Lcom/adyen/checkout/components/core/internal/analytics/DefaultAnalyticsManager$startTimer$2;'}
        self.native.update(key for key in self.rows if key[0] in native_owners or key[0]==MANAGER and key[1] in {'e()V','b()Ljava/lang/String;'}
                           or key[0]==ADJUST and key[1].startswith('checkActivityHandler('))
        self.run(LEVEL,'<clinit>()V')
        for owner,name in [('Lqt2;','b'),('Lrt2;','b')]:self.statics[owner+'->'+name+':'+owner]=self.new(owner)
        self.statics['Ltr;->T:Lsr;']=self.new('Lsr;');self.statics['Lsr;->b:Ld7d;']=self.new('Ld7d;')
        self.statics[MANAGER+'->j:I']=0
        for level in ('DEBUG','WARN'):
            owner='Lcom/adyen/checkout/core/AdyenLogLevel;';self.statics[owner+'->'+level+':'+owner]=self.new(owner)
        self.setup_result='fixture-genuine-attempt-id'

    def invoke(self,target,args):
        if target=='Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;':return args[0].value['fixture-referrer']
        if target in {'Lcom/adjust/sdk/IActivityHandler;->onResume()V','Lcom/adjust/sdk/IActivityHandler;->trackEvent(Lcom/adjust/sdk/AdjustEvent;)V'}:
            self.events.append(('adjust-admission',target));return None
        if target=='Ld7d;->x(Lcom/adyen/checkout/core/AdyenLogLevel;)Z':return 0 # Local debug-logging boundary.
        if target=='Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V':self.defaults(args[0]);return None
        if target=='Lbr1;->c(Lhp3;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;I)Ls8f;':
            self.events.append(('async-job',args[3]));return self.new('Ls8f;')
        if target=='Lkotlinx/coroutines/g;->j(Ljava/util/concurrent/CancellationException;)V':
            args[0].value['fixture-cancelled']=True;return None
        if target=='Lcom/adyen/checkout/components/core/internal/analytics/data/a;->a(Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;':
            # The real SDK setup/attempt-ID service is a retained external
            # boundary. Native initialization consumes its actual result.
            self.events.append(('checkout-setup',))
            if isinstance(self.setup_result,VmThrown):raise self.setup_result
            return self.setup_result
        if target=='Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;':return args[0]
        if target=='Lob;->f(Ljava/lang/Throwable;)Ljava/lang/Object;':return Reference({'exception':args[0]},'Lkotlin/Result$Failure;')
        if target=='Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;':
            return args[0].value['exception'] if isinstance(args[0],Reference) and args[0].descriptor=='Lkotlin/Result$Failure;' else 0
        return super().invoke(target,args)


def verify_sdk_entries(f,disabled):
    failures=[]
    for owner,sig in SDK_VOID:
        code=canonical(f.source.body(owner,sig)).code;marker=len(code)-f.rows[owner,sig][4]
        if f.run(owner,sig,(),stop_at=(marker,))[0]!=(None if disabled else marker):failures.append('SDK entry '+owner+'->'+sig)
    # A restored, already-active Adjust handler cannot resume or receive events.
    instance=f.new(ADJUST,{ADJUST+'->activityHandler:Lcom/adjust/sdk/IActivityHandler;':f.new('Lcom/adjust/sdk/IActivityHandler;')})
    for sig,args in [('onResume()V',(instance,)),('trackEvent(Lcom/adjust/sdk/AdjustEvent;)V',(instance,f.new('Lcom/adjust/sdk/AdjustEvent;')))]:
        f.events.clear();f.run(ADJUST,sig,args)
        if len(f.events)!=(0 if disabled else 1):failures.append('restored Adjust handler '+sig)
    sig='onReceive(Landroid/content/Context;Landroid/content/Intent;)V';code=canonical(f.source.body(RECEIVER,sig)).code
    marker=next(i for i,line in enumerate(code) if '->getDefaultInstance()' in line)
    for referrer in (0,'fixture-campaign'):
        intent=f.new('Landroid/content/Intent;',{'fixture-referrer':referrer})
        result=f.run(RECEIVER,sig,(f.new(RECEIVER),f.firebase_context,intent),stop_at=(marker,))[0]
        if result!=(None if disabled or is_zero(referrer) else marker):failures.append('install-referrer SDK creation')
    # Every branch of this particular FeatureManager callback is optional FB
    # instrumentation. Other methods of the R8-merged class remain untouched.
    value=canonical(f.source.body('Lxj5;','e(Z)V'));table=value.switches[0]
    switch=next(i for i,l in enumerate(value.code) if l.startswith('sparse-switch '))
    for selector in (0,1,27,28,29):
        boundary=table[selector]+1 if selector in table else switch+2
        for requested in (0,1):
            callback=f.new('Lxj5;',{'Lxj5;->a:B':selector})
            result=f.run('Lxj5;','e(Z)V',(callback,requested),stop_at=(boundary,))[0]
            if result!=(None if disabled or not requested else boundary):failures.append('FB diagnostic feature '+str(selector))
    # Execute the genuine native low-priority track branch, including a
    # previously supplied ALL configuration and repeated optional UI events.
    for name in ('INITIAL','ALL'):
        priority=f.enum(LEVEL,name)
        for active_scope in (False,True):
            scope=f.new('Lxz2;') if active_scope else 0
            params=f.new('Lzw;',{'Lzw;->a:'+LEVEL:priority})
            manager=f.new(MANAGER,{MANAGER+'->b:Lzw;':params,MANAGER+'->f:Lxz2;':scope})
            f.events.clear()
            for _ in range(40):f.run(MANAGER,'f(Lsw;)V',(manager,f.new('Lsw;')))
            wanted=40 if not disabled and name=='ALL' and active_scope else 0
            if len(f.events)!=wanted:failures.append('Adyen event admission '+name+'/'+str(active_scope))
    # Native timer cancellation must survive suppression of replacement jobs,
    # for both incoming branches (an existing timer and no timer).
    for previous in (0,f.new('Ls8f;')):
        manager=f.new(MANAGER,{MANAGER+'->g:Ls8f;':previous,MANAGER+'->f:Lxz2;':f.new('Lxz2;')})
        f.events.clear();f.run(MANAGER,'e()V',(manager,))
        if not is_zero(previous):assert previous.value['fixture-cancelled'],'Existing analytics timer was not cancelled'
        if disabled:
            if f.events or not is_zero(manager.value[MANAGER+'->g:Ls8f;']):failures.append('Adyen timer lifetime')
        elif len(f.events)!=1:failures.append('original Adyen timer launch')
    sig='d(Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;';code=canonical(f.source.body(MANAGER,sig)).code
    boundary=code.index('iget-object p1, p0, '+MANAGER+'->d:Lxnk;')
    result=f.run(MANAGER,sig,(f.new(MANAGER),0),stop_at=(boundary,))[0]
    if not (result is f.unit if disabled else result==boundary):failures.append('Adyen event-send admission')
    # Genuine initial setup still supplies the payment attempt ID; neither
    # null nor failure may be converted into a fabricated ID or success.
    for setup in ('fixture-genuine-attempt-id',0,VmThrown(f.new('Ljava/io/IOException;'))):
        f.setup_result=setup;manager=f.new(MANAGER,{MANAGER+'->f:Lxz2;':f.new('Lxz2;')})
        coroutine=f.new(INITIALIZE,{INITIALIZE+'->this$0:'+MANAGER:manager,INITIALIZE+'->L$0:Ljava/lang/Object;':f.new('Lxz2;')})
        f.events.clear();assert f.run(INITIALIZE,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(coroutine,f.unit))[0] is f.unit
        assert sum(e[0]=='checkout-setup' for e in f.events)==1,'Checkout setup was replaced'
        if isinstance(setup,str):
            assert f.run(MANAGER,'b()Ljava/lang/String;',(manager,))[0]==setup,'Genuine payment attempt ID changed'
            if sum(e[0]=='async-job' for e in f.events)!=(0 if disabled else 1):failures.append('Adyen setup restarted optional timer')
        else:assert manager.value[MANAGER+'->d:Lxnk;'] is f.statics['Lqt2;->b:Lqt2;'],'Checkout setup failure fabricated an ID'
    assert not failures,'Marktplaats SDK measurement remains: '+'; '.join(failures)
