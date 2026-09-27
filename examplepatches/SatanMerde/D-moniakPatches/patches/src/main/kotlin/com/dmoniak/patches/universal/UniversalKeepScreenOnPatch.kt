package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalKeepScreenOnPatch = bytecodePatch(
    name = "Universal Keep Screen On (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents the device display from automatically turning off or dimming while the patched app is open in the foreground (ideal for reading, recipes, and monitoring).",
) {
    // Universal patch: No compatibleWith() call. Applies to any app.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalKeepScreenOnLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalKeepScreenOnLogic(logger: Logger) {
    logger.info("Executing Universal Keep Screen On patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Target main activity / view classes
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force keep-screen-on getters to true
            if (!isStatic && (
                mName == "getkeepscreenon" ||
                mName == "iskeepscreenon" ||
                mName == "shouldkeepscreenawake" ||
                mName == "iswakelockpreferred"
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
                    logger.info("[Universal KeepScreen] Enabled keep-screen-on in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal KeepScreen] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable screen timeout / sleep triggers
            if (!isStatic && (
                mName == "cannaturalsleep" ||
                mName == "shouldallowscreentimeout"
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
                    logger.info("[Universal KeepScreen] Blocked screen timeout in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal KeepScreen] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal KeepScreen] Total keep-screen-on hooks applied: $hookedPoints")
}
