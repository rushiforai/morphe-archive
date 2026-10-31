package app.blackmagic.patches.video.bitrate

import app.blackmagic.patches.shared.Constants.COMPATIBILITY_BLACKMAGIC_CAM
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

// Each tier is stored as a float scale in BitrateLevel.f; with the formula rewrite
// below, the recorded bitrate is round(encoderMax * scale), so scale == percent / 100.

@Suppress("unused")
val bitrateTiersPatch = bytecodePatch(
    name = "Configurable bitrate tiers",
    description = "Rescales the LOW / MEDIUM / HIGH video bitrate tiers to a configurable " +
        "percentage of the encoder's maximum (MAX is unchanged); defaults are 25 / 50 / 75 %. " +
        "At 1080p30 H.265 on a flagship this turns the stock 6 / 9 / 12 / 160 Mbps options into " +
        "usable ~40 / 80 / 120 / 160 Mbps steps, removing the order-of-magnitude gap to MAX.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLACKMAGIC_CAM)

    val lowPercent by intOption(
        key = "lowPercent",
        default = 25,
        title = "LOW tier (% of encoder max)",
        description = "LOW bitrate as a percentage of the encoder's maximum (1-100).",
        required = false,
    )
    val mediumPercent by intOption(
        key = "mediumPercent",
        default = 50,
        title = "MEDIUM tier (% of encoder max)",
        description = "MEDIUM bitrate as a percentage of the encoder's maximum (1-100).",
        required = false,
    )
    val highPercent by intOption(
        key = "highPercent",
        default = 75,
        title = "HIGH tier (% of encoder max)",
        description = "HIGH bitrate as a percentage of the encoder's maximum (1-100).",
        required = false,
    )

    execute {
        // --- Part 1: retune the enum scale constants in BitrateLevel.<clinit> ---
        // Stock: HIGH = 2.0, MEDIUM = 1.5, LOW = 1.0 (multipliers of a base).
        // New:   scale = percent / 100, so each tier becomes round(encoderMax * percent/100).
        fun percentToScaleBits(percent: Int?): Int {
            val p = percent ?: throw PatchException("Bitrate tier percentage is unset.")
            if (p !in 1..100) {
                throw PatchException("Bitrate tier percentages must be between 1 and 100 (got $p).")
            }
            return (p / 100f).toRawBits()
        }

        BitrateLevelClinitFingerprint.let { fp ->
            val (highIdx, mediumIdx, lowIdx) = fp.instructionMatches.map { it.index }

            fun retune(index: Int, newBits: Int) {
                val register = fp.method.getInstruction<OneRegisterInstruction>(index).registerA
                fp.method.replaceInstruction(index, "const v$register, $newBits")
            }
            retune(highIdx, percentToScaleBits(highPercent))
            retune(mediumIdx, percentToScaleBits(mediumPercent))
            retune(lowIdx, percentToScaleBits(lowPercent))
        }

        // --- Part 2: rewrite the constant-frame-rate formula to use the encoder ceiling ---
        // Stock tail:  int-to-float p0, vRes ; iget p1,p3,BitrateLevel.f ; mul-float ;
        //              int-to-float p1, vBase ; mul-float ; invoke z64.w ; ... min(encoderMax, .)
        // New tail:    int-to-float p0, encoderMax ; iget p1,p3,BitrateLevel.f ; mul-float ;
        //              invoke z64.w ; ... min(encoderMax, .)
        // i.e. drop the resolution-base factor so the result is `round(encoderMax * scale)`.
        BitrateFormulaFingerprint.let { fp ->
            val igetIndex = fp.instructionMatches.first().index
            val method = fp.method

            // The Math.min(II)I clamp at the end of the formula; its first argument
            // register holds the encoder ceiling.
            val minInsn = fp.instructionMatches[1].getInstruction<Instruction35c>()
            val encoderMaxReg = minInsn.registerC

            // 3.5.1 constant-frame-rate tail is double arithmetic:
            //   iget            vScale, p3, BitrateLevel.f   (igetIndex)
            //   float-to-double vScale, vScale              (+1)  scale as double
            //   mul-double/2addr vAcc, vScale               (+2)  acc *= scale
            //   int-to-double   vScale, vBase               (+3)  vScale = perSecondBase
            //   mul-double/2addr vAcc, vScale               (+4)  acc *= perSecondBase
            //   invoke z.v(D)I ; min(encoderMax, .)
            val floatToDouble = method.getInstruction(igetIndex + 1)
            val mulScale = method.getInstruction(igetIndex + 2)
            val intToBase = method.getInstruction(igetIndex + 3)
            val mulBase = method.getInstruction(igetIndex + 4)
            if (floatToDouble.opcode != Opcode.FLOAT_TO_DOUBLE ||
                mulScale.opcode != Opcode.MUL_DOUBLE_2ADDR ||
                intToBase.opcode != Opcode.INT_TO_DOUBLE ||
                mulBase.opcode != Opcode.MUL_DOUBLE_2ADDR
            ) {
                throw PatchException("Unexpected bitrate formula shape; app internals changed.")
            }

            val accumulatorReg = (mulScale as TwoRegisterInstruction).registerA
            // Overwrite the running accumulator (resolution * aspect * colorspace) with
            // the encoder ceiling, discarding that base entirely.
            method.replaceInstruction(igetIndex + 2, "int-to-double v$accumulatorReg, v$encoderMaxReg")
            // Remove the per-second-base conversion so the scale value survives in its
            // register; the trailing mul-double then yields round(encoderMax * scale).
            method.removeInstructions(igetIndex + 3, 1)
        }
    }
}
