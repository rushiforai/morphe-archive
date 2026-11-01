/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.botunlock

import app.morphe.patcher.Fingerprint

// The single-letter name shifts between chess.com builds (PrathxmOp's 4.10.17 had "i"/"k";
// 4.10.18 has "h", found by matching the class's Kotlin metadata parameter-name table against
// its field declaration order). Both are kept so a future rename has a chance of still matching.
internal object BotPersonalityBotGetCanPlayFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/features/versusbots/Bot\$PersonalityBot;" &&
            (method.name == "i" || method.name == "k" || method.name == "h") &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "Z"
    },
)

// 4.10.17 had "E"/"B"; 4.10.18 has "s" (isAssociatedWithCampaignThatRequiresAccountActivation).
internal object BotPersonalityBotGetRequiresActivationFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/features/versusbots/Bot\$PersonalityBot;" &&
            (method.name == "E" || method.name == "B" || method.name == "s") &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "Z"
    },
)

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
