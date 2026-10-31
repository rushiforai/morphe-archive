package app.morphe.patches.util

import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

/**
 * Two readings of an instruction that the patches library offered until Morphe Patcher 2.0.0 and
 * no longer does. They are kept here rather than spelled out at each use, since what they say is
 * what the ported patches were written to say.
 */

/** The register an instruction writes its result into. */
internal val Instruction.writeRegister: Int
    get() = (this as OneRegisterInstruction).registerA

/**
 * The registers an invoke hands over, in the order it hands them over. An invoke names up to five
 * of them one by one and any number of them as a range, and the two are read differently.
 */
internal val Instruction.registersUsed: List<Int>
    get() = when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

        is RegisterRangeInstruction ->
            (startRegister until startRegister + registerCount).toList()

        else -> emptyList()
    }
