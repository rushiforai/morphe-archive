/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package dev.hyzor.patches.chesscom.botunlock

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched

private const val BOT_UNLOCK = "${Constants.EXTENSION_PACKAGE}/botunlock/BotUnlock;"

@Suppress("unused")
val botUnlockPatch = bytecodePatch(
    name = "Unlock all bots",
    description = "Every bot in Versus Bots can be played, including ones only Premium members may play.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("botUnlockPatched")

        // Bot.PersonalityBot.i() -> boolean (canPlay). Removed (inlined) in 4.10.23.
        BotPersonalityBotGetCanPlayFingerprint.matchOrNull()?.method?.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // Bot.PersonalityBot.E() -> boolean (requiresAccountActivation). Removed in 4.10.23.
        BotPersonalityBotGetRequiresActivationFingerprint.matchOrNull()?.method?.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // BotPersonality (proto).getCan_play() -> Boolean (boxed)
        ProtoBotPersonalityGetCanPlayFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // BotPersonality (proto).getEnabled() -> boolean
        ProtoBotPersonalityGetEnabledFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // BotPersonality (proto).getPremium() -> Boolean (boxed)
        ProtoBotPersonalityGetPremiumFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // h9 (LockedBots).a(Bot) -> boolean (isLocked)
        LockedBotsCheckFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BOT_UNLOCK->enabled()Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
