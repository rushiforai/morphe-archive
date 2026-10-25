package app.template.patches.football433.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOOTBALL433
import app.template.patches.shared.misc.ads.failFlutterGmaPluginLoads

/**
 * The 433 Flutter app shows AdMob / Ad Manager ads only through the google_mobile_ads plugin:
 * Dart asks the plugin to create and load each banner, Ad Manager banner and rewarded
 * interstitial (the types this build's Dart code uses; the patch covers all nine plugin ad
 * types). Each plugin ad's load now reports a NO_FILL load failure to Dart instead of requesting
 * an ad, so the Dart widgets take their own "ad failed" path. No GMA or mediation (Liftoff /
 * Vungle) ad request is made. Rewarded ads fail to load like every other ad.
 * MobileAds.initialize is left alone (AGENTS.md rule 9).
 *
 * The plugin is R8-renamed here (2.3.548: package P8; onMethodCall P8/N, AdInstanceManager P8/a,
 * FlutterAd P8/f), so the shared helper finds it by its method-channel strings and method shapes.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_FOOTBALL433)

    execute {
        // Every plugin ad's load reports NO_FILL to Dart (shared/misc/ads/FlutterGmaPluginLoads.kt).
        failFlutterGmaPluginLoads()
    }
}
