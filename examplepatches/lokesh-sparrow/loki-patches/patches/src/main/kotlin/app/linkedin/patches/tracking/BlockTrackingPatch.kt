package app.linkedin.patches.tracking

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

/** MetricQueue.queueMetric(IMetricAdapter, Tracker, CustomTrackingEventBuilder, CopyOnWriteArraySet). */
private object QueueMetricFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/network/MetricQueue;",
    name = "queueMetric",
    returnType = "V",
    parameters = listOf("L", "L", "L", "Ljava/util/concurrent/CopyOnWriteArraySet;"),
)

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Adds an option (off by default) to stop sending most LinkedIn analytics events.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isBlockTrackingIncluded")

        QueueMetricFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_PACKAGE/TrackingPatch;->blockTracking()Z
                    move-result v0
                    if-eqz v0, :queue
                    return-void
                """,
                ExternalLabel("queue", getInstruction(0))
            )
        }
    }
}
