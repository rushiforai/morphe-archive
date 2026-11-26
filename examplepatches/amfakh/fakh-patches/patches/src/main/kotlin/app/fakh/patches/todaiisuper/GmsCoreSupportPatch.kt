/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiisuper

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.fakh.patches.todaiisuper.shared.Constants.COMPATIBILITY_TODAII_SUPER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val TODAII_SUPER_PACKAGE = "com.eup.todaiisuper"

/** SHA-1 of Todaii Super's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val TODAII_SUPER_SIGNATURE = "2cc4a763cd2ca058406b64b56745508afdff6126"

/**
 * CredentialProviderFrameworkImpl.isAvailableOnDevice checks SDK_INT >= 34 and routes Google sign-in through
 * the system CredentialManager service, bypassing Play services / GmsCore.
 */
private object FrameworkCredentialProviderFingerprint : Fingerprint(
    definingClass = "Lvn0;",
    name = "isAvailableOnDevice",
    returnType = "Z",
    parameters = listOf(),
)

/** R8-obfuscated GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(Context, int). */
private object PlayServicesAvailableFingerprint : Fingerprint(
    definingClass = "Lqy1;",
    name = "b",
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
)

/** R8-obfuscated GoogleApiAvailabilityLight.ensurePlayServicesAvailable(Context). */
private object EnsurePlayServicesAvailableFingerprint : Fingerprint(
    definingClass = "Lqy1;",
    name = "c",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Google sign-in uses AndroidX Credential Manager (`Lvn0;`) to request a Google ID token (`TYPE_GOOGLE_ID_TOKEN_CREDENTIAL`).
 * Disabling the Android 14+ framework provider forces fallback to Play services / GmsCore so microG RE can supply the token.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes Google sign-in work by signing in through microG RE (GmsCore) instead of Google Play " +
        "services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII_SUPER)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(
        pairipLicenseCheckPatch,
        gmsCoreSupportResourcePatch(TODAII_SUPER_PACKAGE, TODAII_SUPER_SIGNATURE),
    )

    execute {
        redirectToGmsCore(TODAII_SUPER_SIGNATURE, patchPlayServicesUtil = false)

        PlayServicesAvailableFingerprint.method.addInstructions(
            0,
            """
            const v0, 252400000
            if-ge p2, v0, :too_old
            const/4 v0, 0x0
            return v0
            :too_old
            const/4 v0, 0x2
            return v0
            """,
        )

        EnsurePlayServicesAvailableFingerprint.method.addInstructions(0, "return-void")

        FrameworkCredentialProviderFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """,
        )

        warnWithoutGmsCore(
            "Lapp/fakh/extension/todaiisuper/GmsCore;->require()V",
            "Lvn0;" to "onGetCredential",
        )
    }
}
