/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko calls Pref.improveImageViewing(size), which returns MAX_IMAGE_SIZE when
 * the setting is on and the original size otherwise. This port drops the settings layer and
 * writes the constant directly, so the maximum size is always requested.
 */

package app.ahmedyarub.patches.instagram.media

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
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

internal object ReturnExtendedImageUrlFingerprint : Fingerprint(
    returnType = EXTENDED_IMAGE_URL_CLASS,
    parameters = listOf("Ljava/lang/Integer;", "Ljava/util/List;", "I"),
)

private fun setMaxSize(register: Int) = "const/16 v$register, $MAX_IMAGE_SIZE"

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
        ReturnExtendedImageUrlFingerprint.method.apply {
            val firstIfNeIndex = indexOfFirstInstruction(Opcode.IF_NE)
            val registers = getInstruction(firstIfNeIndex).registersUsed

            addInstructions(
                firstIfNeIndex,
                """
                    ${setMaxSize(registers[0])}
                    ${setMaxSize(registers[1])}
                """,
            )
        }

        SetDPIMetricsFingerprint.method.apply {
            val filledNewArrayIndex = indexOfFirstInstruction(Opcode.FILLED_NEW_ARRAY)
            val registers = getInstruction(filledNewArrayIndex).registersUsed

            addInstructions(
                filledNewArrayIndex,
                """
                    ${setMaxSizeBoxed(registers[1])}
                    ${setMaxSizeBoxed(registers[2])}
                """,
            )
        }
    }
}
