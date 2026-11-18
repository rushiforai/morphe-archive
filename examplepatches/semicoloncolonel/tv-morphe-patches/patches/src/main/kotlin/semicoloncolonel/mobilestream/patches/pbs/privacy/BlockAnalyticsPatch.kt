package semicoloncolonel.mobilestream.patches.pbs.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in 5.27.0: AppsFlyer, Firebase Analytics and Mux Data,
// whose beacons PBS sends to its own qoe.pbs.org instead of litix.io. PBS
// renames OkHttp, so only the shared URLConnection layer applies (see
// BlockTrackers.kt).
//
// Not touched: PBS sign-in, Passport, local-station selection, Firebase
// Remote Config, Ketch consent, playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
