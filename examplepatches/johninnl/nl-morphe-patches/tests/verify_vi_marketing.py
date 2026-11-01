"""Run VI's typed response getter and cached marketing renderer."""
from rtl_vm import Reference
from vi_consent_vm import ConsentFixture
from vi_marketing_contracts import CONTRACTS,RESPONSE,UI,RENDER,MARKETING,FILTER,EMPTY_GATE


class MarketingFixture(ConsentFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.rows.update({r[:2]:r for r in CONTRACTS})
        self.rows[RESPONSE,FILTER]=(RESPONSE,FILTER,9,4,0,'')
        self.native.add((RESPONSE,FILTER))
        self.native.add((RESPONSE,'getItems()Ljava/util/List;'))

    def invoke(self,target,args):
        if target=='Ljava/util/ArrayList;->size()I':return len(args[0].value)
        return super().invoke(target,args)


def verify_marketing(f,enabled):
    def item(kind,**fields):
        return f.new('Lnl/vi/feature/curated/data/CurationItem$'+kind+';',fields)

    def response(items):
        return f.new(RESPONSE,{RESPONSE+'->items:Ljava/util/List;':items})

    def get(model):return f.run(RESPONSE,'getItems()Ljava/util/List;',(model,))[0]

    article=f.new('Lnl/vi/data/article/Article;',{'Lnl/vi/data/article/Article;->_pro:Ljava/lang/Boolean;':Reference(True,'Ljava/lang/Boolean;')})
    news=item('News',**{'Lnl/vi/feature/curated/data/CurationItem$News;->article:Lnl/vi/data/article/Article;':article})
    match=item('Match');live=item('LiveStream');unknown=item('Unknown')
    # Three independent marketing entries model repeats with different creative
    # fields. The emitted filter must depend exclusively on the native type.
    campaigns=[item('Marketing',fixture_title=title,fixture_url=url)
               for title,url in [('print special','https://shop.invalid/a'),
                                 ('new campaign','https://different.invalid/b'),
                                 ('another creative','https://publisher.invalid/c')]]
    cases=[([],[]),([news,match,live,unknown],[news,match,live,unknown]),
           ([news,campaigns[0],match,campaigns[1],live,campaigns[2],unknown],[news,match,live,unknown]),
           (campaigns,[]),([campaigns[0]]*3,[]),([None,news,campaigns[1]],[None,news])]
    account=dict(f.statics)
    for readonly in (False,True):
        for values,kept in cases:
            original=Reference(tuple(values) if readonly else list(values),'Ljava/util/List;')
            model=response(original);before=tuple(original.value)
            expected=kept if enabled else values
            for _ in range(3):
                result=get(model)
                assert len(result.value)==len(expected) and all(a is b for a,b in zip(result.value,expected)), 'VI home still contains marketing or changed editorial items'
                assert tuple(original.value)==before and model.value[RESPONSE+'->items:Ljava/util/List;'] is original, 'VI marketing filter mutated stored response'
                if not enabled or len(values)==len(kept):assert result is original, 'VI non-marketing list identity changed'
            assert news.value['Lnl/vi/feature/curated/data/CurationItem$News;->article:Lnl/vi/data/article/Article;'] is article
            assert article.value['Lnl/vi/data/article/Article;->_pro:Ljava/lang/Boolean;'].value is True
    assert get(response(0))==0, 'VI null response-list behavior changed'
    assert f.statics==account, 'VI marketing filter changed account/SDK state'

    # The real home UI tests isEmpty before constructing the grid. Run that
    # branch with an all-marketing response, stopping at its original empty arm.
    model=response(Reference(campaigns,'Ljava/util/List;'))
    try:
        f.run(EMPTY_GATE['owner'],EMPTY_GATE['signature'],start=EMPTY_GATE['start'],
              stop_at=(EMPTY_GATE['empty'],),registers={'v1':model,'v12':Reference({},'Landroidx/compose/runtime/Composer;')})
    except AssertionError as error:
        assert str(error)=='VI locked overlay reached Compose' and not enabled, 'VI empty promotion response did not take native empty UI'
    else:assert enabled, 'VI original promotion baseline unexpectedly took empty UI'

    for campaign in campaigns:
        f.events.clear()
        try:f.run(UI,RENDER,(campaign,0,0,0,0,Reference({},'Landroidx/compose/ui/Modifier;'),Reference({},'Landroidx/compose/runtime/Composer;'),0,0))
        except AssertionError as error:
            assert str(error)=='VI locked overlay reached Compose' and not enabled, 'VI cached marketing renderer still reached composition'
        else:assert enabled, 'VI original marketing renderer baseline did not reach composition'
        assert not f.events
