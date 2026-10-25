package app.template.patches.expertplayer.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_EXPERTPLAYER
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.failFlutterGmaPluginLoads
import app.template.patches.shared.misc.ads.neuterAdHooks

// Expert Player is a Flutter app: its Dart code shows banner, interstitial, rewarded interstitial
// and app-open ads through the google_mobile_ads plugin (the load* channel names in libapp.so on
// 11.2.0), and the plugin's FlutterAdLoader / FlutterBannerAd are the only Java callers of the
// Google Mobile Ads loads. MobileAds.initialize is left alone on purpose: Dart awaits the plugin's
// initialize Future, which completes only from the SDK's init listener, so a no-op'ed init could
// hold up whatever awaits it. With every load failed below the SDK starts but never requests an ad,
// and the MobileAds statics the plugin exposes keep working (AGENTS.md rule 9 does not apply).
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads and skips the Play license check."
) {
    compatibleWith(COMPATIBILITY_EXPERTPLAYER)

    execute {
        // 1. PairIP's license check.
        PairipCheckLicenseFingerprint.method.returnEarly()

        // 2. Every google_mobile_ads plugin load reports NO_FILL to Dart, so a Dart flow waiting
        // on a load result (the app-open ad at start, interstitials) takes its "no ad" path.
        failFlutterGmaPluginLoads()

        // 3. Backstop: every Google Mobile Ads load entry point (BaseAdView / AdManagerAdView
        // banners, AdLoader natives, the static full-screen loads) returns at once, so no other
        // path can request an ad either.
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
