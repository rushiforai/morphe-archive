/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package app.noam.patches.chesscom.gamereview

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object GameAnalysisPermissionsGetCanCreateFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameAnalysisPermissions;",
    name = "getCanCreate",
    parameters = listOf(),
    returnType = "Z",
)

internal object GameAnalysisPermissionsGetCanMoveFeedbackFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameAnalysisPermissions;",
    name = "getCanMoveFeedback",
    parameters = listOf(),
    returnType = "Z",
)

internal object GameAnalysisPermissionsGetCanMoveStrengthFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameAnalysisPermissions;",
    name = "getCanMoveStrength",
    parameters = listOf(),
    returnType = "Z",
)

internal object GameAnalysisPermissionsGetCanViewAccuracyAndMovesFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameAnalysisPermissions;",
    name = "getCanViewAccuracyAndMoves",
    parameters = listOf(),
    returnType = "Z",
)

internal object GameAnalysisPermissionsGetCanViewCoachCommentaryFingerprint : Fingerprint(
    definingClass = "Lcom/chess/entities/GameAnalysisPermissions;",
    name = "getCanViewCoachCommentary",
    parameters = listOf(),
    returnType = "Z",
)

/** GameAnalysisRepositoryImpl's entry point: (config, side, coach, skills, depth, engine, Z) -> Flow. */
internal object GameAnalysisRepositoryGetGameAnalysisFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/chess/gamereview/repository/GameAnalysisRepositoryImpl;" &&
            method.parameterTypes.size == 7 &&
            method.parameterTypes.contains("Lcom/chess/entities/AnalysisDepth;") &&
            method.parameterTypes.contains("Lcom/chess/entities/AnalysisEngine;")
    },
)

/** Builds the engine-line preview for a review position: (position, AnalyzedPosition$Eval) -> api type. */
internal object GameReviewV2V0DFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/gamereview/v2/") &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0].startsWith("Lcom/chess/chessboard/variants/") &&
            method.parameterTypes[1].endsWith("/AnalyzedGameData\$AnalyzedPosition\$Eval;") &&
            method.returnType.startsWith("Lcom/chess/gamereview/api/")
    },
)

/** Builds the per-move review item: (AnalyzedPosition, history entry, GameAnalysisPermissions, Z) -> api.d. */
internal object GameReviewV2V0JFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/gamereview/v2/") &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes[0].endsWith("/AnalyzedGameData\$AnalyzedPosition;") &&
            method.parameterTypes[1].startsWith("Lcom/chess/chessboard/history/") &&
            method.parameterTypes[2] == "Lcom/chess/entities/GameAnalysisPermissions;" &&
            method.parameterTypes[3] == "Z" &&
            method.returnType == "Lcom/chess/gamereview/api/d;"
    },
)

/** The analysis service's (CompatGameIdAndType, continuation) call: fetches the permissions object. */
internal object GameAnalysisServiceImplGetPermissionsFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/net/v1/analysis/") &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "Lcom/chess/entities/CompatGameIdAndType;" &&
            method.returnType == "Ljava/lang/Object;"
    },
)

/** toString() of the review overview's state, which keeps whether the move tally is unfolded. */
internal object ReviewOverviewStateToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(", isMoveTallyExpanded="),
)

/** The review summary's row for one move type: Tally(tally, modifier, onMoveClassificationClick, ...). */
internal object TallyRowFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("tally"), string("onMoveClassificationClick")),
)
