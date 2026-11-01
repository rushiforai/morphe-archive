package semicoloncolonel.mobilestream.patches.starz.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers
import semicoloncolonel.mobilestream.patches.starz.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Starz 6.11.0 shows no ads. Its only pre-roll is Starz's own skippable promo,
// so there is no Skip ads patch. Third-party SDKs: AppsFlyer, CleverTap,
// Leanplum, Braze, Firebase Analytics and Ethnio surveys. The app's API calls
// go through HttpURLConnection, so the shared URLConnection layer covers them;
// OkHttp is renamed and only loads images. The SDK entry points are mostly
// R8-renamed, so this relies on the host blocklist rather than init hooks.
//
// Not touched: Starz and TV-provider sign-in (sp.tbxnet.com), Facebook login,
// Firebase Remote Config and installations, billing, playback or DRM.
// Side effects: CleverTap and Leanplum in-app messages stop, and Leanplum
// remote variables fall back to the app's defaults.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the Starz phone app: AppsFlyer, CleverTap, " +
        "Leanplum, Braze, Firebase and Ethnio. Blocking happens on the device, inside the app. " +
        "Sign-in and playback are left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
