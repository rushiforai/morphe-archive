package app.zdrgon.patches.ytmusicwear.skipsilence

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.ytmusicwear.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC_WEAR
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

// ── Skip silence — YouTube Music (Wear OS) 9.45.41-WEAR_RELEASE ──
//
// The official Morphe "Skip silence" patch (shared/misc/audio/silence)
// hooks the audio output's apply method: inside the class carrying
// "AudioTrackAudioOutput" / "Failed to set playback params", a (J)V
// method reads a boolean field (IGET_OBJECT, IGET_BOOLEAN, then
// IPUT_BOOLEAN) — the skip-silence flag — and the patch rewrites the
// read value through its extension.
//
// In the Wear dex that class is Lekt; and the field-access dump
// (2026-11-15, round 9) disambiguates the four (J)V candidates: only
// Lekt;->O(J)V fits — iget-object at 45, iget-boolean v1 from
// Lekt;->E Z at 46, iput-boolean into the output config at 48 and
// back into Lekt;->E at 49. The flag is forced right after the read,
// and because the method stores the (now forced) value back into the
// field, the official patch's separate setter hook is unnecessary
// here: every apply re-forces the flag.

object ApplySkipSilenceWearFingerprint : Fingerprint(
    definingClass = "Lekt;",
    name = "O",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("J")
)

/**
 * YouTube Music (Wear OS) — Skip silence.
 *
 * Wear port of the official Morphe patch of the same name, with the
 * settings toggle hardwired on (the Wear app has no Morphe settings
 * UI): silent passages in audio playback are automatically skipped,
 * using the app's own silence-skipping processor and its built-in
 * tuning (minimum pause length, threshold). The official patch's
 * optional tuning overrides are not ported.
 */
@Suppress("unused")
val skipSilenceWearPatch = bytecodePatch(
    name = "Skip silence",
    description = "Automatically skips silent pauses in audio playback.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC_WEAR)

    execute {
        val method = ApplySkipSilenceWearFingerprint.method
        val instructions = method.implementation!!.instructions
        val readIndex = instructions.indexOfFirst { ins ->
            if (ins.opcode != Opcode.IGET_BOOLEAN) {
                false
            } else {
                val field = (ins as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference as? FieldReference
                field != null && field.definingClass == "Lekt;" && field.name == "E" && field.type == "Z"
            }
        }
        if (readIndex < 0) {
            throw PatchException("YT Music Wear skip silence: skip-silence flag read (iget-boolean Lekt;->E) not found in Lekt;->O.")
        }
        val flagRegister = (instructions[readIndex] as TwoRegisterInstruction).registerA
        method.addInstructions(
            readIndex + 1,
            """
                const/4 v$flagRegister, 0x1
            """.trimIndent()
        )
    }
}
