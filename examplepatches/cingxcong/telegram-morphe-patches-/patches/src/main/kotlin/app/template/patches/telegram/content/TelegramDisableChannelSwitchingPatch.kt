package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.telegram.ChatPullingDownDrawableDrawBottomPanelFingerprint
import app.template.patches.telegram.ChatPullingDownDrawableGetNextFingerprint
import app.template.patches.telegram.ChatPullingDownDrawableNeedDrawBottomPanelFingerprint

@Suppress("unused")
val telegramDisableChannelSwitchingPatch = bytecodePatch(
    name = "Disable channel switching",
    description = "Disables the pull-down gesture that switches to the next unread channel.",
    default = true,
) {
    compatibleWith(TELEGRAM_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        ChatPullingDownDrawableGetNextFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return-object v0
        """)

        ChatPullingDownDrawableNeedDrawBottomPanelFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        ChatPullingDownDrawableDrawBottomPanelFingerprint.method.addInstructions(0, "return-void")
    }
}
