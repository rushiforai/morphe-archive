package com.dmoniak.patches.jetpackjoyride

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_JETPACK_JOYRIDE
import java.util.logging.Logger

@Suppress("unused")
val jetpackJoyrideInfiniteShieldPatch = bytecodePatch(
    name = "Infinite Vehicle Shield - Jetpack Joyride (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Keeps Barry's vehicle and gadget shields permanently active in Jetpack Joyride, preventing destruction upon contact with zappers, missiles, and laser fields.",
) {
    compatibleWith(COMPATIBILITY_JETPACK_JOYRIDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeJetpackJoyrideInfiniteShieldLogic(logger)
    }
}

fun BytecodePatchContext.executeJetpackJoyrideInfiniteShieldLogic(logger: Logger) {
    logger.info("Executing Infinite Vehicle Shield patch for Jetpack Joyride...")
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

            // 1. Force shield active & invulnerability getters to true
            if (!isStatic && (
                mName == "isshieldactive" ||
                mName == "hasvehicleshield" ||
                mName == "isinvulnerable" ||
                mName == "hasdeflectorshield"
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
                    logger.info("[Jetpack Shield] Enforced shield/invincible: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Jetpack Shield] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Prevent shield destruction/breakage
            if (!isStatic && (
                mName == "breakshield" ||
                mName == "destroyshield" ||
                mName == "depleteshield"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Jetpack Shield] Neutralized shield break: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Jetpack Shield] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Jetpack Shield] Total shield protection hooks applied: $hookedPoints")
}
