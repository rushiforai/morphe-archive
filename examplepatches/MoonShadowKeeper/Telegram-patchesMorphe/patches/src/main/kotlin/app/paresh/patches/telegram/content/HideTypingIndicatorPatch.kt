package app.paresh.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM

@Suppress("unused")
val hideTypingIndicatorPatch = bytecodePatch(
    name = "Hide typing indicator",
    description = "Hides your typing indicator from other users."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        Fingerprint(
            name = "needSendTyping",
            returnType = "V",
            parameters = listOf(),
        ).matchAllOrNull()?.forEach { match ->
            if (match.method.implementation != null) {
                match.method.addInstructions(0, "return-void")
            }
        }
    }
}
