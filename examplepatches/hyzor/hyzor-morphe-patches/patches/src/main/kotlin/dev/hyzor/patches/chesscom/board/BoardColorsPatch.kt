package dev.hyzor.patches.chesscom.board

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import dev.hyzor.patches.chesscom.shared.returnString
import dev.hyzor.patches.chesscom.shared.toBinaryName

private const val BOARD_COLORS = "${Constants.EXTENSION_PACKAGE}/board/BoardColors;"

/** toString() of the board theme (background, coordinate colours, highlight colours, pieces). */
internal object ChessBoardThemeToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("ChessBoardTheme(background="),
)

/** toString() of the plain-colour board background. */
internal object DarkAndLightSquaresToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("DarkAndLightSquares(darkSquareColor="),
)

@Suppress("unused")
val boardColorsPatch = bytecodePatch(
    name = "Board colors",
    description = "Choose the board's square colours: your own, or one of chess.com's colour " +
        "themes, on every board of the app. In Noam's Patches → Board colors.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("boardColorsPatched")

        val squares = DarkAndLightSquaresToStringFingerprint.originalClassDef
        val backgroundType = squares.superclass ?: throw PatchException("The board background type was not found")
        mutableClassDefBy(BOARD_COLORS).methods.first { it.name == "squaresClass" }
            .returnString(squares.type.toBinaryName())

        val theme = mutableClassDefBy(ChessBoardThemeToStringFingerprint.originalClassDef)

        // <init>(background, darkSquareCoordinateColor, lightSquareCoordinateColor, ...).
        val constructor = theme.methods.filter {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == backgroundType
        }.maxByOrNull { it.parameterTypes.size } ?: throw PatchException("The board theme constructor was not found")

        // The values are read where the theme is built (the getters are inlined).
        constructor.apply {
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $BOARD_COLORS->background(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                    check-cast p1, $backgroundType
                    invoke-static { p2 }, $BOARD_COLORS->darkSquareCoordinates(I)I
                    move-result p2
                    invoke-static { p3 }, $BOARD_COLORS->lightSquareCoordinates(I)I
                    move-result p3
                """,
            )
        }
    }
}
