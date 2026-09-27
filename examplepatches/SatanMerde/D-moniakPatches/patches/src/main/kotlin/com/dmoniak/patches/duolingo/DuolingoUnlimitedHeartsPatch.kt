package com.dmoniak.patches.duolingo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DUOLINGO
import java.util.logging.Logger

@Suppress("unused")
val duolingoUnlimitedHeartsPatch = bytecodePatch(
    name = "Unlimited Hearts - Duolingo (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables hearts/lives loss when making mistakes during language lessons in Duolingo, enabling infinite learning sessions without waiting or paywalls.",
) {
    compatibleWith(COMPATIBILITY_DUOLINGO)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDuolingoUnlimitedHeartsLogic(logger)
    }
}

fun BytecodePatchContext.executeDuolingoUnlimitedHeartsLogic(logger: Logger) {
    logger.info("Executing Unlimited Hearts patch for Duolingo...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Focus on duolingo lesson & user session classes
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Unlimited hearts / infinite health flag
            if (!isStatic && (
                mName == "isunlimitedhearts" ||
                mName == "hasinfinitehearts" ||
                mName == "ishealthsystemdisabled" ||
                mName == "isheartsystemdisabled" ||
                mName == "hasunlimitedhearts" ||
                mName == "hasheartsremaining"
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
                    hookedPoints++
                    logger.info("[Duolingo Hearts] Enforced unlimited hearts flag: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo Hearts] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Heart count getter: always return 5 (or max)
            if (!isStatic && (
                mName == "getheartcount" ||
                mName == "getcurrenthearts" ||
                mName == "getremaininghearts" ||
                mName == "getnumhearts"
            ) && retType == "I" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x5
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Duolingo Hearts] Fixed heart count to 5: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo Hearts] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Heart decrement / consumption no-op
            if (!isStatic && (
                mName == "consumeheart" ||
                mName == "loseheart" ||
                mName == "decrementheart" ||
                mName == "deductheart"
            ) && (retType == "V" || retType == "Z")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    if (retType == "V") {
                        mutableMethod.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                    } else {
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                    }
                    hookedPoints++
                    logger.info("[Duolingo Hearts] Disabled heart consumption: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo Hearts] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Duolingo Hearts] Total heart protection hooks applied: $hookedPoints")
}
