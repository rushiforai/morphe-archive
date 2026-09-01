package io.github.liongalahad.nuviotv.patches.subtitles.localstoragesubtitles

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.liongalahad.nuviotv.patches.shared.Constants.NUVIO_COMPATIBILITY
import io.github.liongalahad.nuviotv.patches.shared.updates.patchedAppUpdatesPatch
import io.github.liongalahad.nuviotv.patches.settings.hub.settingsUiPatch
import org.w3c.dom.Element

private const val RUNTIME =
    "Lio/github/liongalahad/nuviotv/extension/subtitles/localstoragesubtitles/LocalSubtitleRuntime;"
private const val INIT_PROVIDER =
    "io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles.LocalSubtitleInitProvider"
private const val PICKER_ACTIVITY =
    "io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles.LocalSubtitlePickerActivity"
private const val SETTINGS_METADATA =
    "io.github.liongalahad.nuviotv.settings.provider.local_storage_subtitles"
private const val SETTINGS_CATEGORY =
    "io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles.LocalSubtitleSettingsCategory"

private val localSubtitleResources = resourcePatch {
    compatibleWith(NUVIO_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            application.appendChild(document.createElement("provider").apply {
                setAttribute("android:name", INIT_PROVIDER)
                setAttribute("android:authorities", "com.nuvio.tv.morphe.local-subtitles.init")
                setAttribute("android:exported", "false")
                setAttribute("android:initOrder", "90")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttribute("android:name", PICKER_ACTIVITY)
                setAttribute("android:exported", "false")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            })
            application.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", SETTINGS_METADATA)
                setAttribute("android:value", SETTINGS_CATEGORY)
            })
        }
    }
}

private fun MethodReference.descriptor(): String = buildString {
    append(definingClass).append("->").append(name).append('(')
    parameterTypes.forEach { append(it) }
    append(')').append(returnType)
}

private fun receiverRegister(instruction: Any): Int = when (instruction) {
    is FiveRegisterInstruction -> instruction.registerC
    is RegisterRangeInstruction -> instruction.startRegister
    else -> error("Unsupported invoke register format")
}

private fun argumentRegister(instruction: Any, argumentIndex: Int): Int = when (instruction) {
    is FiveRegisterInstruction -> listOf(
        instruction.registerC,
        instruction.registerD,
        instruction.registerE,
        instruction.registerF,
        instruction.registerG
    )[argumentIndex]
    is RegisterRangeInstruction -> instruction.startRegister + argumentIndex
    else -> error("Unsupported invoke register format")
}

@Suppress("unused")
val localstoragesubtitlesPatch = bytecodePatch(
    name = "Allow Importing Subs from Local Storage",
    description = "Imports device subtitle files into Nuvio's ExoPlayer subtitle menu without rebuilding active playback.",
    default = false
) {
    compatibleWith(NUVIO_COMPATIBILITY)
    dependsOn(patchedAppUpdatesPatch, settingsUiPatch, localSubtitleResources)
    extendWith("extensions/nuviotv.mpe")

    execute {
        listOf(
            SubtitleOverlayFingerprint,
            SubtitleOptionBuilderFingerprint,
            SubtitleInitialFocusFingerprint,
            PlayerEventDispatcherFingerprint,
            RememberAddonSubtitleFingerprint,
            RememberInternalSubtitleFingerprint,
            RememberDisabledSubtitleFingerprint,
            SelectAddonSubtitleFingerprint,
            DisableSubtitlesFingerprint,
            SelectInternalSubtitleFingerprint,
            RestoreTrackPreferencesFingerprint,
            PersistTrackPreferencesFingerprint,
            LoadTrackPreferencesFingerprint,
            SubtitleConfigurationFingerprint,
            SubtitleTextDownloaderFingerprint
        ).forEach { it.matchAll(1..1) }

        val selectMethod = SelectAddonSubtitleFingerprint.method
        val controllerType = selectMethod.parameterTypes.first().toString()
        val engineCandidates = selectMethod.implementation!!.instructions.mapNotNull { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapNotNull null
            reference.takeIf {
                it.returnType == "Z" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf(controllerType)
            }
        }
        val engineCandidateGroups = engineCandidates.groupBy(MethodReference::descriptor)
            .entries.sortedByDescending { it.value.size }
        check(engineCandidateGroups.size >= 2 && engineCandidateGroups[0].value.size > engineCandidateGroups[1].value.size) {
            "Unable to distinguish Nuvio's repeated active-engine helper"
        }
        val isUsingMpvReference = engineCandidateGroups.first().value.first()

        val preferenceFields = PersistTrackPreferencesFingerprint.method.implementation!!.instructions
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }
            .filter { it.definingClass == controllerType }
        val controllerStringFields = preferenceFields
            .filter { it.type == "Ljava/lang/String;" }
            .distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
        check(controllerStringFields.size >= 2) {
            "Unable to identify Nuvio's content identity field"
        }
        val contentIdField = controllerStringFields.first()

        val episodeIdentityFields = LoadTrackPreferencesFingerprint.method.implementation!!.instructions
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }
            .filter { it.definingClass == controllerType && it.type == "Ljava/lang/Integer;" }
            .distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
        check(episodeIdentityFields.size == 2) {
            "Unable to identify Nuvio's season and episode identity fields"
        }
        val seasonField = episodeIdentityFields[0]
        val episodeField = episodeIdentityFields[1]

        fun FieldReference.descriptor() = "$definingClass->$name:$type"

        PlayerEventDispatcherFingerprint.method.apply {
            check(implementation!!.registerCount - parameterTypes.size >= 4) {
                "Player event dispatcher has fewer than four safe local scratch registers"
            }
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $RUNTIME->shouldSuppressTransientDismiss(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_local_dispatch_continue
                    return-void
                    :morphe_local_dispatch_continue
                    nop
                    invoke-static/range { p0 .. p0 }, $RUNTIME->observeController(Ljava/lang/Object;)V
                    move-object/from16 v3, p0
                    iget-object v0, v3, ${contentIdField.descriptor()}
                    iget-object v1, v3, ${seasonField.descriptor()}
                    iget-object v2, v3, ${episodeField.descriptor()}
                    invoke-static { v0, v1, v2 }, $RUNTIME->observeContentIdentity(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
                    invoke-static/range { p0 .. p0 }, ${isUsingMpvReference.descriptor()}
                    move-result v0
                    invoke-static { v0 }, $RUNTIME->setMpvActive(Z)V
                """
            )
        }

        SubtitleOverlayFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val addonSessionCopy = instructions.withIndex().first { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@first false
                reference.definingClass == SUBTITLE && reference.name == "copy\$default"
            }
            val addonSessionRefreshBranch = instructions.take(addonSessionCopy.index).withIndex()
                .last { (_, instruction) -> instruction.opcode == Opcode.IF_NEZ }
            val addonSessionChangedRegister =
                (addonSessionRefreshBranch.value as OneRegisterInstruction).registerA
            check(addonSessionChangedRegister <= 15) {
                "Addon session refresh register cannot be encoded safely"
            }
            val languageCall = instructions.withIndex().last { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@last false
                reference.definingClass == SUBTITLE_COMPANION &&
                    reference.name == "languageCodeToName" &&
                    reference.returnType == "Ljava/lang/String;"
            }
            val languageResult = (instructions[languageCall.index + 1] as? OneRegisterInstruction)?.registerA
                ?: error("Subtitle language label call has no object result")
            val languageKey = argumentRegister(languageCall.value, 1)
            check(languageResult <= 15 && languageKey <= 15) {
                "Subtitle language label registers cannot be encoded safely"
            }

            val languageItemConstructor = instructions.withIndex()
                .drop(languageCall.index + 2)
                .first { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@first false
                    reference.name == "<init>" &&
                        reference.returnType == "V" &&
                        reference.parameterTypes.map(CharSequence::toString) == listOf(
                            "Ljava/lang/String;", "Ljava/lang/String;", "I"
                        )
                }
            val itemKey = argumentRegister(languageItemConstructor.value, 1)
            val itemCount = argumentRegister(languageItemConstructor.value, 3)
            check(itemKey <= 15 && itemCount <= 15) {
                "Subtitle language item registers cannot be encoded safely"
            }

            val languageListPlus = instructions.withIndex()
                .drop(languageItemConstructor.index + 1)
                .first { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@first false
                    reference.name == "plus" &&
                        reference.returnType == "Ljava/util/List;" &&
                        reference.parameterTypes.map(CharSequence::toString) == listOf(
                            "Ljava/util/Collection;", "Ljava/lang/Iterable;"
                        )
                }
            val languageListRegister =
                (instructions[languageListPlus.index + 1] as? OneRegisterInstruction)?.registerA
                    ?: error("Subtitle language list call has no object result")
            check(languageListRegister <= 15) {
                "Subtitle language list register cannot be encoded safely"
            }

            // Insert from the highest original instruction index down so lower-index injections
            // cannot displace a later target.
            addInstructions(
                languageListPlus.index + 2,
                """
                    invoke-static { v$languageListRegister }, $RUNTIME->prioritizeLanguageRail(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$languageListRegister
                """
            )

            addInstructions(
                languageItemConstructor.index,
                """
                    invoke-static { v$itemKey, v$itemCount }, $RUNTIME->adjustLanguageCount(Ljava/lang/String;I)I
                    move-result v$itemCount
                """
            )
            addInstructions(
                languageCall.index + 2,
                """
                    invoke-static { v$languageResult, v$languageKey }, $RUNTIME->rewriteLanguageLabel(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$languageResult
                """
            )
            addInstructions(
                addonSessionRefreshBranch.index,
                """
                    invoke-static { v$addonSessionChangedRegister }, $RUNTIME->refreshSessionAddonList(Z)Z
                    move-result v$addonSessionChangedRegister
                """
            )
            addInstructions(
                0,
                """
                    invoke-static/range { p3 .. p3 }, $RUNTIME->mergeSubtitles(Ljava/util/List;)Ljava/util/List;
                    move-result-object p3
                    invoke-static/range { p10 .. p13 }, $RUNTIME->wrapSelection(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)Lkotlin/jvm/functions/Function1;
                    move-result-object p10
                """
            )
        }

        SubtitleOptionBuilderFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val languageCall = instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == SUBTITLE_COMPANION &&
                    reference.name == "languageCodeToName" &&
                    reference.returnType == "Ljava/lang/String;"
            }
            val titleRegister = (instructions[languageCall.index + 1] as? OneRegisterInstruction)?.registerA
                ?: error("Subtitle option language call has no object result")
            val getLangCall = instructions.take(languageCall.index).withIndex().last { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@last false
                reference.definingClass == SUBTITLE && reference.name == "getLang"
            }
            val subtitleRegister = receiverRegister(getLangCall.value)

            val getIdCall = instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == SUBTITLE && reference.name == "getId"
            }
            val idRegister = (instructions[getIdCall.index + 1] as? OneRegisterInstruction)?.registerA
                ?: error("Subtitle option ID call has no object result")
            val idSubtitleRegister = receiverRegister(getIdCall.value)
            val optionConstructor = instructions.withIndex()
                .drop(getIdCall.index + 1)
                .first { (_, instruction) ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@first false
                    reference.name == "<init>" &&
                        reference.returnType == "V" &&
                        reference.parameterTypes.size == 9 &&
                        reference.parameterTypes[5].toString() == "Z" &&
                        reference.parameterTypes[7].toString() == SUBTITLE
                }
            val selectedRegister = argumentRegister(optionConstructor.value, 6)
            val optionSubtitleRegister = argumentRegister(optionConstructor.value, 8)
            check(
                listOf(
                    titleRegister,
                    subtitleRegister,
                    idRegister,
                    idSubtitleRegister,
                    selectedRegister,
                    optionSubtitleRegister
                ).all { it <= 15 }
            ) {
                "Subtitle option registers cannot be encoded safely"
            }

            addInstructions(
                optionConstructor.index,
                """
                    invoke-static { v$selectedRegister, v$optionSubtitleRegister }, $RUNTIME->selectableOptionState(ZLjava/lang/Object;)Z
                    move-result v$selectedRegister
                """
            )

            addInstructions(
                getIdCall.index + 2,
                """
                    invoke-static { v$idRegister, v$idSubtitleRegister }, $RUNTIME->rewriteOptionMeta(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$idRegister
                """
            )
            addInstructions(
                languageCall.index + 2,
                """
                    invoke-static { v$titleRegister, v$subtitleRegister }, $RUNTIME->rewriteOptionTitle(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$titleRegister
                """
            )
        }

        SubtitleInitialFocusFingerprint.method.apply {
            val stringFields = implementation!!.instructions.mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference as? FieldReference
            }.filter {
                it.definingClass == definingClass && it.type == "Ljava/lang/String;"
            }.distinctBy { "${it.definingClass}->${it.name}:${it.type}" }
            check(stringFields.size == 2) {
                "Unable to identify Nuvio's subtitle overlay focus fields"
            }
            check(implementation!!.registerCount - parameterTypes.size - 1 >= 2) {
                "Subtitle focus restore has fewer than two safe local scratch registers"
            }
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v1, p0
                    iget-object v0, v1, ${stringFields[0].descriptor()}
                    invoke-static { v0 }, $RUNTIME->preferLanguageRailFocus(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :morphe_local_focus_continue
                    const/4 v0, 0x0
                    iput-object v0, v1, ${stringFields[1].descriptor()}
                    :morphe_local_focus_continue
                    nop
                """
            )
        }

        SubtitleConfigurationFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val getLangCall = instructions.withIndex().single { (_, instruction) ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@single false
                reference.definingClass == SUBTITLE && reference.name == "getLang"
            }
            val languageRegister = (instructions[getLangCall.index + 1] as? OneRegisterInstruction)?.registerA
                ?: error("Subtitle configuration language call has no object result")
            val subtitleRegister = receiverRegister(getLangCall.value)
            check(languageRegister <= 15 && subtitleRegister <= 15) {
                "Subtitle configuration registers cannot be encoded safely"
            }
            addInstructions(
                getLangCall.index + 2,
                """
                    invoke-static { v$languageRegister, v$subtitleRegister }, $RUNTIME->playbackLanguage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v$languageRegister
                """
            )
        }

        // Nuvio's supported-format sidecar path preserves the playing media source, but its
        // loader accepts HTTP URLs only. Supply exact patch-owned private files before OkHttp.
        SubtitleTextDownloaderFingerprint.method.apply {
            check(implementation!!.registerCount > parameterTypes.size) {
                "Subtitle text downloader has no safe local scratch register"
            }
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $RUNTIME->localSubtitleText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :morphe_local_subtitle_download_continue
                    return-object v0
                    :morphe_local_subtitle_download_continue
                    nop
                """
            )
        }

        RememberAddonSubtitleFingerprint.method.apply {
            check(implementation!!.registerCount - parameterTypes.size >= 5) {
                "Remember-addon method has fewer than five safe local scratch registers"
            }
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v4, p0
                    iget-object v0, v4, ${contentIdField.descriptor()}
                    iget-object v1, v4, ${seasonField.descriptor()}
                    iget-object v2, v4, ${episodeField.descriptor()}
                    move-object/from16 v3, p1
                    invoke-static { v0, v1, v2, v3 }, $RUNTIME->rememberImportedSelection(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_local_remember_continue
                    return-void
                    :morphe_local_remember_continue
                    nop
                """
            )
        }

        listOf(
            RememberInternalSubtitleFingerprint.method,
            RememberDisabledSubtitleFingerprint.method
        ).forEach { method ->
            check(method.implementation!!.registerCount - method.parameterTypes.size >= 4) {
                "Remember non-addon method has fewer than four safe local scratch registers"
            }
            method.addInstructions(
                0,
                """
                    move-object/from16 v3, p0
                    iget-object v0, v3, ${contentIdField.descriptor()}
                    iget-object v1, v3, ${seasonField.descriptor()}
                    iget-object v2, v3, ${episodeField.descriptor()}
                    invoke-static { v0, v1, v2 }, $RUNTIME->clearImportedSelection(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
                """
            )
        }

        RestoreTrackPreferencesFingerprint.method.apply {
            check(implementation!!.registerCount - parameterTypes.size >= 5) {
                "Track-preference restore has fewer than five safe local scratch registers"
            }
            addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v4, p0
                    iget-object v0, v4, ${contentIdField.descriptor()}
                    iget-object v1, v4, ${seasonField.descriptor()}
                    iget-object v2, v4, ${episodeField.descriptor()}
                    invoke-static { v4, v0, v1, v2 }, $RUNTIME->restoredSubtitle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Object;
                    move-result-object v3
                    if-nez v3, :morphe_local_restore_select
                    invoke-static {}, $RUNTIME->shouldBlockNuvioSubtitleSelection()Z
                    move-result v0
                    if-eqz v0, :morphe_local_restore_continue
                    return-void
                    :morphe_local_restore_select
                    check-cast v3, $SUBTITLE
                    move-object/from16 v0, p0
                    invoke-static { v0, v3 }, ${selectMethod.descriptor()}
                    return-void
                    :morphe_local_restore_continue
                    nop
                """
            )
        }

        // Nuvio's reconciliation may try to restore a stale internal/disabled choice while the
        // selected local sidecar is settling. Explicit user choices clear this guard first.
        listOf(
            DisableSubtitlesFingerprint.method,
            SelectInternalSubtitleFingerprint.method
        ).forEach { method ->
            check(method.implementation!!.registerCount > method.parameterTypes.size) {
                "Subtitle selection method has no safe local scratch register"
            }
            method.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $RUNTIME->shouldBlockNuvioSubtitleSelection()Z
                    move-result v0
                    if-eqz v0, :morphe_local_native_selection_continue
                    return-void
                    :morphe_local_native_selection_continue
                    nop
                """
            )
        }

        selectMethod.apply {
            check(implementation!!.registerCount > parameterTypes.size) {
                "Select-addon method has no safe local scratch register"
            }
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $RUNTIME->rejectImportedSubtitleForMpv(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_local_select_continue
                    return-void
                    :morphe_local_select_continue
                    nop
                """
            )
        }
    }
}
