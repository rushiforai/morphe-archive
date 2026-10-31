/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package dev.hyzor.patches.chesscom.gamereview

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

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

/** Builds the engine-line preview for a review position: (variants.d, AnalyzedPosition$Eval) -> api type. */
internal object GameReviewV2V0DFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/gamereview/v2/") &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString().startsWith("Lcom/chess/chessboard/variants/") &&
            method.parameterTypes[1].endsWith("/AnalyzedGameData\$AnalyzedPosition\$Eval;") &&
            method.returnType.startsWith("Lcom/chess/gamereview/api/")
    },
)

/** Builds the per-move review item: (AnalyzedPosition, history.i, GameAnalysisPermissions, Z) -> api.d. */
internal object GameReviewV2V0JFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/gamereview/v2/") &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes[0].endsWith("/AnalyzedGameData\$AnalyzedPosition;") &&
            method.parameterTypes[1].toString().startsWith("Lcom/chess/chessboard/history/") &&
            method.parameterTypes[2] == "Lcom/chess/entities/GameAnalysisPermissions;" &&
            method.parameterTypes[3] == "Z" &&
            method.returnType == "Lcom/chess/gamereview/api/d;"
    },
)

/** GameAnalysisServiceImpl.a(CompatGameIdAndType, continuation): fetches the permissions object. */
internal object GameAnalysisServiceImplGetPermissionsFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type.startsWith("Lcom/chess/net/v1/analysis/") &&
            method.name == "a" &&
            method.parameterTypes.size == 2 &&
            method.parameterTypes[0] == "Lcom/chess/entities/CompatGameIdAndType;" &&
            method.returnType == "Ljava/lang/Object;" &&
            method.implementation != null &&
            !AccessFlags.INTERFACE.isSet(classDef.accessFlags)
    },
)
