package com.dmoniak.patches.vector2

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VECTOR_2
import java.util.logging.Logger

@Suppress("unused")
val vector2InfiniteBatteryPatch = bytecodePatch(
    name = "Infinite Battery & Shields - Vector 2 (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents armor kit battery and shield depletion in Vector 2, keeping protective shields active against lasers, floor mines, and electric hazards. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_VECTOR_2)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVector2InfiniteBatteryLogic(logger)
    }
}

fun BytecodePatchContext.executeVector2InfiniteBatteryLogic(logger: Logger) {
    logger.info("Executing Infinite Battery & Shields patch for Vector 2...")
    var batteryCount = 0

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

            // 1. Is shield / armor kit active -> always true
            if (!isStatic && (
                mName == "isshieldactive" ||
                mName == "hasenergy" ||
                mName == "hascharges" ||
                mName == "hasbattery"
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
                    batteryCount++
                    logger.info("[Vector 2] Hooked shield activity check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Vector 2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Consume battery / deplete charges -> no-op return-void
            if (!isStatic && (
                mName == "consumebattery" ||
                mName == "consumeenergy" ||
                mName == "depletecharge" ||
                mName == "depleteshield" ||
                mName == "spendcharges"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    batteryCount++
                    logger.info("[Vector 2] Hooked battery depletion: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Vector 2] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Battery / Shield charges count -> return 10 (fully charged)
            if (!isStatic && (
                mName == "getbatterycharge" ||
                mName == "getremainingcharges" ||
                mName == "getenergycount"
            ) && retType == "I" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0xa
                        return v0
                        """.trimIndent()
                    )
                    batteryCount++
                    logger.info("[Vector 2] Hooked battery getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Vector 2] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Vector 2] Infinite Battery & Shields: $batteryCount method(s) hooked.")
}
