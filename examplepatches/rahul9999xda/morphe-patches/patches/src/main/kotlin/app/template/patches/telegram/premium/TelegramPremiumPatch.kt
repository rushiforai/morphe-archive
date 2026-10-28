package app.template.patches.telegram.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
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
    // DEX-verified against Telegram 13.1.1 build 72371, Telegram Web 13.1.1
    // build 72379, and Plus Messenger 13.1.1.0 build 22621. Older
    // target descriptors remain separately declared. The core premium
    // and translation-gate methods below use identical descriptors in all three.
    // Existing legacy targets are unchanged; only builds whose exact fingerprints resolve
    // are eligible, so this does not broaden support by guessing renamed methods.
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    dependsOn(telegramSpoofDependency())

    execute {
        UserConfigIsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Exact body-level target verified in Telegram, Web, and Plus.
        MessagesControllerIsPremiumUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Both exact methods exist in Telegram/Web 13.1.1 and Plus 13.1.1.0. They are client-side
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
