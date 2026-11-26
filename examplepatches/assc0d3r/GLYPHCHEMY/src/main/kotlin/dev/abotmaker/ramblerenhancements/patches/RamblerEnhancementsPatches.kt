package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags

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
val ramblerProductivityToolsPatch = bytecodePatch(
    name = "Rambler Productivity Tools",
    description = "Adds Long-press Spacebar for Rambler (Smart Hybrid / Hold-to-Talk / Toggle modes), a draggable Rambler toolbar quick-access button, 1-Tap Fix & Learn from Dictation History, private On-Device Dictation Stats (words, sessions, avg WPM, cloud latency, time saved vs typing), opt-in hands-free Voice Send & Search suffixes, deterministic Voice Snippets, post-dictation Find & Replace (plain or regex, global or per-app), Strip Trailing Period, private Local Dictation History (last 50 entries), Auto Parallel Retry on flaky networks, configurable Longer Dictation Sessions, and one-tap JSON Settings Backup & Restore. $VERSION_NOTE",
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
