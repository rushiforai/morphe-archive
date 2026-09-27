package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalScreenRotationPatch = bytecodePatch(
    name = "Universal Enable Screen Rotation (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks screen orientation restrictions across any app, allowing portrait-only applications and games to freely rotate into landscape mode for tablets, foldables, and car units.",
) {
    // Universal patch: No compatibleWith() call. Applies to any app.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalScreenRotationLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalScreenRotationLogic(logger: Logger) {
    logger.info("Executing Universal Enable Screen Rotation patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook setRequestedOrientation calls or overrides
            // When an Activity or helper calls setRequestedOrientation(int orientation)
            if (!isStatic && mName == "setrequestedorientation" && retType == "V" && pTypes == listOf("I")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    // Overwrite orientation argument with -1 (SCREEN_ORIENTATION_UNSPECIFIED) or 4 (SCREEN_ORIENTATION_SENSOR)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 p1, -0x1
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Universal Rotation] Unlocked orientation in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Rotation] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook orientation lock check getters
            if (!isStatic && (
                mName == "isorientationlocked" ||
                mName == "isportraitalways" ||
                mName == "isrotationdisabled"
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
                    logger.info("[Universal Rotation] Disabled orientation lock: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Rotation] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal Rotation] Total screen rotation hooks applied: $hookedPoints")
}
