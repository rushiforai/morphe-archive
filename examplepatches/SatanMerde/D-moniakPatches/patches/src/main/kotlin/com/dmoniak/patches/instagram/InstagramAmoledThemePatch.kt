package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Black Theme - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure pitch-black (#000000) for OLED displays across main feed, reels, direct messages, stories bar, and profile in Instagram.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramAmoledLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Black Theme patch for Instagram...")
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

            // Hook background color resolvers returning ARGB int
            if (!isStatic && (
                mName == "getdarkthemecolor" ||
                mName == "getsurfacecolor" ||
                mName == "getfeedbackgroundcolor" ||
                mName == "getdirectbackgroundcolor" ||
                mName == "getreelsbackgroundcolor"
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
                    logger.info("[Instagram AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram AMOLED] Finished: $hookedPoints AMOLED color hooks injected.")
}
