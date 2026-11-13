package com.dmoniak.patches.hotstar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// ============================================================================
// 1. Ads & SSAI (Server-Side Ad Insertion) Fingerprints
// ============================================================================

/**
 * AdMetadata constructor — controls pre-roll/mid-roll ad flags and SSAI tags.
 * Parameters: (disablePreRoll, disableMidRoll, hasPreRoll, hasPlayablePreRoll, enableMidRollLoad, ssaiTag, perPodPositions)
 */
object AdMetadataConstructorFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Z", "Z", "Z", "Z", "Z", "Ljava/lang/String;", "Ljava/util/List;"),
    filters = listOf(
        string("ssaiTag"),
        string("perPodPositions")
    )
)

/**
 * WatchLiveAdsViewModel.b() — Initializes live ad sessions.
 */
object WatchLiveAdsInitFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ads/watch/WatchLiveAdsViewModel;",
    name = "b",
    returnType = "V",
)

/**
 * Inner composable that renders display ad content (home feed banner/sponsored ads).
 */
object DisplayAdComposableFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        string("DisplayAd"),
    )
)

/**
 * SGAI Prefetcher getAd — fetches live ads from server cache.
 */
object SgaiPrefetcherGetAdFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("SGAI_Prefetcher"),
        string("getAd: ")
    )
)

/**
 * LiveAdsManager main ad processing loop.
 */
object LiveAdsManagerProcessFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("LiveAdsManager"),
        string("Removed stale ad at %d")
    )
)

/**
 * SCTE Live Ad Fetch URL — fetches live match ad pods during cricket match overs/wickets.
 */
object LiveAdMetadataGetScteFetchAdUrlFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/player/models/ads/LiveAdMetadata;",
    name = "getScteFetchAdUrl",
    returnType = "Ljava/lang/String;"
)

/**
 * SGAI Server Ad URL — endpoint for Server-Guided Ad Insertion.
 */
object PlayerWidgetSgaiConfigGetSgaiAdsUrlFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$SgaiConfig;",
    name = "getSgaiAdsUrl",
    returnType = "Ljava/lang/String;"
)

/**
 * SGAI Prefetch Network Config flag — triggers background prefetching of filler video ads.
 */
object PlayerWidgetSgaiConfigHasPrefetchNetworkConfigFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$SgaiConfig;",
    name = "hasPrefetchNetworkConfig",
    returnType = "Z"
)

/**
 * SGAI Sync Call Config flag — triggers synchronous ad insertion requests.
 */
object PlayerWidgetSgaiConfigHasSyncCallConfigFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$SgaiConfig;",
    name = "hasSyncCallConfig",
    returnType = "Z"
)

/**
 * LiveStreamAdData Ad Server URL — base ad server for live streams.
 */
object PlayerWidgetLiveStreamAdDataGetAdServerUrlFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$LiveStreamAdData;",
    name = "getAdServerUrl",
    returnType = "Ljava/lang/String;"
)

/**
 * LiveStreamAdData SGAI Ads URL — live stream SGAI ad URL.
 */
object PlayerWidgetLiveStreamAdDataGetSgaiAdsUrlFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$LiveStreamAdData;",
    name = "getSgaiAdsUrl",
    returnType = "Ljava/lang/String;"
)

/**
 * LiveStreamAdData SSAI Tag — live stream SSAI tag.
 */
object PlayerWidgetLiveStreamAdDataGetSsaiTagFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$LiveStreamAdData;",
    name = "getSsaiTag",
    returnType = "Ljava/lang/String;"
)

/**
 * LiveStreamAdData hasSgaiConfig — controls whether SGAI configuration is active for live stream.
 */
object PlayerWidgetLiveStreamAdDataHasSgaiConfigFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/widget/PlayerWidget\$LiveStreamAdData;",
    name = "hasSgaiConfig",
    returnType = "Z"
)

// ============================================================================
// 2. Screenshots & Screen Recording Protection Fingerprints
// ============================================================================

/**
 * ABConfig.getUseSecureView() — Controls whether SurfaceView.setSecure(true) is called.
 */
object UseSecureViewFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/player/models/config/ABConfig;",
    name = "getUseSecureView",
    returnType = "Z"
)

/**
 * Compose FLAG_SECURE — dynamically adds FLAG_SECURE (0x2000) to Activity window in Compose UI.
 */
object ComposeFlagSecureFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("null cannot be cast to non-null type android.app.Activity"),
        methodCall(definingClass = "Landroid/app/Activity;", name = "getWindow"),
        literal(0x2000),
        methodCall(definingClass = "Landroid/view/Window;", name = "addFlags")
    )
)

// ============================================================================
// 3. Signature & Anti-Tamper Verification Fingerprints
// ============================================================================

/**
 * Computes MD5 of app signing certificate, compares with JNI value,
 * and sends encrypted tamper status header to backend API.
 */
object SignatureCheckFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        string("MD5"),
        methodCall(definingClass = "Landroid/util/Base64;", name = "encodeToString"),
        methodCall(definingClass = "Lcom/hotstar/secrets/Secrets;", name = "getSignFromJNI")
    )
)

// ============================================================================
// 4. Premium Entitlements & Subscription Nudges Fingerprints
// ============================================================================

/**
 * MyPageData.getIsSubscribed() — Protobuf-generated class for subscribed UI state.
 */
object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/MyPageData;",
    name = "getIsSubscribed",
    returnType = "Z"
)

/**
 * DownloadInfo.getIsPremium() — Protobuf-generated class for content download restriction.
 */
object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/feature/download/DownloadInfo;",
    name = "getIsPremium",
    returnType = "Z"
)

/**
 * Subscription nudge handler — suppresses paywall prompts during playback.
 */
object SubscriptionNudgeFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("interventionWidget"),
        string("null cannot be cast to non-null type com.hotstar.bff.models.widget.BffWidgetVisibilityIntervention"),
        string("SubscriptionNudgeWidget")
    )
)

// ============================================================================
// 5. Screen Mirroring & HDMI Multi-Display Fingerprints
// ============================================================================

/**
 * Checks DisplayManager.getDisplays().length > 1 and blocks playback over HDMI or wireless display.
 */
object MultipleDisplayCheckFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = "Landroid/hardware/display/DisplayManager;", name = "getDisplays"),
        opcode(Opcode.ARRAY_LENGTH),
        literal(1)
    )
)

/**
 * PlayerConfig.getEnableHdmiBroadcastListener() — Listener that shuts off playback when HDMI is connected.
 */
object PlayerConfigHdmiBroadcastFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/player/models/config/PlayerConfig;",
    name = "getEnableHdmiBroadcastListener",
    returnType = "Z"
)
