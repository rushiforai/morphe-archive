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
import app.template.patches.telegram.Telegram1331PremiumUserNormalFingerprint
import app.template.patches.telegram.Telegram1331PremiumUserWebFingerprint
import app.template.patches.telegram.Telegram1331UserConfigPremiumNormalFingerprint
import app.template.patches.telegram.Telegram1331UserConfigPremiumWebFingerprint
import app.template.patches.telegram.TelegramR8MessagesControllerIsPremiumUserNormalFingerprint
import app.template.patches.telegram.TelegramR8UserConfigIsPremiumFingerprint
import app.template.patches.telegram.TelegramR8MessagesControllerIsPremiumUserWebFingerprint
import app.template.patches.telegram.TelegramR8TranslationsManualNormalFingerprint
import app.template.patches.telegram.TelegramR8TranslationsManualWebFingerprint
import app.template.patches.telegram.TelegramR8TranslationsAutoNormalFingerprint
import app.template.patches.telegram.TelegramR8TranslationsAutoWebFingerprint
import app.template.patches.telegram.TelegramR8DevicePerformanceClassNormalFingerprint
import app.template.patches.telegram.TelegramR8DevicePerformanceClassWebFingerprint
import app.template.patches.telegram.TelegramPlusR8MessagesControllerIsPremiumUserFingerprint
import app.template.patches.telegram.TelegramPlus13221R8MessagesControllerIsPremiumUserFingerprint
import app.template.patches.telegram.TelegramPlusR8UserConfigIsPremiumFingerprint
import app.template.patches.telegram.TelegramPlus13221R8UserConfigIsPremiumFingerprint
import app.template.patches.telegram.TelegramPlusR8UserConfigHasPremiumOnAccountsFingerprint
import app.template.patches.telegram.TelegramPlus13221R8UserConfigHasPremiumOnAccountsFingerprint
import app.template.patches.telegram.TelegramPlusR8UserConfigGetMaxAccountCountFingerprint
import app.template.patches.telegram.TelegramPlus13221R8UserConfigGetMaxAccountCountFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val telegramPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks the local Premium entitlement gates and supported legacy Premium conveniences.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    dependsOn(telegramSpoofDependency())

    execute {
        // Each APK has its own verified controller gate. Do not select the first
        // non-null method across targets: doing so used to leave Plus without a
        // controller entitlement hook.
        val premiumUserMethod = requireNotNull(
            Telegram1331PremiumUserNormalFingerprint.methodOrNull
                ?: Telegram1331PremiumUserWebFingerprint.methodOrNull
                ?: TelegramR8MessagesControllerIsPremiumUserNormalFingerprint.methodOrNull
                ?: TelegramR8MessagesControllerIsPremiumUserWebFingerprint.methodOrNull
                ?: TelegramPlus13221R8MessagesControllerIsPremiumUserFingerprint.methodOrNull
                ?: TelegramPlusR8MessagesControllerIsPremiumUserFingerprint.methodOrNull
                ?: MessagesControllerIsPremiumUserFingerprint.methodOrNull,
        ) { "Missing target-specific MessagesController Premium gate" }

        premiumUserMethod.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Telegram/Web 13.2.2 use d20.q()Z for the active account's premium
        // state. Plus 13.2.2.1 uses lm1.H()Z; the older Plus jm1.H()Z fingerprint remains independent. The old
        // named UserConfig fingerprint remains a legacy-only fallback.
        val userConfigPremium = requireNotNull(
            Telegram1331UserConfigPremiumNormalFingerprint.methodOrNull
                ?: Telegram1331UserConfigPremiumWebFingerprint.methodOrNull
                ?: TelegramR8UserConfigIsPremiumFingerprint.methodOrNull
                ?: TelegramPlus13221R8UserConfigIsPremiumFingerprint.methodOrNull
                ?: TelegramPlusR8UserConfigIsPremiumFingerprint.methodOrNull
                ?: UserConfigIsPremiumFingerprint.methodOrNull,
        ) { "Missing target-specific UserConfig Premium gate" }
        userConfigPremium.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Translation toggles are present in the Telegram and Telegram Web
        // targets. Their Plus equivalents are not assumed without a verified
        // matching implementation.
        val translationsManual =
            TelegramR8TranslationsManualNormalFingerprint.methodOrNull
                ?: TelegramR8TranslationsManualWebFingerprint.methodOrNull
                ?: MessagesControllerIsTranslationsManualEnabledFingerprint.methodOrNull
        translationsManual?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        val translationsAuto =
            TelegramR8TranslationsAutoNormalFingerprint.methodOrNull
                ?: TelegramR8TranslationsAutoWebFingerprint.methodOrNull
                ?: MessagesControllerIsTranslationsAutoEnabledFingerprint.methodOrNull
        translationsAuto?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Plus-specific account gates are verified separately. Keep the
        // account-count initialization side effect (lm1.z0) when overriding
        // the getter; simply returning 999 left the cached count stale.
        val hasPremiumOnAccounts =
            TelegramPlus13221R8UserConfigHasPremiumOnAccountsFingerprint.methodOrNull
                ?: TelegramPlusR8UserConfigHasPremiumOnAccountsFingerprint.methodOrNull
                ?: UserConfigHasPremiumOnAccountsFingerprint.methodOrNull
        hasPremiumOnAccounts?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        val plusMaxAccountCount =
            TelegramPlus13221R8UserConfigGetMaxAccountCountFingerprint.methodOrNull
                ?: TelegramPlusR8UserConfigGetMaxAccountCountFingerprint.methodOrNull
        if (plusMaxAccountCount != null) {
            // Keep the stock SharedPreferences initialization and one-time
            // maxAccountCountChanged_ migration. Override only the returned/cache
            // value after the original method has completed its side effects.
            val implementation = requireNotNull(plusMaxAccountCount.implementation) {
                "Plus UserConfig max-account-count method has no implementation"
            }
            val returnIndex = implementation.instructions.indexOfLast { it.opcode == Opcode.RETURN }
            require(returnIndex >= 0) { "Plus UserConfig max-account-count method has no RETURN" }
            plusMaxAccountCount.addInstructions(returnIndex, """
                const/16 v0, 0x3E7
                sput v0, ${plusMaxAccountCount.definingClass}->z0:I
            """)
        } else {
            UserConfigGetMaxAccountCountFingerprint.methodOrNull?.addInstructions(0, """
                const/16 v0, 0x3E7
                return v0
            """)
        }

        // Device performance class is only changed on the two targets where
        // the exact R8/legacy accessor is known. It is not guessed for Plus.
        val devicePerformanceClass =
            TelegramR8DevicePerformanceClassNormalFingerprint.methodOrNull
                ?: TelegramR8DevicePerformanceClassWebFingerprint.methodOrNull
                ?: SharedConfigGetDevicePerformanceClassFingerprint.methodOrNull
        devicePerformanceClass?.addInstructions(0, """
            const/4 v0, 0x2
            return v0
        """)
    }
}
