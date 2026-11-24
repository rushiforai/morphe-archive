package patches.cronometer.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.cronometer.cronometer
import patches.cronometer.originalInput
import patches.shared.uniqueMatch

private object MobileAdsInitialize : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterMobileAdsWrapper;",
    name = "initialize",
    returnType = "V",
    // The second parameter is an R8-renamed type that changes between releases.
)

private object BannerLoad : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterBannerAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

private object InterstitialLoad : Fingerprint(
    definingClass = "Lio/flutter/plugins/googlemobileads/FlutterInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = emptyList(),
)

private object MobileAdsInitProvider : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Stops the Google Mobile Ads SDK before it initialises and stops both ad
 * formats Cronometer uses. The Dart banner/interstitial wrappers then stay in
 * their placeholder state instead of requesting an ad.
 */
@Suppress("unused")
val disableAds = bytecodePatch(
    name = "Disable ads",
    description = "Stops Google Mobile Ads initialisation and Cronometer's banner/interstitial " +
        "load paths. No ad request is made; the Dart ad slots remain empty.",
) {
    compatibleWith(cronometer)
    dependsOn(originalInput)
    execute {
        MobileAdsInitialize.uniqueMatch().method.addInstruction(0, "return-void")
        BannerLoad.uniqueMatch().method.addInstruction(0, "return-void")
        InterstitialLoad.uniqueMatch().method.addInstruction(0, "return-void")
        MobileAdsInitProvider.uniqueMatch().method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
