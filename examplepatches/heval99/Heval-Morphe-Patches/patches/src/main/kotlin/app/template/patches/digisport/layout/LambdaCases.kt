package app.template.patches.digisport.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Helpers for R8's merged lambda classes: one invoke method reads a byte case field, switches on
// it and runs one case per original lambda, so a hook in one case has to check the selector.

private fun Method.insns(): List<Instruction> =
    implementation?.instructions?.toList() ?: throw PatchException("$definingClass->$name has no body")

internal fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

internal fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

/**
 * Index of the last const-string [value], or a loud failure. The last one is the app's own: the
 * hooks are inserted at the start of the method and may load the same string.
 */
internal fun Method.lastIndexOfString(value: String): Int =
    insns().indexOfLast { it.stringRef() == value }.takeIf { it >= 0 }
        ?: throw PatchException("$definingClass->$name has no \"$value\"")

/**
 * Adds, at the start of the article widget lambda, a check that runs only in the widget card case
 * (the one with the app's "widgetCross"): when [check] (smali that branches to [skip] for a card
 * to keep) falls through, the case adds a [spacing] section to its list instead of the card and
 * returns the add result like the original case. [check] gets a lookup for the lambda captures.
 */
internal fun addWidgetSpacingGuard(
    method: MutableMethod,
    spacing: Method,
    skip: String,
    check: ((String) -> String) -> String,
) {
    val anchor = method.lastIndexOfString(WIDGET_CROSS)
    val (selector, key) = method.caseOf(anchor)
    val capture = { type: String -> method.capturedField(anchor, type).let { "${it.definingClass}->${it.name}:${it.type}" } }
    val list = capture("Ljava/util/ArrayList;")
    method.addInstructionsWithLabelsChecked(
        0,
        casePrologue(method, selector, key, skip) + check(capture) + """
            iget-object v1, v0, $list
            check-cast v1, Ljava/util/ArrayList;
            invoke-static {}, ${spacing.definingClass}->${spacing.name}()$ARTICLE_SECTION
            move-result-object v2
            invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            move-result v1
            invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v1
            return-object v1
            :$skip
            nop
        """,
    )
}

/** A switch case of a merged lambda: the byte [selector] field, the case [key] and its first instruction index [start]. */
internal data class LambdaCase(val selector: FieldReference, val key: Int, val start: Int)

/**
 * The case selector of this lambda method and the key of the case that contains the instruction
 * at [anchor]: the switch register is loaded from a byte field of the lambda itself, and the case
 * is the only one whose code reaches the anchor by walking the control flow from its target
 * (branches, gotos and nested switches followed; the walk stops at every other case target and
 * at returns and throws). Zero or several such cases, or a key shared by several, fail loudly.
 */
internal fun Method.caseOf(anchor: Int): LambdaCase {
    val insns = insns()
    val addresses = insns.runningFold(0) { address, insn -> address + insn.codeUnits }
    val addressToIndex = HashMap<Int, Int>().also { map -> addresses.forEachIndexed { index, address -> map.putIfAbsent(address, index) } }
    val switch = insns.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
    if (switch < 0) throw PatchException("$definingClass->$name has no case switch")
    val switchRegister = (insns[switch] as OneRegisterInstruction).registerA
    val selector = insns.take(switch).lastOrNull {
        it.opcode == Opcode.IGET_BYTE && (it as TwoRegisterInstruction).registerA == switchRegister
    }?.fieldRef()?.takeIf { it.definingClass == definingClass && it.type == "B" }
        ?: throw PatchException("$definingClass->$name: the switch does not read a byte case field")
    val payloadAddress = addresses[switch] + (insns[switch] as OffsetInstruction).codeOffset
    val payload = insns.getOrNull(addresses.indexOf(payloadAddress)) as? SwitchPayload
        ?: throw PatchException("$definingClass->$name: no switch payload")
    if (anchor !in insns.indices) throw PatchException("$definingClass->$name: anchor $anchor is out of range")
    val caseTargets = payload.switchElements.map { element ->
        element.key to (addressToIndex[addresses[switch] + element.offset]
            ?: throw PatchException("$definingClass->$name: case ${element.key} does not land on an instruction"))
    }
    val targetIndexes = caseTargets.map { it.second }.toSet()

    fun jump(index: Int): Int =
        addressToIndex[addresses[index] + (insns[index] as OffsetInstruction).codeOffset]
            ?: throw PatchException("$definingClass->$name: the branch at $index does not land on an instruction")

    fun successors(index: Int): List<Int> {
        val insn = insns[index]
        return when (insn.opcode) {
            Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW,
            Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD -> emptyList()
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> listOf(jump(index))
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                val nested = insns.getOrNull(addressToIndex[addresses[index] + (insn as OffsetInstruction).codeOffset] ?: -1) as? SwitchPayload
                    ?: throw PatchException("$definingClass->$name: no payload for the switch at $index")
                listOf(index + 1) + nested.switchElements.map {
                    addressToIndex[addresses[index] + it.offset]
                        ?: throw PatchException("$definingClass->$name: a case of the switch at $index does not land on an instruction")
                }
            }
            else -> if (insn is OffsetInstruction) listOf(index + 1, jump(index)) else listOf(index + 1)
        }
    }

    fun reaches(start: Int): Boolean {
        val seen = hashSetOf(start)
        val queue = ArrayDeque(listOf(start))
        while (queue.isNotEmpty()) {
            val index = queue.removeFirst()
            if (index == anchor) return true
            for (next in successors(index)) {
                if (next in insns.indices && next !in targetIndexes && seen.add(next)) queue.addLast(next)
            }
        }
        return false
    }

    val owners = targetIndexes.filter(::reaches)
    val owner = owners.singleOrNull()
        ?: throw PatchException(
            "$definingClass->$name: instruction $anchor is reached from ${owners.size} switch cases " +
                "(${owners.map { start -> caseTargets.filter { it.second == start }.map { it.first } }}), expected exactly one"
        )
    val key = caseTargets.filter { it.second == owner }.map { it.first }.singleOrNull()
        ?: throw PatchException("$definingClass->$name: the case containing instruction $anchor is shared by several keys")
    return LambdaCase(selector, key, owner)
}

/**
 * The lambda field cast to [type] last before [index] inside the case that contains [index]
 * (`iget-object vX, p0, F` + `check-cast vX, type`); the code before the case is not scanned.
 */
internal fun Method.capturedField(index: Int, type: String): FieldReference {
    val insns = insns()
    val start = caseOf(index).start
    for (i in index - 1 downTo maxOf(start + 1, 1)) {
        val cast = insns[i]
        if (cast.opcode != Opcode.CHECK_CAST || ((cast as ReferenceInstruction).reference.toString()) != type) continue
        val load = insns[i - 1]
        val field = load.fieldRef()
        if (load.opcode == Opcode.IGET_OBJECT && field?.definingClass == definingClass &&
            (load as TwoRegisterInstruction).registerA == (cast as OneRegisterInstruction).registerA
        ) {
            return field
        }
    }
    throw PatchException("$definingClass->$name: no captured $type between the case start $start and instruction $index")
}

/** A static singleton field (`sget-object` of a field whose type is its own class) before [end]. */
internal fun Method.singletonBefore(end: Int): FieldReference =
    insns().take(end).firstNotNullOfOrNull { insn ->
        insn.fieldRef()?.takeIf { insn.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass }
    } ?: throw PatchException("$definingClass->$name: no singleton read before instruction $end")

/** The singleton that the case returns right after [index]: `sget-object vX, F` + `return-object vX`. */
internal fun Method.returnedSingletonAfter(index: Int): FieldReference {
    val insns = insns()
    for (i in index until insns.size - 1) {
        val load = insns[i]
        val field = load.fieldRef() ?: continue
        val ret = insns[i + 1]
        if (load.opcode == Opcode.SGET_OBJECT && field.type == field.definingClass && ret.opcode == Opcode.RETURN_OBJECT &&
            (ret as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA
        ) {
            return field
        }
    }
    throw PatchException("$definingClass->$name: no singleton return after instruction $index")
}

/**
 * Smali prologue that runs only in case [key] of the selector [selector]: v0 = this, v1 = the
 * case, and a branch to [skip] for every other case. Only v0-v2 are used; they are written before
 * any read at the method's first instruction, so [method] must have at least three locals
 * (registers that are not parameters), else this fails loudly.
 */
internal fun casePrologue(method: Method, selector: FieldReference, key: Int, skip: String): String {
    val registers = (method.implementation ?: throw PatchException("${method.definingClass}->${method.name} has no body")).registerCount
    val parameters = method.parameterTypes.sumOf { if (it[0] == 'J' || it[0] == 'D') 2 else 1 } +
        if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    if (registers - parameters < 3) {
        throw PatchException(
            "${method.definingClass}->${method.name}: $registers registers with $parameters for parameters leave " +
                "fewer than the 3 locals (v0-v2) of the case guard"
        )
    }
    return """
        move-object/from16 v0, p0
        iget-byte v1, v0, ${selector.definingClass}->${selector.name}:B
        const/16 v2, $key
        if-ne v1, v2, :$skip
    """
}

/** Smali that leaves in v1 whether the String in v1 is null or blank (trim().isEmpty()), branching to [notSet] when it is. */
internal fun blankCheck(notSet: String) = """
    if-eqz v1, :$notSet
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :$notSet
"""
