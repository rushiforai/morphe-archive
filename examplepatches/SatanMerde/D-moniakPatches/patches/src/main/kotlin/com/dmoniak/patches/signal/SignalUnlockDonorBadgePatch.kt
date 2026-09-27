package com.dmoniak.patches.signal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIGNAL
import java.util.logging.Logger

@Suppress("unused")
val signalUnlockDonorBadgePatch = bytecodePatch(
    name = "Unlock Supporter & Donor Badge - Signal (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Activates the client-side Signal Sustainer / Supporter profile badge and unlocks exclusive supporter avatar rings and custom app icons.",
) {
    compatibleWith(COMPATIBILITY_SIGNAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSignalUnlockDonorBadgeLogic(logger)
    }
}

fun BytecodePatchContext.executeSignalUnlockDonorBadgeLogic(logger: Logger) {
    logger.info("Executing Unlock Supporter & Donor Badge patch for Signal...")
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

            // Hook donor badge and supporter features
            if (!isStatic && (
                mName == "isdonorbadgeactive" ||
                mName == "hassupporterstatus" ||
                mName == "issignalboosteractive" ||
                mName == "canusesupportericons" ||
                mName == "shouldshowdonorbadge"
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
                    logger.info("[Signal Supporter] Unlocked donor badge in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal Supporter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Signal Unlock Supporter] Total hooks applied: $hookedPoints")
}
