package semicoloncolonel.mobilestream.patches.disney.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.disney.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 26.20.0 phone build: Braze (marketing), Conviva
// (video measurement), Nielsen (audience measurement; its config comes from
// nmrodam.com), Firebase/Google Analytics, and Datadog session monitoring.
// Disney renames OkHttp, so only the URLConnection layer applies here
// (see BlockTrackers.kt). On-device logs confirm Braze and Conviva are
// blocked through it. Datadog sends through the renamed OkHttp and is not
// covered.
//
// Not covered: Disney's own analytics ("Glimpse" and DSS event-edge events).
// Those go to the same bamgrid.com API hosts the app needs for sign-in and
// playback, so they cannot be blocked by host. Not touched: OneTrust consent,
// sign-in, ads/playback/DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops third-party analytics and tracking in the Disney+ phone app: Braze, " +
        "Conviva, Nielsen, and Firebase/Google Analytics. " +
        "Blocking happens on the device, inside the app. Disney's own analytics share " +
        "servers with sign-in and playback, so they are not blocked. Opt-in / experimental; " +
        "test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
