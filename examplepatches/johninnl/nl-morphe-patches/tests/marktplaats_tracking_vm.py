"""Native Marktplaats optional-measurement admission and setup boundaries."""
from brabant_smali import canonical
from marktplaats_ad_requests_vm import AdFixture,ROOT
from rtl_vm import Reference,is_zero

HUB='Lcz9;'
CONFIG=ROOT+'core/tracking/config/a;'
DATADOG=ROOT+'core/tracking/datadog/a;'
GAID=ROOT+'core/tracking/gaid/a;'
HUB_NAMES={'b','g','i','j','k','m','n','o','p'}


class TrackingFixture(AdFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.add((CONFIG,'m()Z'))
        self.statics['Lbdg;->a:Lgq3;']=self.new('Lgq3;')
        self.flag=self.new(ROOT+'core/tracking/config/FeatureSwitches;')
        self.statics[ROOT+'core/tracking/config/FeatureSwitches;->DATADOG_KILL:'+ROOT+'core/tracking/config/FeatureSwitches;']=self.flag
        self.statics['Lc8h;->a:Lkotlin/Lazy;']=Reference({'value':0},'Lkotlin/Lazy;')

    def invoke(self,target,args):
        if target=='Lgq3;->b(Ljava/lang/String;[Ljava/lang/Object;)V':
            self.events.append(('local-log',));return None
        if target=='Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;':return args[0]+args[1]
        if target=='Lkotlin/Lazy;->getValue()Ljava/lang/Object;':return args[0].value['value']
        if target=='Lktc;->a(Lrp5;)Z':
            assert args[1] is self.flag;return args[0].value['kill']
        if target=='Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':
            previous=args[0].value.get(args[1],0);args[0].value[args[1]]=args[2];return previous
        return super().invoke(target,args)


def verify_measurement(f,disabled):
    failures=[]
    # Every analytics sink/command/property-admission path must return before
    # building events, resolving an SDK singleton or accumulating cached keys.
    for owner,sig,flags,local,count,digest in f.rows.values():
        if owner!=HUB or sig.split('(',1)[0] not in HUB_NAMES:continue
        code=canonical(f.source.body(owner,sig)).code;marker=len(code)-count
        result=f.run(owner,sig,(f.new(owner),),stop_at=(marker,))[0]
        if result!=(None if disabled else marker):failures.append('analytics '+sig)
    maps={name:Reference({},'Ljava/util/concurrent/ConcurrentHashMap;') for name in 'ghi'}
    tracker=f.new(HUB,{HUB+'->'+name+':Ljava/util/concurrent/ConcurrentHashMap;':value for name,value in maps.items()})
    for index in range(60):
        for name in ('n','o'):
            f.run(HUB,name+'(Ljava/lang/String;Ljava/lang/String;)V',(tracker,'fixture-'+str(index),'fixture-value'))
    if not all(len(value.value)==(0 if disabled else 60) for value in maps.values()):failures.append('analytics property caches')
    # The app already has a disabled attribution wrapper. Use its genuine
    # object type for every Adjust/Criteo consent input, without SDK creation.
    sig='d(ZZLkm6;)Lwq;';code=canonical(f.source.body('Lei;',sig)).code
    marker=next(i for i,line in enumerate(code) if line=='new-instance p0, Lyq;')
    for adjust in (0,1):
        for criteo in (0,1):
            f.events.clear();result=f.run('Lei;',sig,(adjust,criteo,f.new('Lkm6;')),stop_at=(marker,))[0]
            if disabled or not adjust:
                if not isinstance(result,Reference) or result.descriptor!='Luq;':failures.append('attribution consent '+str((adjust,criteo)))
            else:assert result==marker,'Marktplaats original attribution setup boundary changed'
    # Exercise the real configuration predicate and the bootstrap's native
    # false branch across remote flag changes, before any SDK token/config read.
    provider=f.new('Lktc;',{'kill':0});config=f.new(CONFIG,{'La2;->a:Ljava/lang/Object;':provider})
    lazy=Reference({'value':config},'Lkotlin/Lazy;');bootstrap=f.new(DATADOG,{DATADOG+'->d:Lkotlin/Lazy;':lazy})
    for killed in (0,1,0):
        provider.value['kill']=killed
        wanted=0 if disabled else 1-killed
        actual=f.run(CONFIG,'m()Z',(config,))[0]
        if actual!=wanted:failures.append('Datadog enable predicate')
        result=f.run(DATADOG,'a()V',(bootstrap,),stop_at=(9,))[0]
        if result!=(9 if wanted else None):failures.append('Datadog bootstrap still enabled')
    # An unavailable identifier must not retain a previously cached value, and
    # neither entry may launch a lookup job or touch AdvertisingIdClient.
    for sig in ('a('+GAID+')V','b()V'):
        code=canonical(f.source.body(GAID,sig)).code
        marker=next(i for i,l in enumerate(code) if l.startswith('invoke-static') and 'AdvertisingIdClient;' in l) if sig.startswith('a(') else len(code)-f.rows[GAID,sig][4]
        cached=f.new(GAID,{GAID+'->a:Ljava/lang/String;':'fixture-old-id'})
        result=f.run(GAID,sig,(cached,),stop_at=(marker,))[0]
        if disabled:
            if result is not None or not is_zero(cached.value[GAID+'->a:Ljava/lang/String;']):failures.append('GAID lookup/cache '+sig)
        else:assert result==marker
    # Keep all real activity work outside the exact UserZoom slice. The native
    # slice must jump to its original successor before initialization/callbacks.
    sig='onActivityResumed(Landroid/app/Activity;)V';code=canonical(f.source.body('Lwg;',sig)).code
    start=next(i for i,l in enumerate(code) if l=='sget-object v1, Lc8h;->a:Lkotlin/Lazy;')
    sdk=next(i for i,l in enumerate(code) if 'Le8h;->b(Landroid/app/Activity;)V' in l)
    successor=next(i for i in range(sdk,len(code)) if code[i]=='invoke-interface {v0}, Lz68;->getKoin()Lv68;')
    # A selected inserted goto is immediately before the retained slice anchor.
    entry=start-1 if disabled and code[start-1].startswith('goto') else start
    result=f.run('Lwg;',sig,(f.new('Lwg;'),f.new('Landroid/app/Activity;')),start=entry,stop_at=(sdk,successor))[0]
    if result!=(successor if disabled else sdk):failures.append('UserZoom startup/intercept registration')
    sig=f.signature('Lc8h;','a(');code=canonical(f.source.body('Lc8h;',sig)).code;marker=len(code)-f.rows['Lc8h;',sig][4]
    result=f.run('Lc8h;',sig,(),stop_at=(marker,))[0]
    if result!=(None if disabled else marker):failures.append('UserZoom synchronous study')
    assert not failures,'Marktplaats optional measurement remains: '+ '; '.join(failures)
