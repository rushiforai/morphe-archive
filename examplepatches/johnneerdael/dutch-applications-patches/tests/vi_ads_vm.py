"""VI ad activation with explicit platform, SDK and dispatcher boundaries."""
from vi_vm import Fixture
from vi_ads_contracts import ADS_CONTRACTS
from rtl_vm import Reference, VmThrown

POLICY='Lnl/vi/ads/data/config/AdsDisplayConfig;'
MANAGER='Lnl/vi/ads/data/manager/AdManagerImplementation;'
SHOW=MANAGER[:-1]+'$showInterstitialAd$2;'
BANNER='Lnl/vi/core/ads/googleNextGenAds/banner/manager/BannerAdsManager;'
FETCH='Lnl/vi/core/ads/googleNextGenAds/banner/fetcher/BannerAdsFetcherImplementation;'
CONFIG='Lnl/vi/common/ui/videoFeed/config/VideoFeedPlayerConfigDelegate;'
JW='Lcom/jwplayer/pub/api/configuration/'
PARSER='Lnl/vi/extensions/NewsDetailResponseExtensionsKt;'
PARSE='asNewsDetailItemList(Lnl/vi/feature/articleDetail/data/NewsDetailResponse;ZLjava/util/Map;)Ljava/util/List;'
NAV='Lnl/vi/feature/main/domain/OnViEventClickExtensionsKt$handleNavigate$1;'
NAV_JOB=NAV[:-1]+'$2$1;'
NAV_CANCEL_JOB=NAV[:-1]+'$3;'
NAV_CALLBACK='invokeSuspend$lambda$1(Lkotlin/jvm/functions/Function1;Landroidx/navigation/NavController;Ljava/lang/String;)Lkotlin/Unit;'


class AdsFixture(Fixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.rows.update({r[:2]:r for r in ADS_CONTRACTS})
        self.native |= {(POLICY,'mustShowAds()Z')}
        self.native |= {(o,s) for o,s in self.rows if o in {SHOW,BANNER[:-1]+'$initBannerAdsManager$1;'} and s.startswith(('<init>(', 'invokeSuspend('))}
        self.native.add((JW+'PlayerConfig;','getAdvertisingConfig()Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;'))
        self.native |= {(o,s) for o,s in self.rows if o in {NAV_JOB,NAV_CANCEL_JOB} and s.startswith(('<init>(', 'invokeSuspend('))}
        self.policy=self.new(POLICY)
        self.main=Reference({},'Lkotlinx/coroutines/MainCoroutineDispatcher;')
        self.io=Reference({},'Lkotlinx/coroutines/CoroutineDispatcher;')
        self.dispatcher=None;self.defer_main=False;self.pending=None
        self.callback_error=None
        self.statics['Lnl/vi/feature/main/data/AppNavigationRoute$ViNativeArticle;->INSTANCE:Lnl/vi/feature/main/data/AppNavigationRoute$ViNativeArticle;']=Reference({},'Lnl/vi/feature/main/data/AppNavigationRoute$ViNativeArticle;')
        self.statics['Lnl/vi/core/ads/googleNextGenAds/banner/manager/BannerAdsManager;->isInitialized:Z']=0
        for n in ('CENTER_CONTROLS','ERROR','ADS_CONTROL','CONTROLBAR','OVERLAY','PLAYER_CONTROLS_CONTAINER'):
            self.statics['Lcom/jwplayer/pub/api/UiGroup;->'+n+':Lcom/jwplayer/pub/api/UiGroup;']=Reference({},'Lcom/jwplayer/pub/api/UiGroup;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if target=='Lnl/vi/common/data/AppUtilitiesKt;->getAdsDisplayConfig()'+POLICY:return self.policy
        if target=='Lkotlinx/coroutines/Dispatchers;->getMain()Lkotlinx/coroutines/MainCoroutineDispatcher;':return self.main
        if target=='Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;':return self.io
        if owner=='Lkotlin/coroutines/jvm/internal/SuspendLambda;' and sig.startswith('<init>('):return None
        if target=='Lkotlinx/coroutines/CoroutineScopeKt;->CoroutineScope(Lkotlin/coroutines/CoroutineContext;)Lkotlinx/coroutines/CoroutineScope;':return Reference({'dispatcher':args[0]},'Lkotlinx/coroutines/CoroutineScope;')
        if owner=='Lkotlinx/coroutines/BuildersKt;' and sig.startswith('withContext('):
            assert args[0] is self.main;self.events.append('main-dispatch')
            if self.defer_main:self.pending=args[1];return self.suspended
            previous=self.dispatcher;self.dispatcher=self.main
            try:return self.run(args[1].descriptor,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(args[1],0))[0]
            finally:self.dispatcher=previous
        if owner=='Lkotlinx/coroutines/BuildersKt;' and sig.startswith('launch$default('):
            if args[3].descriptor==BANNER[:-1]+'$initBannerAdsManager$1;':self.events.append('ad-initialization-launch')
            elif args[3].descriptor in {NAV_JOB,NAV_CANCEL_JOB}:
                assert args[0].value['dispatcher'] is self.main
                self.events.append('navigation-launch');self.run(args[3].descriptor,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(args[3],0))
            else:raise AssertionError('Unknown VI launch')
            return Reference({},'Lkotlinx/coroutines/Job;')
        if owner=='Lkotlin/jvm/functions/Function0;' and sig=='invoke()Ljava/lang/Object;':
            if args[0].value.get('role')=='dismiss':
                assert self.dispatcher is self.main;self.events.append('dismiss')
                if self.callback_error:raise VmThrown(self.callback_error)
                if args[0].value.get('navigation'):
                    self.run(NAV,NAV_CALLBACK,(Reference({'role':'visibility'},'Lkotlin/jvm/functions/Function1;'),Reference({},'Landroidx/navigation/NavController;'),'2151890'))
            elif args[0].value.get('role')=='feed':return args[0].value['viewmodel']
            else:raise AssertionError('Unknown VI callback')
            return self.statics['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']
        if owner=='Lkotlin/jvm/functions/Function1;' and sig=='invoke(Ljava/lang/Object;)Ljava/lang/Object;':
            if args[0].value.get('role')=='visibility':self.events.append(('visible',args[1].value));return 0
            self.events.append(('banner-result',args[1]))
            if self.callback_error:raise VmThrown(self.callback_error)
            return 0
        if owner=='Lnl/vi/ads/domain/model/NextGenAdAdUnit;':
            if sig.startswith(('getPreloadID(', 'getId(', 'getContentUrl(')):return 'fixture'
            if sig.startswith('getCustomParams('):return Reference({},'Ljava/util/HashMap;')
        if target==MANAGER+'->log(Ljava/lang/String;)V':return None
        if target==MANAGER+'->getAdLoader()Lnl/vi/ads/domain/AdLoader;':return Reference({},'Lnl/vi/ads/domain/AdLoader;')
        if owner=='Lnl/vi/ads/domain/AdLoader;' and sig.startswith('preloadInterstitialAd('):self.events.append('ad-preload');return None
        if owner==FETCH and sig.startswith('requestBannerAd('):self.events.append('banner-request');return None
        if owner==FETCH[:-1]+'$fetchBannerAds$1;' and sig.startswith('<init>('):return None
        if owner==CONFIG and sig.startswith('getAdsConfig('):self.events.append('ad-config');return Reference({},JW+'ads/AdvertisingConfig;')
        if owner in {JW+'PlayerConfig$Builder;',JW+'UiConfig$Builder;'}:
            if sig.startswith('<init>('):return None
            if sig.startswith('build('):
                if 'PlayerConfig' in owner:return self.new(JW+'PlayerConfig;',{JW+'PlayerConfig;->mAdvertisingConfig:Lcom/jwplayer/pub/api/configuration/ads/AdvertisingConfig;':args[0].value.get('advertisingConfig',0),'fixture-builder':dict(args[0].value)})
                return Reference(dict(args[0].value),JW+'UiConfig;')
            args[0].value[sig.split('(')[0]]=args[1];return args[0]
        if target=='Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Ljava/util/concurrent/CancellationException;->getMessage()Ljava/lang/String;':return 'fixture cancellation'
        if target=='Lnl/vi/common/data/AppUtilitiesKt;->getAppLogger()Lnl/vi/shared/module/logger/AppLogger;':return Reference({},'Lnl/vi/shared/module/logger/AppLogger;')
        if target=='Lnl/vi/shared/module/logger/AppLogger;->log(Ljava/lang/String;)V':self.events.append('local-log');return None
        if owner=='Lnl/vi/feature/main/data/AppNavigationRoute$ViNativeArticle;' and sig.startswith('withArguments('):return 'native-article/'+args[1].value[0]
        if target=='Lnl/vi/extensions/NavControllerExtensionsKt;->navigateToView(Landroidx/navigation/NavController;Ljava/lang/String;)V':
            assert args[1]=='native-article/2151890';self.events.append('navigate');return None
        if owner=='Lnl/vi/common/ui/videoFeed/VideoFeedViewModel;':
            if sig.startswith('getVideoCurrentlyPlaying('):return args[0].value['current']
            if sig.startswith('getPreviousVideo('):return args[0].value['previous']
        if owner=='Lnl/vi/data/video_feed/VideoFeedItem;':
            if sig.startswith('getUrl('):return args[0].value['id']
            if sig.startswith('getId('):return args[0].value['id']
            if sig.startswith('getVendor('):return 'fixture-vendor'
            if sig.startswith('isDurationShorterThan30Seconds('):return 0
        if owner=='Lnl/vi/common/ui/videoFeed/advertisement/VideoAdvertisementURLDelegate;' and sig.startswith('<init>('):return None
        if owner.startswith('Lnl/vi/common/ui/videoFeed/delegates/Jw'):
            if sig.startswith('onBeforePlay$lambda$0$0('):return 'https://ad.invalid/fixture'
            if sig.startswith('log('):return None
            if sig.startswith('getVideoFeedManager('):return Reference({},'Lnl/vi/common/ui/videoFeed/VideoFeedManager;')
        if target=='Lnl/vi/common/ui/videoFeed/VideoFeedManager;->mustShowVideoAds()Z':return 1
        if target=='Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z':return int(not args[0].strip())
        if target=='Lcom/jwplayer/pub/api/JWPlayer;->playAd([Ljava/lang/String;)V':self.events.append('play-ad');return None
        if target=='Lnl/vi/feature/articleDetail/data/ContentItem$Companion;->getAds_BLOCK()Ljava/lang/String;':return 'ads'
        if owner=='Lnl/vi/feature/articleDetail/data/ContentItem;':
            if sig.startswith('getBannerAdUnit('):return self.new('Lnl/vi/ads/domain/model/NextGenAdAdUnit;')
            if sig=='isPro()Z':return 0
        if owner=='Lnl/vi/feature/articleDetail/data/NewsDetailResponse;':
            if sig.startswith('getTags('):return Reference([],'Ljava/util/ArrayList;')
            if sig.startswith('getUrl('):return 'https://www.vi.nl/nieuws/fixture'
        if owner=='Lnl/vi/feature/articleDetail/data/NewsAdsItem;' and sig.startswith('<init>('):return None
        if target=='Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z':args[0].value.append(args[1]);return 1
        return super().invoke(target,args)
