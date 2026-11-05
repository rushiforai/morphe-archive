package semicoloncolonel.mobilestream.patches.justwatch.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// JustWatch is a React Native app. On the phone build (26.43.10), every
// display ad goes through the react-native-google-mobile-ads module (Google
// Ad Manager, with AppLovin, ironSource, Chartboost, Unity, and Meta as
// mediation partners):
//   initialize: answers the app at once, so no ad network is started.
//   native ads: every request is refused, as when no ad is available.
//   banners: never requested, and the banner view is hidden.
//   interstitial, rewarded, and app-open ads: never requested.
// The Android TV build (26.43.8) does not ship that module, so those hooks
// are applied only where it exists.
//
// On both builds, video ads before and during free streams are scheduled
// through the Bitmovin player's advertising config, whose schedule is now
// always empty. That hook is required.
//
// The Android TV build also schedules its pre-roll pod at runtime: the app's
// JavaScript calls scheduleAd on Bitmovin's React Native player module after
// the title loads. That call now answers the JavaScript at once without
// scheduling anything, so no ad is pending and autoplay starts the title.

private const val ADS = "Lio/invertase/googlemobileads/"
private const val PROMISE = "Lcom/facebook/react/bridge/Promise;"

internal object AdsInitializeFingerprint : Fingerprint(
    definingClass = "${ADS}ReactNativeGoogleMobileAdsModule;",
    name = "initialize",
    parameters = listOf(PROMISE),
    returnType = "V",
)

internal object NativeAdLoadFingerprint : Fingerprint(
    definingClass = "${ADS}ReactNativeGoogleMobileAdsNativeModule;",
    name = "load",
    returnType = "V",
)

internal object BannerRequestFingerprint : Fingerprint(
    definingClass = "${ADS}ReactNativeGoogleMobileAdsBannerAdViewManager;",
    name = "requestAd",
    returnType = "V",
)

internal object FullScreenAdLoadFingerprint : Fingerprint(
    definingClass = "${ADS}ReactNativeGoogleMobileAdsFullScreenAdModule;",
    name = "load",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
    returnType = "V",
)

// PlayerModule.scheduleAd(nativeId, adItemJson, promise), called from JavaScript.
internal object RnScheduleAdFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/player/reactnative/PlayerModule;",
    name = "scheduleAd",
    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;", PROMISE),
    returnType = "V",
)

internal object AdScheduleFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/player/api/advertising/AdvertisingConfig;",
    name = "getSchedule",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the banner, native, full-screen, and video ads.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Display ads (phone build only).
        AdsInitializeFingerprint.methodOrNull?.returnEarly(
            """
                invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;
                move-result-object v0
                invoke-interface { p1, v0 }, $PROMISE->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )

        // load(adUnitId, requestOptions, promise)
        NativeAdLoadFingerprint.methodOrNull?.returnEarly(
            """
                const-string v0, "no-fill"
                invoke-interface { p3, v0, v0 }, $PROMISE->reject(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """.trimIndent(),
        )

        BannerRequestFingerprint.methodOrNull?.returnEarly(
            """
                const/16 v0, 0x8
                invoke-virtual { p1, v0 }, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        FullScreenAdLoadFingerprint.methodOrNull?.returnEarly("return-void")

        // Video ads (both builds).
        AdScheduleFingerprint.method.returnEarly(
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        // Runtime pre-roll scheduling (Android TV build).
        RnScheduleAdFingerprint.methodOrNull?.returnEarly(
            """
                const/4 v0, 0x0
                invoke-interface { p3, v0 }, $PROMISE->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )
    }
}
