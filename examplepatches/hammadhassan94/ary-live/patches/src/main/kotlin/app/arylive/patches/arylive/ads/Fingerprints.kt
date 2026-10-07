package app.arylive.patches.arylive.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/*
 * ARY PLUS (com.release.arylive) keeps clear class/method names — fingerprints can use
 * definingClass + name. String filters are extras for safety across minor rebuilds.
 */

internal object LoadHomepageInterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/InterstitialAdHelper;",
    name = "loadHomepageInterstitial",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

internal object ShowHomepageInterstitialFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/InterstitialAdHelper;",
    name = "showHomepageInterstitial",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Lcom/material/components/aryzap/Helpers/InterstitialAdHelper\$OnAdClosedListener;",
    ),
)

internal object LoadBannerAdFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadBannerAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal object LoadBannerAdInternalFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadBannerAd",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
    ),
    filters = listOf(string("loadBannerAd: adUnit=")),
)

internal object LoadBannerAdHorizontalFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadBannerAdHorizontal",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

internal object LoadNativeAdFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadNativeAd",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
    ),
)

internal object LoadNativeAdInternalFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadNativeAd",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
        "I",
        "Z",
    ),
)

internal object LoadNativeAdForPosterGridFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadNativeAdForPosterGrid",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
    ),
)

internal object LoadNativeAdHorizontalFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/AdLoaderHelper;",
    name = "loadNativeAdHorizontal",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
    ),
)

internal object ReviveLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/ReviveAdLoader;",
    name = "loadAd",
    // Kotlin @JvmStatic is public static final — Morphe requires exact flags.
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/widget/FrameLayout;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/view/ViewGroup\$LayoutParams;",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

internal object HomeBannerInjectFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/HomeBannerAdInjector;",
    name = "inject",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljava/util/List;", "Ljava/util/List;"),
    filters = listOf(string("HomeBannerAdInjector")),
)

internal object HomeRowInjectAds3Fingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector;",
    name = "injectAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

internal object HomeRowInjectAds4Fingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector;",
    name = "injectAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector\$AdItemCreator;",
    ),
)

internal object HomeRowInjectAdsCoreFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector;",
    name = "injectAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector\$AdItemCreator;",
    ),
)

internal object HomeRowInjectEpisodeAdsFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Helpers/HomeRowAdInjector;",
    name = "injectEpisodeAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Ljava/util/List;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
    ),
)

/**
 * Media3 IMA provider lambdas: (AdsConfiguration) -> AdsLoader
 * Returning null disables CSAI preroll attachment.
 */
internal object PlayerAdsLoaderProviderFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Activities/PlayerActivity;",
    returnType = "Landroidx/media3/exoplayer/source/ads/AdsLoader;",
    parameters = listOf("Landroidx/media3/common/MediaItem\$AdsConfiguration;"),
)

internal object CdnPlayerAdsLoaderProviderFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Activities/CdnPlayer;",
    returnType = "Landroidx/media3/exoplayer/source/ads/AdsLoader;",
    parameters = listOf("Landroidx/media3/common/MediaItem\$AdsConfiguration;"),
)

internal object LiveChannelAdsLoaderProviderFingerprint : Fingerprint(
    definingClass = "Lcom/material/components/aryzap/Activities/PlayerLiveChannel;",
    returnType = "Landroidx/media3/exoplayer/source/ads/AdsLoader;",
    parameters = listOf("Landroidx/media3/common/MediaItem\$AdsConfiguration;"),
)
