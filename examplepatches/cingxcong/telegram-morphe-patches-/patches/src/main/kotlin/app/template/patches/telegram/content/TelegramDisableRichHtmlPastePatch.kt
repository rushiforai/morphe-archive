package app.template.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.Telegram12_10_3RichPasteFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val telegramDisableRichHtmlPastePatch = bytecodePatch(
    name = "Use normal paste",
    description = "Skips Telegram 12.10.3's Rich HTML branch while preserving normal clipboard handling.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    execute {
        Telegram12_10_3RichPasteFingerprint.methodOrNull?.apply {
            val richHtmlBranchMatches = implementation!!.instructions
                .mapIndexedNotNull { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return@mapIndexedNotNull null
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@mapIndexedNotNull null
                    if (reference.definingClass == "Landroid/content/ClipDescription;" &&
                        reference.name == "hasMimeType" &&
                        reference.parameterTypes == listOf("Ljava/lang/String;") &&
                        index + 1 < implementation!!.instructions.size &&
                        implementation!!.instructions[index + 1] is OneRegisterInstruction
                    ) index else null
                }

            check(richHtmlBranchMatches.isNotEmpty()) {
                "Expected at least one ClipDescription.hasMimeType(String) branch in Telegram 12.10.3 rich-paste handler"
            }

            richHtmlBranchMatches
                .reversed()
                .forEach { index ->
                    val register = (implementation!!.instructions[index + 1] as OneRegisterInstruction).registerA
                    replaceInstruction(index + 1, "const/4 v$register, 0x0")
                }
        }
    }
}
