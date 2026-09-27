package com.dmoniak.patches.googlephotos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHOTOS
import java.util.logging.Logger

@Suppress("unused")
val googlePhotosUnlimitedBackupPatch = bytecodePatch(
    name = "Pixel Spoof for Unlimited Backup - Google Photos (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Spoofs the device model as an original Google Pixel to activate unlimited original-quality photo and video cloud storage backup in Google Photos.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHOTOS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhotosUnlimitedBackupLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhotosUnlimitedBackupLogic(logger: Logger) {
    logger.info("Executing Pixel Spoof for Unlimited Backup patch for Google Photos...")
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

            // Hook Pixel device recognition and unlimited cloud storage eligibility
            if (!isStatic && (
                mName == "isoriginalpixeldevice" ||
                mName == "hasunlimitedstoragebackup" ||
                mName == "iseligibleforunlimitedstorage" ||
                mName == "haspixelstoragebenefits" ||
                mName == "isoriginalqualitybackupexempt"
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
                    logger.info("[Google Photos Pixel Spoof] Hooked unlimited storage flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Photos Pixel Spoof] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Photos Pixel Spoof] Total unlimited backup hooks applied: $hookedPoints")
}
