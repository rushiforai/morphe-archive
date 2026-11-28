package semicoloncolonel.mobilestream.patches.fandango.privacy

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.fandango.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Fandango at Home for Android TV 10.20.a016 ships Mux Data, Adobe Analytics,
// and Firebase. It renames OkHttp, and these trackers send through
// URL.openConnection(), which the shared layer covers. Unlike the phone app,
// the Android TV build has no comScore or Kochava.
//
// Not touched: sign-in, purchases, playback, Widevine licenses, and the
// OneTrust consent screen.

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute { blockTrackers() }
}
