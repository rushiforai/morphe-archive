package app.jouss.patches.plusmessenger.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object SendTypingFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "sendTyping",
    returnType = "Z",
    parameters = listOf("J", "J", "I", "Ljava/lang/String;", "I"),
)

@Suppress("unused")
val hideTypingIndicatorPatch = bytecodePatch(
    name = "Hide typing indicator",
    description = "Prevents typing status from being sent to other users."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        SendTypingFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
