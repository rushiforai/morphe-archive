package com.dmoniak.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

@Suppress("unused")
val redditUnlockPremiumAndIconsPatch = bytecodePatch(
    name = "Unlock Reddit Premium & Custom App Icons - Reddit (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Locally unlocks Reddit Premium status, unlocks exclusive custom application launcher icons (Doge, Retro, Neon, Gold), and removes Premium promotional prompts.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRedditUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeRedditUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Reddit Premium patch for Reddit...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "ispremiumuser" ||
                mName == "haspremium" ||
                mName == "iscustomappiconunlocked" ||
                mName == "isgoldmember"
            ) && retType == "Z") {
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
                    logger.info("[Reddit Premium] Enabled premium entitlement in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Reddit Premium] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Reddit Premium] Finished: $hookedPoints Reddit Premium hooks injected.")
}
