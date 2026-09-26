package app.template.patches.telegram.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.MessagesControllerCheckPromoInfoInternalFingerprint
import app.template.patches.telegram.PlusSettingsIsUpdateEnabledFingerprint
import app.template.patches.telegram.PlusUpdaterCheckAppUpdateFingerprint
import app.template.patches.telegram.SharedConfigIsAppUpdateAvailableFingerprint
import app.template.patches.telegram.SharedConfigSetNewAppVersionAvailableFingerprint

@Suppress("unused")
val telegramDisableAutoUpdatePatch = bytecodePatch(
    name = "Disable auto-update",
    description = "Disables Telegram update availability/state and the update-state refresh path for Telegram 12.10.4 without replacing the update UI method wholesale.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)

    execute {
        check(SharedConfigIsAppUpdateAvailableFingerprint.method.implementation != null) {
            "Expected concrete SharedConfig.isAppUpdateAvailable() implementation for Telegram 12.10.4"
        }
        check(SharedConfigSetNewAppVersionAvailableFingerprint.method.implementation != null) {
            "Expected concrete SharedConfig.setNewAppVersionAvailable() implementation for Telegram 12.10.4"
        }

        SharedConfigIsAppUpdateAvailableFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        SharedConfigSetNewAppVersionAvailableFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        MessagesControllerCheckPromoInfoInternalFingerprint.methodOrNull?.addInstructions(0, "return-void")

        PlusUpdaterCheckAppUpdateFingerprint.methodOrNull?.addInstructions(0, "return-void")

        PlusSettingsIsUpdateEnabledFingerprint.methodOrNull?.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)
    }
}
