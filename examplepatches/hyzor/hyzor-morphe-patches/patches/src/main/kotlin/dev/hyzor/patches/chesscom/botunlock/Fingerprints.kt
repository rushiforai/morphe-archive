/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package dev.hyzor.patches.chesscom.botunlock

import app.morphe.patcher.Fingerprint

internal object ProtoBotPersonalityGetCanPlayFingerprint : Fingerprint(
    definingClass = "Lchesscom/bots/v1/BotPersonality;",
    name = "getCan_play",
    parameters = listOf(),
    returnType = "Ljava/lang/Boolean;",
)

internal object ProtoBotPersonalityGetEnabledFingerprint : Fingerprint(
    definingClass = "Lchesscom/bots/v1/BotPersonality;",
    name = "getEnabled",
    parameters = listOf(),
    returnType = "Z",
)

internal object ProtoBotPersonalityGetPremiumFingerprint : Fingerprint(
    definingClass = "Lchesscom/bots/v1/BotPersonality;",
    name = "getPremium",
    parameters = listOf(),
    returnType = "Ljava/lang/Boolean;",
)

internal object LockedBotsCheckFingerprint : Fingerprint(
    definingClass = "Lcom/chess/features/versusbots/ui/",
    returnType = "Z",
    parameters = listOf("Lcom/chess/features/versusbots/Bot;"),
    custom = { method, classDef ->
        classDef.fields.count() == 1 &&
            classDef.fields.any { it.type == "Ljava/util/Set;" }
    },
)
