package com.dmoniak.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

@Suppress("unused")
val redditSanitizeLinksAndOpenExternalPatch = bytecodePatch(
    name = "Sanitize Links & Open Externally - Reddit (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Strips telemetry tracking params (utm_source, out.reddit.com redirects) and opens external links directly in the user's default browser.",
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeRedditSanitizeLinksLogic(logger)
    }
}

fun BytecodePatchContext.executeRedditSanitizeLinksLogic(logger: Logger) {
    logger.info("Executing Sanitize Links & Open Externally patch for Reddit...")
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

            // Hook external browser preference
            if (!isStatic && (
                mName == "shouldopenlinkinexternalbrowser" ||
                mName == "isexternalbrowserpreferred" ||
                mName == "canbypasstrackingredirect" ||
                mName == "shouldstriptelemetryfromurl"
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
                    logger.info("[Reddit Links] Forced external browser preference in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Reddit Links] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Reddit Links] Finished: $hookedPoints link sanitizer hooks injected.")
}
