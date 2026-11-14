package semicoloncolonel.mobilestream.patches.settingshome.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.settingshome.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// Settings Home fans every event out to a stack of trackers, each a subclass of
// AnalyticsService with a logEvent(String, Map) method: Firebase, RudderStack,
// Singular (attribution), Microsoft Clarity (session recording), and Braze
// (marketing). Returning from each logEvent drops the events at the source.
// The shared manifest kill switches turn off Firebase's own auto-collection and
// ad-id, and the shared host blocklist fails the trackers' uploads.
//
// Not touched: the debug-only analytics services, which send nothing.
// ─────────────────────────────────────────────────────────────────────────────

private class TrackerLogEventFingerprint(service: String) : Fingerprint(
    definingClass = service,
    name = "logEvent",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;"),
    returnType = "V",
)

private val trackers = listOf(
    "Lcom/eet/core/analytics/service/firebase/FirebaseAnalyticsService;",
    "Lcom/eet/service/rudderstack/analytics/RudderstackAnalyticsService;",
    "Lcom/eet/service/singular/analytics/SingularAnalyticsService;",
    "Lcom/eet/service/clarity/analytics/ClarityAnalyticsService;",
    "Lcom/eet/service/braze/analytics/BrazeAnalyticsService;",
).map(::TrackerLogEventFingerprint)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops the app's analytics, attribution, session-recording, and marketing trackers.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val hooked = trackers.count { it.methodOrNull?.let { m -> m.addInstructions(0, "return-void"); true } == true }
        if (hooked == 0) throw PatchException("No Settings Home analytics trackers matched")

        blockTrackers()
    }
}
