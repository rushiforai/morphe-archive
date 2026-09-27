package com.dmoniak.patches.simplex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIMPLEX
import java.util.logging.Logger

@Suppress("unused")
val simpleXAmoledThemePatch = bytecodePatch(
    name = "AMOLED Dark Theme - SimpleX (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Replaces dark grey backgrounds with pure OLED pitch black (#000000) across SimpleX Chat conversation screens and network status monitors.",
) {
    compatibleWith(COMPATIBILITY_SIMPLEX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSimpleXAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeSimpleXAmoledThemeLogic(logger: Logger) {
    logger.info("Executing AMOLED Dark Theme patch for SimpleX Chat...")
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

            // Hook dark theme surface color getters -> pure OLED pitch black (#000000)
            if (!isStatic && (
                mName == "getchatbackgroundcolor" ||
                mName == "getsimplexsurfacecolor" ||
                mName == "getdarkthemerootbackground"
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
                    logger.info("[SimpleX AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SimpleX AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SimpleX AMOLED] Total hooks applied: $hookedPoints")
}
