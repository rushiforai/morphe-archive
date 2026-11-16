package app.zdrgon.patches.ytmusicwear.audioducking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/template/extension/ytmusicwear/DisableAudioDucking;"

// ── Audio ducking — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// Same anchors as the official Morphe "Disable audio ducking" patch
// (music/interaction/audioducking), verified against the Wear dex on
// 2026-11-15 (REPORT6):
// - The method carrying "AudioFocus Requested" is Luko;->run()V, and it
//   contains the AudioFocusRequestCompat constructor call
//   Ldvu;-><init>(OnAudioFocusChangeListener; Handler;
//   AudioAttributesCompat; Z)V — the constructor's last parameter is
//   'will pause when ducked'.
// - The method carrying "AudioFocus DUCK" is
//   Luml;->onAudioFocusChange(I)V.

object AudioFocusRequestWearFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("AudioFocus Requested")
)

object AudioFocusChangeWearFingerprint : Fingerprint(
    name = "onAudioFocusChange",
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("AudioFocus DUCK")
)

/**
 * YouTube Music (Wear OS) — Disable audio ducking.
 *
 * Wear port of the official Morphe patch of the same name, with the
 * settings toggle hardwired on (the Wear app has no Morphe settings
 * UI). Mechanism, identical to the official patch and its extension:
 *
 * 1. Android ducks the app itself unless the audio focus request
 *    declares the app pauses when ducked. The boolean argument of the
 *    AudioFocusRequestCompat constructor call is rewritten through
 *    the extension, which forces it to true and remembers whether it
 *    had to.
 * 2. The app is also told about duck events through its focus
 *    listener and would lower the volume itself. The entry of
 *    onAudioFocusChange asks the extension whether to ignore the
 *    event; AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK events are swallowed,
 *    but only when step 1 actually had to force the declaration.
 */
@Suppress("unused")
val disableAudioDuckingWearPatch = bytecodePatch(
    name = "Disable audio ducking",
    description = "Keeps the volume unchanged when another app plays a short sound, such as a notification, instead of ducking the music.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    extendWith("extensions/extension.mpe")

    execute {
        // Step 1: rewrite the 'will pause when ducked' register at the
        // AudioFocusRequestCompat constructor call.
        val requestMethod = AudioFocusRequestWearFingerprint.method
        val instructions = requestMethod.implementation!!.instructions
        val ctorIndex = instructions.indexOfFirst { ins ->
            val ref = (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference as? MethodReference
            ref != null && ref.name == "<init>" &&
                ref.parameterTypes.size == 4 &&
                ref.parameterTypes[2].toString() == "Landroidx/media/AudioAttributesCompat;" &&
                ref.parameterTypes[3].toString() == "Z"
        }
        if (ctorIndex < 0) {
            throw PatchException("YT Music Wear ducking: AudioFocusRequestCompat constructor call not found in the AudioFocus Requested method.")
        }
        val ctorInstruction = instructions[ctorIndex]
        val boolRegister = when (ctorInstruction) {
            is BuilderInstruction35c -> when (ctorInstruction.registerCount) {
                1 -> ctorInstruction.registerC
                2 -> ctorInstruction.registerD
                3 -> ctorInstruction.registerE
                4 -> ctorInstruction.registerF
                else -> ctorInstruction.registerG
            }
            is BuilderInstruction3rc -> ctorInstruction.startRegister + ctorInstruction.registerCount - 1
            else -> throw PatchException("YT Music Wear ducking: unexpected constructor instruction format.")
        }
        requestMethod.addInstructions(
            ctorIndex,
            """
                invoke-static { v$boolRegister }, $EXTENSION_CLASS->willPauseWhenDucked(Z)Z
                move-result v$boolRegister
            """.trimIndent()
        )

        // Step 2: swallow duck events at the focus-change listener.
        AudioFocusChangeWearFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->ignoreAudioFocusChange(I)Z
                move-result v0
                if-eqz v0, :handle
                return-void
                :handle
                nop
            """.trimIndent()
        )
    }
}
