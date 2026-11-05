package dev.hyzor.patches.chesscom.arrows

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.arcade.StandardAnimationsToStringFingerprint
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ARROWS = "${Constants.EXTENSION_PACKAGE}/arrows/Arrows;"
private const val ARROWS_CHIP = "${Constants.EXTENSION_PACKAGE}/arrows/ArrowsChip;"
private const val BOARD_VIEWS = "${Constants.EXTENSION_PACKAGE}/board/BoardViews;"
private const val BOARD = "Lcom/chess/chessboard/view/ChessBoardView;"
private const val V2_BOARD = "Lcom/chess/chessboard/v2/ChessBoardView;"

private const val BUTTON_CLASS = "dev.hyzor.extension.chesscom.arrows.ArrowsButton"

/** Game control bars and the two buttons Arrows goes between. */
private val CONTROL_BARS = mapOf(
    "live_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "daily_game_control_view" to ("chatControlView" to "analyzeControlViewContainer"),
    "pass_and_play_control_view" to ("pauseControlView" to "analysisControlView"),
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
    description = "Adds Arrows and Clear buttons to the live, daily and pass-and-play game bars, and a " +
        "small chip over the board in bot games. While Arrows is on, dragging on the board draws an arrow " +
        "and tapping marks a square, as on the website, and pieces don't move.",
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
        // The piece layer is an obfuscated ViewGroup with setPiecesGraphics.
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

        // The bot game's bar is Compose, with no place for our buttons; a small chip over the
        // board toggles Arrows and clears the marks instead.
        val chipActivity = "Lcom/chess/features/versusbots/game/BotGameActivityV2;"
        run {
            val type = mutableClassDefByOrNull(chipActivity) ?: return@run
            val resume = type.methods.firstOrNull { it.name == "onResume" && it.parameterTypes.isEmpty() }
            if (resume != null) {
                resume.addInstructions(0, "invoke-static/range { p0 .. p0 }, $ARROWS_CHIP->attach(Landroid/app/Activity;)V")
            } else {
                type.methods.firstOrNull { it.name == "onCreate" }?.apply {
                    instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
                        .sortedDescending()
                        .forEach { index ->
                            addInstructions(index, "invoke-static/range { p0 .. p0 }, $ARROWS_CHIP->attach(Landroid/app/Activity;)V")
                        }
                }
            }
        }
    }
}
