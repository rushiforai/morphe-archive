package arpit.morphe.patches.movieboxtv.quality

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.movieboxtv.shared.Constants.COMPATIBILITY_MOVIEBOX_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22s
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val TV_RESOLUTION_MANAGER = "Lcom/transsion/tvplayer/TvResolutionManager;"

/** The hard-coded default resolution of the stream picker. */
private const val DEFAULT_RESOLUTION = "480"

/** What the picker should aim for instead: the top of the ladder. */
private const val HIGHEST_RESOLUTION = "2160"

/** Same resolution as a literal, for the "closest match" distance computation. */
private const val DEFAULT_HEIGHT = 480
private const val HIGHEST_HEIGHT = 2160

/**
 * Starts playback at the highest available resolution instead of 480p.
 *
 * `TvResolutionManager.d(streams)` picks the stream to start with: a resolution the user saved,
 * then an exact `"480"` match, then whatever is closest to 480 (the distance is computed with a
 * literal `-480`), then the last entry. Nothing else prefers a high rendition, so every episode
 * opens at 480p even when the backend delivered better ones.
 *
 * Pointing both the string and the distance at 2160 keeps the structure intact and inverts the
 * preference: exact 4K when offered, otherwise the closest to 4K (i.e. the highest), and the
 * existing fallbacks are untouched. A resolution the user picked in the panel still wins, because
 * that lookup happens before this block.
 */
@Suppress("unused")
val preferHighestResolutionPatch = bytecodePatch(
    name = "Prefer highest resolution",
    description = "Starts playback at the best available resolution instead of the built-in " +
        "480p default. An explicit choice in the settings panel still takes precedence.",
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX_TV)

    execute {
        val resolutionManager = mutableClassDefBy(TV_RESOLUTION_MANAGER)
        val startStream = resolutionManager.methods.firstOrNull { method ->
            method.name == "d" && method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        } ?: throw PatchException("Stream picker not found in $TV_RESOLUTION_MANAGER.")

        var strings = 0
        var distances = 0
        val methodInstructions = startStream.instructions
        for (index in methodInstructions.indices) {
            val instruction = methodInstructions[index]

            val string = (instruction as? ReferenceInstruction)?.reference as? StringReference
            if (string?.string == DEFAULT_RESOLUTION) {
                val register = (instruction as com.android.tools.smali.dexlib2.iface.instruction
                    .OneRegisterInstruction).registerA
                startStream.replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(HIGHEST_RESOLUTION),
                    ),
                )
                strings++
                continue
            }

            if (instruction.opcode == Opcode.ADD_INT_LIT16) {
                val literal = (instruction as NarrowLiteralInstruction).narrowLiteral
                if (literal == -DEFAULT_HEIGHT) {
                    val registers = instruction as TwoRegisterInstruction
                    startStream.replaceInstruction(
                        index,
                        BuilderInstruction22s(
                            Opcode.ADD_INT_LIT16,
                            registers.registerA,
                            registers.registerB,
                            -HIGHEST_HEIGHT,
                        ),
                    )
                    distances++
                }
            }
        }

        if (strings != 1) {
            throw PatchException(
                "Expected one \"$DEFAULT_RESOLUTION\" default in the stream picker, found $strings.",
            )
        }
        if (distances != 2) {
            throw PatchException(
                "Expected two distance computations from $DEFAULT_HEIGHT, found $distances.",
            )
        }
    }
}
