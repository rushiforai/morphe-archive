package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

private const val APPEND_COMMIT_HELPER = "ramblerEnhancementsAppendCommit"
private const val CHAR_SEQUENCE_TYPE = "Ljava/lang/CharSequence;"

private const val VERSION_NOTE =
    "Verified on Gboard 18.5.4 (current GboardWu target); newer versions are best-effort and unverified."

@Suppress("unused")
val ramblerWaveformAnimationPatch = bytecodePatch(
    name = "Rambler Waveform Animation",
    description = "Replaces Gboard Rambler's light bar with Hex by Anomaly's animations. " +
        "Listening (while you speak): Hex Dot Scope (braided dot oscilloscope), Hex Android Wave (7-row scrolling sine wave), or Gboard Default. " +
        "Processing (after you stop speaking while transcribing): Flow, Pulse, or Sweep. " +
        "Includes independent Listening/Processing colors and minimal Hex tuning (Strip trace vs iOS halo, dot spacing, glow, voice response). " +
        "Works alongside upstream GboardWu (requires Advanced Voice Typing in GboardWu). $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerWaveformResourcePatch,
    )

    execute {
        val state = RamblerPatchStateStore.state(this)
        state.selectedFeatures.add(RamblerFeature.WAVEFORM)

        val targets = RamblerDynamicResolver.resolveWaveformTargets(this)
        state.waveformTargets = targets

        val attachImpl = targets.attachMethod.implementation
            ?: throw PatchException("Rambler attach method has no implementation")
        if (attachImpl.registerCount !in 3..16) {
            throw PatchException("Rambler attach register count out of range: ${attachImpl.registerCount}")
        }
        val speechImpl = targets.speechLevelMethod.implementation
            ?: throw PatchException("Rambler speech-level method has no implementation")
        if (speechImpl.registerCount !in 3..16) {
            throw PatchException("Rambler speech-level register count out of range: ${speechImpl.registerCount}")
        }
        val drawImpl = targets.drawMethod.implementation
            ?: throw PatchException("Rambler draw method has no implementation")
        if (drawImpl.registerCount !in 2..16) {
            throw PatchException("Rambler draw register count out of range: ${drawImpl.registerCount}")
        }
        val firstDrawInstruction = drawImpl.instructions.firstOrNull()
            ?: throw PatchException("Rambler draw method has no instructions")

        targets.attachMethod.addInstructions(
            0,
            "invoke-static {p1, p2}, $WAVEFORM_RUNTIME_TYPE->onAttach(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V",
        )

        targets.speechLevelMethod.addInstructions(
            0,
            "invoke-static {p0, p1, p2}, $WAVEFORM_RUNTIME_TYPE->onSpeechLevel(ILandroid/graphics/drawable/Drawable;Landroid/view/View;)V",
        )

        targets.drawMethod.addInstructionsWithLabels(
            0,
            """
            invoke-static {p0, p1}, $WAVEFORM_RUNTIME_TYPE->maybeDraw(Landroid/graphics/drawable/Drawable;Landroid/graphics/Canvas;)Z
            move-result v0
            if-eqz v0, :rambler_waveform_stock_draw
            return-void
            """.trimIndent(),
            ExternalLabel("rambler_waveform_stock_draw", firstDrawInstruction),
        )
    }
}

@Suppress("unused")
val ramblerCustomInstructionsPatch = bytecodePatch(
    name = "Rambler Custom Instructions",
    description = "Enables persistent custom style/formatting instructions for Gboard Rambler (credited to nl-morphe-patches) with Per-app custom instructions (named app rules, searchable app picker, and disabled apps) in Gboard Settings -> Voice typing -> Rambler voice typing and Rambler Enhancements. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerCustomInstructionsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.CUSTOM_INSTRUCTIONS)
    }
}

@Suppress("unused")
val ramblerPersonalDictionaryPatch = bytecodePatch(
    name = "Rambler Personal Dictionary",
    description = "Enables Gboard Rambler's UserFeatureCache MUSE_STATS personal voice dictionary (credited to nl-morphe-patches) with a live Use dictionary words toggle plus add, import/export (.txt), remove, and clear controls. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerPersonalDictionaryResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.PERSONAL_DICTIONARY)
    }
}

@Suppress("unused")
val ramblerContactNamesPatch = bytecodePatch(
    name = "Rambler Contact Names",
    description = "Seeds up to 1,000 phone contact names into Rambler's MUSE_STATS voice dictionary (credited to nl-morphe-patches) when Contacts permission is granted, plus manual sync and reset controls. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerPersonalDictionaryPatch,
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerContactNamesResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.CONTACT_NAMES)
    }
}

@Suppress("unused")
val ramblerCursorEditingPatch = bytecodePatch(
    name = "Rambler Cursor-Aware Editing",
    description = "Enables cursor-aware editing, selected-text-only spoken edits, optional post-edit reselection (off by default, credited to nl-morphe-patches), and a live Append-only dictation toggle with clean cursor-boundary spacing. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerCursorEditingResourcePatch,
    )

    execute {
        val state = RamblerPatchStateStore.state(this)
        state.selectedFeatures.add(RamblerFeature.CURSOR_EDITING)

        val agentic = state.agenticTargets ?: RamblerDynamicResolver.resolveAgenticExtension(this)
            .also { state.agenticTargets = it }
        val spacing = state.appendSpacingTargets
            ?: RamblerDynamicResolver.resolveAppendSpacingTargets(this, agentic.extensionClass)
                .also { state.appendSpacingTargets = it }

        val helperBody = """
            :start
            invoke-static {}, $FLAG_RUNTIME_TYPE->isAppendOnlyEnabled()Z
            move-result v0
            if-eqz v0, :commit
            const/4 v0, 0x1
            const/4 v1, 0x0
            invoke-interface {p0, v0, v0, v1}, ${spacing.pcnType}->${spacing.surroundingMethodName}(III)${spacing.pdxType}
            move-result-object v2
            if-eqz v2, :commit
            invoke-virtual {v2}, ${spacing.pdxType}->${spacing.beforeCursorMethodName}()$CHAR_SEQUENCE_TYPE
            move-result-object v3
            invoke-virtual {v2}, ${spacing.pdxType}->${spacing.afterCursorMethodName}()$CHAR_SEQUENCE_TYPE
            move-result-object v4
            invoke-static {v3, v4, p1}, $FLAG_RUNTIME_TYPE->adjustAppendSpacing($CHAR_SEQUENCE_TYPE$CHAR_SEQUENCE_TYPE$CHAR_SEQUENCE_TYPE)$CHAR_SEQUENCE_TYPE
            move-result-object v5
            if-eqz v5, :commit
            move-object p1, v5
            :end
            .catch Ljava/lang/Throwable; {:start .. :end} :failed
            goto :commit
            :failed
            move-exception v0
            :commit
            const/4 v0, 0x0
            invoke-interface {p0, v0, v0, p1}, ${spacing.pcnType}->${spacing.commitMethodName}(II$CHAR_SEQUENCE_TYPE)Z
            move-result v0
            return v0
        """.trimIndent()

        spacing.extensionClass.addHelperMethodIfMissing(
            name = APPEND_COMMIT_HELPER,
            parameterTypes = listOf(spacing.pcnType, CHAR_SEQUENCE_TYPE),
            returnType = "Z",
            accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            registerCount = 8,
            body = helperBody,
        )

        spacing.targetMethod.replaceInstruction(
            spacing.callIndex,
            "invoke-static {v${spacing.pcnRegister}, v${spacing.textRegister}}, " +
                "${spacing.extensionClass.type}->$APPEND_COMMIT_HELPER(${spacing.pcnType}$CHAR_SEQUENCE_TYPE)Z",
        )
    }
}

@Suppress("unused")
val ramblerAppContextPatch = bytecodePatch(
    name = "Rambler App Context",
    description = "Enables sharing the active app name, input type, and field hint with Gboard Rambler (credited to nl-morphe-patches) with a live toggle in Rambler Enhancements. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerAppContextResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.APP_CONTEXT)
    }
}

@Suppress("unused")
val ramblerProductivityToolsPatch = bytecodePatch(
    name = "Rambler Productivity Tools",
    description = "Adds Smart Search Bars (auto-strip trailing period + opt-in per-app Auto-Search on commit for Search & browser address bars), Long-press Spacebar for Rambler (Smart Hybrid / Hold-to-Talk / Toggle modes), a draggable Rambler toolbar quick-access button, 1-Tap Fix & Learn from Dictation History, private On-Device Dictation Stats (words, sessions, avg WPM, cloud latency, time saved vs typing), opt-in hands-free Voice Send & Search suffixes, deterministic Voice Snippets, post-dictation Find & Replace (plain or regex, global or per-app), Strip Trailing Period, private Local Dictation History (last 50 entries), Auto Parallel Retry on flaky networks, configurable Longer Dictation Sessions, and one-tap JSON Settings Backup & Restore. $VERSION_NOTE",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
        ramblerProductivityToolsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.PRODUCTIVITY_TOOLS)
    }
}
