package com.dmoniak.patches.telegram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TELEGRAM
import java.util.logging.Logger

@Suppress("unused")
val telegramUnlimitedPinnedChatsPatch = bytecodePatch(
    name = "Unlock Unlimited Pinned Chats - Telegram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Bypasses the 5 pinned chats limit in Telegram, allowing users to pin unlimited chats and channels without Telegram Premium.",
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTelegramUnlimitedPinnedChatsLogic(logger)
    }
}

fun BytecodePatchContext.executeTelegramUnlimitedPinnedChatsLogic(logger: Logger) {
    logger.info("Executing Unlock Unlimited Pinned Chats patch for Telegram...")
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

            // Hook max pinned chats limit getter -> 100
            if (!isStatic && (
                mName == "getpinnedchatslimit" ||
                mName == "getmaxpinnedchats" ||
                mName == "getpinneddialogslimit"
            ) && retType == "I") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/16 v0, 0x64
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Telegram Pinned Chats] Increased pinned limit to 100 in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Telegram Pinned Chats] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // Hook canPinMoreChats boolean
            if (!isStatic && (
                mName == "canpinmorechats" ||
                mName == "canpindialog"
            ) && retType == "Z") {
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
                    logger.info("[Telegram Pinned Chats] Forced canPinMoreChats in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Telegram Pinned Chats] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Telegram Unlimited Pinned Chats] Total hooks applied: $hookedPoints")
}
