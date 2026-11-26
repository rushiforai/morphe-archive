/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.genius

import app.fakh.patches.genius.shared.Constants.COMPATIBILITY_GENIUS
import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.morphe.patcher.patch.patch

private const val GENIUS_PACKAGE = "com.genius.android"

/** SHA-1 of Genius's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val GENIUS_SIGNATURE = "eb990e0420946ad044474abf9718d1a3ddcc03a7"

@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes \"Sign in with Google\" work by signing in through microG RE (GmsCore) instead of Google " +
        "Play services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GENIUS)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(GENIUS_PACKAGE, GENIUS_SIGNATURE))

    execute {
        redirectToGmsCore(GENIUS_SIGNATURE)
        warnWithoutGmsCore(
            "Lapp/fakh/extension/genius/GmsCore;->require()V",
            "Lcom/genius/android/core/coordinator/SessionCoordinator;" to "getGoogleSignIn",
        )
    }
}
