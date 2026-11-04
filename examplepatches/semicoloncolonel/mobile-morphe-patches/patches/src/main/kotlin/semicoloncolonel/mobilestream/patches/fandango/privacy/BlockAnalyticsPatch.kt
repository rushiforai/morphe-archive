package semicoloncolonel.mobilestream.patches.fandango.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Fandango at Home 10.24 renames OkHttp, but every tracker it ships sends
// through URL.openConnection(), which the shared layer covers: comScore
// (including the native library, which calls back into Java to send),
// Kochava and its fallback hosts, Mux Data, Adobe Analytics, and Firebase
// Analytics.
//
// Not touched: sign-in, purchases, playback, Widevine licenses, and the
// OneTrust consent screen.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops comScore, Kochava, Mux video analytics, Adobe Analytics, and Firebase Analytics. " +
        "Sign-in, purchases, and playback are left alone.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
