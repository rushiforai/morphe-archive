package com.nmnvan.patches.thescore.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.nmnvan.patches.thescore.shared.isFrom

// region Ad gateway.

/** Parameter types of ScoreAdWrapper.load(AdType, …, EventInfo, callback) after the AdType. */
internal val AD_WRAPPER_LOAD_PARAMETERS_AFTER_AD_TYPE = listOf(
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Ljava/util/Map;",
    "Lcom/thescore/repositories/data/EventInfo;",
)

/** Source file of the ScoreAdWrapper interface every theScore ad (any type) is loaded through. */
internal const val AD_WRAPPER_SOURCE_FILE = "ScoreAdWrapper.kt"

/**
 * AdResult.AdFailed(code: Integer). Its toString() is "AdFailed(code=…)".
 */
internal object AdFailedResultToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("AdFailed(code="),
    custom = { _, classDef -> classDef.isFrom("AdsGateway.kt") }
)

// endregion

// region Splash.

/**
 * AdStorageGateway.getSplashAd(): returns a SplashAd or null.
 * Picks the video or image splash depending on a remote flag.
 */
internal object GetSplashAdFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    strings = listOf(
        "location_region_code",
        "location_country",
        "com.thescore.animated_launch_screens",
    ),
    custom = { _, classDef -> classDef.isFrom("AdStorageGateway.kt") }
)

// endregion

// region List ad slots.

/**
 * ListAdapter.setData(List<? extends AdapterItem>): the shared RecyclerView adapter that
 * every list screen (Scores, News, league lists, Scorecast) uses.
 */
internal object ListAdapterSetDataFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    custom = { _, classDef ->
        classDef.isFrom("ListAdapter.kt") &&
            classDef.superclass == "Landroidx/recyclerview/widget/RecyclerView\$Adapter;"
    }
)

// endregion

// region Ad type delegates (extra layer).

/**
 * AdManagerDelegate.loadAd(Context, AdParams, Continuation<Boolean>): Object.
 * Every ad type delegate overrides this; returning Boolean.FALSE is the normal "no fill" result.
 */
private fun adDelegateLoadFingerprint(sourceFile: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "L", "L"),
    custom = { method, classDef ->
        // The override takes the AdParams base type. Some delegates have a same-shaped
        // helper that takes a nested AdParams subtype (e.g. "Llr$a;"), which must not match.
        classDef.isFrom(sourceFile) && !method.parameterTypes[1].contains('$')
    }
)

/**
 * DeferredAdLoader.load(MainActivity, AdParams.Page, Continuation<Boolean>): Object.
 * Second entry point used to preload the masthead. Not present in 26.12.0.
 */
private fun adDelegateDeferredLoadFingerprint(sourceFile: String) = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lcom/thescore/base/ui/MainActivity;", "L", "L"),
    custom = { _, classDef -> classDef.isFrom(sourceFile) }
)

internal val MastheadAdLoadFingerprint = adDelegateLoadFingerprint("MastheadAdManagerDelegate.kt")
internal val MastheadAdDeferredLoadFingerprint = adDelegateDeferredLoadFingerprint("MastheadAdManagerDelegate.kt")
internal val BigBoxAdLoadFingerprint = adDelegateLoadFingerprint("BigBoxAdManagerDelegate.kt")
internal val PresentedByAdLoadFingerprint = adDelegateLoadFingerprint("PresentedByAdManagerDelegate.kt")

// endregion

// region Video pre-roll (extra layer).

/**
 * GoogleAdManager.buildMediaItem(contentUrl, adTagUri, muted): wraps a video in an IMA ad
 * (pre-roll) when adTagUri is not null, otherwise returns a plain media item.
 */
internal object VideoMediaItemFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;", "Landroid/net/Uri;", "Ljava/lang/Boolean;"),
    strings = listOf("vid_d", "vpmute"),
    custom = { _, classDef -> classDef.isFrom("GoogleAdManager.kt") }
)

/**
 * GoogleAdManager.getVideoAdTagUrl(adUnit, EventInfo, Continuation): the IMA ad tag, or null.
 */
internal object VideoAdTagFingerprint : Fingerprint(
    returnType = "Ljava/lang/Comparable;",
    parameters = listOf("Ljava/lang/String;", "Lcom/thescore/repositories/data/EventInfo;", "L"),
    custom = { _, classDef -> classDef.isFrom("GoogleAdManager.kt") }
)

// endregion

// region Interstitials and Teads (extra layer).

/**
 * InterstitialAdManagerDelegate.canShow(Continuation<Boolean>): true once the frequency cap elapsed.
 */
internal object InterstitialCanShowFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    strings = listOf("interstitial_ad_last_shown_timestamp", "interstitial_ad_frequency_cap_ms"),
    custom = { _, classDef -> classDef.isFrom("InterstitialAdManagerDelegate.kt") }
)

/**
 * TeadsAdManagerDelegate.loadAd(Configs, position, container, InReadAdPlacement, …, callback).
 */
internal object TeadsLoadAdFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lcom/thescore/repositories/data/Configs;",
        "I",
        "Landroid/view/ViewGroup;",
        "Ltv/teads/sdk/InReadAdPlacement;",
        "I",
        "L",
    ),
    custom = { _, classDef -> classDef.isFrom("TeadsAdManagerDelegate.kt") }
)

// endregion
