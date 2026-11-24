/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman

import app.fakh.patches.shared.disableFacebookAppEvents
import app.fakh.patches.shared.disableProviders
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.fakh.patches.todaiigerman.shared.Constants.COMPATIBILITY_TODAII_GERMAN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch

/**
 * Disables the AppMetrica init provider and turns off Facebook App Events and advertiser ID collection.
 * FacebookInitProvider stays enabled because BaseFragment.onCreate builds an AppEventsLogger, which throws when the
 * Facebook SDK was never initialized.
 */
private val analyticsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "io.appmetrica.analytics.internal.PreloadInfoContentProvider",
            )

            manifest.disableFacebookAppEvents()
        }
    }
}

/** FirebaseAnalytics.a(String, Bundle): logs an analytics event. */
private object FirebaseLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

/** FirebaseAnalytics.b(String, String): sets a user property. */
private object FirebaseSetUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII_GERMAN)
    category("Privacy")
    dependsOn(firebaseManifestPatch(), analyticsManifestPatch)

    execute {
        FirebaseLogEventFingerprint.method.addInstructions(0, "return-void")
        FirebaseSetUserPropertyFingerprint.method.addInstructions(0, "return-void")
    }
}
