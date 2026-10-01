package app.bugg4.patches.oplmonitor.ads

import app.bugg4.patches.oplmonitor.Constants.COMPATIBILITY_OPL_MONITOR
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes banner, interstitial, rewarded, rewarded interstitial, app open and native " +
        "ads by preventing the Google Mobile Ads SDK from loading them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OPL_MONITOR)

    execute {
        listOf(
            BaseAdViewLoadAdFingerprint,
            InterstitialAdLoadFingerprint,
            RewardedAdLoadFingerprint,
            RewardedAdLoadAdManagerFingerprint,
            RewardedInterstitialAdLoadFingerprint,
            RewardedInterstitialAdLoadAdManagerFingerprint,
            AppOpenAdLoadFingerprint,
            AdLoaderLoadAdFingerprint,
            AdLoaderLoadAdsFingerprint,
            AdLoaderLoadAdManagerFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstruction(0, "return-void")
        }
    }
}
