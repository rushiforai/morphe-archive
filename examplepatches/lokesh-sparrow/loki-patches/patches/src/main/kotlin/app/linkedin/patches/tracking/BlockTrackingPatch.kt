/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

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
private val metricQueueInsert = Fingerprint(
    definingClass = "Lcom/linkedin/android/litrackinglib/network/MetricQueue;",
    name = "queueMetric",
    returnType = "V",
    parameters = listOf("L", "L", "L", "Ljava/util/concurrent/CopyOnWriteArraySet;"),
)

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Adds a switch (off by default) that stops most of LinkedIn's analytics events from being sent.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch)

    execute {
        markIncluded("isBlockTrackingIncluded")

        with(metricQueueInsert.method) {
            // One funnel for the whole tracking library; the locals are still empty at offset 0, so v0 is free.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_PACKAGE/TrackingPatch;->blockTracking()Z
                    move-result v0
                    if-eqz v0, :keep_metric
                    return-void
                """,
                ExternalLabel("keep_metric", getInstruction(0))
            )
        }
    }
}
