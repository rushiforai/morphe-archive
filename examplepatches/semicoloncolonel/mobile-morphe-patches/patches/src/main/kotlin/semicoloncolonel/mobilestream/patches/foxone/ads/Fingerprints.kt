/*
 * Ported from ajstrick81's Fox One Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/foxone/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.foxone.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Fox One phone build 1.24.0 (versionCode 26101302).
//
// The Fox player SDK (com.fox.android.video.player) is kept un-obfuscated, and
// all eight TV fingerprints match the phone build unchanged, including the
// newer lambda$0$0 numbering. Two ad pipelines:
//   VOD  -> Google IMA/DAI via FoxImaAdListeners + FoxImaStreamIdLoader
//   Live -> Yospace SSAI via YospaceAnalyticEventObserver

// Hook 1 — FoxImaAdListeners.adEventListener_delegate$lambda$0$0
object FoxImaAdEventListenerFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/ima/listeners/FoxImaAdListeners;",
    name = "adEventListener_delegate\$lambda\$0\$0",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL)
)

// Hook 2 — FoxImaAdListeners.adsLoadedListener_delegate$lambda$0$0
object FoxImaAdsLoadedListenerFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/ima/listeners/FoxImaAdListeners;",
    name = "adsLoadedListener_delegate\$lambda\$0\$0",
    strings = listOf("onAdsManagerLoaded"),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL)
)

// Hook 3 — FoxPlayer.clearVodAds()
object FoxPlayerClearVodAdsFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/FoxPlayer;",
    name = "clearVodAds"
)

// Hook 4 — FoxImaStreamIdLoader.requestVODDAIUrl
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

// Hook 5 — FoxImaStreamIdLoader.requestImaStreamId
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

// Hook 6 — YospaceAnalyticEventObserver.dispatchAdEvent(FoxAdEvent). Live.
object YospaceDispatchAdEventFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/yospace/listener/YospaceAnalyticEventObserver;",
    name = "dispatchAdEvent",
    parameters = listOf("Lcom/fox/android/video/player/event/FoxAdEvent;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL)
)

// Hook 7 — YospaceAnalyticEventObserver.dispatchSlateEvent(FoxSlateEvent). Live.
object YospaceDispatchSlateEventFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/yospace/listener/YospaceAnalyticEventObserver;",
    name = "dispatchSlateEvent",
    parameters = listOf("Lcom/fox/android/video/player/event/FoxSlateEvent;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL)
)

// Hook 8 — YospaceSeekablePlaybackPolicyHandler.setHandleFastForwardSeek. Live.
object YospaceSeekPolicyFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/yospace/handler/YospaceSeekablePlaybackPolicyHandler;",
    name = "setHandleFastForwardSeek",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL)
)
