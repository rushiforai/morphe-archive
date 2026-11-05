package semicoloncolonel.mobilestream.patches.foxone.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 1.24.0 phone build: AppsFlyer, Braze, Conviva,
// comScore, Adobe, Nielsen, Mux Data, Datadog, Segment, Contentsquare (session
// replay) and Firebase Analytics. Fox One keeps OkHttp's public names, so both
// shared layers apply: URLConnection and OkHttp (see BlockTrackers.kt). The
// manifest kill switches turn off Firebase collection and Contentsquare's
// auto-start.
//
// Not touched: sign-in, playback, DRM, Maestro (the live-sports panel) and
// PubNub.
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
