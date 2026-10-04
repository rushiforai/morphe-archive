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
val undercoverAmoledThemeAndPrivacyPatch = bytecodePatch(
    name = "AMOLED Dark Theme & Privacy - Undercover (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enforces dark mode and strips analytics telemetry (Firebase Analytics, App Measurement) in Undercover.",
) {
    compatibleWith(COMPATIBILITY_UNDERCOVER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUndercoverThemeAndPrivacyLogic(logger)
    }
}

fun BytecodePatchContext.executeUndercoverThemeAndPrivacyLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme & Privacy patch for Undercover...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Hook Firebase Analytics & GMS AppMeasurement telemetry dispatchers directly
        if (
            type.contains("com/google/firebase/analytics/") ||
            type.contains("com/google/android/gms/measurement/")
        ) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType

                if (
                    (mName == "logEvent" || mName == "logEventInternal" || mName == "setUserProperty") &&
                    retType == "V"
                ) {
                    try {
                        val mm = mutableClass.findMutableMethodOf(method)
                        mm?.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedPoints++
                    } catch (e: Exception) {
                        logger.fine("Failed to hook $type.$mName: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook night mode and dark theme checks in Undercover (non-activity classes only)
        if (!tl.contains("activity")) {
            for (method in classDef.methods.toList()) {
                val impl = method.implementation ?: continue
                val retType = method.returnType

                var referencesNightMode = false
                for (insn in impl.instructions) {
                    if (insn is ReferenceInstruction && insn.reference is StringReference) {
                        val s = (insn.reference as StringReference).string
                        if (
                            s == "LAST_SAVED_IS_SYSTEM_NIGHT_ON" ||
                            s == "LAST_SAVED_APPEARANCE" ||
                            s.contains("night_mode")
                        ) {
                            referencesNightMode = true
                            break
                        }
                    }
                }

                if (referencesNightMode && retType == "Z" && method.parameterTypes.size <= 1) {
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
                        logger.fine("Failed to hook night mode in $type.${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("Hooked $hookedPoints theme and telemetry points in Undercover.")
}
