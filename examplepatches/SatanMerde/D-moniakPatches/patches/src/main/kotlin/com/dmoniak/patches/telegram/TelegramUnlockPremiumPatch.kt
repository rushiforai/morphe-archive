package com.dmoniak.patches.telegram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_TELEGRAM
import java.util.logging.Logger

@Suppress("unused")
val telegramUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Telegram Premium Features - Telegram (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Unlocks client-side Telegram Premium features: exclusive app icons, animated reactions, voice-to-text transcription toggle, and doubled chat folders.",
) {
    compatibleWith(COMPATIBILITY_TELEGRAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeTelegramUnlockPremiumLogic(logger)
    }
}

fun BytecodePatchContext.executeTelegramUnlockPremiumLogic(logger: Logger) {
    logger.info("Executing Unlock Telegram Premium Features patch for Telegram...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.contains("org/telegram/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook Telegram's UserConfig.isPremium() and client-side feature flags
            if ((mName == "ispremium" || mName.contains("isuserpremium") || mName.contains("haspremium")) && retType == "Z") {
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
                    logger.info("[Telegram Premium] Unlocked Premium check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Telegram Premium] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Telegram Premium] Total premium hooks applied: $hookedPoints")
}
