package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import java.util.logging.Logger

@Suppress("unused")
val spotifyAmoledThemePatch = bytecodePatch(
    name = "Spicetify AMOLED Black Theme - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Implements an OLED True Black (#000000) theme for Spotify Mobile, replacing dark-grey backgrounds on AMOLED displays for maximum contrast and battery savings across updates.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Spicetify AMOLED Black Theme patch for Spotify...")
    var patchedColorCount = 0

    // Common Spotify dark grey background color representations
    // #121212 = -15592942 (0xFF121212)
    // #181818 = -15200232 (0xFF181818)
    // #282828 = -14145496 (0xFF282828)
    // #242424 = -14408668 (0xFF242424)

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Skip system/support libraries to maintain update-proof resilience
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook background and surface color getter methods
            if ((mName.contains("backgroundcolor") ||
                 mName.contains("surfacecolor") ||
                 mName.contains("darkbackground") ||
                 mName.contains("elevatedcolor")) &&
                retType == "I" && pTypes.isEmpty()
            ) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent() // 0xFF000000 (Pure Black)
                    )
                    patchedColorCount++
                    logger.info("[Spotify AMOLED] Hooked color method: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Hook theme palette dark-mode check (ensuring dark mode is always enforced)
            if (!isStatic && (
                mName == "isdarktheme" ||
                mName == "isdarkmode" ||
                mName == "isnightmodeactive"
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
                    patchedColorCount++
                    logger.info("[Spotify AMOLED] Enforced dark theme: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Spotify AMOLED] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Spotify AMOLED] Total patched color/theme points: $patchedColorCount")
}
