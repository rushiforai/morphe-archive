/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius

import app.fakh.patches.genius.shared.Constants.COMPATIBILITY_GENIUS
import app.fakh.patches.shared.disableFacebookAppEvents
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

private val TRACKER_METHODS = mapOf(
    "Lcom/comscore/Analytics;" to setOf("start"),
    "Lai/medialab/medialabanalytics/MediaLabAnalytics;" to setOf("initialize", "trackEvent", "flushEventsQueue"),
    "Lcom/mixpanel/android/mpmetrics/MixpanelAPI;" to setOf("track", "trackMap", "flush"),
    "Lcom/google/firebase/analytics/FirebaseAnalytics;" to setOf("logEvent"),
    "Lcom/genius/android/core/reporting/ErrorReporter;" to setOf("send"),
)

/** Turns off Facebook App Events and advertiser ID collection. */
private val analyticsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableFacebookAppEvents()
        }
    }
}

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking (Firebase, Mixpanel, comScore, MediaLab Analytics, and Facebook).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GENIUS)
    category("Privacy")
    dependsOn(firebaseManifestPatch(), analyticsManifestPatch)

    execute {
        var stubbed = 0
        classDefForEach { classDef ->
            val names = TRACKER_METHODS[classDef.type] ?: return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in names && it.returnType == "V" }
                .forEach {
                    it.addInstruction(0, "return-void")
                    stubbed++
                }
        }
        if (stubbed == 0) throw PatchException("genius: no tracker methods found to stub.")
    }
}
