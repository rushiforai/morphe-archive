/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Disables all analytics dispatch in ZEE5 Android TV by short-circuiting the
 * central `DefaultAnalytics.trackEvent` method. Because every `track*` method
 * (CleverTap, Firebase, Mixpanel and videoanalytics) funnels through this
 * single method, returning early here disables all third-party telemetry
 * without touching any of the SDKs individually.
 */

package app.morphe.patches.zee5.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.zee5.shared.AnalyticsTrackEventFingerprint
import app.morphe.patches.zee5.shared.Constants.COMPATIBILITY_ZEE5_TV

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables all third-party analytics (CleverTap, Firebase, Mixpanel, videoanalytics) " +
        "by short-circuiting the central analytics dispatch method. No tracking data is sent."
) {
    compatibleWith(COMPATIBILITY_ZEE5_TV)

    execute {
        // Insert a `return-void` at the very start of the dispatch method so that
        // none of the downstream tracker SDK calls ever execute.
        AnalyticsTrackEventFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
