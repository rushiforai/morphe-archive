package app.morphe.library.instagram.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.bytecodePatch

object SnoozeExpirationManagerInitFingerprint : Fingerprint(
    Fingerprint(
        strings = listOf("snooze_expiration_lockout_manager"),
        returnType = "Z"
    ),
    name = "<init>",
    parameters = listOf("L", "L", "L", "L", "L", "L", "L" ,"L", "L", "I", "Z", "Z")
)

@Suppress("unused")
fun removeBuildExpiredPopupPatch(
    name: String = "Remove build expired popup",
    description: String = "Removes the popup that appears after a while, when the app version ages.",
    default: Boolean,

    block: BytecodePatchBuilder.() -> Unit
) = bytecodePatch(
    name = name,
    description = description,
    default = default
) {
    block()

    execute {
        SnoozeExpirationManagerInitFingerprint.method.addInstruction(
            0,
            "const/4 p10, 0x1"
        )
    }
}
