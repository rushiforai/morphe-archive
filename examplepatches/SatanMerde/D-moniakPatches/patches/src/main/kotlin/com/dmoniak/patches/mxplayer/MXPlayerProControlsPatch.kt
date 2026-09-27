package com.dmoniak.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MX_PLAYER
import java.util.logging.Logger

@Suppress("unused")
val mxPlayerProControlsPatch = bytecodePatch(
    name = "Unlock Pro Player Controls - MX Player (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks background video playback with screen off, Picture-in-Picture (PIP) mode, and 200% volume audio boost.",
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMXPlayerProControlsLogic(logger)
    }
}

fun BytecodePatchContext.executeMXPlayerProControlsLogic(logger: Logger) {
    logger.info("Executing Unlock Pro Player Controls patch for MX Player...")
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

            // 1. Pro features & background play flags
            if (!isStatic && (
                mName == "isbackgroundplaysupported" ||
                mName == "ispipenabled" ||
                mName == "isaudioboostenabled" ||
                mName == "hasprolicense" ||
                mName == "canplayinbackground" ||
                mName == "isproversion"
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
                    logger.info("[MX Player Pro] Enabled Pro player feature: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MX Player Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[MX Player Pro] Total Pro player hooks applied: $hookedPoints")
}
