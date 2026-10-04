package com.dmoniak.patches.undercover

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_UNDERCOVER
import java.util.logging.Logger

@Suppress("unused")
val undercoverUnlockCustomWordEditorPatch = bytecodePatch(
    name = "Unlock Custom Words Creator - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks the custom word pack creator allowing players to create, save, and edit unlimited secret word pairs and custom clue databases without subscription restrictions.",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverUnlockCustomWordEditorLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverUnlockCustomWordEditorLogic(logger: Logger) {
    logger.info("Executing Unlock Custom Words Creator patch for Undercover...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Pack Enum check: if class is Pack Enum, hook boolean methods to unlock custom words
        var isPackEnum = false
        if (classDef.superclass == "Ljava/lang/Enum;") {
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (s == "undercover.unlock_words_en" || s == "ALL_LANGUAGES_ALL_WORDS") {
                            isPackEnum = true
                            break
                        }
                    }
                }
                if (isPackEnum) break
            }
        }

        if (isPackEnum) {
            for (method in classDef.methods.toList()) {
                if (method.returnType == "Z" && method.name in listOf("i", "j", "n", "o")) {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $type.${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook any method referencing custom word strings (non-activity classes only)
        if (!tl.contains("activity")) {
            for (method in classDef.methods.toList()) {
                val impl = method.implementation ?: continue
                val retType = method.returnType

                var referencesCustomWords = false
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (
                            s.contains("unlock_words") ||
                            s.startsWith("N_PAIRS_FROM_") ||
                            s.startsWith("QUEST_COMPLETED_") ||
                            s.startsWith("QUEST_CLAIMED_")
                        ) {
                            referencesCustomWords = true
                            break
                        }
                    }
                }

                if (referencesCustomWords && retType == "Z" && method.parameterTypes.size <= 1) {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $type.${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("Hooked $hookedPoints custom word editor checkpoints in Undercover.")
}
