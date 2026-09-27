package com.dmoniak.patches.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_WAZE
import java.util.logging.Logger

@Suppress("unused")
val wazePreciseCameraAlertsPatch = bytecodePatch(
    name = "Exact Radar & Speed Camera Alerts - Waze (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Restores exact speed camera and radar distance notifications in Waze, replacing vague hazard zone circles with pinpoint accuracy alerts.",
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeWazePreciseCameraAlertsLogic(logger)
    }
}

fun BytecodePatchContext.executeWazePreciseCameraAlertsLogic(logger: Logger) {
    logger.info("Executing Exact Radar & Speed Camera Alerts patch for Waze...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google/android/gms")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Force exact radar warning flags
            if (!isStatic && (
                mName == "isexactspeedcamalertallowed" ||
                mName == "ispreciseradarallowed" ||
                mName == "isexactcameraenabled" ||
                mName == "shouldshowexactcameradistance"
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
                    logger.info("[Waze Radar] Enforced exact radar alert: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Waze Radar] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable vague hazard zone blur / obfuscation
            if (!isStatic && (
                mName == "ishazardzoneobfuscated" ||
                mName == "shouldobfuscatecameradistance" ||
                mName == "isdangerzoneblurred"
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
                    logger.info("[Waze Radar] Disabled camera obfuscation: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Waze Radar] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Waze Radar] Total precise camera hooks applied: $hookedPoints")
}
