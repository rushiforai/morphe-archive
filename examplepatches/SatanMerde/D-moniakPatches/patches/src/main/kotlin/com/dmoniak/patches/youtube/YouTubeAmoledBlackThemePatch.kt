package com.dmoniak.patches.youtube

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import java.util.logging.Logger

@Suppress("unused")
val youtubeAmoledBlackThemePatch = bytecodePatch(
    name = "Pure AMOLED Black Theme - YouTube (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure pitch-black (#000000) into YouTube player controls, navigation bars, comments bottom sheets, and panels for AMOLED battery saving.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeYouTubeAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeYouTubeAmoledLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Black Theme patch for YouTube...")
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

            // Hook dark background color resolvers returning ARGB int
            if (!isStatic && (
                mName == "getdarkbackgroundcolor" ||
                mName == "getsurfacecolor" ||
                mName == "getplayersurfacecolor" ||
                mName == "getbottomsheetbackgroundcolor" ||
                mName == "getthemedcolorbackground"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent() // 0xFF000000 Pure Black
                    )
                    hookedPoints++
                    logger.info("[YouTube AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[YouTube AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[YouTube AMOLED] Finished: $hookedPoints AMOLED color hooks injected.")
}
