package app.noam.patches.chesscom.timecontrol

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.indexOfFirstOrThrow
import app.noam.patches.chesscom.shared.indexOfLast
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TIME_CONTROLS = "${Constants.EXTENSION_PACKAGE}/timecontrol/TimeControls;"

/** SliderRow(titleRes, valueText, max, value, onValueChange, composer, flags). */
private fun MethodReference.isSliderRow() =
    parameterTypes.size == 7 && returnType == "V" &&
        parameterTypes.take(5).map { it.toString() } ==
        listOf("I", "Ljava/lang/String;", "I", "I", "Lkotlin/jvm/functions/Function1;")

private fun Instruction.isGameTimeGetter() = opcode == Opcode.INVOKE_VIRTUAL &&
    ((this as ReferenceInstruction).reference as MethodReference).let {
        it.definingClass == "Lcom/chess/entities/GameTime;" && it.name.startsWith("get") && it.parameterTypes.isEmpty()
    }

private fun MethodReference.isQuantityString() =
    returnType == "Ljava/lang/String;" &&
        parameterTypes.map { it.toString() }.take(3) == listOf("I", "I", "[Ljava/lang/Object;")

@Suppress("unused")
val shortTimeControlsPatch = bytecodePatch(
    name = "Time controls under a minute",
    description = "The custom time slider goes below one minute: 10, 15, 20, 30 and 45 seconds, " +
        "with or without increment, the way the website allows. Labels read \"30 sec\" and \"0:30+1\".",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("shortTimeControlsPatched")

        // The setter: slider stop -> minutes, instead of max(stop, 1).
        MinutesSetterFingerprint.method.apply {
            val maxIndex = indexOfFirstOrThrow(description = "Math.max") {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == "Ljava/lang/Math;" && ref.name == "max"
                    }
            }
            val positionRegister = getInstruction<FiveRegisterInstruction>(maxIndex).registerC
            val toFloatIndex = indexOfFirstOrThrow(maxIndex, "int-to-float") { it.opcode == Opcode.INT_TO_FLOAT }
            val minutesRegister = getInstruction<TwoRegisterInstruction>(toFloatIndex).registerA
            // invoke max, move-result, int-to-float -> one call returning the float minutes.
            removeInstructions(maxIndex, toFloatIndex - maxIndex + 1)
            addInstructions(
                maxIndex,
                """
                    invoke-static/range { v$positionRegister .. v$positionRegister }, $TIME_CONTROLS->minutesForPosition(I)F
                    move-result v$minutesRegister
                """,
            )
        }

        // The minutes slider: SliderRow(titleRes, valueText, max, value, onValueChange, ...); it
        // always starts at 0, so the minutes move right to make room for the sub-minute stops. Of
        // the two SliderRow calls (minutes, increment), the one fed by getMinPerGame().
        val sliders = mutableListOf<Triple<String, String, Int>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                code.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE ||
                        (instruction as ReferenceInstruction).reference.let { it !is MethodReference || !it.isSliderRow() }
                    ) return@forEachIndexed
                    val getter = code.take(index).lastOrNull { it.isGameTimeGetter() }
                    if (getter?.let { ((it as ReferenceInstruction).reference as MethodReference).name } == "getMinPerGame") {
                        sliders += Triple(classDef.type, method.name + method.parameterTypes.joinToString("", "(", ")"), index)
                    }
                }
            }
        }
        val (owner, signature, sliderIndex) = sliders.singleOrNull()
            ?: throw PatchException("Expected one minutes slider, found ${sliders.size}")
        mutableClassDefBy(owner).methods.single { it.name + it.parameterTypes.joinToString("", "(", ")") == signature }.apply {
            val maxRegister = getInstruction<RegisterRangeInstruction>(sliderIndex).startRegister + 2

            // Bottom-up, so earlier indices stay valid. 1) max: one more stop per sub-minute time.
            addInstructions(
                sliderIndex,
                """
                    invoke-static/range { v$maxRegister .. v$maxRegister }, $TIME_CONTROLS->sliderMax(I)I
                    move-result v$maxRegister
                """,
            )

            // 2) value: GameTime.getMinPerGame() -> sliderPosition(gameTime).
            val valueIndex = indexOfLast(sliderIndex) { it.isGameTimeGetter() }
            val gameTimeRegister = getInstruction<FiveRegisterInstruction>(valueIndex).registerC

            // 3) label: the "N min" string built just before -> "30 sec" below a minute.
            val labelIndex = indexOfLast(valueIndex) {
                it.opcode == Opcode.INVOKE_STATIC &&
                    ((it as ReferenceInstruction).reference as MethodReference).isQuantityString()
            }
            if (labelIndex < 0 || getInstruction(labelIndex + 1).opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("The minutes slider label was not found")
            }
            val labelRegister = getInstruction<OneRegisterInstruction>(labelIndex + 1).registerA
            if (labelRegister == gameTimeRegister || labelRegister > 15 || gameTimeRegister > 15) {
                throw PatchException("Unexpected slider registers")
            }

            replaceInstruction(
                valueIndex,
                "invoke-static { v$gameTimeRegister }, $TIME_CONTROLS->sliderPosition(Ljava/lang/Object;)I",
            )
            addInstructions(
                valueIndex,
                """
                    invoke-static { v$labelRegister, v$gameTimeRegister }, $TIME_CONTROLS->sliderLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$labelRegister
                """,
            )
        }

        // "0:30+1" where the app would print "0+1".
        CompactLabelFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $TIME_CONTROLS->compactLabel(Ljava/lang/Object;Landroid/content/Context;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :morphe_app_label
                    return-object v0
                """,
                ExternalLabel("morphe_app_label", getInstruction(0)),
            )
        }
    }
}
