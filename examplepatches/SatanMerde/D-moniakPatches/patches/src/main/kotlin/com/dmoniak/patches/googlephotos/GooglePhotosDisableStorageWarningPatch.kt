package com.dmoniak.patches.googlephotos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHOTOS
import java.util.logging.Logger

@Suppress("unused")
val googlePhotosDisableStorageWarningPatch = bytecodePatch(
    name = "Disable Storage Warnings - Google Photos (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Suppresses intrusive cloud storage full popups, Google One subscription reminders, and backup disabled warnings in Google Photos.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHOTOS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhotosDisableStorageWarningLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhotosDisableStorageWarningLogic(logger: Logger) {
    logger.info("Executing Disable Storage Warnings patch for Google Photos...")
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

            // Hook storage warning and Google One upsell displays
            if (!isStatic && (
                mName == "isstoragealmostfullwarningenabled" ||
                mName == "shouldshowstoragealmostfulldialog" ||
                mName == "shouldshowgoogleoneupgradebanner" ||
                mName == "isstoragequotanoticevisible" ||
                mName == "shouldpromotestorageupgrade"
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
                    logger.info("[Google Photos Storage Nag] Suppressed storage warning in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Photos Storage Nag] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Photos Storage Nag] Total storage warning suppression hooks applied: $hookedPoints")
}
