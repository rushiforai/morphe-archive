package com.dmoniak.patches.pinterest

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_PINTEREST
import java.util.logging.Logger

@Suppress("unused")
val pinterestMediaDownloaderPatch = bytecodePatch(
    name = "Direct Media Download - Pinterest (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables native high-resolution image and video downloading directly from pins without watermarks or third-party scrapers.",
) {
    compatibleWith(COMPATIBILITY_PINTEREST)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executePinterestMediaDownloaderLogic(logger)
    }
}

fun BytecodePatchContext.executePinterestMediaDownloaderLogic(logger: Logger) {
    logger.info("Executing Direct Media Download patch for Pinterest...")
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

            // 1. Enable media download permission & button visibility
            if (!isStatic && (
                mName == "ismediadownloadallowed" ||
                mName == "issavemediabuttonvisible" ||
                mName == "candownloadpinmedia" ||
                mName == "isvideodownloadenabled" ||
                mName == "candownloadoriginalimage"
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
                    logger.info("[Pinterest Downloader] Enabled media download option: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Pinterest Downloader] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Pinterest Downloader] Total media download hooks applied: $hookedPoints")
}
