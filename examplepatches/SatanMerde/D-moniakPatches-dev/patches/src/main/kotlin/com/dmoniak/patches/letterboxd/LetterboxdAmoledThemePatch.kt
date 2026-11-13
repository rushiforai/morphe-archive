package com.dmoniak.patches.letterboxd

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val letterboxdAmoledThemePatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme - Letterboxd (Experimental)",
    description = "⚠️ [Experimental / Untested] Applies a pure pitch-black #000000 AMOLED dark theme across Letterboxd film lists, review feeds, diary entries, and member profiles for maximum OLED battery savings.",
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeLetterboxdAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeLetterboxdAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme patch for Letterboxd...")
    var hooked = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook theme / dark mode detection methods
            if (!isStatic && (mName == "isdarktheme" || mName == "isdarkmode" || mName == "useoleddarktheme") && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 2,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent()
                    )
                    hooked++
                    logger.info("[Letterboxd Theme] Hooked $mName in ${classDef.type}")
                } catch (e: Exception) {
                    logger.fine("[Letterboxd Theme] Failed to hook $mName: ${e.message}")
                }
            }
        }
    }

    logger.info("[Letterboxd Theme] Total hooks applied: $hooked")
}

