package com.dmoniak.patches.strava

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_STRAVA
import java.util.logging.Logger

@Suppress("unused")
val stravaProFeaturesPatch = bytecodePatch(
    name = "Unlock Pro & Subscriber Analytics - Strava (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks 3D terrain route previews, custom segment leaderboard analytics, relative effort metrics, and training log insights.",
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeStravaProFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeStravaProFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Pro Analytics patch for Strava...")
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

            // 1. Pro / Subscriber analytics and features entitlement
            if (!isStatic && (
                mName == "issubscriber" ||
                mName == "hassubscription" ||
                mName == "ispremiummember" ||
                mName == "issegmentanalysisunlocked" ||
                mName == "canaccess3dmap" ||
                mName == "isrelativeeffortunlocked" ||
                mName == "isadvancedtraininglogallowed"
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
                    logger.info("[Strava Pro] Unlocked subscriber feature: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Strava Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Strava Pro] Total pro analytics hooks applied: $hookedPoints")
}
