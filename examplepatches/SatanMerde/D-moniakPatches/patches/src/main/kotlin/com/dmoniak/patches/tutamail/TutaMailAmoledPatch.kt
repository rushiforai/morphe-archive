package com.dmoniak.patches.tutamail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TUTA_MAIL
import java.util.logging.Logger

@Suppress("unused")
val tutaMailAmoledPatch = bytecodePatch(
    name = "AMOLED Black Theme - Tuta Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into Tuta Mail's inbox, message reading view, calendar, and contacts for maximum battery savings on AMOLED displays.",
) {
    compatibleWith(COMPATIBILITY_TUTA_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTutaMailAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeTutaMailAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Black Theme patch for Tuta Mail...")
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

            // Hook dark theme background color getters returning 0xFF000000
            if (!isStatic && (
                mName == "getbackgroundcolor" ||
                mName == "getsurfacecolor" ||
                mName == "getinboxcolor" ||
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
                    logger.info("[Tuta AMOLED] Injected pure black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Tuta AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Tuta AMOLED] Total AMOLED hooks applied: $hookedPoints")
}
