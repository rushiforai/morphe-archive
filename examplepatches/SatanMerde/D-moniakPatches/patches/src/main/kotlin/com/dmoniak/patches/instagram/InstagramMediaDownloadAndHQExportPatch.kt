package com.dmoniak.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import java.util.logging.Logger

@Suppress("unused")
val instagramMediaDownloadAndHQExportPatch = bytecodePatch(
    name = "Media Downloader & Uncompressed Media Upload - Instagram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables downloading original high-resolution photos, reels, stories, and voice messages without watermarks, and bypasses image/video compression downscalers on upload.",
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeInstagramMediaDownloadLogic(logger)
    }
}

fun BytecodePatchContext.executeInstagramMediaDownloadLogic(logger: Logger) {
    logger.info("Executing Media Downloader & Uncompressed Media Upload patch for Instagram...")
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

            // 1. Enable media downloading permission getters
            if (!isStatic && (
                mName == "isdownloadallowed" ||
                mName == "cansavemedia" ||
                mName == "cansavestory" ||
                mName == "cansavereelexport" ||
                mName == "isoriginalqualityuploadenabled"
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
                    logger.info("[Instagram Media Download] Unlocked media action in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Media Download] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Disable upload downscaling compression
            if (!isStatic && (
                mName == "shouldcompressuploadmedia" ||
                mName == "shoulddownscalephoto" ||
                mName == "shouldlimituploadbitrate"
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
                    logger.info("[Instagram Media Upload] Disabled media downscaling in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Instagram Media Upload] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Instagram Media Download] Finished: $hookedPoints download/upload hooks injected.")
}
