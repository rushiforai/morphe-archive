package app.whatsappmorphe.patches.whatsapp

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.whatsappmorphe.patches.shared.Constants.WHATSAPP

private const val EXT = "Lapp/pichiwa/extension/extension/WExtension;"

@Suppress("unused")
val hideTypingIndicator = bytecodePatch(
    name = "Hide Typing",
    description = "Type without broadcasting the typing indicator.",
    default = false
) {
    compatibleWith(WHATSAPP)

    execute {
        Fingerprint(returnType = "V", 
            filters = listOf(string("HandleMeComposing/sendComposing; toJid="))
        ).let { match ->
            match.method.addInstructions(0, """
                return-void
                :original
            """)
        }
    }
}

