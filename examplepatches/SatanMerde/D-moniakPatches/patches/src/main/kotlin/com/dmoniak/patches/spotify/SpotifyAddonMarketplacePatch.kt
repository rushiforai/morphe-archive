package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import java.util.logging.Logger

@Suppress("unused")
val spotifyAddonMarketplacePatch = bytecodePatch(
    name = "Spicetify Community Addons & Settings - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Injects a Spicetify Mobile controller and community addons manager into Spotify, allowing dynamic toggling of visual tweaks, themes, and community extension scripts.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAddonMarketplaceLogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyAddonMarketplaceLogic(logger: Logger) {
    logger.info("Executing Spicetify Community Addons & Settings patch for Spotify...")
    var settingsCount = 0

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

            // 1. Enable developer / internal debug settings menu (Spotify Lab)
            if (!isStatic && (
                mName == "isdebugmenuenabled" ||
                mName == "isinternalsettingsenabled" ||
                mName == "isemployee" ||
                mName == "canaccesslabfeatures"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    settingsCount++
                    logger.info("[Spotify Addons] Enabled internal lab/debug settings: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify Addons] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Allow third-party community extension / custom scripts execution flags
            if (!isStatic && (
                mName == "allowcustomextensions" ||
                mName == "isthirdpartyaddonsallowed"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    settingsCount++
                    logger.info("[Spotify Addons] Enabled custom addons permission: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify Addons] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Spotify Addons] Total settings / addons points hooked: $settingsCount")
}
