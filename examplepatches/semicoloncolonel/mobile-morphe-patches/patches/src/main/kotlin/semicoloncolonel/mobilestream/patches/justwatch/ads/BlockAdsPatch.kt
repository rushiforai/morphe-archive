package semicoloncolonel.mobilestream.patches.justwatch.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// JustWatch 26.43.10 is a React Native app. Every ad goes through the
// react-native-google-mobile-ads module (Google Ad Manager, with AppLovin,
// ironSource, Chartboost, Unity, and Meta as mediation partners):
//   initialize: answers the app at once, so no ad network is started.
//   native ads: every request is refused, as when no ad is available.
//   banners: never requested, and the banner view is hidden.
//   interstitial, rewarded, and app-open ads: never requested.
// Video ads before and during free streams are scheduled through the
// Bitmovin player's advertising config, whose schedule is now always empty.

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

internal object AdScheduleFingerprint : Fingerprint(
    definingClass = "Lcom/bitmovin/player/api/advertising/AdvertisingConfig;",
    name = "getSchedule",
    parameters = listOf(),
    returnType = "Ljava/util/List;",
)

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes the banner, native, full-screen, and video ads from JustWatch and " +
        "stops the ad networks from starting.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdsInitializeFingerprint.method.returnEarly(
            """
                invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;
                move-result-object v0
                invoke-interface { p1, v0 }, $PROMISE->resolve(Ljava/lang/Object;)V
                return-void
            """.trimIndent(),
        )

        // load(adUnitId, requestOptions, promise)
        NativeAdLoadFingerprint.method.returnEarly(
            """
                const-string v0, "no-fill"
                invoke-interface { p3, v0, v0 }, $PROMISE->reject(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """.trimIndent(),
        )

        BannerRequestFingerprint.method.returnEarly(
            """
                const/16 v0, 0x8
                invoke-virtual { p1, v0 }, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        FullScreenAdLoadFingerprint.method.returnEarly("return-void")

        AdScheduleFingerprint.method.returnEarly(
            """
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )
    }
}
