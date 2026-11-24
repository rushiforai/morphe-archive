/*
 * Based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.tracking

import app.fakh.patches.linkedin.shared.Constants.BLOCK_TRACKING
import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

/** MetricQueue.queueMetric(IMetricAdapter, Tracker, CustomTrackingEventBuilder, CopyOnWriteArraySet). */
private object QueueMetricFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/network/MetricQueue;",
    name = "queueMetric",
    returnType = "V",
    parameters = listOf("L", "L", "L", "Ljava/util/concurrent/CopyOnWriteArraySet;"),
)

@Suppress("unused")
val blockTrackingPatch = patch(
    name = "Disable analytics",
    description = "Stops most LinkedIn analytics events from being sent. Adds a switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Privacy")
    dependsOn(settingsPatch)

    execute {
        register(BLOCK_TRACKING)

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
