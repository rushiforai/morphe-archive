package com.dmoniak.patches.protonmail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PROTON_MAIL
import java.util.logging.Logger

@Suppress("unused")
val protonMailAmoledPatch = bytecodePatch(
    name = "AMOLED Black Theme - Proton Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Proton Mail's inbox, message reading view, and settings for maximum readability and battery efficiency.",
) {
    compatibleWith(COMPATIBILITY_PROTON_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeProtonMailAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeProtonMailAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Black Theme patch for Proton Mail...")
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

            // Hook color getters for dark theme backgrounds returning 0xFF000000
            if (!isStatic && (
                mName == "getbackgroundcolor" ||
                mName == "getsurfacecolor" ||
                mName == "getinboxsurfacecolor" ||
                mName == "getdarkthemecolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Proton Mail AMOLED] Replaced color with pure black: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Proton Mail AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Proton Mail AMOLED] Total AMOLED hooks applied: $hookedPoints")
}
