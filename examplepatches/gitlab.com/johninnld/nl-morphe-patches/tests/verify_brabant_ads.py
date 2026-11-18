"""Execute actual selected Brabant callback, list and no-ad player graphs."""
from brabant_vm import Fixture
from brabant_ads_contracts import ADS_CONTRACTS
from rtl_vm import Reference, is_zero

PINCH = 'Lnl/pinch/optoutadvertising/sdk/ui/OptOutAdView;'
EMBED = 'Lcom/bluebillywig/bbnativeshared/model/EmbedObject;'


def verify_feed_models(f):
    f.native |= {(r[0],r[1]) for r in ADS_CONTRACTS if r[1].startswith('<init>(')}
    f.native |= {('Lnt;', 'a(Ljava/util/ArrayList;Ljava/lang/String;Lf34;)Lm9;'),
                 ('Lnt;', 'e(Lf34;Ljava/lang/String;)Lhv1;'), ('Loi4;', 'i(Ljava/lang/String;Ly9;Lhv1;)Lm9;')}
    def definitions():
        return Reference([Reference({'Lw07;->a:Ljava/lang/Object;':Reference(i,'Ljava/lang/Integer;'),
                                     'Lw07;->b:Ljava/lang/Object;':f.new('Ly9;')},'Lw07;') for i in range(3)], 'Ljava/util/ArrayList;')
    selector, targeting = f.new('Lnt;'), f.new('Lf34;')
    # Execute the real selector/factories and caller branch. Definitions still
    # drain normally, while the caller omits only the resulting tablet ad item.
    news = [f.new('Lrj6;') for _ in range(3)]; output=Reference(list(news),'Li85;'); defs=definitions()
    result,_ = f.run('Lpl6;', 'h(Lkk6;Le34;)Llk6;', start=143, stop_at={148}, registers={
        'v23':1,'v8':selector,'v6':defs,'v1':'actual-section','v4':targeting,'v3':output})
    assert result == 148 and len(output.value) == 3 and all(a is b for a,b in zip(output.value,news)), 'Tablet top ad model remains'
    assert len(defs.value) == 2, 'Keep native placement-definition consumption'
    # Nested article/card metadata and children retain identity with a null ad.
    defs=definitions()
    _,frame = f.run('Lpl6;', 'h(Lkk6;Le34;)Llk6;', start=365, stop_at={367}, registers={
        'v8':selector,'v6':defs,'v1':'actual-section','v4':targeting})
    assert is_zero(frame['v33']), 'Nested feed ad model remains'
    children = Reference(news,'Ljava/util/ArrayList;'); lead=f.new('Lrj6;')
    _,frame = f.run('Lpl6;', 'h(Lkk6;Le34;)Llk6;', start=410, stop_at={416}, registers={
        'v0':'real-news-id','v29':'real-title','v31':lead,'v11':children,'v33':frame['v33']})
    card=frame['v0']; assert card.descriptor=='Ljt0;' and is_zero(card.value['Ljt0;->g:Lm9;'])
    assert card.value['Ljt0;->b:Ljava/lang/String;']=='real-news-id' and card.value['Ljt0;->c:Ljava/lang/String;']=='real-title'
    assert card.value['Ljt0;->e:Lrj6;'] is lead and card.value['Ljt0;->f:Ljava/util/ArrayList;'] is children
    assert len(defs.value)==2
    # Both real Compose null arms omit the renderer AND the ad-owned spacer.
    composer=f.new('Lgq3;');signature=f.method('Lsi6;','e(')
    for start,stop,register in [(133,153,'v3'),(431,452,'v12')]:
        before=len(f.events)
        result,_=f.run('Lsi6;',signature,start=start,stop_at={stop},registers={'v0':card,register:composer,'v6':0})
        assert result==stop and len(f.events)==before+2 and all(e[0]=='compose-group' for e in f.events[before:])


def verify_ads(source, declarations, sdk_read):
    f = Fixture(source, declarations, sdk_read)
    verify_feed_models(f)
    f.native.update({('Lgc1;', 'i0()V'), ('Luda;', '<init>(ZZZ)V'),
                     ('Lxb;', 'a(Lxb;Z)Lxb;'), ('Lxb;', '<init>(' + PINCH + 'ZZ)V'),
                     ('Lia;', '<init>(Lja;I)V'), ('Lw0;', '<init>(Ljava/lang/Object;I)V'),
                     ('Li6a;', '<init>(ILjava/util/List;)V')})
    for sig in ('getAdSchedulingData()Lcom/bluebillywig/bbnativeshared/model/AdSchedulingData;', 'getAdServicesData()Ljava/util/List;'):
        f.native.add((EMBED, sig))
        assert is_zero(f.run(EMBED, sig, [f.new(EMBED)])[0])
    wrapper = f.new('Lja;')
    f.run('Lja;', 'R0(Lja;Ly9;)V', [wrapper, None])
    assert wrapper.value['visibility'] == 8
    f.run('Lew9;', f.method('Lew9;', 'a('))
    # Each actual native failure consumer receives exactly one failure after reset.
    for kind in ('boolean', 'state', 'fallback-state', 'xml'):
        flow = Reference({'value': None}, 'Lw29;')
        manager = f.new('Lgc1;', {'Lgc1;->c:Ljava/lang/Object;': flow})
        view = f.new(PINCH, {PINCH + '->c:Lgc1;': manager})
        callbacks = []
        state = Reference({'value': None}, 'Llc6;')
        old = f.new('Lxb;', {'Lxb;->a:' + PINCH: view})
        if kind == 'boolean':
            callback = f.new('Leha;', {'Leha;->b:Ljava/lang/Object;': Reference(callbacks.append, 'Lao3;')})
        elif kind in {'state', 'fallback-state'}:
            if kind == 'state': state.value['value'] = old
            callback = f.new('Lbg4;', {'Lbg4;->b:Ljava/lang/Object;': state, 'Lbg4;->c:Ljava/lang/Object;': old})
        else:
            label = Reference({}, 'Landroid/widget/TextView;')
            binding = f.new('Lns5;', {'Lns5;->b:Landroid/widget/TextView;': label})
            wrapper = f.new('Lja;', {'Lja;->q:Lns5;': binding})
            callback = f.new('Lph6;', {'Lph6;->b:Ljava/lang/Object;': wrapper})
        before = len(f.events)
        f.run(PINCH, 'e(Lk9;)V', [view, callback])
        events = f.events[before:]
        assert events[0][0] == 'reset' and [e[0] for e in events].count('failure') == 1
        reset = flow.value['value']
        assert reset.descriptor == 'Luda;' and all(is_zero(v) for v in reset.value.values())
        if kind == 'boolean': assert callbacks == [f.false]
        elif kind in {'state', 'fallback-state'}:
            updated = state.value['value']
            assert updated.value['Lxb;->a:' + PINCH] is view and updated.value['Lxb;->c:Z'] == 1
        else: assert any(e[0] == 'native-zero-dimensions' for e in events)
    # Native absent vertical configuration keeps exact list identity and index.
    for size in (0, 1, 4, 9):
        videos = Reference([f.new('Lk6a;') for _ in range(size)], 'Ljava/util/ArrayList;')
        for index in ({0, size - 1} if size else {0}):
            receiver = Reference({'value': None}, 'Lmb6;')
            result = Reference({}, 'Ljava/lang/Object;')
            actual, _ = f.run('Lxc0;', 'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;', start=35,
                              registers={'v0': videos, 'v2': result, 'v6': 0, 'v7': index, 'v9': receiver})
            assert actual is result
            output = receiver.value['value']
            assert output.value['Li6a;->a:I'] == index and output.value['Li6a;->b:Ljava/util/List;'] is videos
    # Controller creation is fenced independently for regular, renderer and shorts.
    for player_type in ('regular', 'renderer', 'shorts', 'outstream'):
        core = f.new('Lkj7;')
        embed = f.new(EMBED)
        options = Reference({'playerType': player_type}, 'Ljava/util/LinkedHashMap;')
        reached, _ = f.run('Lkj7;', 'A0(Lfy2;Ljava/util/Map;)V', start=711, stop_at={870},
                           registers={'p0': core, 'p1': options, 'p2': embed, 'v3': '', 'v4': 0, 'v5': 0})
        assert reached == 870 and is_zero(core.value['Lkj7;->h0:Ll9;']) and is_zero(core.value['Lkj7;->i0:Ls96;'])
        if player_type == 'shorts':
            assert core.value['Lkj7;->p0:Llq8;'].descriptor == 'Llq8;'
        native = f.new('Lyh0;')
        reached, _ = f.run('Lyh0;', 'A0(Lfy2;Ljava/util/Map;)V', start=1297, stop_at={1359},
                           registers={'v0': native, 'v2': embed, 'v3': options})
        assert reached == 1359
        # Explicit late adServicesData never resets an existing content controller.
        native.value['Lyh0;->f:Lkj7;'] = core
        late = Reference({'adServicesData': Reference([f.new('Lcom/bluebillywig/bbnativeshared/model/AdUnit;')], 'Ljava/util/ArrayList;')}, 'Ljava/util/LinkedHashMap;')
        f.run('Lyh0;', 't(Lhq;Ljava/util/Map;)V', start=467, registers={'p0': native, 'v2': late})
        assert native.value['Lyh0;->f:Lkj7;'] is core
        # Consent's true canRequestAds input still copies out false without changing it.
        native.value['Lyh0;->m1:Z'] = 1
        options.value['canRequestAds'] = f.true
        _, frame = f.run('Lyh0;', 'g(Ljava/lang/String;Ljava/util/Map;)V', [native, 'content-url', options], stop_at={16})
        assert frame['v5'].value['canRequestAds'] is f.false and options.value['canRequestAds'] is f.true
        # Actual content setup keeps the identical media object and native bus path.
        bus = f.new('Lqw2;')
        core.value['Lkj7;->a:Lrw2;'] = bus
        content = f.new('Lyn1;')
        before = len(f.events)
        f.run('Lkj7;', 'B(Lyn1;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Number;Ljava/lang/Integer;)V',
              [core, content, 'actual-content-id', f.true, 0, 0])
        assert core.value['Lkj7;->N:Lyn1;'] is content
        assert core.value['Lkj7;->k:Ljava/lang/String;'] == 'actual-content-id' and core.value['Lkj7;->D:Z'] == 1
        events = f.events[before:]
        assert [e[1] for e in events if e[0] == 'native-content-coordination'] == ['D()V', 'v()V', 'l()V']
        assert any(e[0] == 'native-content-event' and e[1] is bus for e in events)
