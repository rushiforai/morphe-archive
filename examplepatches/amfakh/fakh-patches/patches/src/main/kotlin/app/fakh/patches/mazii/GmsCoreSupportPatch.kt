/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.mazii

import app.fakh.patches.mazii.shared.Constants.COMPATIBILITY_MAZII
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val MAZII_PACKAGE = "com.mazii.dictionary"

/** SHA-1 of Mazii's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val MAZII_SIGNATURE = "9ba8ed22e34e362f1dcf0d622a8b1566dc6b24b3"

/**
 * GoogleSignInCommon.getSignInIntent(Context, GoogleSignInOptions): the app's own copy of the legacy Google sign-in
 * builds the intent for the login and sign-up buttons and the home screen. R8 renames it, so it is found by the log
 * line it opens with.
 */
private object GetSignInIntentFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;", "Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;"),
    strings = listOf("getSignInIntent()"),
)

/**
 * "Continue with Google" runs the legacy `GoogleSignIn` flow and exchanges the ID token with Mazii's backend. Google
 * only issues that token to the signing certificate registered for the app, so a patched app is rejected by Play
 * services. GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Continue with Google\" work by signing in through microG RE (GmsCore) instead of Google " +
        "Play services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAZII)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(MAZII_PACKAGE, MAZII_SIGNATURE))

    execute {
        redirectToGmsCore(MAZII_SIGNATURE)
        GetSignInIntentFingerprint.method.addInstructions(0, "invoke-static { }, Lapp/fakh/extension/mazii/GmsCore;->require()V")
    }
}
