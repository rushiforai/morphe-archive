package com.dmoniak.patches.twitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TWITCH
import java.util.logging.Logger

@Suppress("unused")
val twitchAdBlockPatch = bytecodePatch(
    name = "Block Video Stream Ads - Twitch (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Blocks embedded pre-roll and mid-roll video advertisements on live channels and VODs without stream buffer freezes.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTwitchAdBlockLogic(logger)
    }
}

fun BytecodePatchContext.executeTwitchAdBlockLogic(logger: Logger) {
    logger.info("Executing Block Video Stream Ads patch for Twitch...")
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

            // Neutralize stream ad insertion
            if (!isStatic && (
                mName == "isadplaying" ||
                mName == "shouldshowstreamad" ||
                mName == "hasprerollad" ||
                mName == "hasmidrollad" ||
                mName == "isadinsertionallowed"
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
                    logger.info("[Twitch Ads] Disabled stream ad trigger in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Ads] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress ad break UI overlay
            if (!isStatic && (
                mName == "showadbreakoverlay" ||
                mName == "startadcountdown" ||
                mName == "rendercommercialbreakbanner"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Twitch Ads] Neutralized ad break overlay in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Ads] Failed to hook ad overlay: ${e.message}")
                }
            }
        }
    }

    logger.info("Block Video Stream Ads for Twitch executed: $hookedPoints points hooked.")
}
