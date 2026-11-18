/*
 * Ported from ajstrick81's Tubi Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.tubi.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Tubi phone build 10.44.1 (also matches 10.43.1).
//
// Fox IMA SDK. This SDK is kept un-obfuscated, and hooks 3 to 5 are
// unchanged from ajstrick81's TV patch. Hooks 1 and 2 hook Kotlin listener
// lambdas, whose synthetic names change between builds ($lambda$10$lambda$9
// in 10.43.1, $lambda$0$0 in 10.44.1), so they match on the listener's
// parameter types instead of its name.

private const val FOX_IMA_AD_LISTENERS = "Lcom/fox/android/video/player/api/ima/listeners/FoxImaAdListeners;"

// Hook 1 — the AdEventListener lambda body, (FoxImaAdListeners, AdEvent)V
object FoxImaAdEventListenerFingerprint : Fingerprint(
    definingClass = FOX_IMA_AD_LISTENERS,
    returnType = "V",
    parameters = listOf(
        FOX_IMA_AD_LISTENERS,
        "Lcom/google/ads/interactivemedia/v3/api/AdEvent;",
    ),
)

// Hook 2 — the AdsLoadedListener lambda body, (FoxImaAdListeners, AdsManagerLoadedEvent)V
object FoxImaAdsLoadedListenerFingerprint : Fingerprint(
    definingClass = FOX_IMA_AD_LISTENERS,
    returnType = "V",
    parameters = listOf(
        FOX_IMA_AD_LISTENERS,
        "Lcom/google/ads/interactivemedia/v3/api/AdsManagerLoadedEvent;",
    ),
    strings = listOf("onAdsManagerLoaded"),
)

// Hook 3 — FoxPlayer.clearVodAds()
object FoxPlayerClearVodAdsFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/FoxPlayer;",
    name = "clearVodAds"
)

// Hook 5 — FoxImaStreamIdLoader.requestVODDAIUrl
object FoxImaVodStreamRequestFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/ima/loaders/FoxImaStreamIdLoader;",
    name = "requestVODDAIUrl",
    strings = listOf("requestVODDAIUrl() BEGIN..."),
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Lcom/fox/android/video/player/loaders/ImaStreamIdLoader\$ImaStreamUrlCallback;"
    ),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

// Hook 6 — FoxImaStreamIdLoader.requestImaStreamId
object FoxImaLiveStreamRequestFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/ima/loaders/FoxImaStreamIdLoader;",
    name = "requestImaStreamId",
    strings = listOf("requestImaStreamId BEGIN..."),
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/Boolean;",
        "Lcom/fox/android/video/player/loaders/ImaStreamIdLoader\$ImaStreamIdCallback;"
    ),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

// Obfuscated Tubi code. This build flattens R8 names into the root package
// (jpf, p9d) instead of the TV build's two-letter packages (Of/c, Bn/d).

// Rainmaker ad-break fetch: RainmakerAdsFetcher.suspendGetAdBreaks, renamed
// to jpf.r in 10.43.1 (rpf.q in 10.42.0). The phone build narrows the
// continuation parameter to the concrete ContinuationImpl (d85 in 10.43.1),
// so the fingerprint anchors
// on the PlayerAdsFetcherInterface implementation and the four leading
// parameters instead of the full signature. It is the only implementation.
object PhoneGetAdBreaksFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("api/v2/rev/vod/"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        classDef.interfaces.contains("Lcom/tubitv/ad/api/PlayerAdsFetcherInterface;") &&
            method.parameterTypes.size == 5 &&
            method.parameterTypes.take(4).map { it.toString() } == listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/util/Map;",
            )
    }
)

// One-shot image pause ad: PauseAdsManager's ImagePauseAds.Callback, whose
// b(Bitmap, String, List, List, List, List) posts show=true and the bitmap
// to the LiveData that raises PauseAdsView. The rotation callback (also an
// ImagePauseAds.Callback) is an empty method in 10.42.0 and 10.43.1, so the
// "waitShowing:" log literal picks out the one that renders.
object PhonePauseAdCallbackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/util/List;",
        "Ljava/util/List;",
    ),
    strings = listOf("waitShowing:"),
    custom = { _, classDef ->
        classDef.interfaces.contains(
            "Lcom/tubitv/features/player/presenters/pauseads/ImagePauseAds\$Callback;"
        )
    }
)

// Rotating image pause ad: PauseAdsManager.f(slot, index, count, onShown),
// the second place that posts the bitmap to PauseAdsView's LiveData. The
// "rotation_slot=" literal also appears in a coroutine lambda (b$e), so the
// (?, int, int, Function2)V shape is what makes this unique.
object PhonePauseAdRotationFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("rotation_slot="),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/tubitv/features/player/presenters/pauseads/") &&
            method.parameterTypes.map { it.toString() }.drop(1) == listOf(
                "I",
                "I",
                "Lkotlin/jvm/functions/Function2;",
            )
    }
)
