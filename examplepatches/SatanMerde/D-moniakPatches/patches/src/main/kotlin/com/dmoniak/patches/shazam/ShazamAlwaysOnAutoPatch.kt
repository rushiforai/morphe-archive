package com.dmoniak.patches.shazam

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHAZAM
import java.util.logging.Logger

@Suppress("unused")
val shazamAlwaysOnAutoPatch = bytecodePatch(
    name = "Always-On Auto Shazam - Shazam (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Keeps Auto Shazam background listening continuously active without battery optimization pauses or auto-timeout limits.",
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShazamAlwaysOnAutoLogic(logger)
    }
}

fun BytecodePatchContext.executeShazamAlwaysOnAutoLogic(logger: Logger) {
    logger.info("Executing Always-On Auto Shazam patch for Shazam...")
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

            // 1. Disable Auto Shazam timeout & battery throttling
            if (!isStatic && (
                mName == "isautoshazamtimeooutenabled" ||
                mName == "isautoshazamtimedout" ||
                mName == "shouldpauseautoshazam" ||
                mName == "isbatterysaverpauseallowed"
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
                    logger.info("[Shazam Auto] Disabled auto-shazam pause/timeout: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Shazam Auto] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Shazam Auto] Total always-on hooks applied: $hookedPoints")
}
