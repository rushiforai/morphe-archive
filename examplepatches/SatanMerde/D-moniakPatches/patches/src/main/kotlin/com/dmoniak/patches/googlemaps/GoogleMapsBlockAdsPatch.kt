package com.dmoniak.patches.googlemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import java.util.logging.Logger

@Suppress("unused")
val googleMapsBlockAdsPatch = bytecodePatch(
    name = "Block Sponsored Pins & Ads - Google Maps (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes sponsored venue pins, promoted business recommendations, and commercial suggestion cards in Google Maps search and navigation.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleMapsBlockAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleMapsBlockAdsLogic(logger: Logger) {
    logger.info("Executing Block Sponsored Pins & Ads patch for Google Maps...")
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

            // Hook sponsored pin visibility and ad suggestions
            if (!isStatic && (
                mName == "issponsoredpin" ||
                mName == "ispromotedlocation" ||
                mName == "isadcardvisible" ||
                mName == "shouldshowpromotedpins" ||
                mName == "haspromotionalcontent"
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
                    logger.info("[Google Maps] Disabled sponsored item in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Google Maps] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Google Maps] Total sponsored ad hooks applied: $hookedPoints")
}
