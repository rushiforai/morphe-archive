package com.dmoniak.patches.simplex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIMPLEX
import java.util.logging.Logger

@Suppress("unused")
val simpleXAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Security Bypass - SimpleX (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Neutralizes FLAG_SECURE window flags in SimpleX Chat, allowing screenshots and screen sharing without black screens.",
) {
    compatibleWith(COMPATIBILITY_SIMPLEX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSimpleXAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeSimpleXAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for SimpleX Chat...")
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

            // Neutralize FLAG_SECURE window protection in SimpleX
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcescreensecurity" ||
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
                    logger.info("[SimpleX Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SimpleX Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Return false for isScreenSecurityActive
            if (!isStatic && (
                mName == "isscreensecurityactive" ||
                mName == "isscreensecurityenabled"
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
                    logger.info("[SimpleX Screenshots] Forced screen security false in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[SimpleX Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[SimpleX Screenshots] Total hooks applied: $hookedPoints")
}
