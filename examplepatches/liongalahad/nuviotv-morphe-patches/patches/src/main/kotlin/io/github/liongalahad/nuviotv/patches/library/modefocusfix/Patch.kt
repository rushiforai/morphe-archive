package io.github.liongalahad.nuviotv.patches.library.modefocusfix

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/library/modefocusfix/LibraryModeFocusFixRuntime;"

@Suppress("unused")
val libraryModeFocusFixPatch = bytecodePatch(
    name = "Library Mode Focus Fix",
    description = "Returns Library focus to the previously selected Saved or Cloud mode.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    extendWith("extensions/nuviotv.mpe")

    execute {
        LibraryModeSelectorFingerprint.matchAll(1..1)
        LibraryFilterRowFingerprint.matchAll(1..1)
        CloudLibraryFilterRowFingerprint.matchAll(1..1)

        val selectorMethod = LibraryModeSelectorFingerprint.method
        selectorMethod.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $RUNTIME->rememberActiveLibraryMode(Ljava/lang/Object;)V"
        )

        val selectorInstructions = selectorMethod.implementation!!.instructions
        val enumType = selectorInstructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        }.single { it.type == "Lkotlin/enums/EnumEntries;" }.definingClass
        val focusModifierCallIndex = selectorInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.definingClass == "Lz1/d;" && reference.name == "d" &&
                reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Lu1/q;", "Lz1/y;")
        }
        check(focusModifierCallIndex >= 0) {
            "Library mode focus modifier call was not found"
        }
        val focusIndexBranchIndex = focusModifierCallIndex - 2
        val focusIndexBranch = selectorInstructions[focusIndexBranchIndex]
            as? BuilderInstruction21t
            ?: error("Library mode focus index branch is not a one-register branch")
        check(focusIndexBranch.opcode == Opcode.IF_NEZ) {
            "Library mode focus is no longer guarded by the row index"
        }
        val selectedModeBranch = selectorInstructions.withIndex()
            .drop(focusModifierCallIndex + 1)
            .take(12)
            .firstOrNull { (_, instruction) -> instruction.opcode == Opcode.IF_EQZ }
            ?.value as? OneRegisterInstruction
            ?: error("Library mode selected-state branch was not found")
        val rowInstructions = selectorMethod.implementation!!.instructions
        val modeRegister = rowInstructions.withIndex()
            .take(focusModifierCallIndex)
            .lastOrNull { (_, instruction) ->
                instruction.opcode == Opcode.CHECK_CAST &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                    enumType
            }?.value as? OneRegisterInstruction
            ?: error("Library mode loop value was not found")
        val selectedFocusResult = rowInstructions.getOrNull(focusModifierCallIndex + 1)
            as? OneRegisterInstruction
            ?: error("Selected Library mode focus modifier no longer has an object result")
        check(selectedFocusResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Selected Library mode focus modifier no longer returns an object"
        }
        val selectedModifierMove = rowInstructions.withIndex()
            .drop(focusModifierCallIndex + 2)
            .take(5)
            .firstOrNull { (_, instruction) ->
                (instruction as? TwoRegisterInstruction)?.registerB ==
                    selectedFocusResult.registerA
            } ?: error("Selected Library mode modifier merge was not found")
        val mergedModifierRegister =
            (selectedModifierMove.value as TwoRegisterInstruction).registerA
        val unselectedModifierMove = rowInstructions.withIndex()
            .drop(selectedModifierMove.index + 1)
            .take(8)
            .firstOrNull { (_, instruction) ->
                (instruction as? TwoRegisterInstruction)?.registerA == mergedModifierRegister
            } ?: error("Unselected Library mode modifier merge was not found")
        check(
            modeRegister.registerA < 16 &&
                selectedModeBranch.registerA < 16 &&
                selectedFocusResult.registerA < 16
        ) {
            "Library mode focus temporaries are not encodable in a three-register invocation"
        }
        selectorMethod.addInstructions(
            unselectedModifierMove.index + 1,
            """
                move-object/from16 v${selectedFocusResult.registerA}, v$mergedModifierRegister
                invoke-static { v${modeRegister.registerA}, v${selectedModeBranch.registerA}, v${selectedFocusResult.registerA} }, $RUNTIME->attachModeFocusRequester(Ljava/lang/Object;ZLjava/lang/Object;)Ljava/lang/Object;
                move-result-object v$mergedModifierRegister
                check-cast v$mergedModifierRegister, Lu1/q;
            """
        )
        selectorMethod.addInstructions(
            focusModifierCallIndex + 2,
            """
                invoke-static { v${modeRegister.registerA}, v${selectedModeBranch.registerA}, v${selectedFocusResult.registerA} }, $RUNTIME->attachModeFocusRequester(Ljava/lang/Object;ZLjava/lang/Object;)Ljava/lang/Object;
                move-result-object v${selectedFocusResult.registerA}
                check-cast v${selectedFocusResult.registerA}, Lu1/q;
            """
        )

        val filterMethod = LibraryFilterRowFingerprint.method
        val filterInstructions = filterMethod.implementation!!.instructions
        val conditionalFocusResults = filterInstructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lz1/d;" || reference.name != "d" ||
                reference.parameterTypes.map(CharSequence::toString) !=
                listOf("Lu1/q;", "Lz1/y;")) return@mapIndexedNotNull null
            val result = filterInstructions.getOrNull(index + 1) as? OneRegisterInstruction
                ?: error("Library filter focus modifier no longer has an object result")
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Library filter focus modifier no longer returns an object"
            }
            index + 1 to result.registerA
        }
        check(conditionalFocusResults.size == 2) {
            "Expected two conditional Library filter focus modifiers"
        }
        conditionalFocusResults.sortedByDescending { it.first }
            .forEach { (resultIndex, register) ->
                filterMethod.addInstructions(
                    resultIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $RUNTIME->restoreActiveModeOnUp(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, Lu1/q;
                    """
                )
            }

        val cloudFilterMethod = CloudLibraryFilterRowFingerprint.method
        val cloudFilterInstructions = cloudFilterMethod.implementation!!.instructions
        val cloudFilterModifierResults = cloudFilterInstructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lc0/w1;" || reference.name != "a" ||
                reference.parameterTypes.map(CharSequence::toString) !=
                listOf("Lu1/q;", "F") || reference.returnType != "Lu1/q;"
            ) return@mapIndexedNotNull null
            val result = cloudFilterInstructions.getOrNull(index + 1) as? OneRegisterInstruction
                ?: error("Cloud Library filter modifier no longer has an object result")
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Cloud Library filter modifier no longer returns an object"
            }
            index + 1 to result.registerA
        }
        check(cloudFilterModifierResults.size == 2) {
            "Expected two Cloud Library filter modifiers"
        }
        cloudFilterModifierResults.sortedByDescending { it.first }
            .forEach { (resultIndex, register) ->
                cloudFilterMethod.addInstructions(
                    resultIndex + 1,
                    """
                        invoke-static/range { v$register .. v$register }, $RUNTIME->restoreActiveModeOnUp(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, Lu1/q;
                    """
                )
            }
    }
}
