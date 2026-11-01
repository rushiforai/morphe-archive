"""Execute shipped ad loaders, completion states and optional-view lifetimes."""
import re
from brabant_smali import canonical
from marktplaats_vm import Fixture,LIST
from rtl_vm import Reference,VmThrown,is_zero

ROOT='Lcom/horizon/android/'
HOME=ROOT+'feature/feeds/homepage/ui/e;'
HOME_UI=ROOT+'feature/feeds/homepage/ui/HomePageFeedComposeViewModel$uiState$1;'
VIP=ROOT+'feature/vip/feature/advertising/b;'
VIP_LOAD=ROOT+'feature/vip/feature/advertising/VipComposableBannerViewModel$loadBanner$1;'
REPO=ROOT+'core/advertising/nativead/a;'
SPONSORED=ROOT+'core/advertising/nativead/NativeAdRepo$getSponsoredAd$1;'
TARGET=ROOT+'core/advertising/targeting/a;'
AD_TARGET=ROOT+'core/advertising/targeting/AdTargetingRepository$requestDisplayTargetingForAd$1;'
LRP_TARGET=ROOT+'core/advertising/targeting/AdTargetingRepository$requestDisplayTargetingForListing$2;'
CONTAINER=ROOT+'core/advertising/nativead/view/NativeAdContainer;'
POSITION=ROOT+'core/datamodel/BannerTargetingPosition;'
STATUS=ROOT+'core/datamodel/resource/ResourceStatus;'
CONFIG=ROOT+'core/datamodel/TargetingConfiguration;'
SEARCH=ROOT+'feature/search/search/usecase/a;'
FETCH=ROOT+'feature/search/search/usecase/NativeSearchAdsUseCase$fetchNativeAdvertisements$2;'
SUSPEND='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
FUNCTION='Lkotlin/jvm/functions/Function0;'
S2I='a(Landroid/content/Context;Landroid/view/ViewGroup;'+CONFIG+'[Lok;Ljava/lang/String;'+FUNCTION*3+')V'
ADMISSIONS=[
    (CONTAINER,'a(','void'),('Lal;','b(','void'),('Lida;','a(','void'),
    (ROOT+'core/advertising/banners/tracking/b;','a(','void'),
    (ROOT+'core/advertising/banners/tracking/a;','a(','unit'),
    (REPO,'c(','unit'),(SEARCH,'b(','unit'),(SEARCH,'c(','unit'),(REPO,'a(','null'),
    (VIP,'b(','void'),('Lxvh;','b(','void')]


class AdFixture(Fixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.unit=Reference({},'Lkotlin/Unit;');self.suspended=Reference({},'Lkotlin/coroutines/intrinsics/CoroutineSingletons;')
        self.statics['Lkotlin/Unit;->a:Lkotlin/Unit;']=self.unit
        self.statics['Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;']=self.suspended
        # Retained callbacks read this static only to trigger class initialization;
        # its membership is not consulted by the executed state transition.
        self.statics[ROOT+'feature/vip/d;->B2:Ljava/util/Set;']=Reference(set(),'Ljava/util/LinkedHashSet;')
        owners={POSITION,STATUS,'Ld41;','Liyh;','Lc0i;',VIP,TARGET,'Lbzf;','Lrzc;',CONFIG,'Ls2d;','Lxmh;'}
        self.native.update(key for key in self.rows if key[0] in owners)
        for owner in (POSITION,STATUS):self.run(owner,'<clinit>()V')
        self.run('Liyh;','<clinit>()V')
        for owner in ('Lacc;','Lzbc;','Lxbc;'):
            self.statics[owner+'->a:'+owner]=self.new(owner)
        self.emit_wait=False
        for sig,m in self.declarations.classes[REPO].methods.items():
            if not sig.startswith('morphe'):continue
            assert sig=='morpheNoAd()Lrzc;' and m.access_flags==9
            local=int(re.search(r'\.locals (\d+)',self.source.body(REPO,sig))[1]);assert local==7
            self.rows[REPO,sig]=(REPO,sig,9,local,0,'');self.native.add((REPO,sig))

    def signature(self,owner,prefix):
        matches=[sig for o,sig in self.rows if o==owner and sig.startswith(prefix)]
        assert len(matches)==1,(owner,prefix,matches)
        return matches[0]

    def invoke(self,target,args):
        if target=='Ljava/lang/Object;->clone()Ljava/lang/Object;':
            assert isinstance(args[0],Reference) and args[0].descriptor.startswith('[')
            return Reference(list(args[0].value),args[0].descriptor)
        if target=='Lkotlin/ResultKt;->b(Ljava/lang/Object;)V':
            if isinstance(args[0],VmThrown):raise args[0]
            return None
        if target=='Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V':
            args[0].value['message']=args[1];return None
        if target=='Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;':return args[0].value.pop(args[1],0)
        if target==FUNCTION+'->invoke()Ljava/lang/Object;' and args[0].descriptor==FUNCTION:
            self.events.append(('callback',args[0].value['tag']));return self.unit
        if target=='Lkotlinx/coroutines/flow/s0;->getValue()Ljava/lang/Object;':return args[0].value['state']
        if target=='Lkotlinx/coroutines/flow/s0;->m(Ljava/lang/Object;Ljava/lang/Object;)Z':
            args[0].value['state']=args[2];self.events.append(('state',args[2]));return 1
        if target in {'Lpy5;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
                      'Lkotlinx/coroutines/flow/o0;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'}:
            self.events.append(('emit',args[1]));return self.suspended if self.emit_wait else self.unit
        if target==ROOT+'feature/vip/d;->q()'+VIP:return args[0].value['fixture-ad-model']
        if target=='Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;':return args[0]
        if target=='Ljava/lang/Number;->intValue()I':return args[0].value
        if target=='Ljava/util/Map;->entrySet()Ljava/util/Set;':
            return Reference([Reference({'key':k,'value':v},'Ljava/util/Map$Entry;') for k,v in args[0].value.items()],'Ljava/util/Set;')
        if target in {'Ljava/util/Set;->iterator()Ljava/util/Iterator;','Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;'}:
            return Reference({'iterator':iter(args[0].value)},'Ljava/util/Iterator;')
        if target=='Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;':return Reference(args[0].value['key'],'Ljava/lang/Integer;')
        if target=='Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;':return args[0].value['value']
        if target=='Lkotlin/collections/e;->o(Ljava/lang/Iterable;)Ljava/util/Map;':
            # Kotlin's standard toMap conversion; the native policy decides
            # which entries reach this boundary, including the empty case.
            return Reference(dict(args[0].value),'Ljava/util/LinkedHashMap;')
        if target=='Lkotlin/collections/e;->e()Ljava/util/Map;':return Reference({},'Ljava/util/Map;')
        if target in {'Ljava/util/LinkedHashMap;->clear()V','Ljava/util/ArrayList;->clear()V','Ljava/util/Set;->clear()V'}:
            args[0].value.clear();return None
        if target=='Ljava/util/Set;->remove(Ljava/lang/Object;)Z':
            original=len(args[0].value);args[0].value[:]=[v for v in args[0].value if v is not args[1]]
            return int(original!=len(args[0].value))
        if target=='Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V':
            assert is_zero(args[1]);args[0].value['pending']=[];self.events.append(('handler-cancel',args[0]));return None
        if target=='Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;':return args[0].value.get('fixture-observer',0)
        if target=='Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V':
            args[0].value['listeners'][:]=[v for v in args[0].value['listeners'] if v is not args[1]];return None
        if target in {'Landroid/view/View;->onAttachedToWindow()V','Landroid/view/View;->onDetachedFromWindow()V'}:
            self.events.append(('super',target));return None
        if target=='Landroidx/lifecycle/a0;->i(Ljava/lang/Object;)V':
            args[0].value['observed']=args[1];self.events.append(('live-data',args[1]));return None
        return super().invoke(target,args)


def verify_ad_consumers(f,hidden,group=None):
    failures=[]
    def check(condition,message):
        if not condition:failures.append(message)
    if group in (None,'loaders'):
        # Search must return native absence before touching its banner cache.
        owner='Le13;';sig=f.signature(owner,'q(');code=canonical(f.source.body(owner,sig)).code
        boundary=next(i for i,l in enumerate(code) if 'Le13;->b:Ljava/lang/Object;' in l)+1
        result=f.run(owner,sig,(f.new(owner),0,1,0,0),stop_at=(boundary,))[0]
        check(result==(0 if hidden else boundary),'Marktplaats search banner cache still accessed')
        owner='Lecc;';sig=f.signature(owner,'a(');code=canonical(f.source.body(owner,sig)).code
        boundary=next(i for i,l in enumerate(code) if l.startswith('new-instance') and 'DFPBannerEventHandler;' in l)
        config=f.new('Lrcc;',{'Lrcc;->a:Ljava/lang/String;':'fixture-unit','Lrcc;->b:[Lok;':Reference([],'[Lok;')})
        result=f.run(owner,sig,(f.new(owner),f.new('Landroid/content/Context;'),config,0,0),stop_at=(boundary,))[0]
        check(result==(0 if hidden else boundary),'Marktplaats PubMatic factory remains reachable')
        owner='Ls2i;';code=canonical(f.source.body(owner,S2I)).code
        boundary=next(i for i,l in enumerate(code) if l.startswith('new-instance') and 'Lrcc;' in l)
        configuration=f.new(CONFIG,{CONFIG+'->adUnitId:Ljava/lang/String;':'fixture-unit'})
        callbacks=[Reference({'tag':tag},FUNCTION) for tag in ('start','loaded','failed')]
        f.events.clear()
        result=f.run(owner,S2I,(f.new(owner),f.new('Landroid/content/Context;'),f.new('Landroid/view/ViewGroup;'),configuration,
                    Reference([],'[Lok;'),'fixture-placement',*callbacks),stop_at=(boundary,))[0]
        check(f.events==[('callback','failed' if hidden else 'start')],'Marktplaats banner callback did not complete exactly once')
        check(result==(None if hidden else boundary),'Marktplaats callback loader still reaches banner construction')
        # Real VIP callbacks, rather than a fixture claiming an ad loaded:
        # the error callback writes the shipped failed state into its StateFlow.
        for cases,field in [((11,12,13),'i'),((14,15,16),'g')]:
            state=f.new('Lkotlinx/coroutines/flow/s0;',{'state':f.statics['Lacc;->a:Lacc;']})
            model=f.new(VIP,{VIP+'->'+field+':Lkotlinx/coroutines/flow/s0;':state})
            fragment=f.new(ROOT+'feature/vip/d;',{'fixture-ad-model':model})
            native_callbacks=[f.new('Lc0i;',{'Lc0i;->a:B':case,'Lc0i;->b:'+ROOT+'feature/vip/d;':fragment}) for case in cases]
            f.events.clear()
            f.run(owner,S2I,(f.new(owner),f.new('Landroid/content/Context;'),f.new('Landroid/view/ViewGroup;'),configuration,
                           Reference([],'[Lok;'),'fixture-placement',*native_callbacks),stop_at=(boundary,))
            check(state.value['state'] is f.statics[('Lxbc;' if hidden else 'Lacc;')+'->a:'+('Lxbc;' if hidden else 'Lacc;')], 'Marktplaats VIP loading state stranded')
            route=f.run('Lbj7;','b(Lbcc;Lkotlin/jvm/functions/Function1;Lh93;I)V',
                        (state.value['state'],0,0,0),start=41,stop_at=(46,50))[0]
            check(route==(46 if hidden else 50),'Marktplaats failed VIP ad still reserves visible UI')
        # The native constructor starts display placements in ybc (unset).
        # Preserve visible loading/loaded states as positive controls, while
        # the untouched renderer leaves unset/failed placements empty.
        for owner in ('Lacc;','Lzbc;','Lxbc;','Lybc;'):
            route=f.run('Lbj7;','b(Lbcc;Lkotlin/jvm/functions/Function1;Lh93;I)V',
                        (f.new(owner),0,0,0),start=41,stop_at=(46,50))[0]
            check(route==(50 if owner in ('Lacc;','Lzbc;') else 46),'Marktplaats native initial/error display state reserves a tile')
    if group in (None,'home'):
        sig='c(Ldx6;)V';code=canonical(f.source.body(HOME,sig)).code
        boundary=next(i for i,l in enumerate(code) if l=='move-object/from16 v0, p0')
        for action in ('Lww6;','Lsw6;','Low6;','Lyw6;','Lrw6;','Lbx6;','Lcx6;','Lvw6;'):
            result=f.run(HOME,sig,(f.new(HOME),f.new(action)),stop_at=(boundary,))[0]
            blocked=hidden and action in {'Lww6;','Lsw6;','Low6;','Lyw6;'}
            check(result==(None if blocked else boundary),'Marktplaats ad action remained or genuine feed action blocked')
        # Run the native state-to-view conversion. No loaded object means no
        # iw6 tile is built; no synthetic placeholder/loaded ad is supplied.
        for state in ({},{3:f.new('Lqn6;')},{7:0}):
            current=f.new('Lix6;');work=f.new(HOME_UI,{HOME_UI+'->L$0:Ljava/lang/Object;':current,
                HOME_UI+'->L$1:Ljava/lang/Object;':Reference(state,'Ljava/util/LinkedHashMap;')})
            _,frame=f.run(HOME_UI,SUSPEND,(work,f.unit),stop_at=(79,))
            check(frame['v8'].value=={},'Marktplaats absent/loading home ad reserved a tile')
    if group in (None,'lifetime'):
        f.events.clear();code=canonical(f.source.body(CONTAINER,'onAttachedToWindow()V')).code
        boundary=next(i for i,l in enumerate(code) if 'getViewTreeObserver()' in l)
        result=f.run(CONTAINER,'onAttachedToWindow()V',(f.new(CONTAINER),),stop_at=(boundary,))[0]
        check(len(f.events)==1 and f.events[0][0]=='super','Marktplaats native view lifecycle super changed')
        check(result==(None if hidden else boundary),'Marktplaats native-ad observer/timer still attached')

    assert not failures, "; ".join(failures)


def verify_ad_admission(f,hidden):
    failures=[];impressions_gated=False
    for owner,prefix,kind in ADMISSIONS:
        sig=f.signature(owner,prefix);code=canonical(f.source.body(owner,sig)).code
        # Every admission/sink must finish before its first original operation.
        # For the nullable repository, execute the initial instance-of then stop;
        # its index1 marker is distinguishable from the native null result0.
        marker=next(i for i,line in enumerate(code) if line.startswith('instance-of'))+1 if kind=='null' else len(code)-f.rows[owner,sig][4]
        parameters=re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]',sig.split('(',1)[1].split(')',1)[0])
        assert not {'J','D'}&set(parameters),'Wide admission arguments need explicit fixture values'
        args=[f.new(owner)]+[0]*len(parameters)
        result=f.run(owner,sig,args,stop_at=(marker,))[0]
        expected={'void':None,'unit':f.unit,'null':0}[kind] if hidden else marker
        correct=result is expected if kind in ('void','unit') and hidden else result==expected
        if not correct:failures.append(owner+'->'+sig)
        if owner==SEARCH and prefix=='c(':impressions_gated=result is f.unit
    # Execute the actual null-response consumer, whose real path clears header
    # and list observables. When its native tracking leaf is disabled, it also
    # completes synchronously without starting an impression coroutine.
    f.native.add((SEARCH,f.signature(SEARCH,'c(')))
    for complete in ([False,True] if impressions_gated else [False]):
        header=f.new('Lp3a;');listing=f.new('Lp3a;')
        case=f.new(SEARCH,{SEARCH+'->d:Lp3a;':header,SEARCH+'->e:Lp3a;':listing})
        work=f.new(FETCH,{FETCH+'->this$0:'+SEARCH:case})
        f.events.clear()
        result,frame=f.run(FETCH,SUSPEND,(work,0),start=42,registers={'v0':f.suspended,'v2':2,'v4':0},stop_at=() if complete else (96,))
        assert f.events==[('live-data',0),('live-data',0)],'Marktplaats null native-ad response did not clear both placements'
        assert result is f.unit if complete else result==96
        assert frame['v'+str(f.rows[FETCH,SUSPEND][3]+1)].value==[],'Marktplaats native no-content path was not an empty list'
    assert not failures,'Marktplaats ad admission/request still active: '+ '; '.join(failures)


def verify_ad_fallbacks(f,hidden):
    failures=[]
    for owner,needle,key in [
        (AD_TARGET,'iget-object p1, p0, '+AD_TARGET+'->this$0:'+TARGET,'fixture-urn'),
        (LRP_TARGET,'iget-object v0, v5, '+LRP_TARGET+'->this$0:'+TARGET,0),
        (SPONSORED,'iget-object p1, p0, '+SPONSORED+'->this$0:'+REPO,None),
        (VIP_LOAD,'invoke-virtual {v0, p1}, Li41;->b('+CONFIG+')Lqj;',None)]:
        code=canonical(f.source.body(owner,SUSPEND)).code;marker=code.index(needle)
        for wait in (False,True):
            jobs=Reference({'fixture-urn':f.new('Ls8f;')},'Ljava/util/HashMap;')
            repo=f.new(TARGET,{TARGET+'->f:Ljava/util/HashMap;':jobs,TARGET+'->d:Lkotlinx/coroutines/flow/o0;':f.new('Lkotlinx/coroutines/flow/o0;')})
            if owner in (AD_TARGET,LRP_TARGET):
                fields={owner+'->this$0:'+TARGET:repo}
                if owner==AD_TARGET:fields[owner+'->$adUrn:Ljava/lang/String;']='fixture-urn'
            elif owner==SPONSORED:fields={owner+'->L$0:Ljava/lang/Object;':f.new('Lpy5;'),owner+'->this$0:'+REPO:f.new(REPO)}
            else:fields={owner+'->this$0:'+VIP:f.new(VIP),owner+'->$configuration:'+CONFIG:f.new(CONFIG)}
            work=f.new(owner,fields)
            f.events.clear();f.emit_wait=wait
            result=f.run(owner,SUSPEND,(work,f.unit),stop_at=(marker,))[0]
            expected=f.suspended if wait and owner!=VIP_LOAD else f.unit
            if result is not expected and hidden:failures.append(owner+' native no-content result')
            if not hidden:assert result==marker and not f.events
            if hidden and result is expected:
                if owner==VIP_LOAD:assert not f.events
                else:
                    assert len(f.events)==1 and f.events[0][0]=='emit','Marktplaats disabled ad did not complete exactly once'
                    data=f.events[0][1]
                    if owner==SPONSORED:
                        assert data.descriptor=='Lrzc;' and data.value['Lrzc;->a:'+STATUS] is f.enum(STATUS,'ERROR')
                        assert data.value['Lrzc;->b:Ljava/lang/Object;']==0,'Marktplaats advertised a loaded sponsored body'
                    else:
                        assert data.descriptor=='Lbzf;' and data.value['Lbzf;->a:Ljava/lang/String;']==key,'Marktplaats lost native targeting failure/key'
                    if owner==AD_TARGET:assert not jobs.value,'Marktplaats targeting job retained after no-content completion'
                    if wait:
                        result=f.run(owner,SUSPEND,(work,f.unit))[0]
                        assert result is f.unit and len(f.events)==1,'Marktplaats no-content resume emitted twice'
            # Retain native coroutine input failure and invalid-label behavior.
            broken=f.new(owner,{owner+'->label:I':99})
            try:f.run(owner,SUSPEND,(broken,f.unit))
            except VmThrown as e:assert e.value.descriptor=='Ljava/lang/IllegalStateException;'
            else:raise AssertionError('Marktplaats lost invalid ad coroutine state')
            incoming=VmThrown(f.new('Ljava/lang/IllegalArgumentException;'))
            fresh=f.new(owner,{owner+'->L$0:Ljava/lang/Object;':f.new('Lpy5;')} if owner==SPONSORED else {})
            try:f.run(owner,SUSPEND,(fresh,incoming),stop_at=(marker,))
            except VmThrown as e:assert e.value is incoming.value
            else:raise AssertionError('Marktplaats lost ad coroutine failure')
            if owner!=VIP_LOAD:
                pending=f.new(owner,{owner+'->label:I':2,owner+'->L$0:Ljava/lang/Object;':0})
                cancellation=VmThrown(f.new('Ljava/util/concurrent/CancellationException;'));before=len(f.events)
                try:f.run(owner,SUSPEND,(pending,cancellation))
                except VmThrown as e:assert e.value is cancellation.value
                else:raise AssertionError('Marktplaats lost cancellation while awaiting its ad-result subscriber')
                assert len(f.events)==before,'Marktplaats cancelled completion emitted again'
    f.emit_wait=False
    assert not failures,'Marktplaats ad fallback still starts a request: '+ '; '.join(failures)


def verify_ad_cleanup(f,hidden):
    # Native cleanup must remain valid when the disabled paths produce no
    # SDK clients. Also check removal of any already registered observer/set.
    loader_jobs=Reference({},'Ljava/util/LinkedHashMap;')
    state=f.new('Lkotlinx/coroutines/flow/s0;',{'state':Reference({},'Ljava/util/Map;')})
    helper=f.new('Lsn6;',{'Lsn6;->c:Ljava/util/LinkedHashMap;':loader_jobs,'Lsn6;->a:Lkotlinx/coroutines/flow/s0;':state})
    f.run(HOME,'onCleared()V',(f.new(HOME,{HOME+'->f:Lsn6;':helper}),))
    assert loader_jobs.value=={} and state.value['state'].value=={}
    clients=Reference([],'Ljava/util/ArrayList;')
    f.run(VIP,'onCleared()V',(f.new(VIP,{VIP+'->l:Ljava/util/ArrayList;':clients}),))
    assert clients.value==[]
    for registered in (False,True):
        watched=Reference([],'Ljava/util/LinkedHashSet;');impressions=Reference([],'Ljava/util/LinkedHashSet;')
        view=f.new(CONTAINER,{CONTAINER+'->c:Lal;':f.new('Lal;',{'Lal;->c:Ljava/util/LinkedHashSet;':watched}),
             CONTAINER+'->e:Lida;':f.new('Lida;',{'Lida;->d:Ljava/util/LinkedHashSet;':impressions})})
        observer=Reference({'listeners':[view] if registered else []},'Landroid/view/ViewTreeObserver;')
        view.value['fixture-observer']=observer
        if registered:watched.value.append(view);impressions.value.append(view)
        f.events.clear();f.run(CONTAINER,'onDetachedFromWindow()V',(view,))
        assert not observer.value['listeners'] and not watched.value and not impressions.value
        assert f.events==[('super','Landroid/view/View;->onDetachedFromWindow()V')]
    handler=f.new('Landroid/os/Handler;',{'pending':[f.new('Ljava/lang/Runnable;')]})
    batch=Reference({'fixture-event':f.new('Lqkg;')},'Ljava/util/LinkedHashMap;');members=Reference([view],'Ljava/util/LinkedHashSet;')
    tracker=f.new('Lal;',{'Lal;->d:Landroid/os/Handler;':handler,'Lal;->b:Ljava/util/LinkedHashMap;':batch,'Lal;->c:Ljava/util/LinkedHashSet;':members})
    f.run('Lal;','a()V',(tracker,))
    assert not handler.value['pending'] and not batch.value and not members.value
