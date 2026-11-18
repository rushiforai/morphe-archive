package patches.humo

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Suppresses native ad requests, header bidding, video prerolls, body ad DTOs; filters known web advertising resources.") {
    dependsOn(originalInput)
    compatibleWith(humo)
    dependsOn(adResources)
    execute {
        change("Lbe/persgroep/advertising/banner/config/FeatureFlags;", "getDfpEnabled()Z", FALSE)
        change("Lbe/persgroep/advertising/banner/config/FeatureFlags;", "getOptOutEnabled()Z", FALSE)
        change("Lbe/persgroep/advertising/banner/config/FeatureFlags;", "getPrebidEnabled()Z", FALSE)
        change("Lbe/persgroep/advertising/banner/config/FeatureFlags;", "getXandrEnabled()Z", FALSE)
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction;", "getAdsEnabled()Z", FALSE)
        change("Lbe/persgroep/advertising/banner/base/performance/PerformanceTracker;", "initialise(Ljava/lang/Boolean;)V", STOP)
        change("Lbe/persgroep/advertising/banner/base/performance/PerformanceTracker;", "track(Lbe/persgroep/advertising/banner/base/performance/PerformanceEvent;)V", STOP)
        change("Lbe/persgroep/advertising/banner/AdvertisingSDK\$1;", "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", UNIT)
        change("Lnl/persgroep/edition/advertisement/presentation/AdvertisementLoadingHandler;", "load(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Lnl/persgroep/edition/advertisement/domain/model/Advertisement;Lnl/persgroep/edition/feature/component/tracking/legacy/PageViewType;Lkotlin/jvm/functions/Function1;)Landroid/view/ViewGroup;", NULL)
        change("Lbe/persgroep/advertising/banner/AdvertisingSDK;", "load(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Lbe/persgroep/advertising/banner/model/AdConfig;Lbe/persgroep/advertising/banner/base/AdResponseListener;Ljava/lang/String;)Landroid/view/ViewGroup;", """
            sget-object v0, Lbe/persgroep/advertising/banner/base/AdResponse${'$'}Failure${'$'}Disabled;->INSTANCE:Lbe/persgroep/advertising/banner/base/AdResponse${'$'}Failure${'$'}Disabled;
            invoke-interface {p4, v0}, Lbe/persgroep/advertising/banner/base/AdResponseListener;->onAdResponse(Lbe/persgroep/advertising/banner/base/AdResponse;)V
            const/4 v0, 0x0
            return-object v0
        """)
        change("Lbe/persgroep/advertising/banner/AdvertisingSDK;", "loadAd(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Ljava/lang/String;Lbe/persgroep/advertising/banner/base/AdResponseListener;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Landroid/view/ViewGroup;", """
            sget-object v0, Lbe/persgroep/advertising/banner/base/AdResponse${'$'}Failure${'$'}Disabled;->INSTANCE:Lbe/persgroep/advertising/banner/base/AdResponse${'$'}Failure${'$'}Disabled;
            invoke-interface {p4, v0}, Lbe/persgroep/advertising/banner/base/AdResponseListener;->onAdResponse(Lbe/persgroep/advertising/banner/base/AdResponse;)V
            const/4 v0, 0x0
            return-object v0
        """)
        change("Lbe/persgroep/advertising/video/ima/ImaManager;", "requestAds()V", "invoke-direct {p0}, Lbe/persgroep/advertising/video/ima/ImaManager;->onContentResumeRequested()V\nreturn-void")
        // Preserve initialized defaults while preventing the independent
        // video and game /video/settings/ advertising-prefetch coroutines.
        change("Lnl/dpgmedia/publishingservices/videosdk/internal/player/core/ad/AdSettingsProvider;", "init()V", STOP)
        change("Lnl/dpgmedia/puzzels/gg/game/player/gameview/ad/settings/AdSettingsProvider;", "init()V", STOP)
        suppressGameAdRequest()
        installArticleFilter()
        installAdvertorialGuard()
        installWebPolicy()
    }
}
