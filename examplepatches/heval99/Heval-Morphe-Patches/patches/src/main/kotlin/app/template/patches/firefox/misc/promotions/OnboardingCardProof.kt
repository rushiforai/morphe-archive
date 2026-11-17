package app.template.patches.firefox.misc.promotions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.template.patches.firefox.shared.fieldRef
import app.template.patches.firefox.shared.insns
import app.template.patches.firefox.shared.methodRef
import app.template.patches.firefox.shared.readClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/*
 * Patch-time proof that the onboarding card filter lambda's <init> parameter the patch zeroes
 * is the DEFAULT_BROWSER card's flag, so a reordered capture list fails the patch instead of
 * hiding another card:
 *   1. OnboardingCardType.<clinit> gives DEFAULT_BROWSER's ordinal (the int passed with the
 *      "DEFAULT_BROWSER" name to the enum constructor, then stored into DEFAULT_BROWSER).
 *   2. The filter's invoke maps cardType.ordinal() through WhenMappings.$EnumSwitchMapping$N;
 *      WhenMappings.<clinit> gives the case key stored at that ordinal.
 *   3. The branch invoke takes for that key (if-eq chain, switch payload, or the fall-through of
 *      a lone if-ne) must read exactly
 *      one lambda flag before it leaves the block, and that flag is the field <init> fills from
 *      the parameter being zeroed.
 * Linear constant tracking is enough for these straight-line R8 shapes; anything it can't
 * resolve throws.
 */

private val CONST_LITERALS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
private val CONST_STRINGS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)
private val BLOCK_ENDS = setOf(
    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32, Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID,
    Opcode.RETURN_WIDE, Opcode.THROW, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH,
)

/** Register constants (Int literal or String) known before each instruction, by linear scan. */
private fun constantsBefore(insns: List<Instruction>): List<Map<Int, Any>> {
    val known = mutableMapOf<Int, Any>()
    return insns.map { insn ->
        val before = known.toMap()
        when {
            insn.opcode in CONST_LITERALS ->
                known[(insn as OneRegisterInstruction).registerA] = (insn as NarrowLiteralInstruction).narrowLiteral
            insn.opcode in CONST_STRINGS ->
                known[(insn as OneRegisterInstruction).registerA] =
                    ((insn as ReferenceInstruction).reference as StringReference).string
            insn.opcode.setsRegister() && insn is OneRegisterInstruction -> {
                known.remove(insn.registerA)
                if (insn.opcode.setsWideRegister()) known.remove(insn.registerA + 1)
            }
        }
        before
    }
}

/** Code-unit address of each instruction. */
private fun addresses(insns: List<Instruction>): List<Int> {
    var address = 0
    return insns.map { insn -> address.also { address += insn.codeUnits } }
}

private fun Method.label() = "$definingClass->$name"

/** The ordinal OnboardingCardType.<clinit> gives the constant named [constant]. */
private fun BytecodePatchContext.enumOrdinal(enumType: String, constant: String): Int {
    val clinit = readClass(enumType).methods.singleOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$enumType has no <clinit>")
    val insns = clinit.insns()
    val constants = constantsBefore(insns)
    val ordinals = insns.indices.mapNotNull { i ->
        val insn = insns[i]
        val ref = insn.methodRef()
        if (insn.opcode != Opcode.INVOKE_DIRECT || ref?.name != "<init>" ||
            ref.parameterTypes.map(CharSequence::toString) != listOf("Ljava/lang/String;", "I")
        ) return@mapNotNull null
        val call = insn as FiveRegisterInstruction
        if (call.registerCount != 3 || constants[i][call.registerD] != constant) return@mapNotNull null
        val ordinal = constants[i][call.registerE] as? Int
            ?: throw PatchException("$enumType.<clinit>: the $constant ordinal is not a constant")
        // The constructed instance must be what is stored into the $constant field.
        val stored = insns.drop(i + 1).firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
        val field = stored?.fieldRef()
        if (field?.definingClass != enumType || field.name != constant ||
            (stored as OneRegisterInstruction).registerA != call.registerC
        ) throw PatchException("$enumType.<clinit>: the \"$constant\" instance is not stored into $constant")
        ordinal
    }
    return ordinals.singleOrNull()
        ?: throw PatchException("$enumType.<clinit> constructs \"$constant\" ${ordinals.size} times, expected 1")
}

/** The case key WhenMappings stores at [ordinal] of the switch map [mapField] (definingClass->name). */
private fun BytecodePatchContext.switchMapKey(mapClass: String, mapField: String, enumType: String, ordinal: Int): Int {
    val clinit = readClass(mapClass).methods.singleOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$mapClass has no <clinit>")
    val insns = clinit.insns()
    val constants = constantsBefore(insns)
    val stores = insns.indices.filter {
        insns[it].opcode == Opcode.SPUT_OBJECT && insns[it].fieldRef()?.let { f -> f.definingClass == mapClass && f.name == mapField } == true
    }
    val store = stores.singleOrNull() ?: throw PatchException("$mapClass.<clinit> stores $mapField ${stores.size} times, expected 1")
    val array = (insns[store] as OneRegisterInstruction).registerA
    val created = (store - 1 downTo 0).firstOrNull {
        insns[it].opcode == Opcode.NEW_ARRAY && (insns[it] as OneRegisterInstruction).registerA == array
    } ?: throw PatchException("$mapClass.<clinit>: $mapField is not a new array")
    val sizedByEnum = (created - 1 downTo 0).take(4).any {
        insns[it].methodRef()?.let { ref -> ref.definingClass == enumType && ref.name == "values" } == true
    }
    if (!sizedByEnum) throw PatchException("$mapClass.<clinit>: $mapField is not sized by $enumType.values()")
    val keys = (created + 1 until store).mapNotNull { i ->
        val put = insns[i] as? ThreeRegisterInstruction ?: return@mapNotNull null
        if (insns[i].opcode != Opcode.APUT || put.registerB != array) return@mapNotNull null
        val index = constants[i][put.registerC] as? Int
            ?: throw PatchException("$mapClass.<clinit>: an aput index into $mapField is not a constant")
        if (index != ordinal) return@mapNotNull null
        constants[i][put.registerA] as? Int
            ?: throw PatchException("$mapClass.<clinit>: the $mapField key at ordinal $ordinal is not a constant")
    }
    return keys.singleOrNull()
        ?: throw PatchException("$mapClass.<clinit> sets $mapField[$ordinal] ${keys.size} times, expected 1")
}

/**
 * Proves the lambda's `<init>` parameter at register [initRegister] is the flag of the [constant]
 * card in [filter] (the lambda's invoke, before any patch edit). Throws when it can't.
 */
internal fun BytecodePatchContext.proveOnboardingCardFlag(
    lambdaType: String,
    init: Method,
    initRegister: Int,
    filter: Method,
    enumType: String,
    constant: String,
) {
    // The field <init> fills from that parameter.
    val flagStores = init.insns().filter {
        it.opcode == Opcode.IPUT_BOOLEAN && (it as TwoRegisterInstruction).registerA == initRegister &&
            it.fieldRef()?.definingClass == lambdaType
    }
    val flag = flagStores.singleOrNull()?.fieldRef()?.name
        ?: throw PatchException("${init.label()} stores v$initRegister into ${flagStores.size} flags, expected 1")

    val ordinal = enumOrdinal(enumType, constant)

    // invoke: key = WhenMappings.$EnumSwitchMapping$N[cardType.ordinal()].
    val insns = filter.insns()
    val maps = insns.indices.filter {
        insns[it].opcode == Opcode.SGET_OBJECT &&
            insns[it].fieldRef()?.let { f -> f.name.startsWith("\$EnumSwitchMapping\$") && f.type == "[I" } == true
    }
    val mapRead = maps.singleOrNull() ?: throw PatchException("${filter.label()} reads ${maps.size} enum switch maps, expected 1")
    val mapRef = insns[mapRead].fieldRef()!!
    val mapRegister = (insns[mapRead] as OneRegisterInstruction).registerA
    val readsOrdinal = insns.drop(mapRead).take(4).any {
        it.methodRef()?.let { ref -> ref.name == "ordinal" && ref.parameterTypes.isEmpty() && ref.returnType == "I" } == true
    }
    val lookup = (mapRead + 1 until insns.size).firstOrNull {
        insns[it].opcode == Opcode.AGET && (insns[it] as ThreeRegisterInstruction).registerB == mapRegister
    }
    if (!readsOrdinal || lookup == null) throw PatchException("${filter.label()} does not index ${mapRef.name} by ordinal()")
    val keyRegister = (insns[lookup] as OneRegisterInstruction).registerA

    val caseKey = switchMapKey(mapRef.definingClass, mapRef.name, enumType, ordinal)

    // The branch taken for caseKey: an if-eq against a constant, or a switch payload entry.
    val constants = constantsBefore(insns)
    val address = addresses(insns)
    fun indexAt(target: Int) = address.indexOf(target).takeIf { it >= 0 }
        ?: throw PatchException("${filter.label()}: no instruction at branch address $target")
    val targets = (lookup + 1 until insns.size).flatMap { i ->
        val insn = insns[i]
        when (insn.opcode) {
            Opcode.IF_EQ -> {
                val compare = insn as TwoRegisterInstruction
                val other = when (keyRegister) {
                    compare.registerA -> compare.registerB
                    compare.registerB -> compare.registerA
                    else -> return@flatMap emptyList()
                }
                if (constants[i][other] == caseKey) listOf(indexAt(address[i] + (insn as OffsetInstruction).codeOffset)) else emptyList()
            }
            // One mapped case left (160.0): `if-ne key, caseKey, :other` falls through into the case.
            Opcode.IF_NE -> {
                val compare = insn as TwoRegisterInstruction
                val other = when (keyRegister) {
                    compare.registerA -> compare.registerB
                    compare.registerB -> compare.registerA
                    else -> return@flatMap emptyList()
                }
                if (constants[i][other] == caseKey) listOf(i + 1) else emptyList()
            }
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                if ((insn as OneRegisterInstruction).registerA != keyRegister) return@flatMap emptyList()
                val payload = insns[indexAt(address[i] + (insn as OffsetInstruction).codeOffset)] as SwitchPayload
                payload.switchElements.filter { it.key == caseKey }.map { indexAt(address[i] + it.offset) }
            }
            else -> emptyList()
        }
    }
    val target = targets.singleOrNull()
        ?: throw PatchException("${filter.label()} branches ${targets.size} times on case $caseKey ($constant), expected 1")

    // That block reads exactly the one flag before it leaves.
    val end = (target until insns.size).firstOrNull { insns[it].opcode in BLOCK_ENDS } ?: insns.size
    val flagsRead = (target until end).mapNotNull { i ->
        insns[i].takeIf { it.opcode == Opcode.IGET_BOOLEAN }?.fieldRef()?.takeIf { it.definingClass == lambdaType }?.name
    }
    if (flagsRead != listOf(flag)) {
        throw PatchException(
            "${filter.label()}: the $constant branch (case $caseKey, ordinal $ordinal) reads $flagsRead, " +
                "not the $flag that <init> fills from v$initRegister",
        )
    }
}
