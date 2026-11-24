/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiisuper

import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.fakh.patches.todaiisuper.shared.Constants.COMPATIBILITY_TODAII_SUPER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

/** Logs a FirebaseAnalytics event from a Bundle. */
private object AnalyticsLogBundleFingerprint : Fingerprint(
    definingClass = "Lxs0;",
    name = "K",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Landroid/os/Bundle;"),
)

/** Logs a FirebaseAnalytics string parameter event. */
private object AnalyticsLogStringFingerprint : Fingerprint(
    definingClass = "Lxs0;",
    name = "T",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and crash reporting.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII_SUPER)
    category("Privacy")
    dependsOn(pairipLicenseCheckPatch, firebaseManifestPatch())

    execute {
        // SuperApplication.onCreate enables Crashlytics at runtime; keep it disabled.
        val crashlyticsEnable = mutableClassDefBy("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
            .methods
            .singleOrNull { it.name == "setCrashlyticsCollectionEnabled" && it.parameters.size == 1 && it.parameters[0].type == "Z" }
            ?: throw PatchException("Todaii Super: FirebaseCrashlytics.setCrashlyticsCollectionEnabled(Z) not found.")
        crashlyticsEnable.addInstructions(0, "return-void")

        AnalyticsLogBundleFingerprint.method.addInstructions(0, "return-void")
        AnalyticsLogStringFingerprint.method.addInstructions(0, "return-void")
    }
}
