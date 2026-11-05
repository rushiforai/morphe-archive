package semicoloncolonel.mobilestream.patches.hulu.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.hulu.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 6.34.0 phone build: AppsFlyer (attribution), Adobe
// Analytics, Conviva (video measurement), Nielsen (audience measurement),
// Datadog (session monitoring), and Firebase/Google Analytics. Hulu's R8
// renames part of OkHttp's API, so only the URLConnection layer applies here
// (see BlockTrackers.kt); it carries every SDK above except Datadog, which
// sends through OkHttp and is not covered.
//
// Not covered: Hulu's own analytics, which share hosts with sign-in and
// playback. Not touched: OneTrust consent, sign-in, ads/playback/DRM.
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
