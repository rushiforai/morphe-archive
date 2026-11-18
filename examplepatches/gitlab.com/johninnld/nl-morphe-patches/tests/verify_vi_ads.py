"""Execute ad policy, callback, insertion and player activation paths."""
from rtl_vm import Reference, VmThrown
from vi_vm import AUTH
from vi_ads_vm import POLICY,MANAGER,SHOW,BANNER,FETCH,CONFIG,JW,PARSER,PARSE,NAV

SHOW_SIG='showInterstitialAd(Landroid/app/Activity;ZLnl/vi/ads/domain/model/NextGenAdAdUnit;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'
GET_CONFIG='getValue(Ljava/lang/Object;Lkotlin/reflect/KProperty;)Lcom/jwplayer/pub/api/configuration/PlayerConfig;'


def verify_ads(f,enabled):
    activity=Reference({},'Landroid/app/Activity;')
    ad=f.new('Lnl/vi/ads/domain/model/NextGenAdAdUnit;')
    for pro in (False,True):
        for iap in (False,True):
            f.iap=iap;f.statics[AUTH+'->proUser:Z']=int(pro)
            assert f.run(POLICY,'mustShowAds()Z',(f.policy,))[0]==int(not(enabled or pro or iap)), 'VI display ad policy remains active'
            assert f.iap==iap and f.statics[AUTH+'->proUser:Z']==int(pro)
    f.iap=False;f.statics[AUTH+'->proUser:Z']=0
    f.events.clear();f.run(MANAGER,'preloadInterstitialAd(Lnl/vi/ads/domain/model/NextGenAdAdUnit;)V',(f.new(MANAGER),ad))
    assert f.events==([] if enabled else ['ad-preload']), 'VI ad preload still starts'
    f.events.clear();f.run(BANNER,'initBannerAdsManager(Landroid/app/Activity;)V',(f.new(BANNER),activity))
    assert f.events==([] if enabled else ['ad-initialization-launch']), 'VI ad initialization still starts'
    assert not f.statics[BANNER+'->isInitialized:Z']

    fetch='fetchBannerAds(Lnl/vi/core/ads/googleNextGenAds/banner/adUnits/BannerAdUnit;Lkotlin/jvm/functions/Function1;)V'
    callback=Reference({},'Lkotlin/jvm/functions/Function1;')
    for pro in (False,True):
        f.statics[AUTH+'->proUser:Z']=int(pro);f.events.clear()
        f.run(FETCH,fetch,(f.new(FETCH),f.new('Lnl/vi/core/ads/googleNextGenAds/banner/adUnits/BannerAdUnit;'),callback))
        assert f.events==([('banner-result',0)] if enabled or pro else ['banner-request']), 'VI banner completion/request mismatch'
    error=Reference({},'Ljava/lang/IllegalArgumentException;');f.callback_error=error
    try:f.run(FETCH,fetch,(f.new(FETCH),ad,callback))
    except VmThrown as thrown:assert thrown.value is error
    else:raise AssertionError('VI banner swallowed callback error')
    f.callback_error=None;f.statics[AUTH+'->proUser:Z']=0

    items=Reference(['text','media'],'Ljava/util/ArrayList;');original=list(items.value)
    f.run(PARSER,PARSE,start=114,stop_at=(65,133),registers={'v2':items,'v7':Reference({},'Lnl/vi/feature/articleDetail/data/ContentItem$Companion;'),'v6':'ads','v5':f.new('Lnl/vi/feature/articleDetail/data/ContentItem;'),'v0':f.new('Lnl/vi/feature/articleDetail/data/NewsDetailResponse;')})
    assert items.value[:2]==original and len(items.value)==(2 if enabled else 3), 'VI supplied ad item still adds a row'

    playlist=Reference([Reference({'adschedule':{'pre':{},'mid':{},'post':{},'vmap':{}}},'Lcom/jwplayer/pub/api/media/playlists/PlaylistItem;')],'Ljava/util/ArrayList;')
    config=f.new(CONFIG,{CONFIG+'->playlistItems:Ljava/util/List;':playlist})
    f.events.clear();result=f.run(CONFIG,GET_CONFIG,(config,0,Reference({},'Lkotlin/reflect/KProperty;')))[0]
    data=result.value['fixture-builder'];assert data['playlist'] is playlist and not data['preload'].value and not data['autostart'].value
    assert data['allowCrossProtocolRedirects'].value and 'uiConfig' in data
    assert bool(result.value[JW+'PlayerConfig;->mAdvertisingConfig:Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;'])==(not enabled), 'VI advertising config is still attached'
    if enabled:
        handler=f.new('Lcom/jwplayer/c/a/c;')
        f.run('Lcom/jwplayer/c/a/c;','a(Lcom/jwplayer/d/a/a/f;)V',(handler,f.new('Lcom/jwplayer/d/a/a/f;',{'Lcom/jwplayer/d/a/a/f;->a:Lcom/jwplayer/pub/api/configuration/PlayerConfig;':result})))
        assert handler.value['Lcom/jwplayer/c/a/c;->t:Lcom/google/ads/interactivemedia/v3/api/ImaSdkSettings;']==0

    player=Reference({},'Lcom/jwplayer/pub/api/JWPlayer;')
    for name in ('JwPlayerActionHandlerDelegate','JwSinglePlayerActionHandlerDelegate'):
        owner='Lnl/vi/common/ui/videoFeed/delegates/'+name+';'
        obj=f.new(owner,{owner+'->player:Lcom/jwplayer/pub/api/JWPlayer;':player,owner+'->vendor:Ljava/lang/String;':'fixture-vendor'})
        if name=='JwPlayerActionHandlerDelegate':
            vm=Reference({'current':Reference({'id':'new'},'Lnl/vi/data/video_feed/VideoFeedItem;'),'previous':Reference({'id':'old'},'Lnl/vi/data/video_feed/VideoFeedItem;')},'Lnl/vi/common/ui/videoFeed/VideoFeedViewModel;')
            obj.value[owner+'->videoFeedViewModel:Lkotlin/jvm/functions/Function0;']=Reference({'role':'feed','viewmodel':vm},'Lkotlin/jvm/functions/Function0;')
        f.events.clear();f.run(owner,'onBeforePlay(Lcom/jwplayer/pub/api/events/BeforePlayEvent;)V',(obj,Reference({},'Lcom/jwplayer/pub/api/events/BeforePlayEvent;')))
        assert f.events==([] if enabled else ['play-ad']), 'VI before-play still requests an ad'

    # Native policy-false coroutine: callback once, on Main, no fake SDK result.
    dismissed=Reference({'role':'dismiss','navigation':True},'Lkotlin/jvm/functions/Function0;')
    for pro in ((False,True) if enabled else (True,)):
        f.statics[AUTH+'->proUser:Z']=int(pro)
        f.events.clear();f.defer_main=False
        args=(f.new(MANAGER),activity,0,ad,0,dismissed,0)
        assert f.run(MANAGER,SHOW_SIG,args)[0] is f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        assert f.events==['main-dispatch','dismiss',('visible',False),'navigation-launch','navigate']
        f.events.clear();f.defer_main=True
        assert f.run(MANAGER,SHOW_SIG,args)[0] is f.suspended
        assert f.events==['main-dispatch']
        f.defer_main=False;f.dispatcher=f.main
        assert f.run(SHOW,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(f.pending,0))[0] is f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        assert f.events==['main-dispatch','dismiss',('visible',False),'navigation-launch','navigate']
        f.dispatcher=None
    f.statics[AUTH+'->proUser:Z']=0
    cancelled=f.new(NAV,{NAV+'->label:I':1,
        NAV+'->$interstitialAdsVisible:Lkotlin/jvm/functions/Function1;':Reference({'role':'visibility'},'Lkotlin/jvm/functions/Function1;'),
        NAV+'->$navController:Landroidx/navigation/NavController;':Reference({},'Landroidx/navigation/NavController;'),
        NAV+'->$articleID:Ljava/lang/String;':'2151890'})
    failure=Reference({'exception':Reference({},'Ljava/util/concurrent/CancellationException;')},'Lkotlin/Result$Failure;')
    f.events.clear()
    assert f.run(NAV,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(cancelled,failure))[0] is f.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
    assert f.events==['local-log',('visible',False),'navigation-launch','navigate'], 'VI cancelled interstitial stranded navigation'
