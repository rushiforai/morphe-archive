package patches.safar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * Safar (com.safar.fyi) is a React Native app; ads are Google AdMob driven through the
 * react-native-google-mobile-ads bridge (io.invertase.googlemobileads.*). The class/method names are
 * the library's own and un-obfuscated, so these anchor cleanly across builds.
 *
 * We stub the three per-type ad *LOAD* funnels to return immediately → no ad is ever requested, so none
 * renders. We deliberately do NOT touch the shared abstract base (ReactNativeGoogleMobileAdsFullScreenAd
 * Module.load/show) — Interstitial/AppOpen/Rewarded/RewardedInterstitial all inherit it — and we do NOT
 * touch the SHOW methods (stubbing show() would leave the JS Promise unresolved and hang the JS handler;
 * with load stubbed, show() cleanly rejects "not-ready" and JS continues).
 *
 * Rewarded / rewarded-interstitial are left working on purpose (they may gate a feature, and they are
 * user-initiated, not intrusive).
 */
private const val GMA = "Lio/invertase/googlemobileads/"

// Banner: the single funnel that builds the BaseAdView and calls loadAd().
internal val bannerRequestAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Lio/invertase/googlemobileads/common/ReactNativeAdView;"),
    custom = { m, c -> c.type == "${GMA}ReactNativeGoogleMobileAdsBannerAdViewManager;" && m.name == "requestAd" },
)

// Interstitial load (@ReactMethod).
internal val interstitialLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
    custom = { m, c -> c.type == "${GMA}ReactNativeGoogleMobileAdsInterstitialModule;" && m.name == "interstitialLoad" },
)

// App-open load (@ReactMethod).
internal val appOpenLoadFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
    custom = { m, c -> c.type == "${GMA}ReactNativeGoogleMobileAdsAppOpenModule;" && m.name == "appOpenLoad" },
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes Safar's AdMob banner, interstitial and app-open ads by stubbing the " +
        "react-native-google-mobile-ads load funnels (no ad is requested, so none renders). " +
        "User-initiated rewarded ads are left working.",
) {
    compatibleWith(COMPATIBILITY_SAFAR)

    execute {
        bannerRequestAdFingerprint.method.addInstructions(0, "return-void")
        interstitialLoadFingerprint.method.addInstructions(0, "return-void")
        appOpenLoadFingerprint.method.addInstructions(0, "return-void")
    }
}
