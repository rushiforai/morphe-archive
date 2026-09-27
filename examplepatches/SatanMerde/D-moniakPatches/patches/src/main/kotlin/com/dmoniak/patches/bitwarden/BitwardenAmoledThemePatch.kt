package com.dmoniak.patches.bitwarden

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BITWARDEN
import java.util.logging.Logger

@Suppress("unused")
val bitwardenAmoledThemePatch = bytecodePatch(
    name = "AMOLED Pure Black Theme - Bitwarden (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Forces deep AMOLED pure black backgrounds across Bitwarden's vault interface, reducing OLED power draw and eye strain.",
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBitwardenAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeBitwardenAmoledThemeLogic(logger: Logger) {
    logger.info("Executing AMOLED Pure Black Theme patch for Bitwarden...")
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

            // Theme detection checks
            if (!isStatic && (
                mName == "isdarktheme" ||
                mName == "isdarkmode" ||
                mName == "shouldusedarktheme" ||
                mName == "isblacktheme"
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
                    logger.info("[Bitwarden Theme] Forced AMOLED theme in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Bitwarden Theme] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Bitwarden Theme] Total theme hooks applied: $hookedPoints")
}
