package app.noam.patches.chesscom.arrows

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.arcade.ANIMATED_PIECE_LAMBDA
import app.noam.patches.chesscom.arcade.StandardAnimationsToStringFingerprint
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.boundReceiverType
import app.noam.patches.chesscom.shared.fieldReference
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.methodReference
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ARROWS = "${Constants.EXTENSION_PACKAGE}/arrows/Arrows;"
private const val ARROWS_BAR = "${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;"
private const val BOARD_VIEWS = "${Constants.EXTENSION_PACKAGE}/board/BoardViews;"
private const val BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"
/** A lambda of the v2 board's piece view: R8 renamed PiecesView but kept this name. */
private const val V2_PIECES_LAMBDA = "Lcom/chess/chessboard/v2/PiecesView\$dynamicRipples\$2;"
private const val BUTTON_CLASS = "app.noam.extension.chesscom.arrows.ArrowsButton"
/** Packages of the Compose game screens whose bottom bar gets Arrows and Clear: bots, guided coach games. */
private val COMPOSE_GAME_PACKAGES = listOf(
    "Lcom/chess/features/versusbots/ui/game",
    "Lcom/chess/features/guidedcoachgame",
)
private const val BOTTOM_ACTIONS_BAR = "\$this\$BottomActionsBar"
private const val COMPOSER = "Landroidx/compose/runtime/a;"
private const val PARCELABLE_STATE = "Landroidx/compose/runtime/ParcelableSnapshotMutableState;"
private val JUMPS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/** Game control bars and the two buttons Arrows goes between (archived games use the daily bar). */
private val CONTROL_BARS = mapOf(
    "live_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "daily_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "pass_and_play_control_view" to ("pauseControlView" to "analysisControlView"),
)

/** chess.com's bottom bar button of the Compose screens. */
internal object BottomButtonFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("\$this\$BottomButton")),
)

private fun Instruction.isString(value: String) =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == value

/** "name(parameters)return" of a call to the composer, or null. */
private fun Instruction.composerCall() = methodReference?.takeIf { it.definingClass == COMPOSER }?.let {
    "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
}

private fun Document.elementWithId(id: String): Element {
    val all = getElementsByTagName("*")
    for (i in 0 until all.length) {
        val element = all.item(i) as Element
        if (element.getAttribute("android:id").substringAfter('/') == id) return element
    }
    throw PatchException("$id was not found")
}

private fun Document.addString(name: String, value: String) {
    val resources = documentElement
    val strings = resources.getElementsByTagName("string")
    if ((0 until strings.length).any { (strings.item(it) as Element).getAttribute("name") == name }) return
    resources.appendChild(
        createElement("string").apply {
            setAttribute("name", name)
            textContent = value
        },
    )
}

private val arrowsResourcePatch = resourcePatch(
    description = "Adds the Arrows and Clear buttons to the game control bars.",
) {
    execute {
        document("res/values/strings.xml").use { document ->
            document.addString("morphe_arrows", "Arrows")
            document.addString("morphe_clear_arrows", "Clear")
        }

        CONTROL_BARS.forEach { (layout, neighbours) ->
            document("res/layout/$layout.xml").use { document ->
                val (beforeId, afterId) = neighbours
                val before = document.elementWithId(beforeId)
                val after = document.elementWithId(afterId)

                // ... before, Arrows, Clear, after ... (the bar is a packed chain).
                fun button(id: String, tag: String, icon: String, text: String, start: String, end: String) =
                    document.createElement(BUTTON_CLASS).apply {
                        setAttribute("android:id", "@+id/$id")
                        setAttribute("android:tag", tag)
                        setAttribute("android:layout_width", "0dp")
                        setAttribute("android:layout_height", "wrap_content")
                        setAttribute("android:contentDescription", "@string/$text")
                        setAttribute("app:icon", "@drawable/$icon")
                        setAttribute("app:text", "@string/$text")
                        setAttribute("app:layout_constraintTop_toTopOf", "parent")
                        setAttribute("app:layout_constraintBottom_toBottomOf", "parent")
                        setAttribute("app:layout_constraintStart_toEndOf", start)
                        setAttribute("app:layout_constraintEnd_toStartOf", end)
                        setAttribute("app:layout_constraintWidth_max", "@dimen/bottom_button_max_width")
                    }

                val draw = button(
                    "morpheArrowsControlView", "draw", "glyph_arrow_line_diagonal_top_right", "morphe_arrows",
                    "@+id/$beforeId", "@+id/morpheClearArrowsControlView",
                )
                val clear = button(
                    "morpheClearArrowsControlView", "clear", "glyph_board_simple_badge_cross", "morphe_clear_arrows",
                    "@+id/morpheArrowsControlView", "@+id/$afterId",
                )
                before.setAttribute("app:layout_constraintEnd_toStartOf", "@+id/morpheArrowsControlView")
                after.setAttribute("app:layout_constraintStart_toEndOf", "@+id/morpheClearArrowsControlView")
                after.parentNode.insertBefore(draw, after)
                after.parentNode.insertBefore(clear, after)
            }
        }
    }
}

@Suppress("unused")
val arrowsPatch = bytecodePatch(
    name = "Arrows in games",
    description = "Adds Arrows and Clear buttons to the game bars (live, daily, archived, pass and " +
        "play, bots, coach). While Arrows is on, dragging on the board draws an arrow and tapping marks a " +
        "square, as on the website, and pieces don't move.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, arrowsResourcePatch)

    execute {
        markFeaturePatched("arrowsPatched")

        // The boards' touches go to the drawing first while Arrows is on (both boards: the older
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

        // The extension tells the renamed board views apart by their class names.
        val v2Pieces = classDefBy(V2_PIECES_LAMBDA).boundReceiverType()
        val animatedPiece = classDefBy(ANIMATED_PIECE_LAMBDA).boundReceiverType()
        mutableClassDefBy(BOARD_VIEWS).methods.apply {
            first { it.name == "v2PiecesClass" }.returnString(v2Pieces.toBinaryName())
            first { it.name == "animatedPieceClass" }.returnString(animatedPiece.toBinaryName())
        }

        // The v2 board: the marks layers once it has built its piece view, and its orientation,
        // which it reports only through this setter (its getter is obfuscated).
        mutableClassDefBy(V2_BOARD).methods.apply {
            val constructors = filter {
                it.name == "<init>" && it.implementation?.instructions?.any { instruction ->
                    instruction.methodReference?.let { reference ->
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

        // Bot and coach games have Compose bars: Arrows and Clear go in as two more of chess.com's bar
        // buttons. They read a state of ours, so the bar redraws them when the arrows change.
        val button = BottomButtonFingerprint.method
        val buttonCall = "${button.definingClass}->${button.name}(${button.parameterTypes.joinToString("")})V"
        val expected = "Lcom/google/android/l16;ILjava/lang/String;Landroidx/compose/ui/b;ZLcom/google/android/yl0;Z" +
            "Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;${COMPOSER}II"
        if (button.parameterTypes.joinToString("") != expected) throw PatchException("Unexpected bar button: $buttonCall")

        // Compose colours are made by their class's (J) constructor.
        val colorType = button.parameterTypes[5].toString()
        classDefBy(colorType).methods.singleOrNull { it.name == "<init>" && it.parameterTypes.joinToString("") == "J" }
            ?: throw PatchException("The color constructor was not found")

        // mutableStateOf(value): the runtime's one static (Object) method that makes the state.
        val stateFactories = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.substringBeforeLast('/') != "Landroidx/compose/runtime") return@classDefForEach
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.joinToString("") == "Ljava/lang/Object;" &&
                    method.implementation?.instructions?.any {
                        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == PARCELABLE_STATE
                    } == true
                ) {
                    stateFactories += "${classDef.type}->${method.name}(Ljava/lang/Object;)${method.returnType}"
                }
            }
        }
        val mutableStateOf = stateFactories.singleOrNull()
            ?: throw PatchException("Expected one mutableStateOf, found ${stateFactories.size}")

        // Our buttons sit in a group of their own: the composer's start (key) and end, as the bars
        // wrap their own optional buttons.
        classDefBy(COMPOSER).methods.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }.let { declared ->
            if (!declared.containsAll(listOf("v(I)V", "s()V"))) throw PatchException("The composer's group calls were not found")
        }

        // A button is (row, icon, label, modifier, enabled, colour, flag, onHold, onClick, composer,
        // changed, defaults); Arrows sets the colour, Clear sets enabled.
        val rowType = button.parameterTypes[0].toString()
        COMPOSE_GAME_PACKAGES.forEach { screen ->
            val bars = mutableListOf<Pair<ClassDef, Method>>()
            classDefForEach { classDef ->
                if (classDef.type.substringBeforeLast('/') != screen) return@classDefForEach
                classDef.methods.filter { method -> method.implementation?.instructions?.any { it.isString(BOTTOM_ACTIONS_BAR) } == true }
                    .forEach { bars += classDef to it }
            }
            val (barClass, barMethod) = bars.singleOrNull()
                ?: throw PatchException("Expected one bottom bar in $screen, found ${bars.size}")
            mutableClassDefBy(barClass).methods.single { it.name == barMethod.name && it.parameterTypes == barMethod.parameterTypes }.apply {
                // A case of a lambda R8 merged others into: invoke(row, composer, changed). The row
                // and the composer stay in p1 and p2, which the method never overwrites.
                val registers = implementation!!.registerCount
                val row = registers - 3
                if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.joinToString("") != "Ljava/lang/Object;".repeat(3) ||
                    registers - 4 < 12
                ) {
                    throw PatchException("Unexpected bottom bar method in $barClass")
                }
                if (instructions.any { instruction ->
                        instruction.opcode.setsRegister() && (instruction as OneRegisterInstruction).registerA.let {
                            it == row || it == row + 1 || (instruction.opcode.setsWideRegister() && it + 1 == row)
                        }
                    }
                ) {
                    throw PatchException("The bottom bar in $barClass overwrites its row or composer")
                }
                if (instructions.none { it.methodReference?.let { call -> call.definingClass == button.definingClass && call.name == button.name } == true }) {
                    throw PatchException("The bottom bar in $barClass has no buttons")
                }

                // The bar runs, or skips to its end when nothing changed (the composer's (IZ)Z check
                // decides, then its ()V skip). The skip falls into the end, where the method returns,
                // and the run jumps there: our buttons go in before each of those jumps.
                val title = instructions.indexOfFirst { it.isString(BOTTOM_ACTIONS_BAR) }
                val check = (title + 1 until instructions.size).firstOrNull {
                    instructions[it].composerCall()?.substringAfter('(') == "IZ)Z"
                } ?: throw PatchException("The bottom bar's skip check was not found in $barClass")
                val branch = instructions[check + 2]
                val skip = (branch as? BuilderOffsetInstruction)?.target?.location?.index?.takeIf { branch.opcode == Opcode.IF_EQZ }
                    ?: throw PatchException("The bottom bar's skip branch was not found in $barClass")
                // The skip may first move the composer into a register it can call from.
                val skipCall = (skip until instructions.size).firstOrNull { instructions[it].composerCall() != null }
                    ?: throw PatchException("The bottom bar's skip was not found in $barClass")
                val end = skipCall + 1
                if (instructions[skipCall].composerCall()?.endsWith("()V") != true ||
                    (skip until skipCall).any { instructions[it] is BuilderOffsetInstruction } ||
                    instructions[end].fieldReference?.definingClass != "Lkotlin/Unit;" || instructions[end + 1].opcode != Opcode.RETURN_OBJECT
                ) {
                    throw PatchException("Unexpected end of the bottom bar in $barClass")
                }
                val ways = instructions.withIndex().filter { (_, instruction) ->
                    (instruction as? BuilderOffsetInstruction)?.target?.location?.index == end
                }
                if (ways.isEmpty() || ways.any { it.value.opcode !in JUMPS }) {
                    throw PatchException("Unexpected ways into the end of the bottom bar in $barClass")
                }
                ways.map { it.index }.sortedDescending().forEach { way -> addInstructionsWithLabels(
                    way,
                    """
                        move-object/from16 v9, p2
                        check-cast v9, $COMPOSER
                        const v10, 0x4e6f616d
                        invoke-interface { v9, v10 }, $COMPOSER->v(I)V
                        invoke-static { }, $ARROWS_BAR->show()Z
                        move-result v0
                        if-eqz v0, :morphe_arrows_bar

                        invoke-static { }, $ARROWS_BAR->needsState()Z
                        move-result v0
                        if-eqz v0, :morphe_arrows_state
                        const/4 v0, 0x0
                        invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v0
                        invoke-static { v0 }, $mutableStateOf
                        move-result-object v0
                        invoke-static { v0 }, $ARROWS_BAR->bind(Ljava/lang/Object;)V
                        :morphe_arrows_state

                        invoke-static { }, $ARROWS_BAR->arrowsColor()J
                        move-result-wide v0
                        const-wide/16 v2, 0x0
                        cmp-long v4, v0, v2
                        const/4 v5, 0x0
                        if-eqz v4, :morphe_arrows_plain
                        new-instance v5, $colorType
                        invoke-direct { v5, v0, v1 }, $colorType-><init>(J)V
                        :morphe_arrows_plain
                        move-object/from16 v0, p1
                        check-cast v0, $rowType
                        invoke-static { }, $ARROWS_BAR->arrowsIcon()I
                        move-result v1
                        invoke-static { }, $ARROWS_BAR->arrowsLabel()Ljava/lang/String;
                        move-result-object v2
                        const/4 v3, 0x0
                        const/4 v4, 0x0
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        invoke-static { }, $ARROWS_BAR->onArrows()Lkotlin/jvm/functions/Function0;
                        move-result-object v8
                        move-object/from16 v9, p2
                        check-cast v9, $COMPOSER
                        const/4 v10, 0x0
                        const/16 v11, 0x6c
                        invoke-static/range { v0 .. v11 }, $buttonCall

                        move-object/from16 v0, p1
                        check-cast v0, $rowType
                        invoke-static { }, $ARROWS_BAR->clearIcon()I
                        move-result v1
                        invoke-static { }, $ARROWS_BAR->clearLabel()Ljava/lang/String;
                        move-result-object v2
                        const/4 v3, 0x0
                        invoke-static { }, $ARROWS_BAR->clearEnabled()Z
                        move-result v4
                        const/4 v5, 0x0
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        invoke-static { }, $ARROWS_BAR->onClear()Lkotlin/jvm/functions/Function0;
                        move-result-object v8
                        move-object/from16 v9, p2
                        check-cast v9, $COMPOSER
                        const/4 v10, 0x0
                        const/16 v11, 0x74
                        invoke-static/range { v0 .. v11 }, $buttonCall

                        :morphe_arrows_bar
                        move-object/from16 v9, p2
                        check-cast v9, $COMPOSER
                        invoke-interface { v9 }, $COMPOSER->s()V
                    """,
                ) }
            }
        }
    }
}
