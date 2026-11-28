package semicoloncolonel.mobilestream.patches.abcnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.abcnews.shared.Constants

// ABC News for Android TV 11.12.0 plays through media3. Its
// AdaptiveTrackSelection picks the highest-bitrate rendition at or below one
// allowed bitrate, which comes from the measured bandwidth. R8 folded the
// allowed bitrate into the method that picks the rendition, so instead of
// raising it, the patch reads each rendition's bitrate as zero there. Every
// rendition then fits, and the first one in the list, the highest, is played.
// Renditions media3 excluded after a load error are still skipped.
//
// Disney's own limits still apply: the stream's highest resolution, and any
// bitrate cap in Disney's player configuration.

internal object AdaptiveTrackSelectionFingerprint : Fingerprint(
    strings = listOf("Adjusting minDurationToRetainAfterDiscardMs to be at least minDurationForQualityIncreaseMs"),
)

@Suppress("unused")
val forceHighestQualityPatch = bytecodePatch(
    name = "Force highest quality",
    description = "Plays each video at its highest quality instead of lowering it to match the measured " +
        "connection speed.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(Constants.REQUIRE_NATIVE_LIBS)

    execute {
        val selection = AdaptiveTrackSelectionFingerprint.classDef
        // determineIdealSelectedIndex(long nowMs, long chunkDurationUs).
        val ideal = selection.methods.filter { method ->
            method.returnType == "I" && method.implementation != null &&
                method.parameterTypes.map { it.toString() } == listOf("J", "J")
        }
        if (ideal.size != 1) {
            throw PatchException("Force highest quality: expected one rendition picker, found ${ideal.size}")
        }
        val method = ideal.single()
        val instructions = method.instructions.toList()
        val read = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IGET &&
                ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == "Landroidx/media3/common/Format;" && it.name == "bitrate"
                }
        }
        if (read < 0 || instructions.getOrNull(read + 1)?.opcode != Opcode.INT_TO_LONG) {
            throw PatchException("Force highest quality: no bitrate read in the rendition picker")
        }
        val register = (instructions[read + 1] as TwoRegisterInstruction).registerA
        method.addInstruction(read + 2, "const-wide/16 v$register, 0x0")
    }
}
