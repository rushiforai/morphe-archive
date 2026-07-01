package app.paresh.patches.telegram.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.telegram.shared.Constants.COMPATIBILITY_TELEGRAM

object AddSponsoredMessagesFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/ui/ChatActivity;",
    name = "addSponsoredMessages",
    returnType = "V",
)

object IsSponsoredDisabledFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSponsoredDisabled",
    returnType = "Z",
)

object IsSponsoredFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSponsored",
    returnType = "Z",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes sponsored messages and video ads."
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        // Block sponsored messages from being added
        AddSponsoredMessagesFingerprint.method.addInstructions(0, "return-void")

        // Report sponsored as disabled
        IsSponsoredDisabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // No message is sponsored
        IsSponsoredFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
