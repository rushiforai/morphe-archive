package dev.hyzor.patches.chesscom.timecontrol

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.indexOfFirstOrThrow
import dev.hyzor.patches.chesscom.shared.indexOfLast
import dev.hyzor.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TIME_CONTROLS = "${Constants.EXTENSION_PACKAGE}/timecontrol/TimeControls;"

private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

private fun MethodReference.isSliderRow() =
    parameterTypes.size == 8 && returnType == "V" &&
        parameterTypes.take(6).map { it.toString() } ==
        listOf("I", "Ljava/lang/String;", "I", "I", "I", "Lkotlin/jvm/functions/Function1;")

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
        // 4.10.23 moved the setter into a shared synthetic lambda (one switch case).
        val sharedSetter = classDefByOrNull { classDef ->
            classDef.methods.any { method ->
                val instructions = method.implementation?.instructions ?: return@any false
                instructions.any {
                    it.opcode == Opcode.INVOKE_STATIC && (it as? ReferenceInstruction)?.reference.let { reference ->
                        reference is MethodReference && reference.definingClass == "Ljava/lang/Math;" && reference.name == "max"
                    }
                } && instructions.any {
                    (it as? ReferenceInstruction)?.reference.let { reference ->
                        reference is MethodReference && reference.definingClass == "Lcom/chess/entities/GameTime;" &&
                            reference.name == "copy\$default"
                    }
                }
            }
        }?.let { classDef ->
            mutableClassDefBy(classDef).methods.single { method ->
                val instructions = method.implementation?.instructions ?: return@single false
                instructions.any {
                    it.opcode == Opcode.INVOKE_STATIC && (it as? ReferenceInstruction)?.reference.let { reference ->
                        reference is MethodReference && reference.definingClass == "Ljava/lang/Math;" && reference.name == "max"
                    }
                } && instructions.any {
                    (it as? ReferenceInstruction)?.reference.let { reference ->
                        reference is MethodReference && reference.definingClass == "Lcom/chess/entities/GameTime;" &&
                            reference.name == "copy\$default"
                    }
                }
            }
        }
        (MinutesSetterFingerprint.matchOrNull()?.method ?: sharedSetter
            ?: throw PatchException("The minutes setter was not found")).apply {
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
                    invoke-static { v$positionRegister }, $TIME_CONTROLS->minutesForPosition(I)F
                    move-result v$minutesRegister
                """,
            )
        }

        // The minutes slider: SliderRow(titleRes, valueText, min, max, value, onValueChange, ...).
        // 4.10.23 uses a shared stepper; only the setter mapping is ported for now.
        CustomTimeSelectorFingerprint.matchOrNull()?.method?.apply {
            val sliderIndex = indexOfFirstOrThrow(description = "the minutes slider") {
                it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    ((it as ReferenceInstruction).reference as MethodReference).isSliderRow()
            }
            val firstArgument = getInstruction<RegisterRangeInstruction>(sliderIndex).startRegister
            val minRegister = firstArgument + 2
            val valueRegister = firstArgument + 4

            // Bottom-up, so earlier indices stay valid. 1) min: the constant 0 -> sliderMin().
            val minIndex = indexOfLast(sliderIndex) {
                it.opcode in CONSTANTS && it is NarrowLiteralInstruction &&
                    (it as OneRegisterInstruction).registerA == minRegister
            }
            if (minIndex < 0) throw PatchException("The minutes slider minimum was not found")
            replaceInstruction(minIndex, "invoke-static { }, $TIME_CONTROLS->sliderMin()I")
            addInstruction(minIndex + 1, "move-result v$minRegister")

            // 2) value: GameTime.getMinPerGame() -> sliderPosition(gameTime).
            val valueIndex = indexOfLast(minIndex) {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                        ref.definingClass == "Lcom/chess/entities/GameTime;" && ref.name == "getMinPerGame"
                    }
            }
            if (valueIndex < 0 || getInstruction<OneRegisterInstruction>(valueIndex + 1).registerA != valueRegister) {
                throw PatchException("The minutes slider value was not found")
            }
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
            if (labelRegister == gameTimeRegister) throw PatchException("Unexpected slider registers")

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

        // 4.10.23's custom time row: the shared stepper (i) and the minutes row (b) in gamesetup.
        if (CustomTimeSelectorFingerprint.matchOrNull() == null) {
            val gamesetup = mutableClassDefBy("Lcom/chess/features/gamesetup/compose/g;")
            // 1) The slider range: 0..max -> sliderMin()..max for the minutes stepper (max 120).
            val stepper = gamesetup.methods.single {
                it.name == "i" && it.returnType == "V" && it.parameterTypes.size == 7
            }
            stepper.apply {
                val code = instructions.toList()
                val rangeIndex = code.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.INVOKE_DIRECT &&
                        (instruction as? ReferenceInstruction)?.reference.let { reference ->
                            reference is MethodReference && reference.definingClass == "Lcom/google/android/vk0;" &&
                                reference.name == "<init>" && reference.parameterTypes.size == 2
                        }
                }
                if (rangeIndex < 0) throw PatchException("The time slider range was not found")
                val range = getInstruction<FiveRegisterInstruction>(rangeIndex)
                // The receiver is registerC; the two float arguments follow it.
                val minFloat = range.registerD
                val maxFloat = range.registerE
                val toFloatMin = indexOfLast(rangeIndex) {
                    it.opcode == Opcode.INT_TO_FLOAT && (it as OneRegisterInstruction).registerA == minFloat
                }
                val toFloatMax = indexOfLast(rangeIndex) {
                    it.opcode == Opcode.INT_TO_FLOAT && (it as OneRegisterInstruction).registerA == maxFloat
                }
                if (toFloatMin < 0 || toFloatMax < 0) throw PatchException("The time slider bounds were not found")
                val minInt = getInstruction<TwoRegisterInstruction>(toFloatMin).registerB
                val maxInt = getInstruction<TwoRegisterInstruction>(toFloatMax).registerB
                val minConst = indexOfLast(toFloatMin) {
                    it.opcode in CONSTANTS && (it as OneRegisterInstruction).registerA == minInt
                }
                if (minConst < 0) throw PatchException("The time slider minimum was not found")
                // v11 is free until the slider call below.
                val spare = 11
                val target = getInstruction(toFloatMin)
                replaceInstruction(minConst, "const/16 v$spare, 120")
                addInstructionsWithLabels(
                    minConst + 1,
                    """
                        if-ne p2, v$spare, :morphe_time_min
                        invoke-static { }, $TIME_CONTROLS->sliderMin()I
                        move-result v$minInt
                    """,
                    ExternalLabel("morphe_time_min", target),
                )
            }

            // 2) The minutes row: show the slider position and the sub-minute label.
            val minutesRow = gamesetup.methods.single {
                it.name == "b" && it.returnType == "V" && it.parameterTypes.size == 4
            }
            minutesRow.apply {
                val code = instructions.toList()
                val callIndex = code.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        (instruction as? ReferenceInstruction)?.reference.let { reference ->
                            reference is MethodReference && reference.definingClass == gamesetup.type &&
                                reference.name == "i" && reference.parameterTypes.size == 7
                        }
                }
                if (callIndex < 0) throw PatchException("The minutes row was not found")
                val call = getInstruction<RegisterRangeInstruction>(callIndex)
                val first = call.startRegister
                val label = "v${first + 1}"
                // The minutes value is read from the row's GameTime just before the call.
                val valueIndex = code.take(callIndex).indexOfLast { instruction ->
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        (instruction as? ReferenceInstruction)?.reference.let { reference ->
                            reference is MethodReference && reference.definingClass == "Lcom/chess/entities/GameTime;" &&
                                reference.name == "getMinPerGame"
                        }
                }
                if (valueIndex < 0) throw PatchException("The time row's minutes were not found")
                val receiver = getInstruction<FiveRegisterInstruction>(valueIndex).registerC
                addInstructions(
                    valueIndex,
                    """
                        invoke-static { $label, v$receiver }, $TIME_CONTROLS->sliderLabel(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                        move-result-object $label
                    """,
                )
                replaceInstruction(
                    valueIndex + 2,
                    "invoke-static { v$receiver }, $TIME_CONTROLS->sliderPosition(Ljava/lang/Object;)I",
                )
            }
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
