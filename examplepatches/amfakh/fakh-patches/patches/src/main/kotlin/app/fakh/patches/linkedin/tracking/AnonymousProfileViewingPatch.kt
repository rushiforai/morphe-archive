package app.fakh.patches.linkedin.tracking

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.markIncluded
import app.fakh.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/**
 * MetricQueue.queueMetric(IMetricAdapter, Tracker, CustomTrackingEventBuilder, CopyOnWriteArraySet): every
 * analytics event built with a CustomTrackingEventBuilder, such as the ProfileViewEvent, goes through here.
 */
private object ProfileEventQueueFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/network/MetricQueue;",
    name = "queueMetric",
    returnType = "V",
    parameters = listOf("L", "L", "L", "Ljava/util/concurrent/CopyOnWriteArraySet;"),
)

@Suppress("unused")
val anonymousProfileViewingPatch = bytecodePatch(
    name = "Anonymous profile viewing",
    description = "Adds an option (off by default) to visit profiles without being listed in " +
        "\"Who viewed your profile\": the app does not report the visit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Privacy")
    dependsOn(settingsPatch)

    execute {
        markIncluded("isAnonymousProfileViewingIncluded")

        ProfileEventQueueFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch. p3 is the event builder.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p3 }, $EXTENSION_PACKAGE/TrackingPatch;->dropProfileView(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :queue
                    return-void
                """,
                ExternalLabel("queue", getInstruction(0))
            )
        }
    }
}
