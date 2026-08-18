package app.template.patches.cricinfo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRICINFO

/**
 * Removes the full-screen "splash ad" shown for several seconds on every cold start
 * (the main cause of the long boot wait), plus the GPT interstitial that interrupts
 * navigation.
 *
 * How the splash ad works: it's pure Dart UI (`getAppSplashAdInfo` →
 * `CiAppSplashAdInfo(imageUrl: …)` in libapp.so), gated entirely on Firebase Remote
 * Config. The app's *bundled* RC defaults already disable it
 * (`app_ad_splash_screen_list = null`, `app_ad_gpt_interstitial_enabled = false`),
 * so the ad only appears after the app fetches config from ESPN's server at startup.
 *
 * Dart reads every RC value through one native path: the firebase_remote_config
 * plugin's `getAll` → `parseParameters(Map)`. We strip the ad keys out of that map,
 * so Dart never sees the server-supplied values and falls back to the (ad-free)
 * in-app defaults — no splash ad, no interstitial — while every other RC value keeps
 * flowing normally. Bytecode can't reach the Dart timer itself, but with no splash
 * config there is nothing to show, so the wait disappears.
 *
 * `parseParameters` is private and may be renamed by R8, but it is the only
 * `(Map) -> Map` method on the plugin, so we match it by signature. The input map is
 * a fresh `HashMap` from `FirebaseRemoteConfig.getAll()`, so removing keys is safe.
 */
@Suppress("unused")
val removeSplashAdPatch = bytecodePatch(
    name = "Remove splash ad, startup delay & forced update",
    description = "Removes the full-screen splash ad shown on every cold start (the " +
        "main cause of the slow boot), the GPT interstitial, and the \"you must " +
        "update\" blocking screen, by hiding their Firebase Remote Config keys from " +
        "the app. Other remote config is untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICINFO)

    execute {
        // Drop the ad- and force-update-gating RC keys from the map handed to Dart.
        // Result of each Map.remove is intentionally ignored.
        //
        // Two independent keys drive the "you must update" blocking page
        // (checkAppUpdate -> ISAAppUpdateConfig{FORCE_UPDATE|FLEXIBLE_UPDATE|NONE}
        // -> CiAppUpdateForceUpdatePage). ESPN raises these server-side as new builds
        // ship, which locks older installs out of the app entirely:
        //
        //  - app_build_min_version_code: a version-code floor. It IS in the bundled RC
        //    defaults (8700), so removing it falls back to 8700 — below every shipped
        //    build (9148, 9240) — and the gate never triggers.
        //  - app_update_config: a JSON blob carrying the update action type. It is NOT
        //    in the bundled defaults, so removing it leaves the same empty value the
        //    app already sees on a fresh install before its first fetch — a state it
        //    must handle, hence safe to force.
        val stripAdKeys = """
            const-string v0, "app_ad_splash_screen_list"
            invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
            const-string v0, "app_ad_splash_screen"
            invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
            const-string v0, "app_ad_gpt_interstitial_enabled"
            invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
            const-string v0, "app_build_min_version_code"
            invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
            const-string v0, "app_update_config"
            invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
        """

        mutableClassDefByOrNull(
            "Lio/flutter/plugins/firebase/firebaseremoteconfig/FirebaseRemoteConfigPlugin;",
        )
            ?.methods
            ?.filter {
                it.returnType == "Ljava/util/Map;" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0].toString() == "Ljava/util/Map;"
            }
            ?.forEach { it.addInstructions(0, stripAdKeys) }
    }
}
