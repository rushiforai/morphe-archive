package com.dmoniak.patches.googlemaps

import com.dmoniak.patches.shared.replaceMethod
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_GOOGLE_MAPS
import java.util.logging.Logger

@Suppress("unused")
val googleMapsBlockSponsoredPinsAndAdsPatch = bytecodePatch(
    name = "Block Sponsored Pins & Search Ads - Google Maps (Experimental)",
    description = "⚠️ [Experimental / Untested] Removes sponsored pins (promoted logos and commercial icons on the map), search suggestion ads, promoted place suggestions, and explore feed ads.",
) {
    compatibleWith(COMPATIBILITY_GOOGLE_MAPS)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeGoogleMapsBlockSponsoredPinsAndAdsLogic(logger)
    }
}

fun BytecodePatchContext.executeGoogleMapsBlockSponsoredPinsAndAdsLogic(logger: Logger) {
    logger.info("Executing Block Sponsored Pins & Search Ads patch for Google Maps...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Hook sponsored pin & promoted pin getters
            if (!isStatic && (
                mName == "ispromoted" ||
                mName == "issponsored" ||
                mName == "ispromotedpin" ||
                mName == "issponsoredpin" ||
                mName == "issponsoredplace" ||
                mName == "haspromotedpin" ||
                mName == "shouldshowsponsoredpin" ||
                mName == "ispromotedsearch" ||
                mName == "issearchad" ||
                mName == "issponsoredresult" ||
                mName == "isadresult" ||
                mName == "issponsoredrecommendation" ||
                mName == "isadcard"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    mutableClass.replaceMethod(

                        method,

                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()

                    )
                    hookedPoints++
                    logger.fine("[Google Maps AdBlock] Suppressed sponsored getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Maps AdBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Neutralize ad click logging / ad tracking telemetry dispatchers
            if (!isStatic && (
                mName == "logadimpression" ||
                mName == "logadclick" ||
                mName == "reportsponsoredpinimpression" ||
                mName == "tracksponsoredclick"
            ) && retType == "V") {
                try {
                    mutableClass.replaceMethod(

                        method,

                        smaliCode = """
                        return-void
                        """.trimIndent()

                    )
                    hookedPoints++
                    logger.fine("[Google Maps AdBlock] Neutralized ad tracking: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Google Maps AdBlock] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Google Maps AdBlock] Total sponsored pin & ad hooks applied: $hookedPoints")
}
