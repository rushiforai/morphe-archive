"""Exercise the shipped redirect clone/send region, including suspended results.

The fixture models URL parsing, attribute-map copying and IO as boundaries;
the original clone/key implementations are pinned alongside the coroutine graph.
"""
from rtl_vm import Reference, VmThrown
from vi_vm import AUTH, SENDER, SENDER_SIG, REDIRECT, REDIRECT_SIG

REQUEST='Lio/ktor/client/request/HttpRequestBuilder;'
CONT='Lio/ktor/client/plugins/HttpRedirect$Plugin$handleCall$1;'
REF='Lkotlin/jvm/internal/Ref$ObjectRef;'
ARTICLE='https://pb-api.vi.nl/domain/200/news/2151890?scope=premium'


def verify_redirects(f, enabled):
    f.statics['Lio/ktor/http/HttpHeaders;->INSTANCE:Lio/ktor/http/HttpHeaders;']=Reference({},'Lio/ktor/http/HttpHeaders;')

    def prepare(iap=False):
        f.statics[AUTH+'->proUser:Z']=0;f.pro=False;f.iap=iap
        f.required_result=f.network_result=None
        req=f.request(ARTICLE)
        f.run(SENDER,SENDER_SIG,(req,Reference({},'Landroid/content/Context;'),Reference({},'Lio/ktor/client/plugins/Sender;'),0))
        req.value['headers']['Authorization']='session-fixture'
        return req

    def redirect(req, url, network=None):
        source_headers=dict(req.value['headers'])
        f.network_result=network
        cont=f.new(CONT);holder=f.new(REF,{REF+'->element:Ljava/lang/Object;':req})
        regs={'v0':Reference({},'Lio/ktor/client/plugins/Sender;'),'v1':1,
              'v2':Reference({},'Lio/ktor/client/HttpClient;'),'v3':Reference({},REDIRECT),
              'v4':f.suspended,'v5':cont,'v6':1,'v7':req,
              'v8':f.new(REF,{REF+'->element:Ljava/lang/Object;':f.response}),
              'v9':req.value['url'].value.netloc,'v10':Reference('https','Lio/ktor/http/URLProtocol;'),
              'v11':holder,'v12':url}
        # Actual native clone -> Location -> Authorization stripping -> spill ->
        # send -> suspend/response. No hand-written redirect policy in fixture.
        result,frame=f.run(REDIRECT,REDIRECT_SIG,start=130,stop_at=(212+int(enabled),),registers=regs)
        new=holder.value[REF+'->element:Ljava/lang/Object;']
        assert new is not req and f.network_requests[-1] is new
        assert new.value['headers']['required-fixture']=='retained'
        assert new.value['headers']['session-fixture']=='retained'
        assert req.value['headers']==source_headers, 'VI redirected source headers were mutated'
        return new,result,frame,cont

    targets=[('https://elsewhere.invalid/collect',False),
             ('https://pb-api.vi.nl/auth/session/refresh?scope=premium',False),
             ('https://pb-api.vi.nl:444/domain/200/news/1?scope=premium',False),
             ('http://pb-api.vi.nl/domain/200/news/1?scope=premium',False),
             ('https://pb-api.vi.nl/domain/200/news/1?scope=public',False),
             ('https://pb-api.vi.nl/domain/200/news/1?scope=premium&scope=public',False),
             ('https://pb-api.vi.nl:443/domain/200/news/path?scope=premium&path=%2Fpro%2Fx',True)]
    for iap in (False,True):
        for target,allowed in targets:
            req=prepare(iap);before=dict(req.value['headers'])
            new,_,_,_=redirect(req,target)
            assert ('x-app-article' in new.value['headers'])==(iap or enabled and allowed), 'VI article header leaked through a redirect outside its scoped route'
            assert req.value['headers']==before
            assert ('Authorization' in new.value['headers'])==(req.value['url'].value.netloc==new.value['url'].value.netloc), ('native Authorization handling',target,sorted(new.value['headers']))

    # Ownership survives allowed hops; once removed it cannot reappear merely
    # because a later redirect returns to the article route.
    req=prepare(iap=not enabled)
    for target,present in [(ARTICLE,True),('https://elsewhere.invalid/',not enabled),(ARTICLE,not enabled)]:
        req,_,_,_=redirect(req,target)
        assert ('x-app-article' in req.value['headers'])==present

    # Native policy does not extend header delivery to non-GET redirects.
    req=prepare(iap=not enabled);req.value['method']='POST'
    new,_,_,_=redirect(req,ARTICLE)
    assert ('x-app-article' in new.value['headers'])==(not enabled)

    req=prepare(iap=not enabled);new,result,_,cont=redirect(req,targets[0][0],f.suspended)
    assert result is f.suspended and cont.value[CONT+'->label:I']==1
    assert ('x-app-article' in new.value['headers'])==(not enabled)
    # Resume the actual saved branch, stopping just before native response
    # inspection. No second send or header addition may occur on resume.
    before=len(f.network_requests)
    _,frame=f.run(REDIRECT,REDIRECT_SIG,start=25,stop_at=(220+int(enabled),),registers={'v1':f.response,'v2':cont})
    assert frame['v1'] is f.response and len(f.network_requests)==before
    error=Reference({},'Ljava/io/IOException;')
    try:f.run(REDIRECT,REDIRECT_SIG,start=25,registers={'v1':Reference({'exception':error},'Lkotlin/Result$Failure;'),'v2':cont})
    except VmThrown as thrown:assert thrown.value is error
    else:raise AssertionError('VI redirect swallowed resumed native error')
    req=prepare()
    try:redirect(req,targets[0][0],VmThrown(error))
    except VmThrown as thrown:assert thrown.value is error
    else:raise AssertionError('VI redirect swallowed native transport error')
    f.network_result=None
