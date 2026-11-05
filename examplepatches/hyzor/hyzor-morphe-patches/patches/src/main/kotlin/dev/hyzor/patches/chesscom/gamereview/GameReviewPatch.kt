/*
 * Copyright 2026 PrathxmOp
 * https://github.com/PrathxmOp/Prathxm-Patches
 *
 * Ported into Noam's chess.com patches (GPL-3.0).
 */

package dev.hyzor.patches.chesscom.gamereview

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import dev.hyzor.patches.chesscom.upsell.NavigateFingerprint
import dev.hyzor.patches.chesscom.upsell.ShowDialogDirectionFingerprint
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "${Constants.EXTENSION_PACKAGE}/gamereview/GameReviewExtension;"
private const val GAME_REVIEW = "${Constants.EXTENSION_PACKAGE}/gamereview/GameReview;"
private const val CHOOSER = "${Constants.EXTENSION_PACKAGE}/gamereview/ReviewChooser;"

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private val LICHESS_SCREENS = listOf(
    "dev.hyzor.extension.chesscom.gamereview.LichessLoginActivity",
    "dev.hyzor.extension.chesscom.gamereview.LichessActivity",
)

/** The Lichess login and analysis pages. */
private val lichessScreensResourcePatch = resourcePatch(
    description = "Adds the Lichess login and analysis pages, for Lichess reviews.",
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("The manifest has no application element")
            LICHESS_SCREENS.forEach { screen ->
                application.appendChild(
                    document.createElement("activity").apply {
                        setAttributeNS(ANDROID_NAMESPACE, "android:name", screen)
                        setAttributeNS(ANDROID_NAMESPACE, "android:exported", "false")
                        setAttributeNS(ANDROID_NAMESPACE, "android:label", "Lichess")
                        setAttributeNS(ANDROID_NAMESPACE, "android:theme", "@android:style/Theme.Material.NoActionBar")
                        setAttributeNS(
                            ANDROID_NAMESPACE, "android:configChanges",
                            "orientation|screenSize|smallestScreenSize|screenLayout|keyboardHidden",
                        )
                    },
                )
            }
        }
    }
}

@Suppress("unused")
val gameReviewPatch = bytecodePatch(
    name = "Unlimited Game Review",
    description = "Game Review asks who reviews the game: chess.com, Lichess's servers (online, with your " +
        "Lichess account) or, with the Stockfish analysis patch, Stockfish on your phone (offline, no daily " +
        "limit). A Lichess or phone review is scored the Lichess way (accuracy, centipawn loss, and " +
        "inaccuracies, mistakes and blunders) and shown in chess.com's own review screen. Finished games " +
        "only; a live game on screen is never analysed.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, lichessScreensResourcePatch)

    execute {
        markFeaturePatched("gameReviewPatched")

        // Opening Game Review asks who reviews: navigate(activity, directions) for the full
        // screen and show(router, direction, fragmentManager) for the dialog are held back
        // until a reviewer is picked.
        listOf(NavigateFingerprint, ShowDialogDirectionFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $CHOOSER->intercept(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_review_chooser
                    return-void
                """,
                ExternalLabel("morphe_review_chooser", fingerprint.method.getInstruction(0)),
            )
        }

        // The five quota/permission flags Game Review's UI reads before it will render full
        // content. getCanViewAccuracyAndMoves() genuinely reads the same backing field as
        // getCanCreate() in chess.com's own code (confirmed against this build, not a typo).
        for (fingerprint in listOf(
            GameAnalysisPermissionsGetCanCreateFingerprint,
            GameAnalysisPermissionsGetCanMoveFeedbackFingerprint,
            GameAnalysisPermissionsGetCanMoveStrengthFingerprint,
            GameAnalysisPermissionsGetCanViewAccuracyAndMovesFingerprint,
            GameAnalysisPermissionsGetCanViewCoachCommentaryFingerprint,
        )) {
            val field = when (fingerprint) {
                GameAnalysisPermissionsGetCanCreateFingerprint,
                GameAnalysisPermissionsGetCanViewAccuracyAndMovesFingerprint -> "canCreate"
                GameAnalysisPermissionsGetCanMoveFeedbackFingerprint -> "canMoveFeedback"
                GameAnalysisPermissionsGetCanMoveStrengthFingerprint -> "canMoveStrength"
                else -> "canViewCoachCommentary"
            }
            val name = fingerprint.method.name
            fingerprint.method.addInstructions(
                0,
                """
                    iget-boolean v0, p0, Lcom/chess/entities/GameAnalysisPermissions;->$field:Z
                    const-string v1, "$name"
                    invoke-static { v0, v1 }, $EXTENSION_CLASS->getAnalysisPermission(ZLjava/lang/String;)Z
                    move-result v0
                    return v0
                """,
            )
        }

        // Replace chess.com's own (quota-limited) Game Review data source with the local
        // review flow. Off, or chess.com picked in the chooser: falls through to the original
        // method, so Game Review works normally against chess.com's server.
        val repoMethod = GameAnalysisRepositoryGetGameAnalysisFingerprint.method
        val repoReturnType = repoMethod.returnType
        val pgnReg = if (repoMethod.parameterTypes[0] == "Lcom/chess/entities/ComputerAnalysisConfiguration;") "p1" else "p2"
        repoMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $GAME_REVIEW->local()Z
                move-result v0
                if-eqz v0, :original
                const-class v0, $repoReturnType
                move-object/from16 v1, $pgnReg
                invoke-static { v0, v1 }, $EXTENSION_CLASS->getLocalAnalysisFlowForConfig(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $repoReturnType
                return-object v0
            """,
            ExternalLabel("original", repoMethod.getInstruction(0)),
        )

        // In our own reviews the engine-line preview, which the app rebuilds from the eval PV, is
        // left out: returning null makes the review fall back to the (always valid) played/best
        // move. chess.com's own reviews show theirs.
        GameReviewV2V0DFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $GAME_REVIEW->local()Z
                move-result v0
                if-eqz v0, :morphe_continuation
                const/4 v0, 0
                return-object v0
            """,
            ExternalLabel("morphe_continuation", GameReviewV2V0DFingerprint.method.getInstruction(0)),
        )

        // If the app is about to build an item of our own review from data it cannot replay (no
        // played move / unconvertible suggestion), return a neutral "book" item instead of
        // crashing. chess.com's own reviews build theirs as before.
        GameReviewV2V0JFingerprint.method.addInstructions(
            0,
            """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                invoke-static { v0, v1 }, $EXTENSION_CLASS->shouldUseDummyMove(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :proceed
                const-class v0, Lcom/chess/gamereview/api/d;
                move-object/from16 v1, p1
                invoke-static { v0, v1 }, $EXTENSION_CLASS->buildDummyMoveResult(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :proceed
                check-cast v0, Lcom/chess/gamereview/api/d;
                return-object v0
                :proceed
                nop
            """,
        )

        // The initial "what can I do with this game" permissions fetch, so the Review button
        // itself does not stay gated before the user even opens the screen.
        GameAnalysisServiceImplGetPermissionsFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $GAME_REVIEW->local()Z
                move-result v0
                if-eqz v0, :original
                invoke-static { }, $EXTENSION_CLASS->getFullGameAnalysisPermissions()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
            ExternalLabel("original", GameAnalysisServiceImplGetPermissionsFingerprint.method.getInstruction(0)),
        )
    }
}
