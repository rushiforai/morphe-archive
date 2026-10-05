package com.dmoniak.patches.freefire

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FREE_FIRE
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FREE_FIRE_MAX
import java.util.logging.Logger

@Suppress("unused")
val freeFire120FpsPatch = bytecodePatch(
    name = "Free Fire MAX 120 FPS & Device Model Spoof (Experimental)",
    description = "⚠️ [Expérimental / Risque de ban en ligne] Débloque l'option 120 FPS / Taux de rafraîchissement élevé dans Free Fire MAX en simulant un modèle d'appareil gaming supporté (ASUS ROG Phone 8 Pro / ASUS_AI2401) et en forçant le taux de rafraîchissement de la fenêtre d'affichage à 120Hz.",
) {
    compatibleWith(COMPATIBILITY_FREE_FIRE_MAX, COMPATIBILITY_FREE_FIRE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFreeFire120FpsLogic(logger)
    }
}

fun BytecodePatchContext.executeFreeFire120FpsLogic(logger: Logger) {
    logger.info("Executing Free Fire MAX 120 FPS & Device Model Spoof patch...")
    var replacedBuildFields = 0
    var replacedFpsConstants = 0
    var hookedGetters = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip core system packages
        if (tl.startsWith("landroid/os/") || tl.startsWith("landroid/view/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            val imp = method.implementation ?: continue
            val mName = method.name
            val mNameLower = mName.lowercase()
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)

            // 1. Scan instructions for Build.MODEL / MANUFACTURER / BRAND / HARDWARE reads (100% in-place safe)
            val instructions = imp.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode == Opcode.SGET_OBJECT) {
                    val fieldRef = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                    if (fieldRef.definingClass == "Landroid/os/Build;") {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val spoofVal = when (fieldRef.name) {
                            "MODEL", "DEVICE", "PRODUCT" -> "ASUS_AI2401"
                            "MANUFACTURER", "BRAND" -> "asus"
                            "HARDWARE" -> "qcom"
                            "BOARD" -> "taro"
                            "SOC_MODEL" -> "SM8650"
                            "FINGERPRINT" -> "asus/WW_AI2401/ASUS_AI2401:14/UKQ1.230924.001/34.1420.1420.316-0:user/release-keys"
                            else -> null
                        }

                        if (spoofVal != null) {
                            try {
                                val mutableMethod = mutableClass.findMutableMethodOf(method)
                                val newInstruction = BuilderInstruction21c(
                                    Opcode.CONST_STRING,
                                    reg,
                                    ImmutableStringReference(spoofVal)
                                )
                                mutableMethod.replaceInstruction(index, newInstruction)
                                replacedBuildFields++
                            } catch (e: Exception) {
                                logger.fine("[Free Fire 120 FPS] Skip instruction replace: ${e.message}")
                            }
                        }
                    }
                }
            }

            // 2. Safely upgrade 60 FPS cap constants (0x3c -> 0x78) in FPS-related methods
            val isFpsMethod = mNameLower.contains("fps") ||
                mNameLower.contains("framerate") ||
                mNameLower.contains("refreshrate") ||
                mNameLower.contains("targetrate") ||
                mNameLower.contains("targetframe")

            if (isFpsMethod) {
                for ((index, instruction) in instructions.withIndex()) {
                    // Check for const/4 reg, 0x3c or const/16 reg, 0x3c (60 FPS cap)
                    if (instruction.opcode == Opcode.CONST_4 || instruction.opcode == Opcode.CONST_16) {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val literal = when (instruction) {
                            is com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction -> instruction.narrowLiteral
                            else -> null
                        }
                        if (literal == 60) {
                            try {
                                val mutableMethod = mutableClass.findMutableMethodOf(method)
                                val newInstruction = com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s(
                                    Opcode.CONST_16,
                                    reg,
                                    120 // 120 FPS
                                )
                                mutableMethod.replaceInstruction(index, newInstruction)
                                replacedFpsConstants++
                            } catch (e: Exception) {
                                logger.fine("[Free Fire 120 FPS] Skip 60fps literal replace: ${e.message}")
                            }
                        }
                    }
                }
            }

            // 3. Hook framerate getters safely by replacing return register value in-place
            if (!isStatic && (
                mNameLower == "gettargetfps" ||
                mNameLower == "getmaxframerate" ||
                mNameLower == "gettargetframerate" ||
                mNameLower == "getdesiredfps"
            ) && method.returnType == "I" && method.parameterTypes.isEmpty()) {
                for ((index, instruction) in instructions.withIndex()) {
                    if (instruction.opcode == Opcode.RETURN) {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            val const120 = com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s(
                                Opcode.CONST_16,
                                reg,
                                120
                            )
                            // Replace whatever loaded the return value right before RETURN with const_16 reg, 120
                            if (index > 0) {
                                mutableMethod.replaceInstruction(index - 1, const120)
                                hookedGetters++
                            }
                        } catch (e: Exception) {
                            logger.fine("[Free Fire 120 FPS] Skip getter replace: ${e.message}")
                        }
                        break
                    }
                }
            }
        }
    }

    logger.info("[Free Fire 120 FPS] Finished: $replacedBuildFields Build field accesses spoofed, $replacedFpsConstants 60 FPS constants boosted to 120, $hookedGetters getters hooked in-place.")
}
