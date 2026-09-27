package com.dmoniak.patches.googlephotos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_PHOTOS
import java.util.logging.Logger

@Suppress("unused")
val googlePhotosDeclutterAmoledPatch = bytecodePatch(
    name = "AMOLED Black & Declutter - Google Photos (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects pure OLED pitch black (#000000) into gallery view and hides Google One subscription paywalls and cloud storage upgrade prompts.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_PHOTOS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGooglePhotosDeclutterAmoledLogic(logger)
    }
}

fun BytecodePatchContext.executeGooglePhotosDeclutterAmoledLogic(logger: Logger) {
    logger.info("Executing AMOLED Black & Declutter patch for Google Photos...")
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

            // 1. Hide Google One storage upgrade banners and promo cards
            if (!isStatic && (
                mName == "isstoragebannervisible" ||
                mName == "shouldshowgoogleoneupsell" ||
                mName == "iscloudstoragealertvisible" ||
                mName == "haspromotionalcard"
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
                    logger.info("[Google Photos] Hidden banner in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Photos] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Pure OLED black background for gallery and viewer
            if (!isStatic && (
                mName == "getbackgroundcolor" ||
                mName == "getphotoviewerbackground" ||
                mName == "getdarkthemecolor"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Google Photos] Injected OLED black in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Photos] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Photos] Total AMOLED & Declutter hooks applied: $hookedPoints")
}
