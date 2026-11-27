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

@Suppress("unused")
val ramblerWaveformAnimationPatch = bytecodePatch(
    name = "Rambler Waveform Animation",
    description = "Replaces Rambler's light bar with Hex Dot Scope / Android Wave (listening) and Flow / Pulse / Sweep (processing) animations, custom colors, and glow tuning.",
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
    description = "Persistent default and per-app custom style rules, searchable app picker, disabled apps, and per-app behavior overrides.",
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
    description = "Live MUSE_STATS personal voice dictionary with add, .txt import/export, remove, and clear controls.",
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
    description = "Auto-seeds up to 1,000 phone contacts into Rambler's voice dictionary when Contacts permission is granted.",
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
    description = "Cursor-aware & selection-only voice edits, optional re-select after edit (off by default), and Append-only dictation.",
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
    description = "Shares active app name, input type, and field hint with Rambler so it adapts formatting (live toggle).",
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
    description = "Long-press Spacebar trigger, Auto-Learn From Fixes (Beta), Smart Search Bars, Rambler toolbar button, Voice Send/Search, Snippets, Find & Replace, private Stats & History with 1-Tap Fix & Learn, Auto Retry, Longer Sessions, and JSON Backup.",
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
