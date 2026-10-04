package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramUnlockDeveloperOptionsPatch = bytecodePatch(
    name = "Unlock Developer Options & Quick Experiments - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks Meta internal Employee Developer Options, Debug Mode, and Quick Experiment (QE) override menus in Instagram by long-pressing the home button or opening settings.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramUnlockDeveloperOptionsLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramUnlockDeveloperOptionsLogic(logger: Logger) {
    logger.info("Executing Unlock Developer Options patch for Instagram...")
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

            // 1. Force employee / internal developer mode
            if (!isStatic && (
                mName == "isemployee" ||
                mName == "isinternalbuild" ||
                mName == "isdevelopermodeenabled" ||
                mName == "shouldshowinternalsettings" ||
                mName == "isquickexperimentoverrideenabled" ||
                mName == "isdebugoptionsenabled"
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
                    logger.info("[Instagram DevOptions] Enabled developer flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram DevOptions] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram DevOptions] Finished: $hookedPoints Developer Option hooks injected.")
}
