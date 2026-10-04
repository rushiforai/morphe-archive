package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramUnlockPlusFeaturesPatch = bytecodePatch(
    name = "Unlock Instagram Plus & Client Entitlements - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Locally unlocks Instagram Plus subscription benefits, custom app launcher icons, enhanced 60 FPS story rendering, and extended multi-media carousel limits.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock Instagram Plus patch for Instagram...")
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
                mName == "isplususer" ||
                mName == "hasplussubscription" ||
                mName == "iscliententitlementactive" ||
                mName == "iscustomappiconallowed"
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
                    logger.info("[Instagram Plus] Enabled plus entitlement in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Plus] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Plus] Finished: $hookedPoints Plus entitlement hooks injected.")
}
