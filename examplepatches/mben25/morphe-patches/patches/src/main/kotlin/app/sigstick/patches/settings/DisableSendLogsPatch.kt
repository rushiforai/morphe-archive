package app.sigstick.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK
import app.sigstick.patches.shared.indexOfCall
import app.sigstick.patches.shared.nopCall

@Suppress("unused")
val disableSendLogsPatch = bytecodePatch(
    name = "Disable Send Logs to Developer",
    description = "Removes \"Send Logs to Developer\" from Settings, stops the app from " +
        "collecting its in-memory log buffer, and makes the log export a no-op.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    execute {
        SendDevLogFingerprint.method.addInstruction(0, "return-void")
        LogTreeLogFingerprint.method.addInstruction(0, "return-void")

        // The Send Logs ListItem is the first List.add after its Adb icon.
        AboutItemsFingerprint.method.apply { nopCall("add", indexOfCall("getAdb")) }
    }
}
