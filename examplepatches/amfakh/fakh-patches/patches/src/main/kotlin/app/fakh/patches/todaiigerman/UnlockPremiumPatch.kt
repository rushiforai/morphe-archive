/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaiigerman

import app.fakh.patches.shared.returnTrue
import app.fakh.patches.todaiigerman.shared.Constants.COMPATIBILITY_TODAII_GERMAN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch

private const val USER = "Lmobi/eup/easygerman/model/user/User;"

/** User.isUserPremium: the paid flag or an unexpired premium day; read by the ad gates and most screens. */
private object UserPremiumFingerprint : Fingerprint(
    definingClass = USER,
    name = "isUserPremium",
    returnType = "Z",
    parameters = listOf(),
)

/** User.isUserPremiumAi. */
private object UserPremiumAiFingerprint : Fingerprint(
    definingClass = USER,
    name = "isUserPremiumAi",
    returnType = "Z",
    parameters = listOf(),
)

/** User.isPremium: the raw paid flag, also read directly by MainActivity. */
private object UserPaidFingerprint : Fingerprint(
    definingClass = USER,
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
)

/** User.isPremiumAi: the raw paid AI flag. */
private object UserPaidAiFingerprint : Fingerprint(
    definingClass = USER,
    name = "isPremiumAi",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Premium unlock",
    description = "Unlocks the client-side Premium and Premium AI checks and removes ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII_GERMAN)
    category("Premium")
    dependsOn(hideAdsPatch)

    execute {
        listOf(UserPremiumFingerprint, UserPremiumAiFingerprint, UserPaidFingerprint, UserPaidAiFingerprint)
            .forEach { it.method.returnTrue() }
    }
}
