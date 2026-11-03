package app.template.patches.bold.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOLD
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks

/**
 * Bold (`dk.bold`) is a native Android app that ship Google Mobile Ads unmodified: banners,
 * interstitials, rewarded and app-open all load through the classic GMA classes. There is no
 * AppLovin MAX and no mediation in the APK.
 *
 * Every GMA load returns at once, exactly like an unfilled request; the app's own callbacks handle
 * a failed load. MobileAds.initialize is left alone (rule 9: the statics throw without it).
 *
 * Verified 2026-10-29 against 6.5.2 (versionCode 261): smoke test and CLI without -f.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Stops every Google Mobile Ads banner, native, interstitial, rewarded and app-open load.",
) {
    compatibleWith(COMPATIBILITY_BOLD)

    execute {
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
