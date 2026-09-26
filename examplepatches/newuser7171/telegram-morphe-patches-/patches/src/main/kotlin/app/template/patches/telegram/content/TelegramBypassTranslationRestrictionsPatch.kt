package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.TranslateControllerIsTranslateDialogHiddenFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

@Suppress("unused")
val telegramBypassTranslationRestrictionsPatch = bytecodePatch(
    name = "Bypass translation restrictions",
    description = "Keeps the translation UI available when a chat or user has disabled translations.",
    default = true,
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        check(TranslateControllerIsTranslateDialogHiddenFingerprint.method.implementation != null) {
            "Expected concrete TranslateController.isTranslateDialogHidden(J) implementation"
        }

        TranslateControllerIsTranslateDialogHiddenFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
