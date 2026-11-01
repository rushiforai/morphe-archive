package semicoloncolonel.mobilestream.patches.mgm.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Third-party SDKs in the 240.0 phone build: Braze, Kochava, Segment, Nielsen
// and Firebase Analytics. MGM+ keeps OkHttp's public names, so both shared
// layers apply: URLConnection and OkHttp (see BlockTrackers.kt). The manifest
// kill switches turn off Firebase's own collection.
//
// Not touched: sign-in, playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the MGM+ phone app: Braze, Kochava, Segment, " +
        "Nielsen and Firebase. Blocking happens on the device, inside the app. Sign-in and " +
        "playback are left alone. Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
