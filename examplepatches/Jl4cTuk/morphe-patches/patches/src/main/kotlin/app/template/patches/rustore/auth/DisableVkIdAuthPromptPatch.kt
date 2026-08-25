package app.template.patches.rustore.auth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext

context(_: BytecodePatchContext)
internal fun disableVkIdAuthPrompt() {
    AuthSuggestShownFingerprint.method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            return-object v0
        """,
    )
}
