package app.morphe.patches.maps

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.writeRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.util.Locale

internal enum class IdentityHeaderKind { PACKAGE, CERT }
internal data class IdentityHeaderWrite(val method: Method, val index: Int, val kind: IdentityHeaderKind,
    val target: MethodReference, val opcode: Opcode, val registers: List<Int>)

internal fun identityInvokeRegisters(instruction: Instruction): List<Int> = when (instruction) {
    is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
        instruction.registerF, instruction.registerG).take(instruction.registerCount)
    is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    else -> throw PatchException("Identity: unsupported invoke ${instruction.opcode}")
}

/** Must/may key analysis. A mixed or unproven header key at a write fails instead of broadening a hook. */
internal class MapsIdentityHeaderScanner(private val classes: List<ClassDef>) {
    private val byType = classes.associateBy { it.type }
    private val fields = mutableMapOf<String, Tag>()
    private data class Tag(val kinds: Set<IdentityHeaderKind>, val type: String, val origins: Set<Int>, val uncertain: Boolean = false)
    private data class State(val keys: Map<Int, Tag> = emptyMap(), val fresh: Map<Int, String> = emptyMap(), val pending: Tag? = null)
    private data class Result(val fields: Map<String, Tag>, val writes: List<IdentityHeaderWrite>)

    private fun kind(value: String?): IdentityHeaderKind? = when (value?.lowercase(Locale.ROOT)) {
        "x-android-package" -> IdentityHeaderKind.PACKAGE
        "x-android-cert" -> IdentityHeaderKind.CERT
        else -> null
    }
    private fun fail(reason: String): Nothing = throw PatchException("Maps identity header analysis: $reason")
    private fun merge(a: Tag?, b: Tag?): Tag? {
        if (a == null && b == null) return null
        if (a == null) return b!!.copy(uncertain = true)
        if (b == null) return a.copy(uncertain = true)
        return Tag(a.kinds + b.kinds, if (a.type == b.type) a.type else "",
            a.origins + b.origins, a.uncertain || b.uncertain || a.type != b.type || a.kinds != b.kinds)
    }
    private fun merge(a: State, b: State): State = State(
        (a.keys.keys + b.keys.keys).associateWith { merge(a.keys[it], b.keys[it])!! },
        a.fresh.filter { (r, type) -> b.fresh[r] == type }, merge(a.pending, b.pending),
    )
    private fun fits(actual: String, expected: String): Boolean {
        if (actual == expected || expected == "Ljava/lang/Object;") return true
        val visited = mutableSetOf<String>()
        val pending = ArrayDeque<String>(); pending.add(actual)
        while (pending.isNotEmpty()) {
            val type = pending.removeFirst()
            if (type == expected) return true
            if (!visited.add(type)) continue
            byType[type]?.let { cls -> cls.superclass?.let { pending.add(it) }; cls.interfaces.forEach { pending.add(it) } }
        }
        return false
    }

    fun inspect(): List<IdentityHeaderWrite> {
        classes.forEach { cls -> cls.staticFields.forEach { field ->
            kind((field.initialValue as? StringEncodedValue)?.value)?.let {
                fields[field.toString()] = Tag(setOf(it), field.type, emptySet())
            }
        } }
        // Resolve literal-backed static key objects and any aliases before scanning their consumers.
        var changed: Boolean
        do {
            changed = false
            classes.forEach { cls -> cls.methods.filter { it.name == "<clinit>" }.forEach { method ->
                if (candidate(method)) analyze(method).fields.forEach { (field, tag) ->
                    val previous = fields[field]
                    if (previous != null && (previous.kinds != tag.kinds || previous.type != tag.type)) fail("ambiguous key field $field")
                    if (previous == null) { fields[field] = tag.copy(origins = emptySet()); changed = true }
                }
            } }
        } while (changed)
        if (fields.values.flatMap { it.kinds }.toSet() != IdentityHeaderKind.entries.toSet()) fail("missing static header-key kinds")
        val assignments = mutableMapOf<String, Int>()
        classes.forEach { cls -> cls.methods.forEach { method -> method.implementation?.instructions?.forEach { instruction ->
            if (instruction.opcode == Opcode.SPUT_OBJECT) instruction.getReference<FieldReference>()?.toString()?.let {
                if (it in fields) assignments[it] = (assignments[it] ?: 0) + 1
            }
        } } }
        fields.keys.forEach { field ->
            if ((assignments[field] ?: 0) != 1) fail("expected one initializer for $field")
        }
        val writes = classes.flatMap { cls -> cls.methods.filter { candidate(it) }.flatMap { analyze(it).writes } }
        if (writes.isEmpty() || writes.map { it.kind }.toSet() != IdentityHeaderKind.entries.toSet()) fail("missing header writes")
        writes.groupBy { it.method.definingClass }.forEach { (owner, sites) ->
            if (sites.map { it.kind }.toSet() != IdentityHeaderKind.entries.toSet()) fail("unpaired header producer $owner")
        }
        val main = writes.groupBy { it.method.toString() }.values.filter { sites ->
            val method = sites.first().method
            method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "Ljava/lang/Object;" &&
                method.returnType.startsWith("L") && method.implementation!!.instructions.any {
                    it.getReference<StringReference>()?.string == "X-Goog-Api-Key"
                }
        }
        if (main.size != 1 || main.single().size != 2 || main.single().map { it.kind }.toSet() != IdentityHeaderKind.entries.toSet())
            fail("main API-key interceptor is missing or ambiguous")
        return writes
    }

    private fun candidate(method: Method): Boolean = method.implementation?.instructions?.any {
        kind(it.getReference<StringReference>()?.string) != null ||
            (it.getReference<FieldReference>()?.toString()?.let { field -> field in fields } == true)
    } == true

    private fun analyze(method: Method): Result {
        val implementation = method.implementation!!
        val code = implementation.instructions.toList()
        if (code.isEmpty()) return Result(emptyMap(), emptyList())
        val offsets = IntArray(code.size); val at = mutableMapOf<Int, Int>(); var offset = 0
        code.forEachIndexed { i, ins -> offsets[i] = offset; at[offset] = i; offset += ins.codeUnits }
        fun target(index: Int) = at[offsets[index] + (code[index] as OffsetInstruction).codeOffset]
            ?: fail("invalid branch in $method at $index")
        fun next(index: Int): List<Int> = when (code[index].opcode) {
            Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.THROW -> emptyList()
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> listOf(target(index))
            Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
            Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ -> listOf(target(index), index + 1)
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> (code[target(index)] as? SwitchPayload)?.switchElements?.map {
                at[offsets[index] + it.offset] ?: fail("invalid switch in $method")
            }?.plus(index + 1) ?: fail("invalid switch payload in $method")
            else -> listOf(index + 1)
        }
        fun handlers(index: Int) = implementation.tryBlocks.filter {
            offsets[index] >= it.startCodeAddress && offsets[index] < it.startCodeAddress + it.codeUnitCount
        }.flatMap { block -> block.exceptionHandlers.map {
            at[it.handlerCodeAddress] ?: fail("invalid handler in $method")
        } }
        val used = mutableSetOf<Int>(); val origins = mutableSetOf<Int>()
        val foundFields = mutableMapOf<String, Tag>(); val writes = mutableListOf<IdentityHeaderWrite>()
        fun step(index: Int, input: State, collect: Boolean): State {
            val ins = code[index]; val keys = input.keys.toMutableMap(); val fresh = input.fresh.toMutableMap()
            var pending: Tag? = null
            ins.writeRegister?.let { written ->
                keys.remove(written); fresh.remove(written)
                if (ins.opcode.setsWideRegister()) { keys.remove(written + 1); fresh.remove(written + 1) }
            }
            val field = ins.getReference<FieldReference>()
            val literal = kind(ins.getReference<StringReference>()?.string)
            when {
                literal != null -> {
                    keys[(ins as OneRegisterInstruction).registerA] = Tag(setOf(literal), "Ljava/lang/String;", setOf(index))
                    if (collect) origins += index
                }
                ins.opcode == Opcode.SGET_OBJECT && field.toString() in fields -> {
                    keys[(ins as OneRegisterInstruction).registerA] = fields.getValue(field.toString()).copy(origins = setOf(index))
                    if (collect) origins += index
                }
                ins.opcode == Opcode.NEW_INSTANCE -> fresh[(ins as OneRegisterInstruction).registerA] = ins.getReference<TypeReference>()!!.type
                ins.opcode in listOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) -> {
                    val move = ins as TwoRegisterInstruction
                    input.keys[move.registerB]?.let { keys[move.registerA] = it }
                    input.fresh[move.registerB]?.let { fresh[move.registerA] = it }
                }
                ins.opcode == Opcode.CHECK_CAST -> input.keys[(ins as OneRegisterInstruction).registerA]?.let { keys[ins.registerA] = it }
                ins.opcode == Opcode.MOVE_RESULT_OBJECT -> input.pending?.let { keys[(ins as OneRegisterInstruction).registerA] = it }
                ins.opcode == Opcode.IGET_OBJECT && field?.type == "Ljava/lang/String;" -> {
                    val get = ins as TwoRegisterInstruction
                    input.keys[get.registerB]?.let { tag ->
                        if (tag.type != "Ljava/lang/String;" && fits(tag.type, field.definingClass)) {
                            val declaration = byType[field.definingClass]?.fields?.singleOrNull { it.name == field.name && it.type == field.type }
                            if (declaration != null && AccessFlags.FINAL.isSet(declaration.accessFlags)) keys[get.registerA] = tag.copy(type = field.type)
                        }
                    }
                }
                ins.opcode == Opcode.SPUT_OBJECT -> input.keys[(ins as OneRegisterInstruction).registerA]?.let { tag ->
                    if (collect) {
                        if (tag.uncertain || tag.kinds.size != 1 || field == null || !fits(tag.type, field.type)) fail("ambiguous key initializer in $method at $index")
                        foundFields[field.toString()] = tag.copy(type = field.type)
                        used += tag.origins
                    }
                }
            }
            ins.getReference<MethodReference>()?.let { ref ->
                val args = identityInvokeRegisters(ins); val params = ref.parameterTypes.map { it.toString() }
                val firstArgument = if (ins.opcode in listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)) 0 else 1
                val tag = args.getOrNull(firstArgument)?.let { input.keys[it] }
                if (tag != null) {
                    when {
                        ref.name == "<init>" && params.size == 2 && params[0] == "Ljava/lang/String;" &&
                            params[1].startsWith("L") && params[1] != "Ljava/lang/String;" && args.size == 3 -> {
                            val receiver = args[0]
                            val valid = input.fresh[receiver] == ref.definingClass
                            keys[receiver] = tag.copy(type = ref.definingClass, uncertain = tag.uncertain || !valid)
                        }
                        firstArgument == 0 && params == listOf("Ljava/lang/String;") && ref.returnType.startsWith("L") &&
                            ref.returnType != "Ljava/lang/String;" -> pending = tag.copy(type = ref.returnType)
                        firstArgument == 1 && params.size == 2 && args.size == 3 && ref.name != "<init>" -> {
                            if (collect) {
                                val validOpcode = ins.opcode in listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
                                    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)
                                if (tag.uncertain || tag.kinds.size != 1 || !validOpcode || !fits(tag.type, params[0]) ||
                                    params[1] !in listOf("Ljava/lang/String;", "Ljava/lang/Object;") ||
                                    (ref.returnType != "V" && ref.returnType != ref.definingClass)
                                ) fail("unrecognized/ambiguous header writer $ref in $method at $index")
                                writes += IdentityHeaderWrite(method, index, tag.kinds.single(), ref, ins.opcode, args)
                                used += tag.origins
                            }
                        }
                        firstArgument == 1 && params.size == 1 && args.size == 2 -> if (collect) used += tag.origins
                    }
                }
            }
            return State(keys, fresh, pending)
        }
        val states = mutableMapOf(0 to State()); val queue = ArrayDeque<Int>(); queue.add(0)
        fun offer(index: Int, state: State) {
            if (index !in code.indices) fail("invalid successor in $method")
            val old = states[index]; val updated = if (old == null) state else merge(old, state)
            if (old != updated) { states[index] = updated; queue.add(index) }
        }
        while (queue.isNotEmpty()) {
            val index = queue.removeFirst(); val input = states.getValue(index)
            val output = step(index, input, false)
            next(index).forEach { offer(it, output) }
            handlers(index).forEach { offer(it, input.copy(pending = null)) }
        }
        states.toSortedMap().forEach { (index, input) -> step(index, input, true) }
        if ((origins - used).isNotEmpty()) fail("unrecognized header-key consumers in $method at ${origins - used}")
        return Result(foundFields, writes)
    }
}
