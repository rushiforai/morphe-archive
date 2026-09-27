package com.dmoniak.patches.vlc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VLC
import java.util.logging.Logger

@Suppress("unused")
val vlcAmoledUiCleanPatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme & Declutter - VLC (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces a pitch-black AMOLED dark theme, hides tips and audio/video discovery clutter across the VLC player UI.",
) {
    compatibleWith(COMPATIBILITY_VLC)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVlcAmoledUiCleanLogic(logger)
    }
}

fun BytecodePatchContext.executeVlcAmoledUiCleanLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme & Declutter patch for VLC...")
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

            // Force pure AMOLED theme
            if (!isStatic && (
                mName == "isblackthemeenabled" ||
                mName == "isamoledforced" ||
                mName == "shouldusedarktheme"
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
                    logger.info("[VLC AMOLED] Forced black theme in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[VLC AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress discovery hints and tips
            if (!isStatic && (
                mName == "shouldshowtips" ||
                mName == "ishintonboardingactive" ||
                mName == "shouldshowdiscoverybanner"
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
                    logger.info("[VLC UI] Suppressed hints/tips in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[VLC UI] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("Pure AMOLED Dark Theme & Declutter for VLC executed: $hookedPoints points hooked.")
}
