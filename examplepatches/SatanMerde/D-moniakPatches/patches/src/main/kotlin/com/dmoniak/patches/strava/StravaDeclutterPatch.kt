package com.dmoniak.patches.strava

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_STRAVA
import java.util.logging.Logger

@Suppress("unused")
val stravaDeclutterPatch = bytecodePatch(
    name = "Declutter Feed & Hide Trials - Strava (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Hides persistent 'Start Free Trial' promotional banners, sponsored club challenges, and upsell carousels in the activity feed.",
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeStravaDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeStravaDeclutterLogic(logger: Logger) {
    logger.info("Executing Declutter Feed & Hide Trials patch for Strava...")
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

            // 1. Hide trial promotions and upsell cards
            if (!isStatic && (
                mName == "isfreetrialbannervisible" ||
                mName == "shouldshowsubscriptionpromo" ||
                mName == "isupsellcard" ||
                mName == "issponsoredchallenge" ||
                mName == "haspromotionalbanner"
            ) && retType == "Z") {
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
                    logger.info("[Strava Declutter] Hidden trial/promo card: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Strava Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Strava Declutter] Total feed declutter hooks applied: $hookedPoints")
}
