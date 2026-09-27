package com.dmoniak.patches.tutamail

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TUTA_MAIL
import java.util.logging.Logger

@Suppress("unused")
val tutaMailAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Mirroring - Tuta Mail (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes Android FLAG_SECURE window restrictions in Tuta Mail, allowing users to take screenshots, capture invoice receipts, and mirror screens without black screens.",
) {
    compatibleWith(COMPATIBILITY_TUTA_MAIL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTutaMailAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeTutaMailAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Tuta Mail...")
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

            // Neutralize FLAG_SECURE window protection
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcesecurescreen" ||
                mName == "disablescreenshots" ||
                mName == "protectwindowfromcapture"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Tuta Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Tuta Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Tuta Screenshots] Total allow screenshot hooks applied: $hookedPoints")
}
