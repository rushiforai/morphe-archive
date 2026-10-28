package app.saurabh.patches.blablacar

import app.morphe.patcher.Fingerprint

object InMobiMediaCpLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/media/cp;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "I"
    )
)

object InMobiInterstitialLoadAdUnitFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiInterstitial;",
    name = "loadAdUnit",
    returnType = "V",
    parameters = emptyList()
)

object AdMobInterstitialLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/comuto/admob/AdMobInterstitial;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lap3;",
        "Lap3;",
        "Lap3;"
    )
)

object AdMobAppOpenLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/comuto/admob/AdMobAppOpen;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lap3;",
        "Lap3;"
    )
)

object MetaRtbAppOpenAdLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/google/ads/mediation/facebook/rtb/MetaRtbAppOpenAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Lcom/google/android/gms/ads/mediation/MediationAppOpenAdConfiguration;"
    )
)

object AdMobAnchorBannerViewLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/comuto/admob/components/AdMobAnchorBannerView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lap3;",
        "Lap3;"
    )
)

object AdMobNativeViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/comuto/admob/components/AdMobNativeView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lap3;",
        "Lop3;",
        "Lop3;",
        "Lop3;",
        "Lop3;",
        "Ldp3;",
        "Ldp3;",
        "Lap3;",
        "Lap3;",
        "Lap3;"
    )
)

object AdNativeSearchResultsPageViewLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/comuto/features/ads/presentation/components/searchresultspage/AdNativeSearchResultsPageView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Lcom/comuto/coreui/ads/AdFeatureKeyUIModel;"
    )
)

object AdInterstitialLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/comuto/features/ads/presentation/components/interstitial/AdInterstitial;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Lcom/comuto/coreui/ads/AdFeatureKeyUIModel;"
    )
)

object AdNativeHomePageViewLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/comuto/features/ads/presentation/components/homepage/AdNativeHomePageView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Lcom/comuto/coreui/ads/AdFeatureKeyUIModel;"
    )
)

object AdAnchorBannerViewLoadAdFingerprint : Fingerprint(
    definingClass =
        "Lcom/comuto/features/ads/presentation/components/banner/AdAnchorBannerView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Lcom/comuto/coreui/ads/AdFeatureKeyUIModel;"
    )
)
