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
val undercoverUnlockAdvancedGameSettingsPatch = bytecodePatch(
    name = "Unlock Advanced Game Settings - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks advanced game configuration (custom player counts, exact role distribution sliders for Civilians, Undercover agents, and Mr. White, custom discussion timers, and voting rules).",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverUnlockSettingsLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverUnlockSettingsLogic(logger: Logger) {
    logger.info("Executing Unlock Advanced Game Settings patch for Undercover...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Pack Enum check: ensure SPECIAL_ROLES pack is unlocked
        var isPackEnum = false
        if (classDef.superclass == "Ljava/lang/Enum;") {
            for (method in classDef.methods) {
                val impl = method.implementation ?: continue
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (s == "undercover.all_roles" || s == "SPECIAL_ROLES") {
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

        // 2. Safe targeted role flags checks (non-activity classes only)
        if (!tl.contains("activity")) {
            for (method in classDef.methods.toList()) {
                val impl = method.implementation ?: continue
                val retType = method.returnType

                var referencesRoleFlag = false
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (
                            s == "is_using_falafel_vendor" ||
                            s == "mr_white_can_start" ||
                            s == "SETTING_MR_WHITE_CAN_START" ||
                            s == "SETTING_USE_FALAFEL_VENDOR" ||
                            s == "SETTING_USE_LOVERS"
                        ) {
                            referencesRoleFlag = true
                            break
                        }
                    }
                }

                if (referencesRoleFlag && retType == "Z" && method.parameterTypes.size <= 1) {
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

    logger.info("Hooked $hookedPoints advanced game configuration points in Undercover.")
}
