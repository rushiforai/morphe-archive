"""APK-bound marketing admission and native Braze disablement state."""
from brabant_smali import canonical
from marktplaats_tracking_vm import TrackingFixture,ROOT
from rtl_vm import Reference,is_zero

BRAZE='Lcom/braze/Braze;'
COMPANION='Lcom/braze/Braze$Companion;'
MANAGER=ROOT+'braze/i;'
ENABLEMENT='Lbo/app/qe;'
GUARDED='runGuardedAsync$android_sdk_base_release(Lkotlin/jvm/functions/Function0;ZZZLkotlin/jvm/functions/Function0;)V'
FACEBOOK_GATES=[
 ('Lqn5;','b(Lmd0;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/Double;)V'),
 ('Lqn5;','c(Lnc5;Z)V'),
 ('Lzaj;','b(Landroid/app/Application;Ljava/lang/String;)V'),
 ('Lzaj;','i()V'),
 ('Lzaj;','j(Lcom/facebook/appevents/AppEvent;Lcom/facebook/appevents/AccessTokenAppIdPair;)V'),
 ('Lnd0;','f(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lu4b;)V'),
 ('Lxc0;','c(Lcom/facebook/appevents/FlushReason;)V'),
 ('Lxc0;','d(Lcom/facebook/appevents/FlushReason;)V'),
]
FACEBOOK_FLUSH='f(Lcom/facebook/appevents/FlushReason;Lvoa;)Lq42;'


class MarketingFixture(TrackingFixture):
    def __init__(self,*args):
        super().__init__(*args)
        owners={COMPANION,ENABLEMENT,'Lbm1;','Lxl1;','Lhl1;'}
        self.native.update(key for key in self.rows if key[0] in owners or key[0]==BRAZE and key[1].startswith('access$'))
        self.braze_companion=self.new(COMPANION)
        self.braze_context=self.new(ROOT+'HorizonApplication;')
        self.statics[BRAZE+'->Companion:'+COMPANION]=self.braze_companion
        self.statics[BRAZE+'->brazeClassLock:Ljava/util/concurrent/locks/ReentrantLock;']=self.new('Ljava/util/concurrent/locks/ReentrantLock;')
        self.statics['Lcom/braze/enums/DataStoreKey;->SDK_ENABLEMENT:Lcom/braze/enums/DataStoreKey;']=self.new('Lcom/braze/enums/DataStoreKey;')
        self.statics['Lcom/braze/support/BrazeLogger;->INSTANCE:Lcom/braze/support/BrazeLogger;']=self.new('Lcom/braze/support/BrazeLogger;')
        for priority in ('I','V','W'):
            self.statics['Lcom/braze/support/BrazeLogger$Priority;->'+priority+':Lcom/braze/support/BrazeLogger$Priority;']=self.new('Lcom/braze/support/BrazeLogger$Priority;')
        self.braze_store={}
        self.statics['Lfq3;->a:Ljava/util/Set;']=Reference(set(),'Ljava/util/Set;')

    def invoke(self,target,args):
        if target=='Lbo/app/pe;-><init>(Landroid/content/Context;)V':
            # Vendor storage adapter: the real qe constructor and read/write
            # decisions execute above this persistent-storage boundary.
            assert args[1] is self.braze_context
            args[0].value['fixture-store']=self.braze_store;return None
        if target=='Lcom/braze/storage/DataStoreProvider;->readBoolean(Lcom/braze/enums/DataStoreKey;Ljava/lang/Boolean;)Ljava/lang/Boolean;':
            return args[0].value['fixture-store'].get('disabled',args[2])
        if target=='Lcom/braze/storage/DataStoreProvider;->writeData(Lcom/braze/enums/DataStoreKey;Ljava/lang/Object;)V':
            assert args[1] is self.statics['Lcom/braze/enums/DataStoreKey;->SDK_ENABLEMENT:Lcom/braze/enums/DataStoreKey;']
            args[0].value['fixture-store']['disabled']=args[2];return None
        if target=='Lcom/braze/support/BrazeLogger;->brazelog$default(Lcom/braze/support/BrazeLogger;Ljava/lang/Object;Lcom/braze/support/BrazeLogger$Priority;Ljava/lang/Throwable;ZLkotlin/jvm/functions/Function0;ILjava/lang/Object;)V':return None
        if target=='Lcom/braze/coroutine/BrazeCoroutineScope;->cancelChildren()V':return None
        if target in {'Ljava/util/concurrent/locks/Lock;->lock()V','Ljava/util/concurrent/locks/Lock;->unlock()V'}:return None
        if target=='Lkotlin/jvm/internal/Intrinsics;->c(Ljava/lang/Object;Ljava/lang/Object;)Z':
            return int(args[0].value==args[1].value if isinstance(args[0],Reference) and isinstance(args[1],Reference) else args[0]==args[1])
        if target=='Ljava/util/Set;->contains(Ljava/lang/Object;)Z':return int(args[1] in args[0].value)
        return super().invoke(target,args)


def verify_marketing(f,disabled):
    failures=[]
    # Losing any gate would admit commands, a scheduler, user/event properties,
    # or old on-disk events. All original method bodies remain graph-pinned.
    for owner,sig in FACEBOOK_GATES+[(BRAZE,GUARDED)]:
        code=canonical(f.source.body(owner,sig)).code
        marker=len(code)-f.rows[owner,sig][4]
        for _ in range(3):
            result=f.run(owner,sig,(),stop_at=(marker,))[0]
            if result!=(None if disabled else marker):failures.append('marketing admission '+owner+'->'+sig);break
    code=canonical(f.source.body('Lxc0;',FACEBOOK_FLUSH)).code
    marker=code.index('new-instance v0, Lq42;')
    result=f.run('Lxc0;',FACEBOOK_FLUSH,(f.new('Lcom/facebook/appevents/FlushReason;'),f.new('Lvoa;')),stop_at=(marker,))[0]
    if not (is_zero(result) if disabled else result==marker):failures.append('Facebook direct persisted flush')

    # Permanent disabled predicates also cover the pre-bootstrap window and
    # a cached user preference that previously enabled collection.
    for present in (False,True):
        f.statics[BRAZE+'->instance:'+BRAZE]=0
        f.statics[BRAZE+'->sdkEnablementProvider:'+ENABLEMENT]=0
        if present:
            provider=f.new(ENABLEMENT)
            f.run(ENABLEMENT,'<init>(Landroid/content/Context;)V',(provider,f.braze_context))
            f.statics[BRAZE+'->sdkEnablementProvider:'+ENABLEMENT]=provider
        for previous in (False,True,False):
            f.braze_store['disabled']=Reference(previous,'Ljava/lang/Boolean;')
            actual=f.run(COMPANION,'isDisabled()Z',(f.braze_companion,))[0]
            if actual!=(1 if disabled else int(present and previous)):failures.append('Braze pre-bootstrap disabled predicate')
    # Use the SDK's real enable/disable implementation and native persistent
    # writes, rather than replacing the SDK singleton or faking disableSdk.
    for method in ('enableSdk','disableSdk','enableSdk'):
        f.statics[BRAZE+'->areOutboundNetworkRequestsOffline:Z']=0
        f.run(COMPANION,method+'(Landroid/content/Context;)V',(f.braze_companion,f.braze_context))
        wanted=disabled or method=='disableSdk'
        if f.braze_store['disabled'].value!=wanted:failures.append('Braze persisted state '+method)
        if f.statics[BRAZE+'->areOutboundNetworkRequestsOffline:Z']!=int(wanted):failures.append('Braze outbound state '+method)
        assert is_zero(f.statics[BRAZE+'->instance:'+BRAZE]),'Braze disablement constructed an SDK singleton'
    for requested in (0,1,0):
        f.run(COMPANION,'setOutboundNetworkRequestsOffline(Z)V',(f.braze_companion,requested))
        if f.statics[BRAZE+'->areOutboundNetworkRequestsOffline:Z']!=(1 if disabled else requested):failures.append('Braze later offline override')
    for requested in (0,1,0):
        provider=f.statics[BRAZE+'->sdkEnablementProvider:'+ENABLEMENT]
        f.run(ENABLEMENT,'b(Z)V',(provider,requested))
        if f.braze_store['disabled'].value!=(True if disabled else bool(requested)):failures.append('Braze later stored override')
        actual=f.run(ENABLEMENT,'a()Z',(provider,))[0]
        if actual!=(1 if disabled else requested):failures.append('Braze internal stored predicate')
    # Fresh and post-consent/login bootstrap attempts must disable natively
    # before config, lifecycle/content-card subscribers or observer jobs exist.
    for sig in ('e('+MANAGER+')V','g()V'):
        manager=f.new(MANAGER,{MANAGER+'->a:Landroid/app/Application;':f.braze_context})
        code=canonical(f.source.body(MANAGER,sig)).code
        marker=len(code)-f.rows[MANAGER,sig][4]
        for _ in range(3):
            f.braze_store['disabled']=Reference(False,'Ljava/lang/Boolean;')
            result=f.run(MANAGER,sig,(manager,),stop_at=(marker,))[0]
            if disabled:
                if result is not None or not f.braze_store['disabled'].value:failures.append('Braze native bootstrap disable '+sig)
                assert not manager.value[MANAGER+'->k:Z'] and not manager.value[MANAGER+'->l:Z']
            elif result!=marker:failures.append('Braze original bootstrap boundary')
    sig='d('+MANAGER+'Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'
    code=canonical(f.source.body(MANAGER,sig)).code;marker=len(code)-f.rows[MANAGER,sig][4]
    result=f.run(MANAGER,sig,(),stop_at=(marker,))[0]
    if not (result is f.unit if disabled else result==marker):failures.append('Braze consent/user observer admission')
    assert not failures,'Marktplaats marketing remains: '+'; '.join(failures)
