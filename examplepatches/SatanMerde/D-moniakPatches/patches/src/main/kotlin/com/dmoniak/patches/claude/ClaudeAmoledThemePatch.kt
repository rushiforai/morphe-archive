package com.dmoniak.patches.claude

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CLAUDE
import java.util.logging.Logger

@Suppress("unused")
val claudeAmoledThemePatch = bytecodePatch(
    name = "AMOLED Dark Theme - Claude AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces deep AMOLED pure black theme for Claude AI, optimizing contrast and reducing battery consumption on OLED displays.",
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeClaudeAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeClaudeAmoledThemeLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme patch for Claude AI...")
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

            // Force dark / AMOLED theme detection
            if (!isStatic && (
                mName == "isdarktheme" ||
                mName == "isdarkmodeenabled" ||
                mName == "shouldusedarktheme" ||
                mName == "isnightmode"
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
                    logger.info("[Claude Theme] Forced dark theme in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Claude Theme] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Claude Theme] Total theme hooks applied: $hookedPoints")
}
