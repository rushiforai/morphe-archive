package com.dmoniak.patches.robberybob

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_ROBBERY_BOB
import java.util.logging.Logger

@Suppress("unused")
val robberyBobUnlimitedSprintPatch = bytecodePatch(
    name = "Unlimited Sprint & Stamina - Robbery Bob (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables Bob's sprint exhaustion in Robbery Bob, giving unlimited running stamina to escape guards, residents, and guard dogs without slowing down. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_ROBBERY_BOB)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRobberyBobUnlimitedSprintLogic(logger)
    }
}

fun BytecodePatchContext.executeRobberyBobUnlimitedSprintLogic(logger: Logger) {
    logger.info("Executing Unlimited Sprint & Stamina patch for Robbery Bob...")
    var sprintCount = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Is tired / exhausted -> always false (never exhausted)
            if (!isStatic && (
                mName == "istired" ||
                mName == "isexhausted" ||
                mName == "outoffbreath" ||
                mName == "isbreathout"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    sprintCount++
                    logger.info("[Robbery Bob] Hooked fatigue check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Can sprint / has stamina -> always true
            if (!isStatic && (
                mName == "cansprint" ||
                mName == "canrun" ||
                mName == "hasstamina"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    sprintCount++
                    logger.info("[Robbery Bob] Hooked sprint ability check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Stamina depletion / consumption -> no-op return-void
            if (!isStatic && (
                mName == "consumestamina" ||
                mName == "depletestamina" ||
                mName == "drainstamina" ||
                mName == "spendsprint" ||
                mName == "decreasestamina"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    sprintCount++
                    logger.info("[Robbery Bob] Hooked stamina depletion: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 4. Stamina / Sprint percentage getter -> return 1.0f (100% full)
            if (!isStatic && (
                mName == "getstamina" ||
                mName == "getstaminapercent" ||
                mName == "getsprintenergy" ||
                mName == "getcurrentstamina"
            ) && retType == "F" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, 0x3f800000
                        return v0
                        """.trimIndent()
                    )
                    sprintCount++
                    logger.info("[Robbery Bob] Hooked stamina getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Robbery Bob] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Robbery Bob] Unlimited Sprint & Stamina: $sprintCount method(s) hooked.")
}
