/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.coach

import app.morphe.patcher.Fingerprint

// Play Coach's daily quota: com.chess.features.versusbots.coach.CoachGamesQuotaServiceImpl.
//
//   canStartCoachedGame(Continuation) -> Boolean: asks GetCoachQuota and answers remaining != 0;
//        when false, the setup screen's Play button opens the premium upsell instead.
//
//   coachedGameReachedQuotaThreshold(gameToken, Continuation) -> Unit: called once a coach game
//        has been played long enough to count; stores the token and sends StartedGameAgainstCoach,
//        which uses up the daily free game.
//
// R8 renames these and narrows their signatures between builds, so each is found by the
// coroutine class only it creates (CoachGamesQuotaServiceImpl$canStartCoachedGame$1 and so on).

private const val QUOTA_SERVICE = "Lcom/chess/features/versusbots/coach/CoachGamesQuotaServiceImpl;"

private fun createsCoroutine(method: com.android.tools.smali.dexlib2.iface.Method, name: String) =
    method.implementation?.instructions?.any { instruction ->
        val reference = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference
        reference is com.android.tools.smali.dexlib2.iface.reference.TypeReference &&
            reference.type.startsWith("${QUOTA_SERVICE.removeSuffix(";")}\$$name\$")
    } == true

internal object CoachQuotaCanStartFingerprint : Fingerprint(
    definingClass = QUOTA_SERVICE,
    custom = { method, _ -> createsCoroutine(method, "canStartCoachedGame") },
)

internal object CoachQuotaConsumeFingerprint : Fingerprint(
    definingClass = QUOTA_SERVICE,
    custom = { method, _ -> createsCoroutine(method, "coachedGameReachedQuotaThreshold") },
)
