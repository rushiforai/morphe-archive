package app.morphe.patches.viber.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.viber.shared.Constants.COMPATIBILITY_VIBER

private const val EXTENSION_CLASS = "Lapp/morphe/extension/viber/PrivacyHook;"

@Suppress("unused")
val ghostModePatch = bytecodePatch(
    name = "Ghost mode",
    description = "Prevents sending read receipts (seen status) and typing indicators."
) {
    compatibleWith(COMPATIBILITY_VIBER)

    execute {
        // Intercept read receipts (seen notifications)
        ReadReceiptDispatcherFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $EXTENSION_CLASS->shouldSendReadReceipt()Z
            move-result v0
            if-eqz v0, :cond_send
            return-void
            :cond_send
            """
        )

        // Intercept typing status notifications
        TypingIndicatorDispatcherFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $EXTENSION_CLASS->shouldSendTypingNotification()Z
            move-result v0
            if-eqz v0, :cond_typing
            return-void
            :cond_typing
            """
        )
    }
}