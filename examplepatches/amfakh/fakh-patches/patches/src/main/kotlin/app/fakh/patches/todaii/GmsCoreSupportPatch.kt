/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii

import app.fakh.patches.shared.gms.gmsCoreSupportResourcePatch
import app.fakh.patches.shared.gms.redirectToGmsCore
import app.fakh.patches.shared.gms.warnWithoutGmsCore
import app.fakh.patches.todaii.shared.Constants.COMPATIBILITY_TODAII
import app.morphe.patcher.patch.patch

private const val TODAII_PACKAGE = "mobi.eup.jpnews"

/** SHA-1 of Todaii's signing certificate, which GmsCore presents to Google in place of the patched app's. */
private const val TODAII_SIGNATURE = "9ba8ed22e34e362f1dcf0d622a8b1566dc6b24b3"

/**
 * Google sign-in on `AuthLoginFragment` (`Lrn/s;->k1()V`) runs the legacy `Auth.GoogleSignInApi.getSignInIntent`
 * (`Lcom/google/android/gms/auth/api/signin/internal/zbd;->getSignInIntent`) with `requestIdToken` and exchanges the
 * ID token with Todaii's backend (`Lbr/l;`). Google only issues that ID token to the signing certificate registered
 * for the app, so a patched app is rejected by Play services. GmsCore presents the original certificate instead.
 */
@Suppress("unused")
val gmsCoreSupportPatch = patch(
    name = "GmsCore support",
    description = "Makes Google sign-in work by signing in through microG RE (GmsCore) instead of Google Play " +
        "services. Needs microG RE installed and signed in to a Google account.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII)
    category("Feature")
    extendWith("extensions/extension.mpe")
    dependsOn(gmsCoreSupportResourcePatch(TODAII_PACKAGE, TODAII_SIGNATURE))

    execute {
        redirectToGmsCore(TODAII_SIGNATURE)
        warnWithoutGmsCore(
            "Lapp/fakh/extension/todaii/GmsCore;->require()V",
            "Lcom/google/android/gms/auth/api/signin/internal/zbd;" to "getSignInIntent",
        )
    }
}
