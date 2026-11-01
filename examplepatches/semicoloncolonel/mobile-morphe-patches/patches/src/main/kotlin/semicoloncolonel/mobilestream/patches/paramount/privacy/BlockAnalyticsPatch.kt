package semicoloncolonel.mobilestream.patches.paramount.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.paramount.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 17.2.0 phone build: Braze, Conviva, Nielsen,
// comScore, Kochava, Adobe Analytics, New Relic, Tealium (tiqcdn.com) and
// Branch through Paramount's own link domain (branch-sf5.cbs.com). Paramount+
// keeps OkHttp's public names, so both shared layers apply: URLConnection and
// OkHttp (see BlockTrackers.kt).
//
// Not touched: OneTrust consent, sign-in, ads/playback/DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the Paramount+ phone app: Braze, Conviva, " +
        "Nielsen, comScore, Kochava, Adobe Analytics, New Relic, Tealium and Branch. Blocking " +
        "happens on the device, inside the app. Sign-in and playback are left alone. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
