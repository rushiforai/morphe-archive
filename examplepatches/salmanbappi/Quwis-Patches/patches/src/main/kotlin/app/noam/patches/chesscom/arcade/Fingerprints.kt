package app.noam.patches.chesscom.arcade

import app.morphe.patcher.Fingerprint

/** toString() of the board's animation settings (move and drag-cancel animations). */
internal object StandardAnimationsToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("StandardAnimations(move="),
)

/** toString() of the interpolated (non-spring) piece animation type. */
internal object EasingCurveToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("EasingCurve(interpolator="),
)

/** toString() of a fixed animation duration. */
internal object FixedDurationToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Fixed(ms="),
)

/** Constructor of the board painter that fills the last move's squares. */
internal object LastMovePainterFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("highlightLastMove", "isDynamic"),
)

/** Constructor of the board painter that draws the legal-move dots. */
internal object LegalMovesPainterFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("availableMovesProv", "showLegalMoves"),
)
