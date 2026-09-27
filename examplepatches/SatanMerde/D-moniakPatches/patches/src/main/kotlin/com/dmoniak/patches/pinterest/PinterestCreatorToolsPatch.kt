package com.dmoniak.patches.pinterest

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PINTEREST
import java.util.logging.Logger

@Suppress("unused")
val pinterestCreatorToolsPatch = bytecodePatch(
    name = "Unlock Creator & Pro Tools - Pinterest (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Pinterest Creator and Pro business dashboard analytics, advanced pin inspector, and rich pin creation preview tools.",
) {
    compatibleWith(COMPATIBILITY_PINTEREST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePinterestCreatorToolsLogic(logger)
    }
}

fun BytecodePatchContext.executePinterestCreatorToolsLogic(logger: Logger) {
    logger.info("Executing Unlock Creator & Pro Tools patch for Pinterest...")
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

            // 1. Enable Creator & Pro tools flags
            if (!isStatic && (
                mName == "iscreatortoolsenabled" ||
                mName == "hasbusinessaccountfeatures" ||
                mName == "isanalyticstabvisible" ||
                mName == "ispininspectorunlocked" ||
                mName == "canviewreachinsights"
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
                    logger.info("[Pinterest Pro] Enabled creator tool flag: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Pinterest Pro] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Pinterest Pro] Total creator tool hooks applied: $hookedPoints")
}
