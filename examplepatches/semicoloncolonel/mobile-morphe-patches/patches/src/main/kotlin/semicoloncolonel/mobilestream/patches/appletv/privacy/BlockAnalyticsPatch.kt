package semicoloncolonel.mobilestream.patches.appletv.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Apple TV 3.0.0 has no third-party analytics SDK. Its own metrics (page
// views, clicks, plays, searches, impressions and purchases) are recorded in
// the native TV app services library and uploaded by Apple Media Services
// (AMSKit), both of which network from native code, so a network blocker in
// Java cannot see them. Every event crosses into Java once, though: the
// native core hands it to MetricsServiceAdapter.recordEvent(topic, json),
// and asks MetricsServiceAdapter.flushEvents() to upload the queue. Both
// return a BridgeMetricsResult. They are made to report success at once,
// so no event is queued or uploaded and the core carries on as usual.
//
// Not touched: Crashlytics crash reporting, sign-in, purchases and playback.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADAPTER = "Lcom/apple/android/tv/tvappservices/ams/MetricsServiceAdapter;"
private const val RESULT = "Lcom/apple/android/tv/tvappservices/bindings/BridgeMetricsResult;"

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops Apple's usage metrics, such as the pages you view and what you play.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val methods = mutableClassDefBy(ADAPTER).methods.filter {
            (it.name == "recordEvent" || it.name == "flushEvents") && it.returnType == RESULT
        }
        if (methods.size != 2) throw PatchException("Apple TV metrics adapter not found")
        methods.forEach {
            it.addInstructions(
                0,
                """
                    new-instance v0, $RESULT
                    invoke-direct { v0 }, $RESULT-><init>()V
                    const/4 v1, 0x1
                    invoke-virtual { v0, v1 }, $RESULT->setIsSuccess(Z)V
                    return-object v0
                """,
            )
        }
    }
}
