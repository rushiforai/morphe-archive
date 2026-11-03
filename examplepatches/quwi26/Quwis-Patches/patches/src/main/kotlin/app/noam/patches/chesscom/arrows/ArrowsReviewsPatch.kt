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
import app.noam.patches.chesscom.shared.addArrowsState
import app.noam.patches.chesscom.shared.markFeaturePatched
import app.noam.patches.chesscom.shared.mutableStateFactory
import app.noam.patches.chesscom.shared.returnString
import app.noam.patches.chesscom.shared.toBinaryName
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ARROWS_CHIP = "${Constants.EXTENSION_PACKAGE}/arrows/ArrowsChip;"
private const val REVIEW_ACTIVITY = "Lcom/chess/gamereview/v2/GameReviewActivity;"

private val arrowsReviewsResourcePatch = resourcePatch(
    description = "Adds the Arrows and Clear labels to the review bar.",
) {
    execute {
        document("res/values/strings.xml").use { document ->
            document.addString("morphe_arrows", "Arrows")
            document.addString("morphe_clear_arrows", "Clear")
        }
    }
}

@Suppress("unused")
val arrowsReviewsPatch = bytecodePatch(
    name = "Arrows in reviews",
    description = "Adds Arrows and Clear to Game Review's bottom bar. While Arrows is on, " +
        "dragging on the board draws an arrow and tapping marks a square, as on the website, and pieces " +
        "don't move. Clear joins Arrows while drawing and folds away when it is switched off, so the " +
        "bar keeps its space.",
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
            // A state of ours for the review bars: they read it, so Clear can appear and fold away
            // when drawing starts and stops. Some versions keep Compose's state classes out of
            // reach; then the bars keep both buttons instead of failing.
            val stateFactory = runCatching { mutableStateFactory() }.getOrNull()

            mutableClassDefBy(ARROWS_CHIP).methods.first { it.name == "actionType" }
                .returnString(actionType.type.toBinaryName())
            mutableClassDefBy(ARROWS_CHIP).methods.first { it.name == "reviewsInBar" }
                .replaceInstructions(0, "const/4 v0, 0x1\nreturn v0")
            val stateMethods = mutableSetOf<String>()
            calls.groupBy { Triple(it.type, it.name, it.parameters) }.forEach { (key, group) ->
                val method = mutableClassDefBy(key.first).methods.firstOrNull {
                    it.name == key.second && it.parameterTypes.joinToString("") == key.third &&
                        it.implementation != null
                } ?: throw PatchException("The review bar method was not found in ${key.first}")
                group.sortedByDescending { it.index }.forEach { call ->
                    method.addInstructions(
                        call.index,
                        "invoke-static/range { v${call.register} .. v${call.register} }, " +
                            "$ARROWS_CHIP->addActions(Ljava/lang/Object;)V",
                    )
                }
                if (stateFactory != null && stateMethods.add(key.first + "->" + key.second + key.third)) {
                    try {
                        method.addArrowsState(stateFactory)
                    } catch (throwable: Throwable) {
                        throw PatchException("The arrows state failed in ${key.first}->${key.second}: $throwable")
                    }
                }
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
