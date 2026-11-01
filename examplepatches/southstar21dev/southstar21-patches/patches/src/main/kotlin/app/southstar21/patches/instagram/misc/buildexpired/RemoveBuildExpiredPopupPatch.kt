package app.southstar21.patches.instagram.misc.buildexpired

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.instagram.shared.Constants.COMPATIBILITY_INSTAGRAM

/**
 * The lockout manager is handed the build's age in days as its int parameter, and shows the
 * popup once that reaches 7 or 14 depending on its flags.
 */
internal object SnoozeExpirationManagerInitFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf("snooze_expiration_lockout_manager"),
        returnType = "Z",
    ),
    name = "<init>",
    parameters = listOf("L", "L", "L", "L", "L", "L", "L", "L", "L", "I", "Z", "Z"),
)

// Ported from https://github.com/brosssh/instagram-morphe-patches-library (GPLv3).
@Suppress("unused")
val removeBuildExpiredPopupPatch = bytecodePatch(
    name = "Remove build expired popup",
    description = "Removes the popup that appears after a while, when the app version ages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        // p10 is the age in days, always report a build that is 1 day old.
        SnoozeExpirationManagerInitFingerprint.method.addInstruction(
            0,
            "const/4 p10, 0x1"
        )
    }
}
