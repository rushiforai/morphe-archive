package com.dmoniak.patches.snapchat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SNAPCHAT
import java.util.logging.Logger

@Suppress("unused")
val snapchatUnlockPlusFeaturesPatch = bytecodePatch(
    name = "Unlock Snapchat+ Features - Snapchat (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks client-side Snapchat+ UI features: custom app icons, post-view emojis, best friends pin badges, and dark mode controls.",
) {
    compatibleWith(COMPATIBILITY_SNAPCHAT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSnapchatUnlockPlusLogic(logger)
    }
}

fun BytecodePatchContext.executeSnapchatUnlockPlusLogic(logger: Logger) {
    logger.info("Executing Unlock Snapchat+ Features patch for Snapchat...")
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

            // Hook client-side Snapchat+ feature availability and subscriber flags
            if (!isStatic && (
                mName == "issnapchatplusactive" ||
                mName == "issnapchatplussubscriber" ||
                mName == "hassnapplusfeatures" ||
                mName == "canusesnapplusbadge" ||
                mName == "ispostviewemojienabled" ||
                mName == "canusecustomappicons"
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
                    logger.info("[Snapchat Plus] Unlocked Snap+ feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Snapchat Plus] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Snapchat Unlock Plus] Total hooks applied: $hookedPoints")
}
