/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.muslimpro

import app.fakh.patches.muslimpro.shared.Constants.COMPATIBILITY_MUSLIMPRO
import app.fakh.patches.muslimpro.shared.duplicateApplicationNamePatch
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val MUSLIMPRO_PACKAGE = "com.bitsmedia.android.muslimpro"

/** SHA-1 of Muslim Pro's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val MUSLIMPRO_SIGNATURE = "5af0cce22ae8484e3842672e3dc0fdc5e2fc9abc"

/**
 * `GoogleSignInCommon.getSignInIntent` of the Play services auth library, which builds the intent that "Continue with
 * Google" and account linking start. R8 renames it, so it is found by the log line it opens with.
 */
private object GetSignInIntentFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;", "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;"),
    strings = listOf("getSignInIntent()"),
)

/**
 * "Continue with Google" runs the legacy `GoogleSignIn` flow and hands the ID token to Firebase Auth. Google only
 * issues that token to the signing certificate registered for the app, so a patched app is refused by Play services.
 * GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Continue with Google\" work by signing in through microG RE (GmsCore) instead of Google " +
        "Play services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MUSLIMPRO)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(duplicateApplicationNamePatch, gmsCoreSupportResourcePatch(MUSLIMPRO_PACKAGE, MUSLIMPRO_SIGNATURE))

    execute {
        redirectToGmsCore(MUSLIMPRO_SIGNATURE)
        GetSignInIntentFingerprint.method.addInstructions(0, "invoke-static { }, Lapp/fakh/extension/muslimpro/GmsCore;->require()V")
    }
}
