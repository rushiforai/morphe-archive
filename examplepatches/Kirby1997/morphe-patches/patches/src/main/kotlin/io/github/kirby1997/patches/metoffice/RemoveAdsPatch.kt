package io.github.kirby1997.patches.metoffice

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// react-native-google-mobile-ads banner chokepoint. Every banner ad routed through
// the JS <BannerAd /> component lands here to call into AdManagerAdView.loadAd().
// Returning at offset 0 leaves the slot in the layout but never fetches an ad.
object BannerRequestAdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf("Lio/invertase/googlemobileads/common/ReactNativeAdView;"),
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsBannerAdViewManager;",
    name = "requestAd",
)

// Shared entry point for InterstitialAd and RewardedAd (both modules subclass this
// abstract module). The JS bridge calls load(requestId, adUnitId, adRequestOptions);
// returning before the AdLoader runs prevents the ad from ever loading or showing.
object FullScreenLoadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsFullScreenAdModule;",
    name = "load",
)

// AppOpenAd module has its own load entry instead of inheriting from FullScreenAdModule.
object AppOpenLoadFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;", "Lcom/facebook/react/bridge/ReadableMap;"),
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsAppOpenModule;",
    name = "appOpenLoad",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops banner, interstitial, rewarded, and app-open ads from loading by no-opping " +
        "the react-native-google-mobile-ads native bridge entry points.",
) {
    compatibleWith(Constants.METOFFICE)

    execute {
        BannerRequestAdFingerprint.method.addInstructions(0, "return-void")
        FullScreenLoadFingerprint.method.addInstructions(0, "return-void")
        AppOpenLoadFingerprint.method.addInstructions(0, "return-void")
    }
}
