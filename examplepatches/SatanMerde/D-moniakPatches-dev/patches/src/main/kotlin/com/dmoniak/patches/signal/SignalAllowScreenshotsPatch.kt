package com.dmoniak.patches.signal

import com.dmoniak.patches.shared.replaceMethod
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIGNAL
import java.util.logging.Logger

@Suppress("unused")
val signalAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Security Bypass - Signal (Experimental)",
    description = "⚠️ [Experimental / Untested] Bypasses Android FLAG_SECURE window restrictions in Signal, allowing users to take screenshots and record screens even when Screen Security is enforced.",
) {
    compatibleWith(COMPATIBILITY_SIGNAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSignalAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeSignalAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Signal...")
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

            // Neutralize Screen Security & FLAG_SECURE
            if (!isStatic && (
                mName == "setflagsecure" ||
                mName == "enforcescreensecurity" ||
                mName == "disablescreenshots" ||
                mName == "protectwindowfromcapture"
            ) && retType == "V") {
                try {
                    mutableClass.replaceMethod(

                        method,

                        smaliCode = """
                        return-void
                        """.trimIndent()

                    )
                    hookedPoints++
                    logger.info("[Signal Screenshots] Neutralized FLAG_SECURE in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Return false for isScreenSecurityEnabled to prevent system-wide window blacking
            if (!isStatic && (
                mName == "isscreensecurityenabled" ||
                mName == "isincognitokeyboardrequired" ||
                mName == "isflagsecureactive"
            ) && retType == "Z") {
                try {
                    mutableClass.replaceMethod(

                        method,

                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()

                    )
                    hookedPoints++
                    logger.info("[Signal Screenshots] Forced screen security false in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Signal Screenshots] Total hooks applied: $hookedPoints")
}
