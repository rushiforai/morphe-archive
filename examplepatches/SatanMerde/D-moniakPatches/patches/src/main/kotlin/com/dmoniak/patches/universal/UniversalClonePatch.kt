package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalClonePatch = bytecodePatch(
    name = "Universal App Clone (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables side-by-side dual installation for any app, allowing the official unmodified app and the patched version to run simultaneously on the same device without signature or provider collisions.",
) {
    // Universal patch: No compatibleWith() call. This makes it applicable to any app selected in Morphe Manager.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalCloneLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalCloneLogic(logger: Logger) {
    logger.info("Executing Universal App Clone patch...")
    var clonedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        // Skip AndroidX / Support libraries
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. ContentProvider Authority isolation (prevents INSTALL_FAILED_CONFLICTING_PROVIDER)
            if (!isStatic && (
                mName.contains("getauthority") ||
                mName.contains("providerauthority") ||
                mName.contains("contentauthority")
            ) && retType == "Ljava/lang/String;" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const-string v0, ".clone"
                        """.trimIndent()
                    )
                    clonedPoints++
                    logger.info("[Universal Clone] Isolated provider authority: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Clone] Failed to isolate authority in ${method.name}: ${e.message}")
                }
            }

            // 2. Dual-install / package alteration detection bypass
            if (!isStatic && (
                mName == "isclonedapp" ||
                mName == "isdualappdetected" ||
                mName == "ismodifiedpackagename" ||
                mName == "checkpackagename"
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
                    clonedPoints++
                    logger.info("[Universal Clone] Disabled clone detection: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal Clone] Failed to hook clone check in ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal Clone] Total clone isolation hooks applied: $clonedPoints")
}
