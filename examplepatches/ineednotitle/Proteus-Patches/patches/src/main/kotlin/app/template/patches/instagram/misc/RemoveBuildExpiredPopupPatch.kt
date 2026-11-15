/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

private object SnoozeExpirationLockoutManagerFingerprint : Fingerprint(
    strings = listOf("snooze_expiration_lockout_manager"),
    returnType = "Z",
)

private object SnoozeExpirationManagerInitFingerprint : Fingerprint(
    classFingerprint = SnoozeExpirationLockoutManagerFingerprint,
    name = "<init>",
    parameters = listOf("L", "L", "L", "L", "L", "L", "L", "L", "L", "I", "Z", "Z"),
)

@Suppress("unused")
val instagramRemoveBuildExpiredPopupPatch = bytecodePatch(
    name = "Remove build expired popup",
    description = "Removes the popup that appears after a while when the app version ages.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    execute {
        SnoozeExpirationManagerInitFingerprint.method.addInstruction(
            0,
            "const/16 p10, 0x1",
        )
    }
}
