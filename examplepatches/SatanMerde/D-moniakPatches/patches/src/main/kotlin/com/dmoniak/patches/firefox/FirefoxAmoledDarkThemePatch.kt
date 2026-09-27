package com.dmoniak.patches.firefox

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FIREFOX
import java.util.logging.Logger

@Suppress("unused")
val firefoxAmoledDarkThemePatch = bytecodePatch(
    name = "Pure AMOLED Dark Theme - Firefox (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces a true pitch-black (#000000) AMOLED dark theme across the browser UI, new tab homepage, toolbar, and reader mode.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFirefoxAmoledDarkThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeFirefoxAmoledDarkThemeLogic(logger: Logger) {
    logger.info("Executing Pure AMOLED Dark Theme patch for Firefox...")
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

            // Force dark theme and AMOLED black background
            if (!isStatic && (
                mName == "isdarkmodeforced" ||
                mName == "isamoledthemeenabled" ||
                mName == "shouldusedarktheme" ||
                mName == "isnightmodemandatory"
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
                    logger.info("[Firefox AMOLED] Forced dark mode in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook color getter to return #FF000000 (Pure Black)
            if (!isStatic && (
                mName == "getbackgroundcolor" ||
                mName == "getreadermodebackground" ||
                mName == "gethomebackgroundcolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Firefox AMOLED] Overrode background color in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Firefox AMOLED] Failed to hook background color: ${e.message}")
                }
            }
        }
    }

    logger.info("Pure AMOLED Dark Theme for Firefox executed: $hookedPoints points hooked.")
}
