package io.github.liongalahad.nuviotv.patches.subtitles.sdh

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsHubPatch
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private const val SETTINGS_RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime;"
private const val CUE_TRANSFORMER =
    "Lio/github/liongalahad/nuviotv/extension/subtitles/sdh/SdhCueTransformer;"
private const val MORPHE_DIALOG_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSdhModeDialogAction;"
private const val MORPHE_EXPAND_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSubtitlesExpandAction;"

@Suppress("unused")
val removeSdhAnnotationsPatch = bytecodePatch(
    name = "Remove SDH Annotations",
    description = "Adds Settings → Morphe → Subtitles and removes SDH annotations from Media3 subtitles when enabled.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsHubPatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        SettingsScreenFingerprint.method.apply {
            val ordinalCallIndex = SettingsScreenFingerprint.instructionMatches.last().index
            val resultInstruction = getInstruction<OneRegisterInstruction>(ordinalCallIndex + 1)
            val register = resultInstruction.registerA
            addInstructions(
                ordinalCallIndex + 2,
                """
                    invoke-static/range { v$register .. v$register }, $SETTINGS_RUNTIME->mapVisibilityOrdinal(I)I
                    move-result v$register
                """
            )
        }

        fun remapResourceLiterals(
            method: MutableMethod,
            replacements: Map<Int, Int>
        ) {
            method.implementation!!.instructions.withIndex().forEach { (index, instruction) ->
                val literal = instruction as? WideLiteralInstruction ?: return@forEach
                val oldValue = literal.wideLiteral.toInt()
                val newValue = replacements[oldValue] ?: return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const v$register, 0x${newValue.toString(16)}")
            }
        }

        remapResourceLiterals(
            ExperienceSettingsHeaderFingerprint.method,
            mapOf(
                0x7f110894 to 0x7f1108b9, // Advanced -> Morphe
                0x7f110550 to 0x7f1108ba // mode subtitle -> registered patch summary
            )
        )

        val nativeSwitchReference = NativeSettingsSwitchUsageFingerprint.method.implementation!!.instructions
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? MethodReference
            }
            .single { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 10 &&
                            parameters[0] == "Ljava/lang/String;" &&
                            parameters[1] == "Ljava/lang/String;" &&
                            parameters[2] == "Z" &&
                            parameters[3] == "Lkotlin/jvm/functions/Function0;" &&
                            parameters[5] == "Lkotlin/jvm/functions/Function0;" &&
                            parameters[6] == "Z" &&
                            parameters[8] == "I" &&
                            parameters[9] == "I"
                    }
            }
        val composerType = nativeSwitchReference.parameterTypes[7].toString()
        val nativeCardCalls = ExperienceSettingsCardFingerprint.method.implementation!!.instructions
            .withIndex()
            .filter { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@filter false
                reference.returnType == "V" &&
                    reference.parameterTypes.size >= 4 &&
                    reference.parameterTypes[0].toString() == "Ljava/lang/String;" &&
                    reference.parameterTypes[1].toString() == "Ljava/lang/String;" &&
                    reference.parameterTypes[2].toString() == "Ljava/lang/String;" &&
                    reference.parameterTypes[3].toString() == "Lkotlin/jvm/functions/Function0;"
            }
            .toList()
        check(nativeCardCalls.size == 2) {
            "Expected exactly two native Experience setting cards; found ${nativeCardCalls.size}"
        }
        nativeCardCalls.asReversed().forEach { (index, instruction) ->
            val range = instruction as? RegisterRangeInstruction
                ?: error("Native settings card call is not an invoke-range instruction")
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            val composerParameterIndex = reference.parameterTypes
                .indexOfFirst { it.toString() == composerType }
            check(composerParameterIndex >= 0) {
                "Native settings card has no $composerType composer parameter"
            }
            val composerWordOffset = reference.parameterTypes
                .take(composerParameterIndex)
                .sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
            val start = range.startRegister
            val composerRegister = start + composerWordOffset
            val nativeCardDescriptor = buildString {
                append(reference.definingClass)
                append("->")
                append(reference.name)
                append('(')
                reference.parameterTypes.forEach { append(it) }
                append(')')
                append(reference.returnType)
            }
            val nativeCardEndRegister = start + range.registerCount - 1

            ExperienceSettingsCardFingerprint.method.addInstructionsWithLabels(
                index + 1,
                """
                    invoke-static {}, $SETTINGS_RUNTIME->isSubtitlesExpanded()Z
                    move-result v${start + 6}
                    if-eqz v${start + 6}, :morphe_collapsed_$index
                    invoke-static {}, $SETTINGS_RUNTIME->sdhDialogTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $SETTINGS_RUNTIME->currentSdhModeTitle()Ljava/lang/String;
                    move-result-object v${start + 1}
                    const/4 v${start + 2}, 0x0
                    invoke-static {}, $MORPHE_DIALOG_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static/range { v$start .. v$nativeCardEndRegister }, $nativeCardDescriptor
                    sget-object v$start, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                    return-object v$start
                    :morphe_collapsed_$index
                    nop
                """
            )
            ExperienceSettingsCardFingerprint.method.addInstructions(
                index,
                """
                    invoke-static/range { v${start + 3} .. v${start + 3} }, $MORPHE_EXPAND_ACTION->wrap(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static {}, $SETTINGS_RUNTIME->subtitlesExpansionStatus()Ljava/lang/String;
                    move-result-object v${start + 2}
                """
            )
        }

        fun MutableMethod.hook(parameter: String, returnType: String) = addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $CUE_TRANSFORMER->clean($parameter)$returnType
                move-result-object p1
            """
        )

        CueGroupOutputFingerprint.method.apply {
            val constructorIndex = CueGroupOutputFingerprint.instructionMatches.first().index
            val constructorInstruction = getInstruction<com.android.tools.smali.dexlib2.iface.instruction.Instruction>(
                constructorIndex
            )
            val listRegister = when (constructorInstruction) {
                is FiveRegisterInstruction -> constructorInstruction.registerD
                is RegisterRangeInstruction -> constructorInstruction.startRegister + 1
                else -> error("CueGroup constructor call uses an unsupported instruction format")
            }
            addInstructions(
                constructorIndex,
                """
                    invoke-static { v$listRegister }, $CUE_TRANSFORMER->clean(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$listRegister
                """
            )
        }
        LegacyCueOutputFingerprint.method.hook("Ljava/util/List;", "Ljava/util/List;")
    }
}
