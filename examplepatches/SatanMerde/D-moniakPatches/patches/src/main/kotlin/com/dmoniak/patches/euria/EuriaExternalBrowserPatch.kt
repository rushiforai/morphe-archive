package com.dmoniak.patches.euria

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_EURIA
import java.util.logging.Logger

@Suppress("unused")
val euriaExternalBrowserPatch = bytecodePatch(
    name = "Open Links in External Browser - Euria AI (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Opens reference citations and external links directly in the system's default browser rather than an embedded webview.",
) {
    compatibleWith(COMPATIBILITY_EURIA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeEuriaExternalBrowserLogic(logger)
    }
}

fun BytecodePatchContext.executeEuriaExternalBrowserLogic(logger: Logger) {
    logger.info("Executing Open Links in External Browser patch for Euria AI...")
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
                mName == "shouldopeninexternalbrowser" ||
                mName == "useexternalbrowser" ||
                mName == "isexternalbrowsermode"
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
                    logger.info("[Euria Browser] Forced external browser mode in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Euria Browser] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Euria Browser] Total browser routing hooks applied: $hookedPoints")
}
