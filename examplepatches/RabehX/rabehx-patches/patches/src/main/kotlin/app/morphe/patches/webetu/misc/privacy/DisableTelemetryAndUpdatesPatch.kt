/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.privacy

import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.returnEarlyAll
import app.morphe.patches.shared.returnEarlyVoidAll
import app.morphe.patches.shared.setMetaData
import app.morphe.patches.webetu.shared.WebetuConstants

private val REMOVED_COMPONENTS = setOf(
    "io.sentry.android.core.SentryInitProvider",
    "io.sentry.android.core.SentryPerformanceProvider",
    "androidx.compose.ui.tooling.PreviewActivity",
)

private val OVERRIDDEN_META_DATA = mapOf(
    "expo.modules.updates.ENABLED" to "false",
    "expo.modules.updates.EXPO_UPDATES_CHECK_ON_LAUNCH" to "NEVER",
    "io.sentry.auto-init" to "false",
)

@Suppress("unused")
val disableTelemetryAndUpdatesPatch = patch(
    name = "Disable telemetry and OTA updates",
    description = "Disables Expo OTA updates so patched JS bundles are not overwritten, removes " +
            "Sentry crash/performance telemetry and root checks, and strips leaked debug tooling " +
            "while keeping Firebase push notifications working.",
    default = true,
) {
    category("Privacy")
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    execute {
        mutableClassDefByOrNull("Lio/sentry/android/core/SentryAndroid;")?.returnEarlyVoidAll { it.name == "init" }
        mutableClassDefByOrNull("Lio/sentry/android/core/internal/util/RootChecker;")?.returnEarlyAll(false)

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements(listOf("provider", "activity", "service", "receiver")) {
                it.attribute("android:name") in REMOVED_COMPONENTS
            }
            manifest.removeElements(listOf("uses-permission")) {
                it.attribute("android:name") == "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"
            }
            manifest.setMetaData(OVERRIDDEN_META_DATA)
        }
    }
}
