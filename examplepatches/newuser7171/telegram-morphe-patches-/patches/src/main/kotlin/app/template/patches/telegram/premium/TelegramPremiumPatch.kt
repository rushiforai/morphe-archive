package app.template.patches.telegram.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.telegram.MessagesControllerIsPremiumUserFingerprint
import app.template.patches.telegram.PremiumFeaturesBlockedFingerprint
import app.template.patches.telegram.SharedConfigGetDevicePerformanceClassFingerprint
import app.template.patches.telegram.StoriesControllerIsPremiumFingerprint
import app.template.patches.telegram.StoriesControllerPremiumComparatorFingerprint
import app.template.patches.telegram.UserConfigGetMaxAccountCountFingerprint
import app.template.patches.telegram.UserConfigHasPremiumOnAccountsFingerprint
import app.template.patches.telegram.UserConfigIsPremiumFingerprint

@Suppress("unused")
val telegramPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Telegram Premium features for the current account.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency())

    execute {
        listOf(
            UserConfigIsPremiumFingerprint,
            MessagesControllerIsPremiumUserFingerprint,
            UserConfigHasPremiumOnAccountsFingerprint,
            UserConfigGetMaxAccountCountFingerprint,
            SharedConfigGetDevicePerformanceClassFingerprint,
        ).forEach {
            check(it.method.implementation != null) {
                "Expected concrete implementation for ${it.method.definingClass}->${it.method.name}"
            }
        }

        PremiumFeaturesBlockedFingerprint.methodOrNull?.let { method ->
            check(method.implementation != null) {
                "Expected concrete implementation for ${method.definingClass}->${method.name}"
            }
        }
        StoriesControllerIsPremiumFingerprint.methodOrNull?.let { method ->
            check(method.implementation != null) {
                "Expected concrete implementation for ${method.definingClass}->${method.name}"
            }
        }
        StoriesControllerPremiumComparatorFingerprint.methodOrNull?.let { method ->
            check(method.implementation != null) {
                "Expected concrete implementation for ${method.definingClass}->${method.name}"
            }
        }

        UserConfigIsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        val isPlusBuild = PremiumFeaturesBlockedFingerprint.methodOrNull != null
        if (isPlusBuild) {
            MessagesControllerIsPremiumUserFingerprint.method.addInstructions(0, """
                if-eqz p1, :not_self
                iget-boolean v0, p1, Lorg/telegram/tgnet/TLRPC${'$'}User;->self:Z
                if-eqz v0, :not_self
                const/4 v0, 0x1
                return v0
                :not_self
                nop
            """)
            PremiumFeaturesBlockedFingerprint.methodOrNull?.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        } else {
            MessagesControllerIsPremiumUserFingerprint.method.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)
        }

        StoriesControllerIsPremiumFingerprint.methodOrNull?.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        StoriesControllerPremiumComparatorFingerprint.methodOrNull?.let { method ->
            // Do not rely on instruction offsets: R8 changes the comparator body
            // between Telegram releases. Force every direct TLRPC.User.premium read
            // to true instead.
            method.implementation!!.instructions
                .mapIndexedNotNull { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (instruction.opcode == Opcode.IGET_BOOLEAN &&
                        ref?.definingClass == "Lorg/telegram/tgnet/TLRPC\$User;" &&
                        ref.name == "premium"
                    ) index else null
                }
                .reversed()
                .forEach { index ->
                    val register = (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "const/4 v$register, 0x1")
                }
        }

        UserConfigHasPremiumOnAccountsFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        UserConfigGetMaxAccountCountFingerprint.method.addInstructions(0, """
            const/16 v0, 0x3E7
            return v0
        """)

        SharedConfigGetDevicePerformanceClassFingerprint.method.addInstructions(0, """
            const/4 v0, 0x2
            return v0
        """)
    }
}
