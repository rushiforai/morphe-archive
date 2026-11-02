package app.noam.patches.chesscom.arrows

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.arcade.StandardAnimationsToStringFingerprint
import app.noam.patches.chesscom.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val ARROWS = "${Constants.EXTENSION_PACKAGE}/arrows/Arrows;"
internal const val BOARD_VIEWS = "${Constants.EXTENSION_PACKAGE}/board/BoardViews;"
internal const val BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
internal const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"

/**
 * The board side of every arrows patch: touches go to the drawing first, and the marks layers are
 * added once a board has built its pieces. Separate from the buttons so games and reviews can be
 * two patches with one board implementation.
 */
internal val arrowsCorePatch = bytecodePatch(
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // The boards' touches go to the drawing first while arrows are on (both boards: the older
        // one and the newer v2 one some screens use).
        listOf(BOARD, V2_BOARD).forEach { board ->
            mutableClassDefBy(board).methods.single {
                it.name == "onTouchEvent" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/view/MotionEvent;")
            }.apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p0 .. p1 }, $ARROWS->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
                        move-result v0
                        if-eqz v0, :morphe_board_touch
                        return v0
                    """,
                    ExternalLabel("morphe_board_touch", getInstruction(0)),
                )
            }
        }

        // The v2 board: the marks layers once it has built its piece view, and its orientation,
        // which it reports only through this setter (its getter is obfuscated).
        // 4.10.18 has v2/PiecesView; 4.10.23 keeps the piece layer in an obfuscated ViewGroup.
        val v2Pieces = classDefByOrNull { classDef ->
            classDef.type.startsWith("Lcom/chess/chessboard/v2/") &&
                classDef.superclass == "Landroid/view/ViewGroup;" &&
                classDef.methods.any { method -> method.name == "setPiecesGraphics" }
        }?.type ?: throw PatchException("The v2 piece layer was not found")
        mutableClassDefBy(V2_BOARD).methods.apply {
            val constructors = filter {
                it.name == "<init>" && it.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { reference ->
                        reference.name == "<init>" && reference.definingClass == v2Pieces
                    } == true
                } == true
            }
            if (constructors.size != 1) throw PatchException("Expected one v2 board constructor building its pieces, found ${constructors.size}")
            constructors.single().apply {
                instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
                    .reversed().forEach {
                        addInstructions(it, "invoke-static/range { p0 .. p0 }, $ARROWS->attachBoard(Landroid/view/ViewGroup;)V")
                    }
            }
            single { it.name == "setBoardFlipped" && it.parameterTypes.map { type -> type.toString() } == listOf("Z") }
                .addInstructions(0, "invoke-static { p0, p1 }, $BOARD_VIEWS->onFlipped(Landroid/view/View;Z)V")
        }

        // Once a board's piece layer has built its children, add the arrow layers:
        // PieceView.init(standardAnimations, dragSettings).
        val standardAnimations = StandardAnimationsToStringFingerprint.originalClassDef.type
        mutableClassDefBy("Lcom/chess/chessboard/view/viewlayers/PieceView;").methods.single {
            it.returnType == "V" && it.parameterTypes.size == 2 && it.parameterTypes.first().toString() == standardAnimations
        }.apply {
            instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
                .reversed().forEach {
                    addInstructions(it, "invoke-static/range { p0 .. p0 }, $ARROWS->attach(Landroid/view/ViewGroup;)V")
                }
        }
    }
}
