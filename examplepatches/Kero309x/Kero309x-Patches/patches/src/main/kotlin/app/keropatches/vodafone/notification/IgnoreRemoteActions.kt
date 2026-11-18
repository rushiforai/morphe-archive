// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.vodafone.notification

import app.keropatches.core.PatchCategory
import app.keropatches.vodafone.VodafoneApp
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The handler for the destructive silent pushes.
 *
 * The push listener reads a key out of the message and, for the two keys that
 * destroy local state, hands the key to this method. It is the only place that
 * reaches the two destructive actions, and the class is renamed by the
 * shrinker, so it is identified by the class and the signature together.
 */
private object RemoteActionFingerprint : Fingerprint(
    definingClass = "Lo/getChildPosition;",
    name = "AnimatedBarChartPreview",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Stops the server from wiping the installation or logging the account out.
 *
 * The application receives its push messages through a push service and reads
 * a silent-push key out of them. Three keys are handled by the application
 * itself: one asks for the access token to be refreshed, one resets the user
 * token, and one updates the shopping-cart count. Every other key is handed to
 * the destructive handler, which understands two of them: one clears the
 * application's data through the system service, and one logs the account out
 * and sends the user back to the login screen.
 *
 * The patch answers the destructive handler with an early return. Only that
 * handler is touched, so the three keys the application handles itself keep
 * working: a refresh of the access token, a reset of the user token and the
 * shopping-cart count are not affected.
 *
 * The messages themselves are still received and still logged, and the rest of
 * the push handling, including the deep links a message can carry, is
 * untouched. The patch only stops the two actions that destroy local state.
 */
@Suppress("unused")
val ignoreRemoteActionsPatch = bytecodePatch(
    name = "Ignore the server's remote wipe and forced logout",
    description = "Stops a silent push from clearing the app's data or logging the account out.",
    default = true,
) {
    compatibleWith(VodafoneApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        RemoteActionFingerprint.method.returnEarly()
    }
}
