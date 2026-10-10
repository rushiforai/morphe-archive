package app.noam.patches.chesscom.board

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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

/** Passes what a getter returns through [hook] (descriptor of a static extension method). */
private fun MutableMethod.filterReturn(hook: String, objectType: String? = null) {
    val index = instructions.indexOfLast { it.opcode == Opcode.RETURN || it.opcode == Opcode.RETURN_OBJECT }
    if (index < 0) throw PatchException("$name has no return")
    val register = getInstruction<OneRegisterInstruction>(index).registerA
    addInstructions(
        index,
        if (objectType == null) {
            """
                invoke-static/range { v$register .. v$register }, $hook
                move-result v$register
            """
        } else {
            """
                invoke-static/range { v$register .. v$register }, $hook
                move-result-object v$register
                check-cast v$register, $objectType
            """
        },
    )
}

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
        val firstParameter = constructor.implementation!!.registerCount - constructor.parameterTypes.size
        fun fieldFromParameter(index: Int): FieldReference = constructor.implementation!!.instructions.firstNotNullOfOrNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { _ ->
                it.opcode == Opcode.IPUT && (it as TwoRegisterInstruction).registerA == firstParameter + index
            }
        } ?: throw PatchException("The board theme field of parameter $index was not found")
        val darkCoordinates = fieldFromParameter(1)
        val lightCoordinates = fieldFromParameter(2)

        // A plain getter: read the field, return it (hashCode reads every field too).
        fun getterOf(field: FieldReference) = theme.methods.single { method ->
            method.parameterTypes.isEmpty() && method.returnType == field.type &&
                method.implementation?.instructions?.toList()?.let { body ->
                    body.size == 2 && (body[0] as? ReferenceInstruction)?.reference == field
                } == true
        }

        theme.methods.single { it.parameterTypes.isEmpty() && it.returnType == backgroundType }
            .filterReturn("$BOARD_COLORS->background(Ljava/lang/Object;)Ljava/lang/Object;", backgroundType)
        getterOf(darkCoordinates).filterReturn("$BOARD_COLORS->darkSquareCoordinates(I)I")
        getterOf(lightCoordinates).filterReturn("$BOARD_COLORS->lightSquareCoordinates(I)I")
    }
}
