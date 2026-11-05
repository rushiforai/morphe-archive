package dev.hyzor.patches.chesscom.arcade

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import dev.hyzor.patches.chesscom.shared.returnString
import dev.hyzor.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ARCADE = "${Constants.EXTENSION_PACKAGE}/arcade/Arcade;"
private const val CHESS_BOARD_VIEW = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val PIECE_VIEW = "Lcom/chess/chessboard/view/viewlayers/PieceView;"
private const val ANIMATED_PIECE = "Lcom/chess/chessboard/view/viewlayers/AnimatedPiece;"
private const val PIECE_ANIMATION = "Lcom/chess/chessboard/view/viewlayers/PieceView\$b;"
private const val SQUARE = "Lcom/chess/chessboard/t;"
private const val BOARD = "Lcom/chess/chessboard/a;"
private const val PAINTER_DRAW = "(Landroid/graphics/Canvas;ZFFLcom/chess/chessboard/a;Lcom/chess/chessboard/v2/a0;)V"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val PROVIDER = "Ljavax/inject/Provider;"

private fun Method.parameters() = parameterTypes.map { it.toString() }

private fun Method.calls(predicate: (MethodReference) -> Boolean) = implementation?.instructions?.any {
    (it as? ReferenceInstruction)?.reference.let { ref -> ref is MethodReference && predicate(ref) }
} == true

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun ClassDef.method(description: String, predicate: (Method) -> Boolean): Method =
    methods.filter(predicate).singleOrNull()
        ?: throw PatchException("Expected one $description in $type, found ${methods.count(predicate)}")

/** Register number of p0 (parameters sit at the top of the frame). */
private fun MutableMethod.thisRegister() =
    implementation!!.registerCount - parameterTypes.sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt() - 1

/** First field of [type] this method reads from its own object. */
private fun MutableMethod.firstFieldRead(type: String): FieldReference =
    instructions.firstNotNullOfOrNull { instruction ->
        instruction.fieldReference()?.takeIf { instruction.opcode == Opcode.IGET_OBJECT && it.type == type }
    } ?: throw PatchException("No $type field read in $definingClass->$name")

/** Replaces the method's first parameter with Arcade.animations(it). */
private fun MutableMethod.wrapAnimationsParameter(type: String) = addInstructions(
    0,
    """
        invoke-static/range { p1 .. p1 }, $ARCADE->animations(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object p1
        check-cast p1, $type
    """,
)

private fun MutableMethod.beforeEveryReturn(smali: String) {
    instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        .reversed().forEach { addInstructions(it, smali) }
}

@Suppress("unused")
val arcadePatch = bytecodePatch(
    name = "Arcade animations",
    description = "Adds the chess.com website's Arcade piece animations to every board: light " +
        "trails, bursts when a piece is picked up, dropped or captured, a flash on check, " +
        "outlined last-move squares and animated move hints. Switch it in Noam's Patches.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("arcadePatched")

        // The extension builds Arcade's move settings out of these (obfuscated) classes.
        val standardAnimations = StandardAnimationsToStringFingerprint.originalClassDef
        val standardAnimationsType = standardAnimations.type
        val animationsConstructor = mutableClassDefBy(standardAnimations).methods.single {
            it.name == "<init>" && it.parameterTypes.size == 2
        }
        // <init>(move, dragCancel): the field set from the last parameter is dragCancel, so the
        // hook below passes the right animation.
        val registers = animationsConstructor.implementation!!.registerCount
        animationsConstructor.implementation!!.instructions.firstOrNull { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                (instruction as TwoRegisterInstruction).registerA == registers - 1
        } ?: throw PatchException("The drag-cancel animation field was not found")
        // The getter is inlined, so capture the drag-cancel animation in the constructor instead.
        animationsConstructor.addInstructions(
            0,
            "invoke-static/range { p1 .. p2 }, $ARCADE->onStandardAnimations(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
        mutableClassDefBy(ARCADE).methods.apply {
            first { it.name == "easingCurveClass" }
                .returnString(EasingCurveToStringFingerprint.originalClassDef.type.toBinaryName())
            first { it.name == "fixedDurationClass" }
                .returnString(FixedDurationToStringFingerprint.originalClassDef.type.toBinaryName())
        }
        // Every board takes Arcade's move animation: the board view and its piece layer.
        mutableClassDefBy(CHESS_BOARD_VIEW).methods.single {
            it.name == "setStandardAnimations" && it.parameters() == listOf(standardAnimationsType)
        }.wrapAnimationsParameter(standardAnimationsType)
        val pieceView = mutableClassDefBy(PIECE_VIEW)
        pieceView.methods.single { it.returnType == "V" && it.parameters() == listOf(standardAnimationsType) }
            .wrapAnimationsParameter(standardAnimationsType)
        pieceView.methods.single {
            it.returnType == "V" && it.parameterTypes.size == 2 && it.parameters().first() == standardAnimationsType
        }.apply {
            wrapAnimationsParameter(standardAnimationsType)
            // Once the piece layer has built its children, add the Arcade layers.
            beforeEveryReturn("invoke-static/range { p0 .. p0 }, $ARCADE->attach(Landroid/view/ViewGroup;)V")
        }
        // A move's animations: remember which one is the castling rook.
        pieceView.methods.single {
            it.returnType == "V" && it.parameters().take(2) == listOf(PIECE_ANIMATION, PIECE_ANIMATION)
        }.addInstruction(0, "invoke-static/range { p2 .. p2 }, $ARCADE->onMoves(Ljava/lang/Object;)V")
        // The square under a dragged piece: Arcade outlines it instead of the app's mark.
        // The square type is obfuscated differently per build, so take it from the method.
        val hover = pieceView.methods.single { method ->
            method.returnType == "V" && method.parameters().size == 1 &&
                method.calls { it.name == "getFlipBoard" }
        }
        val squareType = hover.parameterTypes[0].toString()
        hover.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $ARCADE->onHover(Landroid/view/ViewGroup;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $squareType
            """,
        )

        // AnimatedPiece is an obfuscated view of the same package.
        val animatedPieceType = classDefByOrNull { classDef ->
            classDef.type.startsWith("Lcom/chess/chessboard/view/viewlayers/") &&
                classDef.superclass == "Landroid/view/View;" &&
                classDef.methods.any {
                    it.returnType == "V" &&
                        it.parameterTypes.map { type -> type.toString() } ==
                        listOf(PIECE_ANIMATION, "Landroid/animation/Animator;")
                }
        }?.type ?: ANIMATED_PIECE
        val animatedPiece = mutableClassDefBy(animatedPieceType)

        // A piece starts its move: AnimatedPiece.animate(animData, extra) right before the
        // private move runner, whose last argument says whether the piece was dropped.
        animatedPiece.methods.single { it.returnType == "V" && it.parameters() == listOf(PIECE_ANIMATION, "Landroid/animation/Animator;") }
            .apply {
                val runIndex = instructions.indexOfLast {
                    (it.opcode == Opcode.INVOKE_DIRECT_RANGE || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                        it.methodReference()?.let { ref ->
                            ref.definingClass == animatedPieceType && ref.parameterTypes.size == 6
                        } == true
                }
                if (runIndex < 0) throw PatchException("The move runner call was not found")
                val run = getInstruction<RegisterRangeInstruction>(runIndex)
                val dropped = run.startRegister + run.registerCount - 1
                val self = thisRegister()
                if (listOf(self, dropped).any { it > 15 }) throw PatchException("Move registers out of range")
                // The runner takes other arguments, but the animation is this method's first parameter.
                addInstruction(
                    runIndex,
                    "invoke-static { v$self, p1, v$dropped }, " +
                        "$ARCADE->onMove(Landroid/view/View;Ljava/lang/Object;Z)V",
                )
            }
        // The player picks a piece up (dragStart(dragData, magnify)) ...
        animatedPiece.methods.single { it.returnType == "V" && it.parameterTypes.size == 2 && it.parameters()[1] == "Z" }
            .beforeEveryReturn("invoke-static/range { p0 .. p0 }, $ARCADE->onDragStart(Landroid/view/View;)V")
        // Board painters: last move outlined in the mover's colour, and the website's move hints.
        mutableClassDefBy(LastMovePainterFingerprint.originalClassDef).methods.single { method ->
            method.returnType == "V" && method.parameterTypes.size == 6 &&
                method.parameterTypes[0].toString() == "Landroid/graphics/Canvas;" &&
                method.parameterTypes[1].toString() == "Z" &&
                method.parameterTypes[2].toString() == "F" &&
                method.parameterTypes[3].toString() == "F" &&
                method.parameterTypes[4].toString() == "Lcom/chess/chessboard/a;"
        }.apply {
            val shown = firstFieldRead(FUNCTION0)
            val squares = firstFieldRead(PROVIDER)
            // The parameters sit above v15, so copy them into low locals first.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $ARCADE->enabled()Z
                    move-result v0
                    if-eqz v0, :morphe_highlights
                    move-object/from16 v0, p0
                    iget-object v0, v0, $shown
                    invoke-interface { v0 }, $FUNCTION0->invoke()Ljava/lang/Object;
                    move-result-object v0
                    move-object/from16 v1, p0
                    iget-object v1, v1, $squares
                    invoke-interface { v1 }, $PROVIDER->get()Ljava/lang/Object;
                    move-result-object v1
                    move-object/from16 v2, p1
                    move/from16 v3, p2
                    move/from16 v4, p4
                    move-object/from16 v5, p5
                    move-object/from16 v6, p6
                    invoke-static/range { v0 .. v6 }, $ARCADE->drawLastMove(Ljava/lang/Object;Ljava/lang/Object;Landroid/graphics/Canvas;ZFLjava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
                ExternalLabel("morphe_highlights", getInstruction(0)),
            )
        }

        mutableClassDefBy(LegalMovesPainterFingerprint.originalClassDef).methods.single { method ->
            method.returnType == "V" && method.parameterTypes.size == 6 &&
                method.parameterTypes[0].toString() == "Landroid/graphics/Canvas;" &&
                method.parameterTypes[1].toString() == "Z" &&
                method.parameterTypes[2].toString() == "F" &&
                method.parameterTypes[3].toString() == "F" &&
                method.parameterTypes[4].toString() == "Lcom/chess/chessboard/a;"
        }.apply {
            val shown = firstFieldRead(FUNCTION0)
            val moves = firstFieldRead(PROVIDER)
            // The available moves of the position, as the painter itself reads them.
            val hintsOf = instructions.firstNotNullOfOrNull { instruction ->
                instruction.methodReference()?.takeIf {
                    instruction.opcode == Opcode.INVOKE_VIRTUAL && it.parameterTypes.map { type -> type.toString() } == listOf(BOARD) &&
                        it.returnType == "Ljava/util/Set;"
                }
            }
            // The hint set comes from a state object; the website hints are skipped.
            if (hintsOf != null) addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $ARCADE->enabled()Z
                    move-result v0
                    if-eqz v0, :morphe_hints
                    move-object/from16 v0, p0
                    iget-object v0, v0, $shown
                    invoke-interface { v0 }, $FUNCTION0->invoke()Ljava/lang/Object;
                    move-result-object v0
                    move-object/from16 v1, p0
                    iget-object v1, v1, $moves
                    invoke-interface { v1 }, $PROVIDER->get()Ljava/lang/Object;
                    move-result-object v1
                    check-cast v1, ${hintsOf.definingClass}
                    move-object/from16 v6, p5
                    invoke-virtual { v1, v6 }, $hintsOf
                    move-result-object v1
                    move-object/from16 v2, p1
                    move/from16 v3, p2
                    move/from16 v4, p4
                    move-object/from16 v5, p6
                    invoke-static/range { v0 .. v5 }, $ARCADE->drawHints(Ljava/lang/Object;Ljava/lang/Object;Landroid/graphics/Canvas;ZFLjava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_hints
                    return-void
                """,
                ExternalLabel("morphe_hints", getInstruction(0)),
            )
        }
    }
}
