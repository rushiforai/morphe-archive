package app.journal.patches.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL

// The bottom nav bar reads a single static List<TopLevelRoute> that's built
// once in a <clinit>: five route objects (Stats, Journal, Drugs, Safer,
// Settings) get constructed, then collected with one filled-new-array and
// wrapped into a List. Anchor on the five tab-name strings rather than the
// holder class's obfuscated name, since that gets renamed every release.
internal object TopLevelRoutesFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf("Stats", "Journal", "Drugs", "Safer", "Settings"),
)

private fun Instruction.isConstructorInvoke(elementType: String): Boolean {
    if (opcode != Opcode.INVOKE_DIRECT && opcode != Opcode.INVOKE_DIRECT_RANGE) return false
    val reference = (this as ReferenceInstruction).reference
    return reference is MethodReference &&
        reference.definingClass == elementType &&
        reference.name == "<init>"
}

private fun Instruction.constructedInstanceRegister(): Int = when (this) {
    is RegisterRangeInstruction -> startRegister
    is FiveRegisterInstruction -> registerC
    else -> throw PatchException("Unexpected constructor invoke format: $opcode")
}

private fun Instruction.isMoveObjectFrom(register: Int): Boolean {
    if (opcode != Opcode.MOVE_OBJECT && opcode != Opcode.MOVE_OBJECT_FROM16 && opcode != Opcode.MOVE_OBJECT_16) {
        return false
    }
    return (this as TwoRegisterInstruction).registerB == register
}

/**
 * Finds the register that ends up referencing the [tabName] route object at
 * the point the tab list's filled-new-array instruction runs. The
 * constructor call's "this" register is often relocated into a different
 * register by a move-object right afterwards (e.g. from a wide/range-only
 * register down into one usable by the 5-register filled-new-array), so
 * follow that move if present.
 */
private fun findTabRegister(instructions: List<Instruction>, elementType: String, tabName: String): Int {
    val nameIndex = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.CONST_STRING &&
            ((instruction as ReferenceInstruction).reference as? StringReference)?.string == tabName
    }
    if (nameIndex == -1) {
        throw PatchException("Could not find tab name string \"$tabName\"")
    }

    val initIndex = instructions
        .withIndex()
        .drop(nameIndex)
        .firstOrNull { (_, instruction) -> instruction.isConstructorInvoke(elementType) }
        ?.index
        ?: throw PatchException("Could not find constructor call for tab \"$tabName\"")

    val instanceRegister = instructions[initIndex].constructedInstanceRegister()

    val next = instructions.getOrNull(initIndex + 1)
    return if (next != null && next.isMoveObjectFrom(instanceRegister)) {
        (next as TwoRegisterInstruction).registerA
    } else {
        instanceRegister
    }
}

@Suppress("unused")
val hideBottomTabsPatch = bytecodePatch(
    name = "Hide bottom tabs",
    description = "Lets you individually hide the Stats, Drugs and Safer tabs from the bottom " +
        "navigation bar. Journal and Settings can't be hidden.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    val hideStats by booleanOption(
        key = "hideStats",
        default = true,
        title = "Hide Stats tab",
        description = "Removes the Stats tab from the bottom navigation bar.",
    )
    val hideDrugs by booleanOption(
        key = "hideDrugs",
        default = true,
        title = "Hide Drugs tab",
        description = "Removes the Drugs tab from the bottom navigation bar.",
    )
    val hideSafer by booleanOption(
        key = "hideSafer",
        default = true,
        title = "Hide Safer tab",
        description = "Removes the Safer tab from the bottom navigation bar.",
    )

    execute {
        val method = TopLevelRoutesFingerprint.method
        val instructions = method.instructions

        val arrayIndex = instructions.indexOfFirst { it.opcode == Opcode.FILLED_NEW_ARRAY }
        if (arrayIndex == -1) {
            throw PatchException("Could not find the tab list's filled-new-array instruction")
        }

        val arrayType = ((instructions[arrayIndex] as ReferenceInstruction).reference as TypeReference).type
        val elementType = arrayType.removePrefix("[")

        // Journal and Settings are always kept; the other three are optional,
        // each independently toggled. Order matches the original tab order.
        val keptRegisters = buildList {
            if (hideStats != true) add(findTabRegister(instructions, elementType, "Stats"))
            add(findTabRegister(instructions, elementType, "Journal"))
            if (hideDrugs != true) add(findTabRegister(instructions, elementType, "Drugs"))
            if (hideSafer != true) add(findTabRegister(instructions, elementType, "Safer"))
            add(findTabRegister(instructions, elementType, "Settings"))
        }

        method.replaceInstruction(
            arrayIndex,
            "filled-new-array {${keptRegisters.joinToString(", ") { "v$it" }}}, $arrayType",
        )
    }
}
