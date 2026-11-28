package semicoloncolonel.mobilestream.patches.foxnews.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// Fox News for Android TV 5.6.0 ships Adobe Experience Platform, Braze,
// comScore, Nielsen, Segment, Fox's Pyxis ad telemetry and ID graph,
// LiveRamp, Unified ID 2.0, and Firebase Analytics. The app keeps OkHttp's
// public names, so both shared layers apply: every OkHttp client and every
// URL.openConnection() call checks the host blocklist. comScore's core is
// native code that may not use either, so its start-up call does nothing.
//
// Not touched: TV-provider sign-in (Adobe Pass), playback, Ketch consent,
// crash reporting, or the header bidding that only feeds ad requests.

internal object ComScoreInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/tv/ads/ComScoreInit;",
    name = "initialize",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "V",
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, ad measurement, and marketing services.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS, analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ComScoreInitializeFingerprint.method.returnEarly("return-void")
        blockTrackers()
    }
}
