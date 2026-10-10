package app.template.patches.telegram.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.MessagesControllerIsPremiumUserFingerprint
import app.template.patches.telegram.MessagesControllerIsTranslationsAutoEnabledFingerprint
import app.template.patches.telegram.MessagesControllerIsTranslationsManualEnabledFingerprint
import app.template.patches.telegram.SharedConfigGetDevicePerformanceClassFingerprint
import app.template.patches.telegram.UserConfigGetMaxAccountCountFingerprint
import app.template.patches.telegram.UserConfigHasPremiumOnAccountsFingerprint
import app.template.patches.telegram.UserConfigIsPremiumFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

@Suppress("unused")
val telegramPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Telegram Premium features for the current account.",
) {
    // Instruction-level audit scope: Telegram 12.10.6 and Telegram Web 12.10.6.
    // Plus 12.10.6.0 has a verified UpdateButton.update(Z)V UI method, but does not
    // locally declare the core MessagesController target required by this patch.
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY)

    dependsOn(telegramSpoofDependency())

    execute {
        UserConfigIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Exact body-level target in Telegram and Web. Plus support is intentionally excluded.
        MessagesControllerIsPremiumUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Both exact methods exist in Telegram and Web 12.10.6. They are client-side
        // app-config gates for translation controls; enabling them does not override
        // server-side account checks or per-chat translations_disabled flags.
        MessagesControllerIsTranslationsManualEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        MessagesControllerIsTranslationsAutoEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Stories controllers are obfuscated per fork; their audited bodies call UserConfig.isPremium()
        // to select premium story limits. Forcing UserConfig.isPremium() above covers these branches,
        // so do not inject into the obsolete StoriesControllerIsPremiumFingerprint.
        UserConfigHasPremiumOnAccountsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        UserConfigGetMaxAccountCountFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x3E7
                return v0
            """,
        )

        SharedConfigGetDevicePerformanceClassFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x2
                return v0
            """,
        )
    }
}
