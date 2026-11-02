package app.noam.patches.chesscom.arrows

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.addArrowsBarButtons
import app.noam.patches.chesscom.shared.composeBarButton
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ARROWS_CHIP = "${Constants.EXTENSION_PACKAGE}/arrows/ArrowsChip;"
private const val BUTTON_CLASS = "app.noam.extension.chesscom.arrows.ArrowsButton"
private const val REVIEW_ACTIVITY = "Lcom/chess/gamereview/v2/GameReviewActivity;"
private const val ANALYSIS_PACKAGE = "Lcom/chess/features/analysis/"

/** Analysis bars and the game's two buttons Arrows goes between. */
private val REVIEW_BARS = mapOf(
    "view_standalone_analysis_controls" to ("optionsBtn" to "explorerBtn"),
    "view_analysis_self_engineless_controls" to ("resetView" to "backControlView"),
)

private val arrowsReviewsResourcePatch = resourcePatch(
    description = "Adds the Arrows and Clear buttons to the review and analysis boards.",
) {
    execute {
        document("res/values/strings.xml").use { document ->
            document.addString("morphe_arrows", "Arrows")
            document.addString("morphe_clear_arrows", "Clear")
        }

        REVIEW_BARS.forEach { (layout, neighbours) ->
            val bar = runCatching { document("res/layout/$layout.xml") }.getOrNull() ?: return@forEach
            bar.use { document ->
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
                    "morpheArrowsControlView", "reviews_draw", "glyph_arrow_line_diagonal_top_right", "morphe_arrows",
                    "@+id/$beforeId", "@+id/morpheClearArrowsControlView",
                )
                val clear = button(
                    "morpheClearArrowsControlView", "reviews_clear", "glyph_board_simple_badge_cross", "morphe_clear_arrows",
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
val arrowsReviewsPatch = bytecodePatch(
    name = "Arrows in reviews",
    description = "Adds Arrows and Clear to Game Review and the Analysis boards. While Arrows is on, " +
        "dragging on the board draws an arrow and tapping marks a square, as on the website, and pieces " +
        "don't move. Clear removes them.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch, arrowsReviewsResourcePatch, arrowsCorePatch)

    execute {
        markFeaturePatched("arrowsReviewsPatched")

        // Game Review's own bottom bar draws a list of actions, so Arrows and Clear go in as two
        // more of them instead of floating over the board.
        val actionConstructor = listOf(
            "Ljava/lang/String;", "Ljava/lang/Integer;", "Lkotlin/jvm/functions/Function0;",
            "Lkotlin/jvm/functions/Function1;", "Z", "Z", "I",
        )
        class ActionsCall(
            val type: String,
            val name: String,
            val parameters: String,
            val index: Int,
            val register: Int,
            val barType: String,
        )
        val calls = mutableListOf<ActionsCall>()
        classDefForEach { classDef ->
            if (!classDef.type.contains("/gamereview/")) return@classDefForEach
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC &&
                        instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEachIndexed
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    val types = reference.parameterTypes.map(CharSequence::toString)
                    if (types.size != 9 || types[2] != "Landroidx/compose/ui/b;" ||
                        types[4] != "Ljava/lang/Integer;" || types[5] != "Z" ||
                        types[7] != "I" || types[8] != "I") return@forEachIndexed
                    val register = when (instruction) {
                        is RegisterRangeInstruction -> instruction.startRegister
                        is FiveRegisterInstruction -> instruction.registerC
                        else -> return@forEachIndexed
                    }
                    calls += ActionsCall(
                        classDef.type, method.name, method.parameterTypes.joinToString(""), index, register, types[0],
                    )
                }
            }
        }
        // The action class sits beside the bar's state class: it is the one with the bar's action constructor.
        val barPackage = calls.firstOrNull()?.barType?.substringBeforeLast('/')?.plus("/")
        val actionType = barPackage?.let { prefix ->
            mutableClassDefByOrNull { classDef ->
                classDef.type.startsWith(prefix) && classDef.methods.any { method ->
                    method.name == "<init>" &&
                        method.parameterTypes.map(CharSequence::toString) == actionConstructor
                }
            }
        }

        if (calls.isNotEmpty() && actionType != null) {
            mutableClassDefBy(ARROWS_CHIP).methods.first { it.name == "actionType" }
                .returnString(actionType.type.toBinaryName())
            mutableClassDefBy(ARROWS_CHIP).methods.first { it.name == "reviewsInBar" }
                .replaceInstructions(0, "const/4 v0, 0x1\nreturn v0")
            calls.groupBy { Triple(it.type, it.name, it.parameters) }.forEach { (key, group) ->
                val method = mutableClassDefBy(key.first).methods.first {
                    it.name == key.second && it.parameterTypes.joinToString("") == key.third
                }
                group.sortedByDescending { it.index }.forEach { call ->
                    method.addInstructions(
                        call.index,
                        "invoke-static/range { v${call.register} .. v${call.register} }, " +
                            "$ARROWS_CHIP->addActions(Ljava/lang/Object;)V",
                    )
                }
            }

            // 4.10.23's Analysis screen draws its own Compose bar; Arrows and Clear join its buttons.
            var analysisType: String? = null
            var analysisMethod: String? = null
            classDefForEach { classDef ->
                if (analysisType != null || !classDef.type.startsWith(ANALYSIS_PACKAGE)) return@classDefForEach
                val method = classDef.methods.firstOrNull { it.composeBarButton() != null } ?: return@classDefForEach
                analysisType = classDef.type
                analysisMethod = method.name + "(" + method.parameterTypes.joinToString("") + ")" + method.returnType
            }
            val type = analysisType
            val key = analysisMethod
            if (type != null && key != null) {
                mutableClassDefBy(type).methods.first {
                    it.name + "(" + it.parameterTypes.joinToString("") + ")" + it.returnType == key
                }.addArrowsBarButtons("reviewsShow")
            }
        } else {
            // The review screen is Compose, so its chip floats over the board instead of sitting in a bar.
            val review = mutableClassDefByOrNull(REVIEW_ACTIVITY)
                ?: throw PatchException("The Game Review screen was not found")
            val onCreate = review.methods.singleOrNull {
                it.name == "onCreate" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/os/Bundle;")
            } ?: throw PatchException("Game Review's onCreate was not found")
            onCreate.addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $ARROWS_CHIP->attachReviews(Landroid/app/Activity;)V",
            )
        }
    }
}
