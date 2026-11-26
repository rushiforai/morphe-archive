/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.windy

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.mutableClass
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.fakh.patches.windy.shared.Constants.COMPATIBILITY_WINDY
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val WINDY_PACKAGE = "com.windyty.android"

/** SHA-1 of Windy's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val WINDY_SIGNATURE = "516a543f88b4bbc4a2aef4d1a36a34ceeef72850"

/**
 * Play services' `isGooglePlayServicesAvailable(Context, int)`. R8 renames it and its class and drops the static
 * modifier, so the shared redirect cannot find it; it is found by the log line of its signature check.
 */
private object PlayServicesAvailabilityFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("Landroid/content/Context;", "I"),
    strings = listOf(" requires Google Play services, but their signature is invalid."),
)

/**
 * "Log in with Google" runs the Capacitor SocialLogin plugin, which asks Credential Manager for a Google ID token and
 * then Google's authorization client for the scopes. Both only answer the signing certificate registered for the app,
 * so GmsCore presents the original one.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Log in with Google\" work by signing in through microG RE (GmsCore) instead of Google " +
        "Play services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WINDY)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(WINDY_PACKAGE, WINDY_SIGNATURE))

    execute {
        // GmsCore passes the check up to the version from which Credential Manager uses the Identity Credentials API
        // (25.24), which GmsCore lacks.
        PlayServicesAvailabilityFingerprint.method.addInstructions(
            0,
            """
                move/from16 v0, p2
                const v1, 252400000
                if-ge v0, v1, :too_old
                const/4 v0, 0x0
                return v0
                :too_old
                const/4 v0, 0x2
                return v0
            """,
        )
        redirectToGmsCore(WINDY_SIGNATURE, patchPlayServicesUtil = false)

        // The system Credential Manager (Android 14+) asks the real Play services, which reject the patched app's
        // signature. Without it, the app's Play services provider is used, which goes through GmsCore.
        mutableClass("Landroidx/credentials/CredentialProviderFactory;").methods
            .single { it.name == "tryCreatePostUProvider" }
            .addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        warnWithoutGmsCore(
            "Lapp/fakh/extension/windy/GmsCore;->require()V",
            "Lee/forgr/capacitor/social/login/GoogleProvider;" to "login",
        )
    }
}
