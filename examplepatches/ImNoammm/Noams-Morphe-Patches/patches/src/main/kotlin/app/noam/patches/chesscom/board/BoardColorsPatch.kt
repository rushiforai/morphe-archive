package app.noam.patches.chesscom.board

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

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
    description = "Choose the board's square colors: your own, or one of chess.com's color " +
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

        // <init>(background, darkSquareCoordinateColor, lightSquareCoordinateColor, ...). The theme's
        // fields are read directly (it has no getters), so these three are filtered as they are stored.
        val constructor = theme.methods.filter {
            it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == backgroundType
        }.maxByOrNull { it.parameterTypes.size } ?: throw PatchException("The board theme constructor was not found")
        val firstParameter = constructor.implementation!!.registerCount - constructor.parameterTypes.size
        listOf(
            "$BOARD_COLORS->background(Ljava/lang/Object;)Ljava/lang/Object;",
            "$BOARD_COLORS->darkSquareCoordinates(I)I",
            "$BOARD_COLORS->lightSquareCoordinates(I)I",
        ).mapIndexed { parameter, hook ->
            val register = firstParameter + parameter
            val store = constructor.instructions.indexOfFirst {
                (it.opcode == Opcode.IPUT || it.opcode == Opcode.IPUT_OBJECT) &&
                    (it as TwoRegisterInstruction).registerA == register &&
                    ((it as ReferenceInstruction).reference as FieldReference).definingClass == theme.type
            }
            if (store < 0) throw PatchException("The board theme store of parameter $parameter was not found")
            Triple(store, register, hook)
        }.sortedByDescending { it.first }.forEach { (store, register, hook) ->
            constructor.addInstructions(
                store,
                if (hook.endsWith("I")) {
                    """
                        invoke-static/range { v$register .. v$register }, $hook
                        move-result v$register
                    """
                } else {
                    """
                        invoke-static/range { v$register .. v$register }, $hook
                        move-result-object v$register
                        check-cast v$register, $backgroundType
                    """
                },
            )
        }
    }
}
