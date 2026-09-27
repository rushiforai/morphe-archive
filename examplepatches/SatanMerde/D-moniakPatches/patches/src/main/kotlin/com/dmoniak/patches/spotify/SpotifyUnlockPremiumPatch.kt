package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import java.util.logging.Logger

@Suppress("unused")
val spotifyUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Spotify Premium & Playback Restrictions - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Débloque les fonctionnalités Premium sur Spotify : zapping illimité (skips), lecture à la demande sans mode aléatoire forcé (no shuffle), recherche libre sur la barre de lecture (scrubbing/seeking), répétition de pistes et suppression des publicités audio/visuelles.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Spotify Premium & Playback Restrictions patch for Spotify...")
    var hookedPoints = 0

    // 1. Hook Google Play BillingClient for in-app Premium subscriptions
    hookedPoints += executeGooglePlayBillingBypass(logger, "Spotify")

    // 2. Hook player capabilities and playback restrictions
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // A. Unlock Playback Freedom (on demand, unlimited skips, seek, repeat) -> return true
            if (!isStatic && retType == "Z" && (
                mName == "canplayondemand" ||
                mName == "canseek" ||
                mName == "canskipprevious" ||
                mName == "canskipnext" ||
                mName == "canrepeat" ||
                mName == "canrepeatcontext" ||
                mName == "canrepeattrack" ||
                mName == "hasunlimitedskips" ||
                mName == "isextremequalityavailable" ||
                mName == "canstreamextremequality" ||
                mName == "isveryhighbitrateallowed" ||
                mName == "ispremium" ||
                mName == "haspremiumtier"
            )) {
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
                    logger.info("[Spotify Premium] Unlocked player capability: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Spotify Premium] Failed ${method.name}: ${e.message}")
                }
            }

            // B. Disable Restrictions (forced shuffle, skip limit, ads) -> return false
            if (!isStatic && retType == "Z" && (
                mName == "isshuffleonly" ||
                mName == "isshufflerestricted" ||
                mName == "isseekingrestricted" ||
                mName == "isskiprestricted" ||
                mName == "isaudioadsenabled" ||
                mName == "isvideoadsenabled" ||
                mName == "isadplaying" ||
                mName == "shouldshowadinterstitial" ||
                mName == "isupsellnagneeded"
            )) {
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
                    logger.info("[Spotify Premium] Disabled restriction: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Spotify Premium] Failed ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("Unlock Spotify Premium & Playback Restrictions executed: $hookedPoints points hooked.")
}
