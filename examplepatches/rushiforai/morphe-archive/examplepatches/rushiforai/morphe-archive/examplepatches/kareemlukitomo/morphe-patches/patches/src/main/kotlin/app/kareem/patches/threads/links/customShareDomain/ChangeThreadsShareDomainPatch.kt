package app.kareem.patches.threads.links.customShareDomain

import app.kareem.patches.shared.Constants.COMPATIBILITY_THREADS
import app.kareem.patches.shared.replaceStringLiterals
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val CUSTOM_URL = "https://shoelace.kareem.one"
private const val CUSTOM_HOST = "shoelace.kareem.one"
private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/kareem/extension/threads/patches/ThreadsShareLinksPatch;"
private const val REWRITE_CHAR_SEQUENCE_METHOD =
    "$EXTENSION_CLASS_DESCRIPTOR->rewriteShareCharSequence(Ljava/lang/CharSequence;)Ljava/lang/String;"
private const val REWRITE_CLIP_DATA_METHOD =
    "$EXTENSION_CLASS_DESCRIPTOR->rewriteClipData(Landroid/content/ClipData;)Landroid/content/ClipData;"

@Suppress("unused")
val changeThreadsShareDomainPatch =
    bytecodePatch(
        name = "Change Threads share domain",
        description = "Rewrites generated Threads share links to shoelace.kareem.one.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_THREADS)

        extendWith("extensions/extension.rve")

        execute {
            replaceStringLiterals(
                mapOf(
                    "https://www.threads.com" to CUSTOM_URL,
                    "https://www.threads.com/" to "$CUSTOM_URL/",
                    "https://threads.com/?" to "$CUSTOM_URL/?",
                    "https://www.threads.com/custom_feed/" to "$CUSTOM_URL/custom_feed/",
                    "https://www.threads.com/search?" to "$CUSTOM_URL/search?",
                    "https://www.threads.net" to CUSTOM_URL,
                    "l.threads.com" to CUSTOM_HOST,
                    "threads.com" to CUSTOM_HOST,
                    "threads.net" to CUSTOM_HOST,
                    "www.threads.com" to CUSTOM_HOST,
                    "www.threads.net" to CUSTOM_HOST,
                ),
            )

            PlainTextShareIntentBuilderFingerprint.method.apply {
                val textRegister = implementation!!.registerCount - 1

                addInstructions(
                    0,
                    """
                    invoke-static/range { v$textRegister .. v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->rewriteShareText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                    """.trimIndent(),
                )
            }

            ChatInviteShareIntentBuilderFingerprint.method.apply {
                val textExtraStringIndex =
                    indexOfFirstInstruction {
                        opcode == Opcode.CONST_STRING &&
                            (((this as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                                "android.intent.extra.TEXT")
                    }
                val putTextExtraIndex = indexOfFirstInstruction(textExtraStringIndex, Opcode.INVOKE_VIRTUAL)
                val textRegister = instructions[putTextExtraIndex].registersUsed[2]

                addInstructions(
                    putTextExtraIndex,
                    """
                    invoke-static/range { v$textRegister .. v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->rewriteShareText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                        """.trimIndent(),
                )
            }

            LinkShareSheetCopyLinkFingerprint.method.apply {
                val setTextIndex =
                    indexOfFirstInstruction {
                        opcode == Opcode.INVOKE_VIRTUAL &&
                            ((this as? ReferenceInstruction)?.reference?.toString()
                                ?.contains("Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V") == true)
                    }
                val textRegister = instructions[setTextIndex].registersUsed[1]

                addInstructions(
                    setTextIndex,
                    """
                    invoke-static/range { v$textRegister .. v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->rewriteShareText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                        """.trimIndent(),
                )
            }

            CopyToClipboardUseCaseFingerprint.method.apply {
                val setTextIndex =
                    indexOfFirstInstruction {
                        opcode == Opcode.INVOKE_VIRTUAL &&
                            ((this as? ReferenceInstruction)?.reference?.toString()
                                ?.contains("Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V") == true)
                    }
                val textRegister = instructions[setTextIndex].registersUsed[1]

                addInstructions(
                    setTextIndex,
                    """
                    invoke-static/range { v$textRegister .. v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->rewriteShareText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                    """.trimIndent(),
                )
            }

            classDefForEach { classDef ->
                val mutableClass = mutableClassDefBy(classDef)

                mutableClass.methods.forEach { method ->
                    val insertions =
                        method.implementation
                            ?.instructions
                            ?.toList()
                            ?.mapIndexedNotNull { index, instruction ->
                                val reference =
                                    (instruction as? ReferenceInstruction)?.reference?.toString()
                                        ?: return@mapIndexedNotNull null
                                val registers = instruction.registersUsed

                                when {
                                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                        reference == "Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V" &&
                                        registers.size >= 2 -> index to registers[1]

                                    instruction.opcode == Opcode.INVOKE_STATIC &&
                                        reference == "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;" &&
                                        registers.size >= 2 -> index to registers[1]

                                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                                        reference == "Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V" &&
                                        registers.size >= 2 -> index to registers[1]

                                    else -> null
                                }
                            }
                            ?: return@forEach

                    insertions.asReversed().forEach { (index, textRegister) ->
                        val instruction = method.instructions[index]
                        val reference = (instruction as ReferenceInstruction).reference.toString()
                        val rewriteMethod =
                            when (reference) {
                                "Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V" ->
                                    REWRITE_CLIP_DATA_METHOD

                                else -> REWRITE_CHAR_SEQUENCE_METHOD
                            }

                        method.addInstructions(
                            index,
                            """
                            invoke-static/range { v$textRegister .. v$textRegister }, $rewriteMethod
                            move-result-object v$textRegister
                            """.trimIndent(),
                        )
                    }
                }
            }
        }
    }
