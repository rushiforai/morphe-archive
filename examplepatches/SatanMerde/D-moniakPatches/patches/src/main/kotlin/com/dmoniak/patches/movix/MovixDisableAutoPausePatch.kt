package com.dmoniak.patches.movix

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOVIX
import java.util.logging.Logger

@Suppress("unused")
val movixDisableAutoPausePatch = bytecodePatch(
    name = "Disable Auto-Pause on Background - Movix",
    description = "Prevents Movix from automatically pausing or stopping video playback when the app transitions to the background, enabling audio-only listening and uninterrupted casting.",
) {
    compatibleWith(COMPATIBILITY_MOVIX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMovixDisableAutoPauseLogic(logger)
    }
}

fun BytecodePatchContext.executeMovixDisableAutoPauseLogic(logger: Logger) {
    logger.info("Executing Disable Auto-Pause on Background patch for Movix...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // Hook RNCWebChromeClient: neutralize onHostPause to keep WebView alive in background
        if (classDef.type.contains("RNCWebChromeClient")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name == "onHostPause" && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            return-void
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Movix AutoPause] Neutralized onHostPause in: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[Movix AutoPause] Failed to hook onHostPause: ${e.message}")
                    }
                }
            }
        }

        // Auxiliary pause checks
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "shouldpauseplaybackonbackground" ||
                mName == "shouldstopplaybackonpause" ||
                mName == "shouldpauseonappfocuslost" ||
                mName == "ispausebackgroundplaybackenabled"
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
                    logger.info("[Movix AutoPause] Disabled auto-pause in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Movix AutoPause] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Movix Disable Auto-Pause] Total hooks applied: $hookedPoints")
}
