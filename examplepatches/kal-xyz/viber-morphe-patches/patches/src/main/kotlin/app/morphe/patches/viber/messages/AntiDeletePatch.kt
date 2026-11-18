package app.morphe.patches.viber.messages

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.viber.shared.Constants.COMPATIBILITY_VIBER

private const val EXTENSION_CLASS = "Lapp/morphe/extension/viber/AntiDeleteHook;"

@Suppress("unused")
val antiDeletePatch = bytecodePatch(
    name = "Anti-delete messages",
    description = "Retains messages even when deleted or retracted by the sender."
) {
    compatibleWith(COMPATIBILITY_VIBER)

    execute {
        MessageRetractionHandlerFingerprint.method.addInstructions(
            0,
            """
            invoke-static {p1, p2}, $EXTENSION_CLASS->shouldProcessMessageDeletion(Ljava/lang/String;Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :cond_retract
            const/4 v0, 0x0
            return v0
            :cond_retract
            """
        )
    }
}