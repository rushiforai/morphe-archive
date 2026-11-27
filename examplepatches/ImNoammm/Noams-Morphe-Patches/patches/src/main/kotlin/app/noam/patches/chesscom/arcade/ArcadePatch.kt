package app.noam.patches.chesscom.arcade

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.boundReceiverType
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ARCADE = "${Constants.EXTENSION_PACKAGE}/arcade/Arcade;"
private const val CHESS_BOARD_VIEW = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val PIECE_VIEW = "Lcom/chess/chessboard/view/viewlayers/PieceView;"
private const val PIECE_ANIMATION = "Lcom/chess/chessboard/view/viewlayers/PieceView\$b;"
private const val SQUARE = "Lcom/chess/chessboard/s;"
private const val PAINTER_DRAW = "(Landroid/graphics/Canvas;ZFFLcom/chess/chessboard/a;Lcom/chess/chessboard/v2/s;)V"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val PROVIDER = "Ljavax/inject/Provider;"
private const val ANIMATIONS_TYPE = "Lcom/chess/entities/PieceAnimationsType;"
private const val BOARD_SETTINGS_PACKAGE = "Lcom/chess/chessboard/settings/"

private fun Method.parameters() = parameterTypes.map { it.toString() }

private fun Method.calls(predicate: (MethodReference) -> Boolean) = implementation?.instructions?.any {
    (it as? ReferenceInstruction)?.reference.let { ref -> ref is MethodReference && predicate(ref) }
} == true

private fun Instruction.methodReference() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.typeReference() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/**
 * Indices of the DYNAMIC reads that are compared with the board settings' animation type: the
 * settings' provider getter, its invoke() and the DYNAMIC constant in a row.
 */
private fun List<Instruction>.dynamicReads() = indices.filter { index ->
    index >= 4 && this[index].opcode == Opcode.SGET_OBJECT &&
        this[index].fieldReference()?.let { it.definingClass == ANIMATIONS_TYPE && it.name == "DYNAMIC" } == true &&
        this[index - 2].methodReference()?.let { it.definingClass == FUNCTION0 && it.name == "invoke" } == true &&
        this[index - 4].methodReference()?.let { it.definingClass.startsWith(BOARD_SETTINGS_PACKAGE) && it.returnType == FUNCTION0 } == true
}

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

        // The extension builds Arcade's move settings out of these (obfuscated) classes, reading and
        // setting their fields (R8 left them no getters, and FixedDuration a constant constructor).
        val standardAnimations = StandardAnimationsToStringFingerprint.originalClassDef
        val standardAnimationsType = standardAnimations.type
        // <init>(move, dragCancel): the field set from the last parameter is dragCancel.
        val dragCancel = standardAnimations.methods.single { it.name == "<init>" && it.parameterTypes.size == 2 }.let { constructor ->
            val registers = constructor.implementation!!.registerCount
            constructor.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
                instruction.fieldReference()?.takeIf {
                    instruction.opcode == Opcode.IPUT_OBJECT &&
                        (instruction as TwoRegisterInstruction).registerA == registers - 1
                }
            } ?: throw PatchException("The drag-cancel animation field was not found")
        }
        val fixedDuration = FixedDurationToStringFingerprint.originalClassDef
        val milliseconds = fixedDuration.instanceFields.singleOrNull { it.type == "J" }
            ?: throw PatchException("The fixed duration's milliseconds field was not found")
        mutableClassDefBy(ARCADE).methods.apply {
            first { it.name == "easingCurveClass" }
                .returnString(EasingCurveToStringFingerprint.originalClassDef.type.toBinaryName())
            first { it.name == "fixedDurationClass" }.returnString(fixedDuration.type.toBinaryName())
            first { it.name == "fixedDurationField" }.returnString(milliseconds.name)
            first { it.name == "dragCancelField" }.returnString(dragCancel.name)
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
        pieceView.methods.single { method ->
            method.returnType == "V" && method.parameters() == listOf(SQUARE) &&
                method.calls { it.name == "getFlipBoard" }
        }.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $ARCADE->onHover(Landroid/view/ViewGroup;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p1
                check-cast p1, $SQUARE
            """,
        )

        val animatedPieceType = classDefBy(ANIMATED_PIECE_LAMBDA).boundReceiverType()
        val animatedPiece = mutableClassDefBy(animatedPieceType)

        // A piece starts its move: AnimatedPiece.animate(animData, extra) right before the move
        // runner, whose last argument says whether the piece was dropped.
        animatedPiece.methods.single { it.returnType == "V" && it.parameters() == listOf(PIECE_ANIMATION, "Landroid/animation/Animator;") }
            .apply {
                val runIndex = instructions.indexOfLast {
                    it.opcode == Opcode.INVOKE_VIRTUAL_RANGE && it.methodReference()?.let { ref ->
                        ref.definingClass == animatedPieceType && ref.parameterTypes.size == 6
                    } == true
                }
                if (runIndex < 0) throw PatchException("The move runner call was not found")
                val run = getInstruction<RegisterRangeInstruction>(runIndex)
                val dropped = run.startRegister + run.registerCount - 1
                val self = thisRegister()
                if (listOf(self, self + 1, dropped).any { it > 15 }) throw PatchException("Move registers out of range")
                addInstruction(
                    runIndex,
                    "invoke-static { v$self, v${self + 1}, v$dropped }, " +
                        "$ARCADE->onMove(Landroid/view/View;Ljava/lang/Object;Z)V",
                )
            }

        // The player picks a piece up (dragStart(dragData, magnify)) ...
        animatedPiece.methods.single { it.returnType == "V" && it.parameterTypes.size == 2 && it.parameters()[1] == "Z" }
            .beforeEveryReturn("invoke-static/range { p0 .. p0 }, $ARCADE->onDragStart(Landroid/view/View;)V")

        // ... or lets go of it where it cannot move: the drag-cancel animation, which R8 inlined into
        // the piece view's loop over the dragged pieces (it makes the drag-cancel lambdas there).
        pieceView.methods.single { method ->
            method.implementation?.instructions?.any { it.typeReference() == ANIMATED_PIECE_LAMBDA && it.opcode == Opcode.NEW_INSTANCE } == true
        }.apply {
            val cast = instructions.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.typeReference() == animatedPieceType }
            if (cast < 0) throw PatchException("The dragged piece was not found")
            val piece = getInstruction<OneRegisterInstruction>(cast).registerA
            addInstruction(cast + 1, "invoke-static/range { v$piece .. v$piece }, $ARCADE->onDragEnd(Landroid/view/View;)V")
        }

        // The app's "Dynamic" style checks, which R8 inlined where the board's settings are read:
        // they compare the animation type with DYNAMIC, which matches nothing while Arcade draws.
        val dynamicChecks = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.implementation?.instructions?.toList()?.dynamicReads()?.isNotEmpty() == true) dynamicChecks += classDef to method
            }
        }
        if (dynamicChecks.isEmpty()) throw PatchException("The Dynamic style checks were not found")
        dynamicChecks.forEach { (classDef, method) ->
            mutableClassDefBy(classDef).methods.first {
                it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
            }.apply {
                instructions.toList().dynamicReads().reversed().forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v$register }, $ARCADE->dynamicType(Ljava/lang/Object;)Ljava/lang/Object;
                            move-result-object v$register
                            check-cast v$register, $ANIMATIONS_TYPE
                        """,
                    )
                }
            }
        }

        // Board painters: last move outlined in the mover's colour, and the website's move hints.
        mutableClassDefBy(LastMovePainterFingerprint.originalClassDef).methods.single {
            it.name == "c" && "(${it.parameters().joinToString("")})${it.returnType}" == PAINTER_DRAW
        }.apply {
            // At the start every register below the parameters is free: v0..v6 carry the call.
            if (implementation!!.registerCount - parameterTypes.size - 1 < 7) throw PatchException("Too few last-move painter registers")
            val shown = firstFieldRead(FUNCTION0)
            val squares = firstFieldRead(PROVIDER)
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $ARCADE->enabled()Z
                    move-result v0
                    if-eqz v0, :morphe_highlights
                    move-object/from16 v6, p0
                    iget-object v0, v6, $shown
                    invoke-interface { v0 }, $FUNCTION0->invoke()Ljava/lang/Object;
                    move-result-object v0
                    iget-object v1, v6, $squares
                    invoke-interface { v1 }, $PROVIDER->get()Ljava/lang/Object;
                    move-result-object v1
                    move-object/from16 v2, p1
                    move/from16 v3, p2
                    move/from16 v4, p4
                    move-object/from16 v5, p5
                    invoke-static/range { v0 .. v6 }, $ARCADE->drawLastMove(Ljava/lang/Object;Ljava/lang/Object;Landroid/graphics/Canvas;ZFLjava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
                ExternalLabel("morphe_highlights", getInstruction(0)),
            )
        }

        // The painter works the hints out itself (R8 inlined it), caching them in the moves'
        // LinkedHashSet field, then loops over them. Arcade takes the draw's canvas, orientation and
        // square size at the start and the hints at the loop, draws them, and leaves the loop none.
        mutableClassDefBy(LegalMovesPainterFingerprint.originalClassDef).methods.single {
            it.name == "c" && "(${it.parameters().joinToString("")})${it.returnType}" == PAINTER_DRAW
        }.apply {
            val cached = instructions.indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT && it.fieldReference()?.type == "Ljava/util/LinkedHashSet;"
            }
            if (cached < 0) throw PatchException("The move hints were not found")
            val hints = getInstruction<TwoRegisterInstruction>(cached).registerA
            val loop = (cached + 1 until instructions.size).firstOrNull { index ->
                instructions[index].methodReference()?.let { it.definingClass == "Ljava/lang/Iterable;" && it.name == "iterator" } == true &&
                    (instructions[index] as? FiveRegisterInstruction)?.registerC == hints
            } ?: throw PatchException("The move hints loop was not found")
            // Replaced in place, so the jump that skips the computation still lands on the hook.
            replaceInstruction(loop, "invoke-static/range { v$hints .. v$hints }, $ARCADE->hints(Ljava/lang/Object;)Ljava/lang/Object;")
            addInstructions(
                loop + 1,
                """
                    move-result-object v$hints
                    check-cast v$hints, Ljava/lang/Iterable;
                    invoke-interface/range { v$hints .. v$hints }, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
                """,
            )
            addInstruction(0, "invoke-static/range { p0 .. p4 }, $ARCADE->hintsFrame(Ljava/lang/Object;Landroid/graphics/Canvas;ZFF)V")
        }
    }
}
