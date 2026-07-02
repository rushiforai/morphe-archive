package app.kareem.patches.reddit.links

import app.kareem.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val URL_FORMATTER_CLASS = "Lvu3/f;"
private const val URL_FORMATTER_METHOD = "a"
private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/kareem/extension/reddit/patches/RedditShareLinksPatch;"
private const val REWRITE_STRING_METHOD =
    "$EXTENSION_CLASS_DESCRIPTOR->rewriteShareText(Ljava/lang/String;)Ljava/lang/String;"
private const val REWRITE_CHAR_SEQUENCE_METHOD =
    "$EXTENSION_CLASS_DESCRIPTOR->rewriteShareCharSequence(Ljava/lang/CharSequence;)Ljava/lang/String;"
private const val REWRITE_CLIP_DATA_METHOD =
    "$EXTENSION_CLASS_DESCRIPTOR->rewriteClipData(Landroid/content/ClipData;)Landroid/content/ClipData;"

private const val TEXT_EXTRA = "android.intent.extra.TEXT"
private const val INTENT_PUT_EXTRA_STRING =
    "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;"
private const val INTENT_PUT_EXTRA_CHAR_SEQUENCE =
    "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;"
private const val TEXT_CLIPBOARD_SET_TEXT =
    "Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V"
private const val CLIP_DATA_NEW_PLAIN_TEXT =
    "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;"
private const val CONTENT_CLIPBOARD_SET_PRIMARY_CLIP =
    "Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V"

@Suppress("unused")
val sanitizeRedditShareLinksPatch =
    bytecodePatch(
        name = "Sanitize Reddit share links",
        description = "Stops Reddit from appending tracking query parameters to shared links.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)

        extendWith("extensions/extension.rve")

        execute {
            var insertionCount = 0

            classDefForEach { classDef ->
                val mutableClass = mutableClassDefBy(classDef)

                if (classDef.type == URL_FORMATTER_CLASS) {
                    val formatterMethod = mutableClass.methods.firstOrNull(::isUrlFormatterMethod)
                    if (formatterMethod != null) {
                        formatterMethod.addInstructions(0, "return-object p2")
                        insertionCount++
                    }
                }

                mutableClass.methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                    val insertions =
                        instructions.mapIndexedNotNull { index, instruction ->
                            val reference =
                                (instruction as? ReferenceInstruction)?.reference?.toString()
                                    ?: return@mapIndexedNotNull null
                            val registers = instruction.registersUsed

                            when {
                                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                    reference == INTENT_PUT_EXTRA_STRING &&
                                    registers.size >= 3 &&
                                    stringLiteralForRegisterBefore(instructions, index, registers[1]) == TEXT_EXTRA ->
                                    Insertion(index, registers[2], REWRITE_STRING_METHOD)

                                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                    reference == INTENT_PUT_EXTRA_CHAR_SEQUENCE &&
                                    registers.size >= 3 &&
                                    stringLiteralForRegisterBefore(instructions, index, registers[1]) == TEXT_EXTRA ->
                                    Insertion(index, registers[2], REWRITE_CHAR_SEQUENCE_METHOD)

                                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                    reference == TEXT_CLIPBOARD_SET_TEXT &&
                                    registers.size >= 2 ->
                                    Insertion(index, registers[1], REWRITE_CHAR_SEQUENCE_METHOD)

                                instruction.opcode == Opcode.INVOKE_STATIC &&
                                    reference == CLIP_DATA_NEW_PLAIN_TEXT &&
                                    registers.size >= 2 ->
                                    Insertion(index, registers[1], REWRITE_CHAR_SEQUENCE_METHOD)

                                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                    reference == CONTENT_CLIPBOARD_SET_PRIMARY_CLIP &&
                                    registers.size >= 2 ->
                                    Insertion(index, registers[1], REWRITE_CLIP_DATA_METHOD)

                                else -> null
                            }
                        }

                    insertions.asReversed().forEach { insertion ->
                        method.addInstructions(
                            insertion.index,
                            """
                            invoke-static/range { v${insertion.register} .. v${insertion.register} }, ${insertion.method}
                            move-result-object v${insertion.register}
                            """.trimIndent(),
                        )
                        insertionCount++
                    }
                }
            }

            if (insertionCount == 0) {
                throw PatchException("Could not find Reddit share or clipboard outputs to sanitize")
            }
        }
    }

private data class Insertion(
    val index: Int,
    val register: Int,
    val method: String,
)

private fun isUrlFormatterMethod(method: Method): Boolean {
    if (method.definingClass != URL_FORMATTER_CLASS) return false
    if (method.name != URL_FORMATTER_METHOD) return false
    if (method.returnType != "Ljava/lang/String;") return false
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false

    return method.parameterTypes ==
        listOf(
            "Lhc3/x;",
            "Lcom/reddit/sharing/SharingNavigator\$ShareTrigger;",
            "Ljava/lang/String;",
            "Z",
        )
}

private fun stringLiteralForRegisterBefore(
    instructions: List<Instruction>,
    invokeIndex: Int,
    register: Int,
): String? {
    val minIndex = maxOf(0, invokeIndex - 32)
    for (index in invokeIndex - 1 downTo minIndex) {
        val instruction = instructions[index]
        if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
            val constRegister = (instruction as? OneRegisterInstruction)?.registerA ?: continue
            if (constRegister == register) {
                return ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            }
        }
    }

    return null
}
