package com.dmoniak.patches.euria

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_EURIA
import java.util.logging.Logger

@Suppress("unused")
val euriaAmoledThemePatch = bytecodePatch(
    name = "AMOLED Dark Theme - Euria AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces deep AMOLED pure black background in Euria AI dark mode, enhancing battery efficiency and contrast on OLED screens.",
) {
    compatibleWith(COMPATIBILITY_EURIA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeEuriaAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeEuriaAmoledThemeLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme patch for Euria AI...")
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

            if (!isStatic && (
                mName == "isdarkmode" ||
                mName == "isnightmode" ||
                mName == "shouldusedarktheme" ||
                mName == "isdarkthemeenabled"
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
                    logger.info("[Euria Theme] Forced dark theme in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Euria Theme] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Euria Theme] Total theme hooks applied: $hookedPoints")
}
