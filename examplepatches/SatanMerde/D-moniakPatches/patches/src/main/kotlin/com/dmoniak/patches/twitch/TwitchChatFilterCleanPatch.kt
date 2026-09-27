package com.dmoniak.patches.twitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TWITCH
import java.util.logging.Logger

@Suppress("unused")
val twitchChatFilterCleanPatch = bytecodePatch(
    name = "Chat Filter & Declutter Overlays - Twitch (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Filters chat spam, suppresses Hype Train popups, hides bits cheering banners, and declutters live stream overlays.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTwitchChatFilterCleanLogic(logger)
    }
}

fun BytecodePatchContext.executeTwitchChatFilterCleanLogic(logger: Logger) {
    logger.info("Executing Chat Filter & Declutter Overlays patch for Twitch...")
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

            // Disable Hype Train, Bits prompts & leaderboards
            if (!isStatic && (
                mName == "ishypetrainenabled" ||
                mName == "shouldshowhypetrain" ||
                mName == "isbitscheeringvisible" ||
                mName == "isleaderboardpinned" ||
                mName == "shouldrendercommunitygoals"
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
                    logger.info("[Twitch Chat] Suppressed overlay element in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Chat] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress hype train animations
            if (!isStatic && (
                mName == "showhypetrainbanner" ||
                mName == "renderbitscheerpopup" ||
                mName == "displaypinnedmessage"
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
                    logger.info("[Twitch Chat] Neutralized popup animation in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Twitch Chat] Failed to hook overlay animation: ${e.message}")
                }
            }
        }
    }

    logger.info("Chat Filter & Declutter Overlays for Twitch executed: $hookedPoints points hooked.")
}
