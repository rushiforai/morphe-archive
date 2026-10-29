"""Run the original/emitted article policies without exporting key/header values."""
import hmac
import hashlib
from vi_vm import Fixture, DATA, IAP, SENDER, HELPER, AUTH, CONT
from rtl_vm import Reference, VmThrown

DATA_SIGS=('getArticleDetail(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;',
           'getArticleDetail(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;')
GEN='generateInAppSubscriptionAuthValue()Ljava/lang/String;'


def verify_scope(f, enabled):
    for pro in (False,True):
        for iap in (False,True):
            f.pro,f.iap=pro,iap;f.statics[AUTH+'->proUser:Z']=int(pro)
            for sig,value in zip(DATA_SIGS,(2151890,'/pro/sample')):
                before=(f.pro,f.iap,f.statics[AUTH+'->proUser:Z'])
                f.requests.clear()
                f.run(DATA,sig,(f.new(DATA),value,0))
                assert len(f.requests)==1 and f.requests[0][1:3]==(200,value)
                assert (f.requests[0][3] is f.premium)==(enabled or pro or iap), 'VI body request still uses public scope'
                assert before==(f.pro,f.iap,f.statics[AUTH+'->proUser:Z']), 'VI account state changed'


def verify_generator(f, enabled):
    for amsterdam in (3600,7200):
        for offset in (0,3600,-18000,32400):
            f.device_offset=offset
            f.amsterdam_offset=amsterdam
            f.events.clear()
            value=f.run(IAP,GEN,(f.subscription,))[0]
            # Compare privately; assertion output must never include the actual header.
            stamp=str(f.now-120 if enabled else f.now-120+offset-amsterdam)
            key=f.statics[IAP+'->hashSecret:Ljava/lang/String;']
            expected=stamp+':'+hmac.new(key.encode(),stamp.encode(),hashlib.sha256).hexdigest()
            assert value==expected, 'VI native header timestamp/formatter changed'
            assert bool(f.events)==(not enabled), 'VI generated header was logged'


def verify_routes(f):
    cases=[('https://pb-api.vi.nl/domain/200/news/2151890?scope=premium','GET',True),
           ('https://pb-api.vi.nl:443/domain/200/news/path?path=%2Fpro%2Fx&scope=premium','GET',True),
           ('http://pb-api.vi.nl/domain/200/news/1?scope=premium','GET',False),
           ('https://pb-api.vi.nl.evil.invalid/domain/200/news/1?scope=premium','GET',False),
           ('https://pb-api.vi.nl:444/domain/200/news/1?scope=premium','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/most-read?scope=premium','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1?scope=public','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1?scope=premium&scope=public','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1?scope=premium&scope=','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1?scope=','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1?scope=premium','POST',False),
           ('https://pb-api.vi.nl/auth/session/refresh?scope=premium','GET',False),
           ('https://pb-api.vi.nl/domain/200/news/1/extra?scope=premium','GET',False)]
    for pro in (False,True):
        f.statics[AUTH+'->proUser:Z']=int(pro)
        for native_iap in (0,1):
            for url,verb,allowed in cases:
                request=f.request(url,verb)
                actual=f.run(SENDER,HELPER,(request,native_iap))[0]
                assert actual==int(bool(native_iap) or (allowed and not pro)), 'VI article header escaped its scoped route'
                assert request.value['headers']=={}, 'VI predicate changed headers/state'
                assert bool(request.value['attributes'])==(allowed and not pro and not native_iap), 'VI redirect ownership must mark only patch-extended requests'

SENDER_SIG='executeCall(Lio/ktor/client/request/HttpRequestBuilder;Landroid/content/Context;Lio/ktor/client/plugins/Sender;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'

def verify_sender(f, enabled):
    f.device_offset=f.amsterdam_offset=3600
    for pro in (False,True):
        for iap in (False,True):
            f.pro,f.iap=pro,iap;f.statics[AUTH+'->proUser:Z']=int(pro)
            req=f.request('https://pb-api.vi.nl/domain/200/news/2151890?scope=premium')
            req.value['headers']['required-fixture']='retained'
            before=(f.iap,f.statics[AUTH+'->proUser:Z'])
            f.run(SENDER,SENDER_SIG,(req,Reference({},'Landroid/content/Context;'),0,0),start=54,stop_at=(70+2*enabled,))
            assert ('x-app-article' in req.value['headers'])==(iap or (enabled and not pro)), 'VI native sender did not attach scoped article header'
            assert req.value['headers']['required-fixture']=='retained'
            assert before==(f.iap,f.statics[AUTH+'->proUser:Z']), 'VI sender mutated account state'


def verify_sender_coroutine(f, enabled):
    """Run the actual sender and its continuation; model only IO/platform calls."""
    def prepare(pro=False,iap=False):
        f.events.clear();f.required_result=f.network_result=None
        f.pro,f.iap=pro,iap;f.statics[AUTH+'->proUser:Z']=int(pro)
        return f.request('https://pb-api.vi.nl/domain/200/news/2151890?scope=premium')

    def send(req):
        return f.run(SENDER,SENDER_SIG,(req,Reference({},'Landroid/content/Context;'),Reference({},'Lio/ktor/client/plugins/Sender;'),0))[0]

    def resume(cont,value):
        return f.run(CONT,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(cont,value))[0]

    def headers(req,pro=False,iap=False):
        assert ('x-app-article' in req.value['headers'])==(iap or (enabled and not pro)), 'VI whole sender header policy'
        assert req.value['headers'].get('required-fixture')=='retained'
        assert req.value['headers'].get('session-fixture')=='retained'
        assert f.statics[AUTH+'->proUser:Z']==int(pro) and f.iap==iap

    for pro in (False,True):
        for iap in (False,True):
            req=prepare(pro,iap)
            assert send(req) is f.response
            headers(req,pro,iap)
            assert [e for e in f.events if e!='sensitive-header-log']==['required-headers','session-auth','network','save-token']

    req=prepare();f.required_result=f.suspended
    assert send(req) is f.suspended
    assert f.events==['required-headers'] and 'x-app-article' not in req.value['headers']
    f.required_result=None
    assert resume(f.required_cont,0) is f.response
    headers(req)
    assert f.events.count('required-headers')==f.events.count('network')==f.events.count('save-token')==1

    req=prepare();f.network_result=f.suspended
    assert send(req) is f.suspended
    before=dict(req.value['headers']);events=list(f.events)
    assert 'save-token' not in events
    assert resume(f.network_cont,f.response) is f.response
    assert req.value['headers']==before and f.events==events+['save-token']
    headers(req)

    for stage in ('required','network'):
        req=prepare();error=Reference({},'Ljava/io/IOException;')
        setattr(f,stage+'_result',VmThrown(error))
        try:send(req)
        except VmThrown as thrown:assert thrown.value is error
        else:raise AssertionError('VI sender swallowed native IO failure')
        assert 'save-token' not in f.events
        if stage=='required':assert f.events==['required-headers']

        req=prepare();setattr(f,stage+'_result',f.suspended)
        assert send(req) is f.suspended
        before=dict(req.value['headers']);events=list(f.events)
        failure=Reference({'exception':error},'Lkotlin/Result$Failure;')
        try:resume(getattr(f,stage+'_cont'),failure)
        except VmThrown as thrown:assert thrown.value is error
        else:raise AssertionError('VI sender swallowed resumed IO failure')
        assert req.value['headers']==before and f.events==events

    prepare()
    invalid=f.new(CONT,{CONT+'->label:I':3})
    try:resume(invalid,0)
    except VmThrown as thrown:assert thrown.value.descriptor=='Ljava/lang/IllegalStateException;'
    else:raise AssertionError('VI invalid continuation label accepted')
    assert not f.events

PAYWALL=('Lnl/vi/feature/articleDetail/ui/components/paywall/PaywallComponentKt;',
         'NativeArticlePaywallComponent(Lnl/vi/feature/articleDetail/data/PaywallBlockItem;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V')
CAROUSEL=('Lnl/vi/feature/articleDetail/ui/components/videoFeed/items/NativeArticleVideoFeedCarouselItemKt;',
          'NativeArticleVideoFeedCarouselItem(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V')
VM='Lnl/vi/feature/articleDetail/ui/viewmodels/NativeArticleViewModel;'
STATE='Lnl/vi/feature/articleDetail/data/NativeArticleViewState;'

def verify_overlay(f, enabled):
    account=f.statics[AUTH+'->proUser:Z']
    result,frame=f.run(*CAROUSEL,(0,Reference({},'Lkotlin/jvm/functions/Function0;'),Reference({},'Lkotlin/jvm/functions/Function1;'),Reference({},'Landroidx/compose/runtime/Composer;'),0),stop_at=(1+enabled,))
    assert frame['v8']==int(enabled), 'VI carousel still selects locked rendering'
    if enabled:
        f.events.clear()
        assert f.run(*PAYWALL,(f.new('Lnl/vi/feature/articleDetail/data/PaywallBlockItem;'),Reference({},'Lkotlin/jvm/functions/Function1;'),Reference({},'Landroidx/compose/runtime/Composer;'),0))[0] is None
        assert not f.events
    assert account==f.statics[AUTH+'->proUser:Z'], 'VI overlay changed real subscription state'

def verify_cache(f, enabled):
    f.statics[AUTH+'->proUser:Z']=0;f.iap=False
    for pro,wall,empty in [(True,True,False),(True,False,False),(False,True,False),(True,False,True)]:
        items=[] if empty else [f.new('Lnl/vi/feature/articleDetail/data/PaywallBlockItem;') if wall else Reference({},'Lnl/vi/feature/articleDetail/data/NewsDetailListItem;')]
        state=f.new(STATE,{STATE+'->isPro:Z':int(pro),STATE+'->contents:Ljava/util/List;':Reference(items,'Ljava/util/ArrayList;')})
        vm=f.new(VM,{VM+'->_nativeArticleViewState:Lkotlinx/coroutines/flow/MutableStateFlow;':Reference(state,'Lkotlinx/coroutines/flow/MutableStateFlow;')})
        f.events.clear();f.run(VM,'checkForReloading()V',(vm,))
        assert f.events.count('article-reload')==int(empty or (enabled and pro and wall)), 'VI cached Pro teaser did not take native reload path'
        assert f.statics[AUTH+'->proUser:Z']==0 and not f.iap
