package app.morphe.patches.klikk.user

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikk.shared.Constants.COMPATIBILITY_KLIKK
import app.morphe.patches.klikk.shared.patches.utils.ioUtils.hasValidSubscriptionPatch
import app.morphe.patches.klikk.shared.patches.utils.ioUtils.isUserLoggedInPatch

@Suppress("unused")
val anonymousUserPatch = bytecodePatch(
    name = "Anonymous user",
    description = "Log in as anonymous subscribed user.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKK)

    dependsOn(isUserLoggedInPatch, hasValidSubscriptionPatch)
}