package io.github.liongalahad.nuviotv.patches.settings.hub

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSettingsRuntime;"
private const val PRIMARY_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorphePrimaryCategoryAction;"
private const val SUBTITLES_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSubtitlesExpandAction;"
private const val OVERALL_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheOverallRatingsToggleAction;"
private const val EPISODE_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheEpisodeRatingsDialogAction;"
private const val SDH_ACTION =
    "Lio/github/liongalahad/nuviotv/extension/settings/MorpheSdhModeDialogAction;"

/** Shared native Morphe pane used by every independently selectable configurable patch. */
internal val settingsUiPatch = bytecodePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(settingsHubPatch)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            SettingsScreenFingerprint,
            ExperienceSettingsHeaderFingerprint,
            ExperienceSettingsCardFingerprint,
            NativeSettingsSwitchUsageFingerprint
        ).forEach { it.matchAll(1..1) }

        SettingsScreenFingerprint.method.apply {
            val ordinalCallIndex = SettingsScreenFingerprint.instructionMatches.last().index
            val resultInstruction = getInstruction<OneRegisterInstruction>(ordinalCallIndex + 1)
            val register = resultInstruction.registerA
            addInstructions(
                ordinalCallIndex + 2,
                """
                    invoke-static/range { v$register .. v$register }, $RUNTIME->mapVisibilityOrdinal(I)I
                    move-result v$register
                """
            )
        }

        fun remapResourceLiterals(method: MutableMethod, replacements: Map<Int, Int>) {
            method.implementation!!.instructions.withIndex().forEach { (index, instruction) ->
                val literal = instruction as? WideLiteralInstruction ?: return@forEach
                val replacement = replacements[literal.wideLiteral.toInt()] ?: return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const v$register, 0x${replacement.toString(16)}")
            }
        }

        remapResourceLiterals(
            ExperienceSettingsHeaderFingerprint.method,
            mapOf(0x7f11089a to 0x7f1108bf, 0x7f110552 to 0x7f1108c0)
        )

        val nativeSwitchReference = NativeSettingsSwitchUsageFingerprint.method.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .single { reference ->
                reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString).let { parameters ->
                        parameters.size == 10 &&
                            parameters.take(4) == listOf(
                                "Ljava/lang/String;", "Ljava/lang/String;", "Z",
                                "Lkotlin/jvm/functions/Function0;"
                            )
                    }
            }
        val composerType = nativeSwitchReference.parameterTypes[7].toString()
        val nativeSwitchDescriptor = buildString {
            append(nativeSwitchReference.definingClass).append("->").append(nativeSwitchReference.name).append('(')
            nativeSwitchReference.parameterTypes.forEach { append(it) }
            append(')').append(nativeSwitchReference.returnType)
        }
        val nativeSwitchRegisterCount = nativeSwitchReference.parameterTypes.sumOf { type ->
            if (type.toString() == "J" || type.toString() == "D") 2 else 1
        }
        val nativeSwitchComposerOffset = nativeSwitchReference.parameterTypes
            .takeWhile { it.toString() != composerType }
            .sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2 else 1 }
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
                ?: error("Native settings card call is not invoke-range")
            val reference = (instruction as ReferenceInstruction).reference as MethodReference
            val composerParameterIndex = reference.parameterTypes.indexOfFirst { it.toString() == composerType }
            check(composerParameterIndex >= 0) { "Native settings card has no composer parameter" }
            val composerRegisterOffset = reference.parameterTypes.take(composerParameterIndex)
                .sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2 else 1 }
            val start = range.startRegister
            val end = start + range.registerCount - 1
            check(start + nativeSwitchRegisterCount - 1 <= end) {
                "Native settings card does not expose enough argument registers for the ratings toggle"
            }
            val descriptor = buildString {
                append(reference.definingClass).append("->").append(reference.name).append('(')
                reference.parameterTypes.forEach { append(it) }
                append(')').append(reference.returnType)
            }

            ExperienceSettingsCardFingerprint.method.addInstructionsWithLabels(
                index + 1,
                """
                    invoke-static {}, $RUNTIME->isPrimaryRatingsExpanded()Z
                    move-result v${start + 6}
                    if-eqz v${start + 6}, :morphe_primary_not_ratings_$index
                    invoke-static {}, $RUNTIME->overallRatingsTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->overallRatingsDescription()Ljava/lang/String;
                    move-result-object v${start + 1}
                    invoke-static {}, $RUNTIME->isOverallRatingsShown()Z
                    move-result v${start + 2}
                    invoke-static {}, $OVERALL_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    move-object/from16 v${start + nativeSwitchComposerOffset}, v${start + composerRegisterOffset}
                    const/16 v${start + nativeSwitchComposerOffset + 1}, 0x0
                    const/16 v${start + nativeSwitchComposerOffset + 2}, 0x70
                    invoke-static/range { v$start .. v${start + nativeSwitchRegisterCount - 1} }, $nativeSwitchDescriptor
                    const/16 v${start + 7}, 0x0
                    const/16 v${start + 8}, 0x0
                    const-wide/16 v${start + 9}, 0x0
                    invoke-static {}, $RUNTIME->episodeRatingsTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->currentEpisodeRatingsTitle()Ljava/lang/String;
                    move-result-object v${start + 1}
                    const/4 v${start + 2}, 0x0
                    invoke-static {}, $EPISODE_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static/range { v$start .. v$end }, $descriptor
                    :morphe_primary_not_ratings_$index
                    invoke-static {}, $RUNTIME->isPrimarySubtitlesExpanded()Z
                    move-result v${start + 6}
                    if-eqz v${start + 6}, :morphe_primary_children_done_$index
                    invoke-static {}, $RUNTIME->sdhDialogTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->currentSdhModeTitle()Ljava/lang/String;
                    move-result-object v${start + 1}
                    const/4 v${start + 2}, 0x0
                    invoke-static {}, $SDH_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static/range { v$start .. v$end }, $descriptor
                    :morphe_primary_children_done_$index
                    invoke-static {}, $RUNTIME->shouldRenderSecondarySubtitles()Z
                    move-result v${start + 6}
                    if-eqz v${start + 6}, :morphe_categories_done_$index
                    invoke-static {}, $RUNTIME->subtitlesCategoryTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->subtitlesCategoryDescription()Ljava/lang/String;
                    move-result-object v${start + 1}
                    invoke-static {}, $RUNTIME->subtitlesExpansionStatus()Ljava/lang/String;
                    move-result-object v${start + 2}
                    invoke-static {}, $SUBTITLES_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static/range { v$start .. v$end }, $descriptor
                    invoke-static {}, $RUNTIME->isSubtitlesExpanded()Z
                    move-result v${start + 6}
                    if-eqz v${start + 6}, :morphe_categories_done_$index
                    invoke-static {}, $RUNTIME->sdhDialogTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->currentSdhModeTitle()Ljava/lang/String;
                    move-result-object v${start + 1}
                    const/4 v${start + 2}, 0x0
                    invoke-static {}, $SDH_ACTION->create()Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static/range { v$start .. v$end }, $descriptor
                    :morphe_categories_done_$index
                    nop
                """
            )
            ExperienceSettingsCardFingerprint.method.addInstructions(
                index,
                """
                    invoke-static/range { v${start + 3} .. v${start + 3} }, $PRIMARY_ACTION->wrap(Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function0;
                    move-result-object v${start + 3}
                    invoke-static {}, $RUNTIME->primaryCategoryTitle()Ljava/lang/String;
                    move-result-object v$start
                    invoke-static {}, $RUNTIME->primaryCategoryDescription()Ljava/lang/String;
                    move-result-object v${start + 1}
                    invoke-static {}, $RUNTIME->primaryCategoryStatus()Ljava/lang/String;
                    move-result-object v${start + 2}
                """
            )
        }
    }
}
