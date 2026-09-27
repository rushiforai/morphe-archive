package com.dmoniak.patches.googlephotos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHOTOS
import java.util.logging.Logger

@Suppress("unused")
val googlePhotosUnlockFeaturesPatch = bytecodePatch(
    name = "Unlock Editing Tools - Google Photos (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Enables Pixel-exclusive photo editing features, Magic Eraser UI toggles, and Portrait Blur enhancement tools in Google Photos.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHOTOS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhotosUnlockFeaturesLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhotosUnlockFeaturesLogic(logger: Logger) {
    logger.info("Executing Unlock Editing Tools patch for Google Photos...")
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

            // Hook editing tools feature availability flags (Magic Eraser, Portrait Light, Sky Palette, etc.)
            if (!isStatic && (
                mName == "ismagiceraseravailable" ||
                mName == "isportraitblurenabled" ||
                mName == "isadvancededitorallowed" ||
                mName == "hasgoogleonebenefits" ||
                mName == "canuseexclusivefeatures"
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
                    logger.info("[Google Photos] Unlocked editing feature in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Photos] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Photos] Total editing feature hooks applied: $hookedPoints")
}
