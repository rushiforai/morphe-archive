/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

/**
 * A getter of the app's own Privacy and analytics switches: a static `(Context)Z` method that reads [key] from the
 * "settings_preferences" SharedPreferences, defaulting to true. R8 renames it, so it is found by the key.
 */
private class PrivacySwitchFingerprint(key: String) : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(key),
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics, telemetry and crash reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Privacy")
    dependsOn(firebaseManifestPatch())

    execute {
        // Everything GitHub collects itself is gated on the "Analytics" switch: scheduling the AnalyticsWorker, the
        // worker's upload, recording events into the analytics_events table, and the health metrics sent to the
        // Twirp TelemetryAPI. The crash reporting switch is turned off too, so the settings screen shows both as off.
        listOf("key_analytics_enabled", "key_crash_logging_enabled").forEach {
            PrivacySwitchFingerprint(it).method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }
    }
}
