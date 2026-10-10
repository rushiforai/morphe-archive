package app.noam.patches.chesscom.arrows

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.arcade.StandardAnimationsToStringFingerprint
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ARROWS = "${Constants.EXTENSION_PACKAGE}/arrows/Arrows;"
private const val ARROWS_BAR = "${Constants.EXTENSION_PACKAGE}/arrows/ArrowsBar;"
private const val BOARD_VIEWS = "${Constants.EXTENSION_PACKAGE}/board/BoardViews;"
private const val BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"
private const val V2_PIECES = "Lcom/chess/chessboard/v2/PiecesView;"
private const val BUTTON_CLASS = "app.noam.extension.chesscom.arrows.ArrowsButton"
/** Compose game screens whose bottom bar gets Arrows and Clear: bots, guided coach games. */
private val COMPOSE_GAME_BARS = listOf(
    "Lcom/chess/features/versusbots/ui/game/BotGameActivityContentKt;",
    "Lcom/chess/features/guidedcoachgame/GuidedCoachGameActivity;",
)
private const val COMPOSER = "Landroidx/compose/runtime/d;"
private const val PARCELABLE_STATE = "Landroidx/compose/runtime/ParcelableSnapshotMutableState;"
private val JUMPS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

/** Game control bars and the two buttons Arrows goes between. */
private val CONTROL_BARS = mapOf(
    "live_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "daily_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "archived_live_game_control_view" to ("optionsControlView" to "analyzeControlViewContainer"),
    "pass_and_play_control_view" to ("pauseControlView" to "analysisControlView"),
)

/** chess.com's bottom bar button of the Compose screens. */
internal object BottomButtonFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("com.chess.palette.components.BottomButton (BottomActionsBar.kt:128)"),
)

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

        // The v2 board: the marks layers once it has built its piece view, and its orientation,
        // which it reports only through this setter (its getter is obfuscated).
        mutableClassDefBy(V2_BOARD).methods.apply {
            val constructors = filter {
                it.name == "<init>" && it.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let { reference ->
                        reference.name == "<init>" && reference.definingClass == V2_PIECES
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
        val expected = "Lcom/google/android/era;ILjava/lang/String;Landroidx/compose/ui/b;ZLcom/google/android/ei1;Z" +
            "Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;${COMPOSER}II"
        if (button.parameterTypes.joinToString("") != expected) throw PatchException("Unexpected bar button: $buttonCall")

        // Compose colours are boxed by their class's one static (J) method.
        val colorType = button.parameterTypes[5].toString()
        val colorClass = classDefByOrNull { it.type == colorType } ?: throw PatchException("$colorType was not found")
        val box = colorClass.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == colorType &&
                it.parameterTypes.joinToString("") == "J"
        }.singleOrNull() ?: throw PatchException("The colour box method was not found")
        val boxCall = "$colorType->${box.name}(J)$colorType"

        // mutableStateOf(value, policy = default): (value, policy, defaults mask, marker).
        val stateClass = classDefByOrNull { it.type == PARCELABLE_STATE } ?: throw PatchException("$PARCELABLE_STATE was not found")
        val policyType = stateClass.methods.single {
            it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == "Ljava/lang/Object;"
        }.parameterTypes[1].toString()
        val stateFactories = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.substringBeforeLast('/') != "Landroidx/compose/runtime") return@classDefForEach
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") &&
                    method.parameterTypes.joinToString("") == "Ljava/lang/Object;${policyType}ILjava/lang/Object;"
                ) {
                    stateFactories += "${classDef.type}->${method.name}(Ljava/lang/Object;${policyType}ILjava/lang/Object;)${method.returnType}"
                }
            }
        }
        val mutableStateOf = stateFactories.minOrNull() ?: throw PatchException("mutableStateOf was not found")

        // A button is (row, icon, label, modifier, enabled, colour, flag, onHold, onClick, composer,
        // changed, defaults); Arrows sets the colour, Clear sets enabled.
        val rowType = button.parameterTypes[0].toString()
        COMPOSE_GAME_BARS.forEach { type ->
            val bars = mutableClassDefBy(type).methods.filter { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "\$this\$BottomActionsBar"
                } == true
            }
            if (bars.size != 1) throw PatchException("Expected one bottom bar in $type, found ${bars.size}")
            bars.single().apply {
                val types = parameterTypes.map { it.toString() }
                if (!AccessFlags.STATIC.isSet(accessFlags) || types.any { it == "J" || it == "D" }) {
                    throw PatchException("Unexpected bottom bar method in $type")
                }
                val row = "p${types.indexOf(rowType).takeIf { it >= 0 } ?: throw PatchException("No row in $type")}"
                val composer = "p${types.indexOf(COMPOSER).takeIf { it >= 0 } ?: throw PatchException("No composer in $type")}"
                if (implementation!!.registerCount - types.size < 12) throw PatchException("Too few registers in $type")

                val last = instructions.indexOfLast { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null && reference.definingClass == button.definingClass && reference.name == button.name &&
                        reference.parameterTypes.joinToString("") == expected
                }
                if (last < 0) throw PatchException("The bottom bar's buttons were not found in $type")
                // The bar's end: the trace check every way through the bar reaches last (some jump
                // there from their own last button). Our buttons go in before each way in.
                val end = (last + 1 until instructions.size).firstOrNull { index ->
                    val instruction = instructions[index]
                    instruction.opcode == Opcode.INVOKE_STATIC && (instruction as ReferenceInstruction).reference.let {
                        it is MethodReference && it.parameterTypes.isEmpty() && it.returnType == "Z"
                    }
                } ?: throw PatchException("The end of the bottom bar was not found in $type")
                val entries = instructions.withIndex().filter { (_, instruction) ->
                    (instruction as? BuilderOffsetInstruction)?.target?.location?.index == end
                }
                entries.firstOrNull { it.value.opcode !in JUMPS }?.let {
                    throw PatchException("A conditional branch reaches the end of the bottom bar in $type")
                }
                val ways = entries.map { it.index }.toMutableList()
                if (instructions[end - 1].opcode !in JUMPS + Opcode.RETURN_OBJECT + Opcode.RETURN_VOID + Opcode.THROW) ways += end
                if (ways.isEmpty()) throw PatchException("No way into the end of the bottom bar in $type")
                ways.sortedDescending().forEach { way -> addInstructionsWithLabels(
                    way,
                    """
                        move-object/from16 v9, $composer
                        const v10, 0x4e6f616d
                        invoke-interface { v9, v10 }, $COMPOSER->y(I)V
                        invoke-static { }, $ARROWS_BAR->show()Z
                        move-result v0
                        if-eqz v0, :morphe_arrows_bar

                        invoke-static { }, $ARROWS_BAR->needsState()Z
                        move-result v0
                        if-eqz v0, :morphe_arrows_state
                        const/4 v0, 0x0
                        invoke-static { v0 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v0
                        const/4 v1, 0x0
                        const/4 v2, 0x2
                        const/4 v3, 0x0
                        invoke-static { v0, v1, v2, v3 }, $mutableStateOf
                        move-result-object v0
                        invoke-static { v0 }, $ARROWS_BAR->bind(Ljava/lang/Object;)V
                        :morphe_arrows_state

                        invoke-static { }, $ARROWS_BAR->arrowsColor()J
                        move-result-wide v0
                        const-wide/16 v2, 0x0
                        cmp-long v4, v0, v2
                        const/4 v5, 0x0
                        if-eqz v4, :morphe_arrows_plain
                        invoke-static { v0, v1 }, $boxCall
                        move-result-object v5
                        :morphe_arrows_plain
                        move-object/from16 v0, $row
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
                        move-object/from16 v9, $composer
                        const/4 v10, 0x0
                        const/16 v11, 0x6c
                        invoke-static/range { v0 .. v11 }, $buttonCall

                        move-object/from16 v0, $row
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
                        move-object/from16 v9, $composer
                        const/4 v10, 0x0
                        const/16 v11, 0x74
                        invoke-static/range { v0 .. v11 }, $buttonCall

                        :morphe_arrows_bar
                        move-object/from16 v9, $composer
                        invoke-interface { v9 }, $COMPOSER->u()V
                    """,
                ) }
            }
        }
    }
}
