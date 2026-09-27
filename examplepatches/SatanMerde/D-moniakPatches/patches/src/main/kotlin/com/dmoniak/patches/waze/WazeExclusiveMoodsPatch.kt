package com.dmoniak.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WAZE
import java.util.logging.Logger

@Suppress("unused")
val wazeExclusiveMoodsPatch = bytecodePatch(
    name = "Unlock Exclusive Moods & Car Icons - Waze (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks all exclusive driver moods, special vehicle avatars, and internal voice/audio themes without requiring event points or milestones.",
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWazeExclusiveMoodsLogic(logger)
    }
}

fun BytecodePatchContext.executeWazeExclusiveMoodsLogic(logger: Logger) {
    logger.info("Executing Unlock Exclusive Moods & Car Icons patch for Waze...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google/android/gms")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Exclusive moods, avatars and vehicle icon unlocked states
            if (!isStatic && (
                mName == "ismoodunlocked" ||
                mName == "iscariconavailable" ||
                mName == "isspecialthemeunlocked" ||
                mName == "canselectmood" ||
                mName == "isavatarunlocked" ||
                mName == "hasmoodpermission" ||
                mName == "isbonuscarunlocked"
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
                    logger.info("[Waze Moods] Unlocked mood/avatar: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Waze Moods] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Waze Moods] Total mood & car customization hooks applied: $hookedPoints")
}
