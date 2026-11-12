package app.template.patches.gboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.GBOARD_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

private val IsCarBluetoothFingerprint = Fingerprint(
    definingClass = "Ltfs;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/media/AudioDeviceInfo;"),
)

@Suppress("unused")
val gboardDisableBluetoothVoicePatch = bytecodePatch(
    name = "Disable Bluetooth voice routing",
    description = "Treats every Bluetooth audio device as an unusable car device so Gboard voice typing keeps using the built-in microphone.",
    default = false,
) {
    compatibleWith(GBOARD_COMPATIBILITY)

    execute {
        IsCarBluetoothFingerprint.method.apply {
            ensureRegisters(1)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
    }
}
