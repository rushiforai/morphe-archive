package com.dmoniak.patches.universal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalAmoledPatch = bytecodePatch(
    name = "Universal AMOLED Black Theme (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects true OLED pitch black (#000000) into UI background surfaces, replacing dark grey tones to maximize battery savings and contrast on AMOLED displays for any app.",
) {
    // Universal patch: No compatibleWith() call. Applies to any app.

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalAmoledLogic(logger: Logger) {
    logger.info("Executing Universal AMOLED Black Theme patch...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Skip Android framework internals
        if (tl.startsWith("landroid/view/") || tl.startsWith("landroid/os/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook background and surface color getter methods returning ARGB int
            if ((mName.contains("backgroundcolor") ||
                 mName.contains("surfacecolor") ||
                 mName.contains("darkbackground") ||
                 mName.contains("windowbackgroundcolor")) &&
                retType == "I" && pTypes.isEmpty()
            ) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent() // 0xFF000000 (Pure Black)
                    )
                    hookedPoints++
                    logger.info("[Universal AMOLED] Injected pure black into ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Force dark mode checks across theme managers
            if (!isStatic && (
                mName == "isdarktheme" ||
                mName == "isdarkmode" ||
                mName == "isnightmode" ||
                mName == "isnightmodeactive"
            ) && retType == "Z" && pTypes.isEmpty()) {
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
                    logger.info("[Universal AMOLED] Enforced dark mode in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Universal AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Universal AMOLED] Total AMOLED color/theme hooks applied: $hookedPoints")
}
