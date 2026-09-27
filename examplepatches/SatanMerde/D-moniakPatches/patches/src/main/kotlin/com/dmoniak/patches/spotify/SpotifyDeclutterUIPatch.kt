package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import java.util.logging.Logger

@Suppress("unused")
val spotifyDeclutterUIPatch = bytecodePatch(
    name = "Spicetify Declutter UI - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes intrusive Premium upgrade banners, bottom navigation upsell tabs, and promotional carousels for a clean, distraction-free music experience.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyDeclutterUILogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyDeclutterUILogic(logger: Logger) {
    logger.info("Executing Spicetify Declutter UI patch for Spotify...")
    var declutterCount = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Check whether to display upgrade banners / promotion prompts -> always false
            if (!isStatic && (
                mName == "shouldshowupsell" ||
                mName == "shouldshowpremiumtab" ||
                mName == "haspremiumbanner" ||
                mName == "isupsellbannerenabled" ||
                mName == "shouldpromotepremium" ||
                mName == "isupgradebuttonvisible"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    declutterCount++
                    logger.info("[Spotify Declutter] Disabled upsell check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hide audiobooks / promotional podcast carousels from home if gated by flags
            if (!isStatic && (
                mName == "iscarriagepromoenabled" ||
                mName == "shouldshowaudiobookpromos" ||
                mName == "isadcarouselvisible"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    declutterCount++
                    logger.info("[Spotify Declutter] Disabled promo carousel: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify Declutter] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Spotify Declutter] Total declutter points hooked: $declutterCount")
}
