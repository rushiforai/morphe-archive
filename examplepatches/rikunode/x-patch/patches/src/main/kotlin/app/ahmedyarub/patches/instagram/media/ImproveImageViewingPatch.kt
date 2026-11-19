/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko calls Pref.improveImageViewing(size), which returns MAX_IMAGE_SIZE when
 * the setting is on and the original size otherwise. This port drops the settings layer and
 * writes the constant directly, so the maximum size is always requested.
 */

package app.ahmedyarub.patches.instagram.media

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.shared.declaredParameterRegister
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENDED_IMAGE_URL_CLASS = "Lcom/instagram/model/mediasize/ExtendedImageUrl;"

/** piko's MAX_IMAGE_SIZE. */
private const val MAX_IMAGE_SIZE = 4096

internal object SetDPIMetricsFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("%sdpi; %sx%s"),
)

/**
 * Picks, from an image's candidate sizes, the one whose width is closest to the size asked for:
 * (preferred shape, candidates, requested width).
 */
internal object ReturnExtendedImageUrlFingerprint : Fingerprint(
    returnType = EXTENDED_IMAGE_URL_CLASS,
    parameters = listOf("Ljava/lang/Integer;", "Ljava/util/List;", "I"),
)

/**
 * The boxed variant reuses the same register: the constant is written as an int, boxed, and
 * the Integer written back over it, so no free register is required.
 */
private fun setMaxSizeBoxed(register: Int) = """
    const/16 v$register, $MAX_IMAGE_SIZE
    invoke-static { v$register }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v$register
"""

@Suppress("unused")
val improveImageViewingPatch = bytecodePatch(
    name = "Improve image viewing",
    description = "Requests the maximum resolution images from the server.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    execute {
        // Ask the picker for the largest size, so the candidate closest to it is the largest one.
        // piko overwrote the registers of the first if-ne instead, which on 448 compares a
        // candidate's height with its width, so every candidate looked square and 4096 wide
        // and the pick fell to whichever the server listed first.
        ReturnExtendedImageUrlFingerprint.method.apply {
            val requestedWidth = declaredParameterRegister(this, 2)
            addInstructions(0, "const/16 v$requestedWidth, $MAX_IMAGE_SIZE")
        }

        // Report the largest screen in the device metrics the app sends, so the server offers
        // images at that size in the first place.
        SetDPIMetricsFingerprint.method.apply {
            val filledNewArrayIndex = indexOfFirstInstruction(Opcode.FILLED_NEW_ARRAY)
            val registers = getInstruction(filledNewArrayIndex).registersUsed
            // (dpi, width, height); the boxing call below is a four-bit invoke.
            val width = registers[1]
            val height = registers[2]
            if (maxOf(width, height) > 15) throw PatchException("The screen size is not in four-bit registers")

            addInstructions(
                filledNewArrayIndex,
                """
                    ${setMaxSizeBoxed(width)}
                    ${setMaxSizeBoxed(height)}
                """,
            )
        }
    }
}
