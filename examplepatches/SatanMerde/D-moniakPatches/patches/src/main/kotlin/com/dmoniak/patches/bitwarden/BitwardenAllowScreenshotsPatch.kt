package com.dmoniak.patches.bitwarden

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BITWARDEN
import java.util.logging.Logger

@Suppress("unused")
val bitwardenAllowScreenshotsPatch = bytecodePatch(
    name = "Allow Screenshots & Screen Capture - Bitwarden (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Disables FLAG_SECURE window restrictions to permit taking screenshots and screen recordings in Bitwarden.",
) {
    compatibleWith(COMPATIBILITY_BITWARDEN)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBitwardenAllowScreenshotsLogic(logger)
    }
}

fun BytecodePatchContext.executeBitwardenAllowScreenshotsLogic(logger: Logger) {
    logger.info("Executing Allow Screenshots patch for Bitwarden...")
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

            // Hook methods checking whether screen capture should be blocked
            if (!isStatic && (
                mName == "isscreencaptureblocked" ||
                mName == "isflagsecureset" ||
                mName == "shouldblockscreenrecording" ||
                mName == "issecurewindowenabled"
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
                    logger.info("[Bitwarden Screenshots] Neutralized screen capture block in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Bitwarden Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook methods that apply FLAG_SECURE to Window
            if (!isStatic && (
                mName == "applyflagsecure" ||
                mName == "enableflagsecure" ||
                mName == "blockscreenshots"
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
                    logger.info("[Bitwarden Screenshots] Neutralized flag secure setter in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Bitwarden Screenshots] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Bitwarden Screenshots] Total screenshot hooks applied: $hookedPoints")
}
