package app.gwp.patches.google.chat

import app.gwp.patches.shared.Constants.COMPATIBILITY_GOOGLE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val unlockUpdateRequiredChatsPatch = patch(
    name = "Unlock update-required chats",
    description = "Keeps the input field and hides the \"Update required for this conversation\" card " +
        "(\"App aktualisieren\") that the server shows for some chats. The patched app cannot be updated " +
        "from the Play Store, so this card would otherwise block these chats for good.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE)

    execute {
        val method = PuntTypeForNumberFingerprint.matchAll(1..1).single().method
        val implementation = method.implementation ?: throw PatchException("Punt type lookup has no code")
        // Static method with one int parameter (p0): at least one local register (v0) is needed.
        // v0 is free at the start: the original code assigns it before reading it.
        if (implementation.registerCount < 2) throw PatchException("Punt type lookup has no local register")

        // Treat "thread with punt card" (1) and "disclaimer + disabled input plate" (4) as UNKNOWN (0):
        // no card, input plate enabled, the chat behaves like a normal one.
        // HIDE_THREAD_WITH_PUNT (2) and SHOW_THREAD_WITH_DISCLAIMER (3) are left alone.
        method.addInstructionsWithLabels(
            0,
            """
                const/4 v0, 0x$PUNT_TYPE_SHOW_THREAD_WITH_PUNT
                if-eq p0, v0, :unknown
                const/4 v0, 0x$PUNT_TYPE_DISABLED_INPUT_PLATE
                if-ne p0, v0, :original
                :unknown
                const/4 p0, 0x0
            """,
            ExternalLabel("original", method.getInstruction(0)),
        )
    }
}
