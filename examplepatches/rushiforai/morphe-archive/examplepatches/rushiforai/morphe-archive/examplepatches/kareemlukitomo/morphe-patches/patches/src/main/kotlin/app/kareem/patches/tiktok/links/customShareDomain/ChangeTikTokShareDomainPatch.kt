package app.kareem.patches.tiktok.links.customShareDomain

import app.kareem.patches.shared.Constants.COMPATIBILITY_TIKTOK
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/kareem/extension/tiktok/patches/TikTokShareLinksPatch;"
private const val CUSTOM_HOST = "sticktock.kareem.one"
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
private const val BYTEDANCE_CLIPBOARD_SET_PRIMARY_CLIP =
    "LX/0gX5;->LIZJ(Landroid/content/ClipboardManager;Landroid/content/ClipData;Lcom/bytedance/bpea/basics/Cert;)V"

private val SHARE_HANDLER_CLASSES =
    setOf(
        "LX/0bqW;",
        "LX/0c91;",
        "LX/0c92;",
        "LX/0zFr;",
        "LX/0zFt;",
        "LX/0zFu;",
        "LX/0zFv;",
        "LX/0zFz;",
        "LX/0zG4;",
        "LX/0zG5;",
        "LX/0zG6;",
        "Lcom/ss/android/ugc/aweme/channel/share/channel/wrap/WrapDefaultWhatsappChannel;",
        "Lcom/ss/android/ugc/aweme/base/share/ShareInfo;",
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
        "Lcom/ss/android/ugc/aweme/feed/model/live/ShareStruct;",
        "Lcom/ss/android/ugc/aweme/im/common/model/ChatInviteShareResponse;",
        "Lcom/ss/android/ugc/aweme/openshare/DmShare\$TikTokDSPSettings;",
        "Lcom/ss/android/ugc/aweme/poi/detail/container/model/PoiShareInfo;",
        "Lcom/ss/android/ugc/aweme/share/model/ShareURLInfo;",
        "Lcom/ss/android/ugc/sdk/channel/third/whatsapp/WhatsappChannel;",
        "Lcom/ss/android/ugc/tiktok/ConvertHelper;",
        "Lkotlin/jvm/internal/AwS356S0200000_15;",
        "Lkotlin/jvm/internal/AwS540S0100000_30;",
    )

private val SHORT_HOST_LITERAL_CLASSES =
    setOf(
        "LX/0qh1;",
        "LX/0qh2;",
        "Lcom/bytedance/helios/api/config/AgControlConfig;",
    )

private val SHORT_HOST_LITERAL_REPLACEMENTS =
    mapOf(
        "vt.tiktok.com" to CUSTOM_HOST,
        "vm.tiktok.com" to CUSTOM_HOST,
    )

@Suppress("unused")
val changeTikTokShareDomainPatch =
    bytecodePatch(
        name = "Change TikTok share domain",
        description = "Rewrites generated TikTok share links to sticktock.kareem.one.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_TIKTOK)

        extendWith("extensions/extension.rve")

        execute {
            var insertionCount = 0

            classDefForEach { classDef ->
                val rewriteShortHostLiterals = classDef.type in SHORT_HOST_LITERAL_CLASSES
                val rewriteShareOutputs = classDef.type in SHARE_HANDLER_CLASSES
                val rewriteClipboardHelper = classDef.type == "LX/0gX5;"
                if (!rewriteShortHostLiterals && !rewriteShareOutputs && !rewriteClipboardHelper) {
                    return@classDefForEach
                }

                val mutableClass = mutableClassDefBy(classDef)

                if (classDef.type == "LX/0gX5;") {
                    mutableClass.methods
                        .firstOrNull { method ->
                            method.name == "LIZJ" &&
                                method.parameterTypes == listOf(
                                    "Landroid/content/ClipboardManager;",
                                    "Landroid/content/ClipData;",
                                    "Lcom/bytedance/bpea/basics/Cert;",
                                )
                        }
                        ?.apply {
                            addInstructions(
                                0,
                                """
                                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->rewriteClipData(Landroid/content/ClipData;)Landroid/content/ClipData;
                                move-result-object p1
                                """.trimIndent(),
                            )
                            insertionCount++
                        }
                }

                mutableClass.methods.forEach { method ->
                    val instructions = method.implementation?.instructions?.toList() ?: return@forEach

                    if (rewriteShortHostLiterals) {
                        instructions.forEachIndexed { index, instruction ->
                            if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                                return@forEachIndexed
                            }

                            val literal =
                                ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                                    ?.string
                                    ?: return@forEachIndexed
                            val replacement = SHORT_HOST_LITERAL_REPLACEMENTS[literal] ?: return@forEachIndexed
                            val register = (instruction as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
                            val opcode =
                                when (instruction.opcode) {
                                    Opcode.CONST_STRING_JUMBO -> "const-string/jumbo"
                                    else -> "const-string"
                                }

                            method.replaceInstruction(index, "$opcode v$register, \"$replacement\"")
                            insertionCount++
                        }
                    }

                    if (!rewriteShareOutputs) {
                        return@forEach
                    }

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

                                instruction.opcode == Opcode.INVOKE_STATIC &&
                                    reference == BYTEDANCE_CLIPBOARD_SET_PRIMARY_CLIP &&
                                    registers.size >= 2 ->
                                    Insertion(index, registers[1], REWRITE_CLIP_DATA_METHOD)

                                instruction.opcode == Opcode.IPUT_OBJECT &&
                                    isShareLinkStringField(reference) &&
                                    registers.isNotEmpty() ->
                                    Insertion(index, registers[0], REWRITE_STRING_METHOD)

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
                throw PatchException("Could not find TikTok share or clipboard outputs to rewrite")
            }
        }
    }

private data class Insertion(
    val index: Int,
    val register: Int,
    val method: String,
)

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

private fun isShareLinkStringField(reference: String): Boolean =
    reference.endsWith(":Ljava/lang/String;") &&
        listOf(
            "->shareUrl:",
            "->shortUrl:",
            "->shareLink:",
            "->shareLinkText:",
        ).any(reference::contains)
