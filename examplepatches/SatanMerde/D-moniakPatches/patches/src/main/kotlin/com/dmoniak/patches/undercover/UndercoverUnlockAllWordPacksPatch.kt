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
val undercoverUnlockAllWordPacksPatch = bytecodePatch(
    name = "Unlock All Word Packs & Premium - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hooks in-app purchase verification, pack enums, and preference stores to unlock all premium word packs (Adult 18+, Pop Culture, Geek, Cinema, Science & History, 50+ languages) and remove all paywalls.",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverUnlockWordPacksLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverUnlockWordPacksLogic(logger: Logger) {
    logger.info("Executing Unlock All Word Packs & Premium patch for Undercover...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Pack & Purchase Enum (Lup5): Enum containing "undercover.all_roles" or "undercover.full_access"
        var isPackEnum = false
        if (classDef.superclass == "Ljava/lang/Enum;") {
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (s == "undercover.all_roles" || s == "undercover.full_access" || s.startsWith("undercover.full_library")) {
                            isPackEnum = true
                            break
                        }
                    }
                }
                if (isPackEnum) break
            }
        }

        if (isPackEnum) {
            logger.info("Identified Undercover Pack Enum: $type")
            for (method in classDef.methods.toList()) {
                val ret = method.returnType
                // Hook ONLY the specific unlock/purchase methods: isUnlocked (o), isBought (i), isFree (n), isAvailable (j)
                if (ret == "Z" && method.name in listOf("i", "j", "n", "o")) {
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

        // 2. Safe targeted purchase key hooks (non-activity classes only)
        if (!tl.startsWith("landroid/") && !tl.startsWith("lkotlin/") && !tl.contains("activity")) {
            for (method in classDef.methods.toList()) {
                val impl = method.implementation ?: continue
                val retType = method.returnType

                var referencesPurchaseKey = false
                for (instruction in impl.instructions) {
                    if (instruction is ReferenceInstruction && instruction.reference is StringReference) {
                        val str = (instruction.reference as StringReference).string
                        if (
                            str.startsWith("BOUGHT_STATUS_") ||
                            str == "is_bought_purchase_1" ||
                            str.startsWith("undercover.full") ||
                            str == "undercover.all_roles"
                        ) {
                            referencesPurchaseKey = true
                            break
                        }
                    }
                }

                if (referencesPurchaseKey && retType == "Z" && method.parameterTypes.size <= 1) {
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
                        logger.fine("Failed to hook purchase method ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("Hooked $hookedPoints word pack and premium checkpoints in Undercover.")
}
