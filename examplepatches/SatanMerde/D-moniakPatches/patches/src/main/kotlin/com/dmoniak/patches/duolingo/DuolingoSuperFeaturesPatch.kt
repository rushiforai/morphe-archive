package com.dmoniak.patches.duolingo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_DUOLINGO
import java.util.logging.Logger

@Suppress("unused")
val duolingoSuperFeaturesPatch = bytecodePatch(
    name = "Unlock Super Features - Duolingo (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Super Duolingo practice hub modes, unlimited Legendary test attempts without gem expenditure, and mistake review sessions.",
) {
    compatibleWith(COMPATIBILITY_DUOLINGO)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeDuolingoSuperFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeDuolingoSuperFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Super Features patch for Duolingo...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Super / Plus subscription and entitlement flags
            if (!isStatic && (
                mName == "isplussubscriber" ||
                mName == "issupersubscriber" ||
                mName == "hasactivesubscription" ||
                mName == "canaccesspracticehub" ||
                mName == "islegendaryfree" ||
                mName == "ismistakesreviewunlocked" ||
                mName == "hasunlimitedlegendaryattempts"
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
                    logger.info("[Duolingo Super] Enforced premium/super feature flag: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo Super] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Legendary cost reduction (freezes gem cost to 0)
            if (!isStatic && (
                mName == "getlegendarygemcost" ||
                mName == "getmistakereviewcost" ||
                mName == "getpracticehubcost"
            ) && retType == "I" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Duolingo Super] Set feature gem cost to 0: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Duolingo Super] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Duolingo Super] Total super feature hooks applied: $hookedPoints")
}
