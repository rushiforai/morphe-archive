// Based on o0b/morphe-patches (GPL-3.0), patches/src/main/kotlin/app/template/patches/businesscalendar2/ads/
// BusinessCalendar2RemoveAdsPatch.k: the FairBid backstop (init and preload return early, show
// returns false) and the Audience Network provider kill. The user-level AdsUtil gate is ours.
package app.template.patches.bizcal.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BUSINESSCALENDAR

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads and the \"ads or Pro\" dialog."
) {
    compatibleWith(COMPATIBILITY_BUSINESSCALENDAR)

    execute {
        // 1. The user-level ad gate: no SDK start from MainActivity, no interstitial path.
        ShowAdsForUserFingerprint.method.returnEarly(false)

        // 2. The Remote Config ad flag, forced off so free users never get the "ads or Pro"
        //    dialog, even with Unlock Pro off. Its other readers are showAdsForUser (step 1) and
        //    the Go Pro screens, which then drop their "No ads" row (as when Remote Config says so).
        ShowAdsAccordingToFirebaseFingerprint.method.returnEarly(false)

        // 3. FairBid backstop for callers that skip the gate (AdvertOrProDialogFragment starts
        //    FairBid directly when the user agrees to see ads). Google Mobile Ads is not in the
        //    APK and MobileAds.initialize is not touched, so AGENTS.md rule 9 does not apply.
        InitializeMobileAdsFingerprint.method.returnEarly()
        PreloadInterstitialAdFingerprint.method.returnEarly()
        ShowInterstitialAdFingerprint.method.returnEarly(false)

        // 4. Facebook Audience Network's own process-start bootstrap.
        AudienceNetworkContentProviderFingerprint.method.returnEarly(false)
    }
}
