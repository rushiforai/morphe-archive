package app.template.patches.fotmob.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Turns off FotMob's ads, as for FotMob+ members."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    // Rule 9 (2026-11-22 audit): 242 has no legacy com.google.android.gms.ads.MobileAds class
    // (apkanalyzer: class not found; the com.google.android.gms.ads package itself is there with 45
    // methods, but none of them is MobileAds), no "Initializing on calling thread" log line
    // and no call to that class; the ads come from the next-gen SDK (ads_mobile_sdk/*). So the shared
    // neutraliseMobileAdsStatics has nothing to act on. No MobileAds method is no-opped here: FotMob
    // itself skips the ads initialisation and the ad slots behind shouldShowAds().
    execute {
        // shouldShowAds() answers false, the path FotMob takes for FotMob+ subscribers. Its
        // callers (20 in 239) include the MobileAds initialisation, which then never runs, and
        // the screens that set up ad slots.
        val shouldShowAds = ShouldShowAdsFingerprint.method
        if (shouldShowAds.implementation == null) {
            throw PatchException("FotMob shouldShowAds() has no implementation")
        }
        shouldShowAds.returnEarly(false)

        // 2026-11-03 (startup): the Meta Audience Network and Vungle startup providers answer
        // "created" at once, so neither SDK initialises on cold start. Nothing loads their ads
        // once shouldShowAds() is false.
        listOf(AudienceNetworkProviderFingerprint, VungleProviderFingerprint).forEach { fingerprint ->
            val provider = fingerprint.method
            if (provider.implementation == null) {
                throw PatchException("${provider.definingClass}->onCreate has no implementation")
            }
            provider.returnEarly(true)
        }
    }
}
