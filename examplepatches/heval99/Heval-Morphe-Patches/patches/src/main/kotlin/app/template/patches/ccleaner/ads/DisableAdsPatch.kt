package app.template.patches.ccleaner.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CCLEANER
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

/**
 * CCleaner serves its ads through Google Mobile Ads: the cleaner's `BaseAdService` and the home
 * feed's `AdMobDataSource` both initialize GMA and load banners, interstitials, rewarded and
 * native ads. The AppLovin MAX, Meta Audience Network, IronSource, Unity, Vungle, Mintegral,
 * Pangle and InMobi classes in the dex are mediation adapters that only run if GMA asks for them,
 * so blocking GMA covers them all.
 *
 * The app's own `BaseAdService.areAdsAllowed()` is forced false (that is the path a Pro user
 * already takes, so ad slots collapse instead of loading), `MobileAds.initialize` and every other
 * MobileAds static are no-oped (rule 9: the app calls setAppVolume), and every GMA load entry
 * point returns at once. Firebase-style ad event logging is handled by Disable telemetry.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables ads.",
) {
    compatibleWith(COMPATIBILITY_CCLEANER)

    execute {
        AdsAllowedFingerprint.method.returnEarly(false)
        neutraliseMobileAdsStatics("initialize")
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
