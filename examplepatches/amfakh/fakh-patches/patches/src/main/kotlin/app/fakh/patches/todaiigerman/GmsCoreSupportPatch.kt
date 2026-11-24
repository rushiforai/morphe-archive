/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.fakh.patches.todaiigerman.shared.Constants.COMPATIBILITY_TODAII_GERMAN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val TODAII_GERMAN_PACKAGE = "mobi.eup.easygerman"

/** SHA-1 of Todaii German's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val TODAII_GERMAN_SIGNATURE = "dd3bd1c37049e776249328c9f397f782bcd7b688"

/**
 * CredentialProviderFrameworkImpl.isAvailableOnDevice checks SDK_INT >= 34 and routes Google sign-in through the system
 * CredentialManager service, which finds no credential for the repackaged app and throws NoCredentialException.
 */
private object FrameworkCredentialProviderFingerprint : Fingerprint(
    definingClass = "LP/A;",
    name = "isAvailableOnDevice",
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Google sign-in uses legacy `GoogleSignInClient.getSignInIntent` (`Lcom/google/android/gms/auth/api/signin/internal/zbd;->getSignInIntent`)
 * so Play services validates the signing certificate. GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes Google sign-in work by signing in through microG RE (GmsCore) instead of Google Play " +
        "services. Needs microG RE installed and signed in to a Google account.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TODAII_GERMAN)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(TODAII_GERMAN_PACKAGE, TODAII_GERMAN_SIGNATURE))

    execute {
        redirectToGmsCore(TODAII_GERMAN_SIGNATURE)

        // Disabling the Android 14+ framework provider makes the app fall back to Play services / GmsCore.
        FrameworkCredentialProviderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        warnWithoutGmsCore(
            "Lapp/fakh/extension/todaiigerman/GmsCore;->require()V",
            "Lcom/google/android/gms/auth/api/signin/internal/zbd;" to "getSignInIntent",
        )
    }
}
