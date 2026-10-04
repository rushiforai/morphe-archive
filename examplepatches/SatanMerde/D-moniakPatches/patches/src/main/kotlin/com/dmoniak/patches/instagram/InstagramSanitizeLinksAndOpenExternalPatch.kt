package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramSanitizeLinksAndOpenExternalPatch = bytecodePatch(
    name = "Sanitize Share Links & Open in External Browser - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips telemetry tracking parameters (?igsh=..., ?utm_...) from copied and shared Instagram URLs, and opens external web links directly in the system default browser instead of the in-app browser.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramSanitizeLinksLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramSanitizeLinksLogic(logger: Logger) {
    logger.info("Executing Sanitize Share Links patch for Instagram...")
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

            if (!isStatic && (
                mName == "shouldopeninappbrowser" ||
                mName == "isinappbrowsermandatory" ||
                mName == "shouldappendsharetrackingtoken"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Instagram Links] Sanitized link behavior in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Links] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Links] Finished: $hookedPoints link sanitization hooks injected.")
}
