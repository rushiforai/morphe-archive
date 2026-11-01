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
    description = "Stops analytics and tracking in the Fox One phone app: AppsFlyer, Braze, " +
        "Conviva, comScore, Adobe, Nielsen, Mux, Datadog, Segment, Contentsquare and Firebase. " +
        "Blocking happens on the device, inside the app. Sign-in and playback are left alone. " +
        "Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
