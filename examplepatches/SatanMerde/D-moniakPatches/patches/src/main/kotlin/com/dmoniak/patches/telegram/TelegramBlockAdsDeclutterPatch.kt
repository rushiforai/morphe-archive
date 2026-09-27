package com.dmoniak.patches.telegram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TELEGRAM
import java.util.logging.Logger

@Suppress("unused")
val telegramBlockAdsDeclutterPatch = bytecodePatch(
    name = "Block Ads & Hide Stories - Telegram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Removes sponsored messages in public channels, hides stories carousel from the chat list, and eliminates Telegram Premium upgrade reminders.",
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTelegramBlockAdsDeclutterLogic(logger)
    }
}

fun BytecodePatchContext.executeTelegramBlockAdsDeclutterLogic(logger: Logger) {
    logger.info("Executing Block Ads & Hide Stories patch for Telegram...")
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

            // Suppress sponsored messages / channel ads
            if (!isStatic && (
                mName == "hassponsoredmessage" ||
                mName == "issponsoredmessageenabled" ||
                mName == "shouldshowchannelad" ||
                mName == "isadvisible"
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
                    logger.info("[Telegram Ads] Blocked sponsored message in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Telegram Ads] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Suppress Stories carousel
            if (!isStatic && (
                mName == "isstoriesenabled" ||
                mName == "shouldshowstoriescarousel" ||
                mName == "hasstoriesbar"
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
                    logger.info("[Telegram Stories] Suppressed stories in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Telegram Stories] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Telegram Block Ads & Stories] Total hooks applied: $hookedPoints")
}
