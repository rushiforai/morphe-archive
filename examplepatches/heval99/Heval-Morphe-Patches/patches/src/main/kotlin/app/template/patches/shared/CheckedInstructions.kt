package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/*
 * Count-checked versions of the patcher's smali `addInstruction(s)` extensions.
 *
 * Why: morphe-patcher 1.8.0's InlineSmaliCompiler throws on parser/lexer syntax errors only.
 * Register width is checked later by smali's tree walker, whose error count the compiler never
 * reads. An instruction whose register does not fit its operand (v16+ in a 4-bit slot:
 * const/4, non-range invoke-*, iget/iput, instance-of, if-eq/ne/lt/ge/gt/le, 12x moves and
 * /2addr ops) is printed to stderr ("Invalid register: v17. Must be between v0 and v15") and
 * left out; the rest of the snippet is inserted. The patch applies, the dex verifies and the
 * hook never runs. An out-of-range literal (`const/4 v0, 0x8`) is dropped the same way.
 * If *every* instruction is dropped the compiler instead throws an opaque
 * NoSuchElementException ("Collection is empty."). Pinned by InlineSmaliRegisterWidthTest.
 *
 * These wrappers count the instructions the snippet names and the instructions the method
 * gained, and throw a PatchException naming the method when they differ. NOPs are left out
 * of both counts, because dexlib2 adds or removes payload-alignment NOPs whenever an insert
 * shifts a packed-switch/sparse-switch/array-data payload (raw count off by one per payload).
 *
 * Use them for every new smali injection, especially when p-registers or high v-registers
 * appear in a 4-bit operand. They are drop-in: same parameters as the patcher's versions.
 */

/** Checked [addInstructions] at [index]. */
fun MutableMethod.addInstructionsChecked(index: Int, smaliInstructions: String) =
    checkedInsert("addInstructions", smaliInstructions) { addInstructions(index, smaliInstructions) }

/**
 * Checked [addInstructions] appended at the end of the method. morphe-patcher 2.0.0 hides the
 * index-less `addInstructions(String)`, so the end index is passed explicitly; checkedInsert runs
 * the lambda only after it has checked that the method has a body.
 */
fun MutableMethod.addInstructionsChecked(smaliInstructions: String) =
    checkedInsert("addInstructions", smaliInstructions) {
        addInstructions(implementation!!.instructions.size, smaliInstructions)
    }

/** Checked [addInstructionsWithLabels]. */
fun MutableMethod.addInstructionsWithLabelsChecked(
    index: Int,
    smaliInstructions: String,
    vararg externalLabels: ExternalLabel,
) = checkedInsert("addInstructionsWithLabels", smaliInstructions) {
    addInstructionsWithLabels(index, smaliInstructions, *externalLabels)
}

/**
 * Checked [addInstructionsAtControlFlowLabel]: inserts before the instruction at [index] and moves
 * its labels to the first inserted instruction, so branches to [index] run the inserted code too.
 */
fun MutableMethod.addInstructionsAtControlFlowLabelChecked(
    index: Int,
    smaliInstructions: String,
    vararg externalLabels: ExternalLabel,
) = checkedInsert("addInstructionsAtControlFlowLabel", smaliInstructions) {
    addInstructionsAtControlFlowLabel(index, smaliInstructions, *externalLabels)
}

/**
 * Checked [addInstruction] at [index]. The patcher's version silently uses only the first
 * compiled instruction, so this one also refuses snippets that name more than one.
 */
fun MutableMethod.addInstructionChecked(index: Int, smaliInstruction: String) =
    checkedInsert("addInstruction", smaliInstruction, single = true) { addInstruction(index, smaliInstruction) }

/** Checked [addInstruction] appended at the end of the method. */
fun MutableMethod.addInstructionChecked(smaliInstruction: String) =
    checkedInsert("addInstruction", smaliInstruction, single = true) { addInstruction(smaliInstruction) }

/**
 * Throws unless the instruction at [index] exists and is no branch or switch target. Code inserted
 * at [index] goes in front of that instruction, but its labels stay on it, so a jump there would
 * skip the inserted code (e.g. a value forced right after the instruction that produced it).
 * [what] names the insertion in the error.
 */
fun MutableMethod.requireNoBranchTargetAt(index: Int, what: String) {
    val labels = implementation?.instructions?.getOrNull(index)?.location?.labels
        ?: throw PatchException("${signature()}: $what: there is no instruction $index to insert before")
    if (labels.isNotEmpty()) {
        throw PatchException("${signature()}: $what: instruction $index is a branch target, a jump there would skip the insert")
    }
}

private inline fun MutableMethod.checkedInsert(
    api: String,
    smali: String,
    single: Boolean = false,
    insert: () -> Unit,
) {
    val impl = implementation
        ?: throw PatchException("$api: ${signature()} has no implementation (abstract or native)")
    val written = smaliInstructionCount(smali)
    if (single && written != 1) {
        throw PatchException("$api: expected one instruction for ${signature()}, the snippet names $written")
    }
    val before = impl.instructions.count { it.opcode != Opcode.NOP }
    try {
        insert()
    } catch (e: NoSuchElementException) {
        throw PatchException(
            "$api: the inline smali compiler kept no instruction for ${signature()}; " +
                "${registerHint()}\n$smali",
            e,
        )
    }
    val kept = impl.instructions.count { it.opcode != Opcode.NOP } - before
    if (kept != written) {
        throw PatchException(
            "$api: ${signature()} gained $kept of the $written instructions written " +
                "(the inline smali compiler dropped ${written - kept}); ${registerHint()}\n$smali"
        )
    }
}

private fun MutableMethod.signature() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun MutableMethod.registerHint(): String {
    val registers = implementation?.registerCount ?: 0
    val paramRegisters = parameterTypes.map { it.toString() }.map { if (it == "J" || it == "D") 2 else 1 }.sum() +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val p0 = registers - paramRegisters
    return "the method has $registers registers (p0 = v$p0); a register above v15 does not fit a " +
        "4-bit operand (const/4, non-range invoke-*, iget/iput, if-eq..if-le, 12x moves), and a " +
        "literal must fit its form (const/4 holds -8..7). Use const/16, invoke-*/range, or a local below v16"
}

private val PAYLOAD_START = Regex("""^\.(packed-switch|sparse-switch|array-data)\b""")
private val PAYLOAD_END = Regex("""^\.end\s+(packed-switch|sparse-switch|array-data)\b""")
private val LEADING_LABEL = Regex("""^:[\w$-]+\s*""")

/**
 * Number of non-NOP instructions a smali snippet names: one per instruction line plus one per
 * payload block (`.packed-switch`, `.sparse-switch`, `.array-data`). Labels, comments and other
 * directives (`.line`, `.local`, `.catch`, ...) are not instructions. Assumes one instruction
 * per line, which is how every patch here writes smali; a miscount fails loudly, never silently.
 */
internal fun smaliInstructionCount(smali: String): Int {
    var count = 0
    var inPayload = false
    for (raw in smali.lineSequence()) {
        var line = raw.trim()
        if (inPayload) {
            if (PAYLOAD_END.containsMatchIn(line)) inPayload = false
            continue
        }
        line = line.replace(LEADING_LABEL, "")
        if (line.isEmpty() || line.startsWith("#")) continue
        if (line.startsWith(".")) {
            if (PAYLOAD_START.containsMatchIn(line)) {
                count++
                inPayload = true
            }
            continue
        }
        val opcode = line.substringBefore(' ').substringBefore('\t').substringBefore('#')
        if (opcode != "nop") count++
    }
    return count
}