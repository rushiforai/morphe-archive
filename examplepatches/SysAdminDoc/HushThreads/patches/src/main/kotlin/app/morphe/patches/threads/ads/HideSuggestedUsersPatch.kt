/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireParameterIntact
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.requireThisIntact
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

internal const val SUGGESTED_USERS = "suggested_users"
internal const val KICKSTART_USERS = "text_app_suggested_users_kickstart_unit"
private const val PATCH = "Hide suggested users"
private const val STRING = "Ljava/lang/String;"
private const val RAW_FIELD = "hushthreadsSuggestedUsersRaw"

internal object SuggestedModelFingerprint : Fingerprint(
    name = "<init>", returnType = "V", filters = listOf(string("XDTSuggestedUsers")),
)

internal object SuggestedFeedParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson", returnType = "Ljava/lang/Object;", parameters = listOf("L"),
    filters = listOf(string(KICKSTART_USERS), string(SUGGESTED_USERS)),
)

private data class Use(val index: Int, val register: Int)

/** Follow this value through object moves and control flow, invalidating both halves of writes. */
private fun Method.valueUses(index: Int, register: Int? = null): Set<Use> {
    val flow = ControlFlow.of(this)
    val held = register ?: (flow.instructions[index] as OneRegisterInstruction).registerA
    val pending = ArrayDeque<Use>()
    (if (index < 0) listOf(0) else flow.normal[index]).forEach { pending.add(Use(it, held)) }
    val seen = mutableSetOf<Use>()
    val uses = mutableSetOf<Use>()
    while (pending.isNotEmpty()) {
        val use = pending.removeFirst()
        if (!seen.add(use)) continue
        val instruction = flow.instructions[use.index]
        val opcode = instruction.opcode
        val registers = instruction.namedRegisters()
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        val plainWrite = opcode.setsRegister() && opcode != Opcode.CHECK_CAST &&
            !opcode.name.endsWith("/2addr") && !opcode.name.endsWith("_2addr")
        if (use.register in registers.drop(if (plainWrite) 1 else 0)) uses.add(use)
        val move = opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
        if (move && (instruction as TwoRegisterInstruction).registerB == use.register) {
            flow.normal[use.index].forEach { pending.add(Use(it, instruction.registerA)) }
        }
        val overwritten = opcode.setsRegister() && opcode != Opcode.CHECK_CAST &&
            (destination == use.register || opcode.setsWideRegister() && destination == use.register - 1)
        if (!overwritten) flow.normal[use.index].forEach { pending.add(Use(it, use.register)) }
        flow.exceptional[use.index].forEach { pending.add(Use(it, use.register)) }
    }
    return uses
}

private fun Method.body() = implementation?.instructions?.toList()
    ?: throw PatchException("$PATCH: body missing for $this")

/** Every reaching non-null value must come from this definition or original entry parameter. */
private fun Method.requireValueSource(what: String, read: Use, definition: Use, allowNull: Boolean = false,
                                     flow: ControlFlow = ControlFlow.of(this)) {
    val reachable = mutableSetOf<Int>()
    val entries = ArrayDeque<Int>()
    entries.add(0)
    while (entries.isNotEmpty()) {
        val at = entries.removeFirst()
        if (!reachable.add(at)) continue
        (flow.normal[at] + flow.exceptional[at]).forEach(entries::add)
    }
    if (read.index !in reachable) throw PatchException("$PATCH: $what has an unreachable source")
    val predecessors = Array(flow.instructions.size) { mutableListOf<Pair<Int, Boolean>>() }
    reachable.forEach { at ->
        flow.normal[at].forEach { predecessors[it].add(at to true) }
        flow.exceptional[at].forEach { predecessors[it].add(at to false) }
    }
    val pending = ArrayDeque<Use>()
    pending.add(read)
    val seen = mutableSetOf<Use>()
    var reachedDefinition = false
    while (pending.isNotEmpty()) {
        val use = pending.removeFirst()
        if (!seen.add(use)) continue
        if (use.index == 0) {
            if (definition.index != -1 || use.register != definition.register) {
                throw PatchException("$PATCH: $what has a different entry source")
            }
            reachedDefinition = true
        } else if (predecessors[use.index].isEmpty()) {
            throw PatchException("$PATCH: $what has an unreachable source")
        }
        predecessors[use.index].forEach { (at, normal) ->
            if (normal && at == definition.index && use.register == definition.register) {
                reachedDefinition = true
                return@forEach
            }
            val instruction = flow.instructions[at]
            val opcode = instruction.opcode
            val destination = (instruction as? OneRegisterInstruction)?.registerA
            val written = normal && opcode.setsRegister() && opcode != Opcode.CHECK_CAST &&
                (destination == use.register || opcode.setsWideRegister() && destination == use.register - 1)
            if (written && destination == use.register && allowNull &&
                opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16) &&
                (instruction as NarrowLiteralInstruction).narrowLiteral == 0) return@forEach
            val source = if (!written) use.register else if (destination == use.register &&
                opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)) {
                (instruction as TwoRegisterInstruction).registerB
            } else throw PatchException("$PATCH: $what source overwritten at instruction $at")
            pending.add(Use(at, source))
        }
    }
    if (!reachedDefinition) throw PatchException("$PATCH: $what does not reach its expected definition")
}

private fun Method.stringIndex(value: String): Int {
    val body = body()
    return body.indices.filter { body[it].getReference<StringReference>()?.string == value }
        .singleOrPatchException("$PATCH: unique $value in $this")
}

private data class JsonValue(val result: Int, val parser: String?)

/** The true branch of a unique JSON-key comparison, stopping at its non-matching join. */
private fun Method.jsonValue(key: String, type: String): JsonValue {
    val flow = ControlFlow.of(this)
    val body = flow.instructions
    val literal = stringIndex(key)
    val keyUses = valueUses(literal)
    val equals = keyUses.map { it.index }.distinct().filter {
        val call = body[it].getReference<MethodReference>()
        call?.definingClass == STRING && call.name == "equals" && call.returnType == "Z" &&
            call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") &&
            body[it].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) &&
            body[it].namedRegisters().any { register -> Use(it, register) in keyUses }
    }.singleOrPatchException("$PATCH: $key comparison")
    val keyArgument = body[equals].namedRegisters().filter { Use(equals, it) in keyUses }
        .singleOrPatchException("$PATCH: $key comparison argument")
    requireValueSource("$key comparison", Use(equals, keyArgument),
        Use(literal, (body[literal] as OneRegisterInstruction).registerA))
    val result = body.getOrNull(equals + 1)
    val branch = body.getOrNull(equals + 2)
    if (result?.opcode != Opcode.MOVE_RESULT || branch?.opcode != Opcode.IF_EQZ ||
        (result as OneRegisterInstruction).registerA != (branch as OneRegisterInstruction).registerA) {
        throw PatchException("$PATCH: $key must have a direct conditional result")
    }
    val join = flow.normal[equals + 2].filter { it != equals + 3 }.singleOrPatchException("$PATCH: $key comparison join")
    val pending = ArrayDeque<Int>()
    pending.add(equals + 3)
    val seen = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == join || !seen.add(at)) continue
        flow.normal[at].forEach { pending.add(it) }
    }
    val values = seen.sorted().mapNotNull { at ->
        val call = body[at].getReference<MethodReference>() ?: return@mapNotNull null
        if (body[at].opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
                Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) ||
            call.parameterTypes.map(CharSequence::toString) != parameterTypes.map(CharSequence::toString) ||
            body.getOrNull(at + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        val output = (body[at + 1] as OneRegisterInstruction).registerA
        if (type == STRING) {
            if (call.returnType == STRING) JsonValue(at + 1, null) else null
        } else {
            val cast = body.getOrNull(at + 2)
            val loader = body.getOrNull(at - 1)
            val receiver = body[at].namedRegisters().first()
            if (call.returnType != "Ljava/lang/Object;" || call.name != "parseFromJsonParser" ||
                cast?.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != output ||
                cast.getReference<TypeReference>()?.type != type || loader?.opcode != Opcode.SGET_OBJECT ||
                (loader as OneRegisterInstruction).registerA != receiver) return@mapNotNull null
            JsonValue(at + 1, loader.getReference<FieldReference>()?.type)
        }
    }
    val value = values.singleOrPatchException("$PATCH: typed parsed value for $key")
    val read = value.result - 1
    // Removing the successful comparison edge must make the typed reader unreachable.
    // Merely finding the reader in that arm also admits an incoming branch from elsewhere.
    val bypassed = mutableSetOf<Int>()
    pending.add(0)
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (!bypassed.add(at)) continue
        flow.normal[at].filterNot { at == equals + 2 && it == equals + 3 }.forEach(pending::add)
        flow.exceptional[at].forEach(pending::add)
    }
    if (read in bypassed) throw PatchException("$PATCH: $key reader bypasses its successful key comparison")
    val arguments = body[read].namedRegisters().drop(
        if (body[read].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)) 0 else 1)
    arguments.forEachIndexed { position, register ->
        requireValueSource("$key JSON reader input", Use(read, register),
            Use(-1, parameterRegisterNumber(position)))
    }
    return value
}

internal data class SuggestedTargets(
    val media: MethodReference, val kind: Method,
    val suggestedKind: FieldReference, val kickstartKind: FieldReference,
    val suggestedSlot: FieldReference, val kickstartSlot: FieldReference, val rawType: FieldReference,
    val content: FieldReference, val wrapper: MutableMethod, val capturedRaw: MutableField,
)

internal fun BytecodePatchContext.suggestedTargets(): SuggestedTargets {
    val media = mutableClassDefBy(FEED_ADS).methods.filter { it.name == "itemMedia" }.singleOrPatchException("$PATCH: FeedAds.itemMedia").body()
        .mapNotNull { it.getReference<MethodReference>() }.filter {
            it.parameterTypes.isEmpty() && it.returnType == MEDIA
        }.singleOrPatchException("$PATCH: shared typed Media getter")
    val item = mutableClassDefBy(media.definingClass)
    val kind = item.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            it.parameterTypes.isEmpty() && it.returnType.startsWith("L") &&
            it.body().any { instruction -> instruction.getReference<StringReference>()?.string == "feedItemType" }
    }.singleOrPatchException("$PATCH: item-owned feedItemType getter")
    val kinds = mutableClassDefBy(kind.returnType)
    if (kinds.superclass != "Ljava/lang/Enum;" || !AccessFlags.PUBLIC.isSet(kinds.accessFlags)) {
        throw PatchException("$PATCH: feedItemType is not a public enum")
    }
    val initializer = kinds.methods.filter { it.name == "<clinit>" }.singleOrPatchException("$PATCH: ${kinds.type} static initializer")
    fun enumField(wire: String, name: String): FieldReference {
        val body = initializer.body()
        val wireUses = initializer.valueUses(initializer.stringIndex(wire))
        val nameUses = initializer.valueUses(initializer.stringIndex(name))
        val constructs = wireUses.filter {
            val call = body[it.index].getReference<MethodReference>()
            val registers = body[it.index].namedRegisters()
            call?.definingClass == kinds.type && call.name == "<init>" &&
                call.parameterTypes.map(CharSequence::toString) == listOf(STRING, "I", STRING) &&
                registers.size == 4 && registers[3] == it.register &&
                Use(it.index, registers[1]) in nameUses
        }.map { it.index }.distinct()
        val construct = constructs.singleOrPatchException("$PATCH: enum constructor for $wire")
        val receiver = body[construct].namedRegisters().first()
        val allocation = body.take(construct).indices.lastOrNull {
            body[it].opcode.setsRegister() && (body[it] as? OneRegisterInstruction)?.registerA == receiver
        } ?: throw PatchException("$PATCH: enum allocation for $wire")
        if (body[allocation].opcode != Opcode.NEW_INSTANCE ||
            body[allocation].getReference<TypeReference>()?.type != kinds.type) {
            throw PatchException("$PATCH: enum receiver for $wire")
        }
        val fields = initializer.valueUses(allocation).mapNotNull {
            val instruction = body[it.index]
            instruction.getReference<FieldReference>()?.takeIf { field ->
                instruction.opcode == Opcode.SPUT_OBJECT && field.definingClass == kinds.type &&
                    field.type == kinds.type && (instruction as OneRegisterInstruction).registerA == it.register
            }
        }.distinctBy { it.toString() }
        return fields.singleOrPatchException("$PATCH: enum field for $wire").also { field ->
            if (kinds.fields.none { it.name == field.name && it.type == field.type &&
                    AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
                    AccessFlags.ENUM.isSet(it.accessFlags) }) throw PatchException("$PATCH: public enum field $field")
        }
    }
    val suggestedKind = enumField(SUGGESTED_USERS, "SUGGESTED_USERS")
    val kickstartKind = enumField(KICKSTART_USERS, "KICKSTART_FEED_UNIT")
    val constructor = SuggestedModelFingerprint.method
    val model = mutableClassDefBy(constructor.definingClass)
    if (!AccessFlags.PUBLIC.isSet(model.accessFlags)) throw PatchException("$PATCH: private raw model")
    val parser = SuggestedFeedParserFingerprint.method
    val body = parser.body()
    val allocation = body.indices.filter {
        body[it].opcode == Opcode.NEW_INSTANCE && body[it].getReference<TypeReference>()?.type == item.type
    }.singleOrPatchException("$PATCH: feed-item allocation in response parser")
    val receivers = parser.valueUses(allocation)
    fun slot(key: String): Pair<FieldReference, String> {
        val value = parser.jsonValue(key, model.type)
        val stores = parser.valueUses(value.result).mapNotNull {
            val instruction = body[it.index]
            instruction.getReference<FieldReference>()?.takeIf { field ->
                instruction.opcode == Opcode.IPUT_OBJECT && field.definingClass == item.type &&
                    field.type == model.type && (instruction as TwoRegisterInstruction).registerA == it.register &&
                    Use(it.index, instruction.registerB) in receivers
            }
        }.distinctBy { it.toString() }
        val field = stores.singleOrPatchException("$PATCH: item-owned raw slot for $key")
        body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT &&
            body[it].getReference<FieldReference>()?.toString() == field.toString() }.forEach { store ->
            parser.requireValueSource("$key slot", Use(store, (body[store] as TwoRegisterInstruction).registerA),
                Use(value.result, (body[value.result] as OneRegisterInstruction).registerA), allowNull = true)
        }
        if (item.fields.none { it.name == field.name && it.type == model.type &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
            throw PatchException("$PATCH: accessible raw slot $field")
        }
        return field to (value.parser ?: throw PatchException("$PATCH: raw parser missing for $key"))
    }
    val (suggestedSlot, rawParserType) = slot(SUGGESTED_USERS)
    val (kickstartSlot, otherParser) = slot(KICKSTART_USERS)
    if (suggestedSlot.toString() == kickstartSlot.toString() || rawParserType != otherParser) {
        throw PatchException("$PATCH: distinct slots must use one raw parser")
    }
    val rawParser = mutableClassDefBy(rawParserType).methods.filter {
        it.name == "unsafeParseFromJson" && it.returnType == "Ljava/lang/Object;" &&
            it.parameterTypes.map(CharSequence::toString) == parser.parameterTypes.map(CharSequence::toString) &&
            it.body().any { instruction -> instruction.getReference<StringReference>()?.string == "netego_type" }
    }.singleOrPatchException("$PATCH: netego_type parser")
    val rawValue = rawParser.jsonValue("netego_type", STRING)
    val rawBody = rawParser.body()
    val arguments = rawParser.valueUses(rawValue.result).mapNotNull {
        val call = rawBody[it.index].getReference<MethodReference>()
        if (call?.toString() != constructor.toString()) return@mapNotNull null
        val positions = rawBody[it.index].namedRegisters().withIndex().filter { arg -> arg.value == it.register }
        positions.singleOrNull()?.index?.minus(1)
    }.distinct()
    val argument = arguments.singleOrPatchException("$PATCH: raw type constructor argument")
    if (argument !in constructor.parameterTypes.indices || constructor.parameterTypes[argument] != STRING) {
        throw PatchException("$PATCH: raw type argument is not String")
    }
    rawBody.indices.filter { rawBody[it].getReference<MethodReference>()?.toString() == constructor.toString() }
        .forEach { call -> rawParser.requireValueSource("netego_type constructor argument",
            Use(call, rawBody[call].namedRegisters()[argument + 1]),
            Use(rawValue.result, (rawBody[rawValue.result] as OneRegisterInstruction).registerA), allowNull = true)
        }
    val parameter = constructor.parameterRegisterNumber(argument)
    val fields = constructor.valueUses(-1, parameter).mapNotNull {
        val instruction = constructor.body()[it.index]
        instruction.getReference<FieldReference>()?.takeIf { field ->
            instruction.opcode == Opcode.IPUT_OBJECT && field.definingClass == model.type &&
                field.type == STRING && (instruction as TwoRegisterInstruction).registerA == it.register &&
                instruction.registerB == constructor.implementation!!.registerCount -
                    constructor.parameterTypes.sumOf { type -> if (type == "J" || type == "D") 2 else 1 } - 1
        }
    }.distinctBy { it.toString() }
    val rawType = fields.singleOrPatchException("$PATCH: raw type String field")
    if (model.fields.none { it.name == rawType.name && it.type == STRING &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: accessible raw type field")
    }
    val rawWrites = model.methods.flatMap { method -> method.body().withIndex().filter {
        it.value.opcode == Opcode.IPUT_OBJECT && it.value.getReference<FieldReference>()?.toString() == rawType.toString()
    }.map { method to it.index } }
    if (rawWrites.size != 1 || rawWrites.single().first.toString() != constructor.toString()) {
        throw PatchException("$PATCH: competing raw type field writes; candidates: " + rawWrites.joinToString { "${it.first}@${it.second}" })
    }
    val rawStore = rawWrites.single().second
    constructor.requireThisIntact(PATCH, listOf(rawStore))
    constructor.requireValueSource("raw type field", Use(rawStore,
        (constructor.body()[rawStore] as TwoRegisterInstruction).registerA), Use(-1, parameter))
    // Both root slots must feed the same wrapper whose enum map consumes this exact raw field.
    val wrappers = listOf(suggestedSlot, kickstartSlot).map { slot ->
        body.indices.filter { body[it].opcode == Opcode.IGET_OBJECT &&
            body[it].getReference<FieldReference>()?.toString() == slot.toString() }.flatMap { read ->
            parser.valueUses(read).mapNotNull { use ->
                body[use.index].getReference<MethodReference>()?.takeIf { call ->
                    call.name == "<init>" && call.parameterTypes.map(CharSequence::toString) == listOf(model.type) &&
                        body[use.index].namedRegisters().getOrNull(1) == use.register
                }?.let { it to use.index }
            }
        }.distinctBy { it.second }.singleOrPatchException("$PATCH: wrapper consuming $slot")
    }
    if (wrappers[0].first.toString() != wrappers[1].first.toString()) throw PatchException("$PATCH: conflicting wrappers ${wrappers[0].first} and ${wrappers[1].first}")
    val wrapperType = wrappers[0].first.definingClass
    val wrapperClass = mutableClassDefBy(wrapperType)
    if (!AccessFlags.PUBLIC.isSet(wrapperClass.accessFlags) ||
        (wrapperClass.instanceFields + wrapperClass.staticFields).any { it.name == RAW_FIELD }) {
        throw PatchException("$PATCH: accessible wrapper with no capture-field collision")
    }
    val wrapper = wrapperClass.methods.filter { it.toString() == wrappers[0].first.toString() }.singleOrPatchException("$PATCH: wrapper declaration ${wrappers[0].first}")
    val wrapperBody = wrapper.body()
    val reads = wrapperBody.indices.filter {
        wrapperBody[it].opcode == Opcode.IGET_OBJECT &&
            wrapperBody[it].getReference<FieldReference>()?.toString() == rawType.toString()
    }
    val mapUses = reads.flatMap { read -> wrapper.valueUses(read).filter {
        wrapperBody[it.index].getReference<MethodReference>()?.toString() ==
            "Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;" &&
            wrapperBody[it.index].namedRegisters().getOrNull(1) == it.register &&
            wrapperBody.getOrNull(it.index + 2)?.getReference<TypeReference>()?.type == kinds.type
    } }.distinct()
    if (mapUses.size != 1) throw PatchException("$PATCH: raw type must select the feed enum in its wrapper; found ${mapUses.size} map reads: " + mapUses.joinToString { "${it.index}" })
    val mapUse = mapUses.single()
    val rawRead = reads.filter { mapUse in wrapper.valueUses(it) }
        .singleOrPatchException("$PATCH: raw type read for the enum map")
    val rawParameter = wrapper.parameterRegisterNumber(0)
    wrapper.requireValueSource("raw type map receiver", Use(rawRead,
        (wrapperBody[rawRead] as TwoRegisterInstruction).registerB), Use(-1, rawParameter))
    // A null Raw input takes the stock null-map path and cannot match a non-null card slot.
    // Prove the map input on every path where that original Raw input is non-null.
    val guard = rawRead - 1
    val nonNullFlow = ControlFlow.of(wrapper)
    if (guard < 0 || wrapperBody[guard].opcode != Opcode.IF_EQZ ||
        nonNullFlow.normal[guard].size != 2 || rawRead !in nonNullFlow.normal[guard]) {
        throw PatchException("$PATCH: raw type read requires its original input's null guard")
    }
    wrapper.requireValueSource("raw type map null guard", Use(guard,
        (wrapperBody[guard] as OneRegisterInstruction).registerA), Use(-1, rawParameter))
    nonNullFlow.normal[guard] = listOf(rawRead)
    wrapper.requireValueSource("raw type map argument", mapUse,
        Use(rawRead, (wrapperBody[rawRead] as OneRegisterInstruction).registerA), flow = nonNullFlow)
    val contentFields = wrappers.map { (_, call) ->
        val receiver = body[call].namedRegisters().first()
        val allocation = body.indices.filter {
            body[it].opcode == Opcode.NEW_INSTANCE && body[it].getReference<TypeReference>()?.type == wrapperType &&
                Use(call, receiver) in parser.valueUses(it)
        }.singleOrPatchException("$PATCH: wrapper allocation for instruction $call")
        parser.valueUses(allocation).mapNotNull { use ->
            val instruction = body[use.index]
            instruction.getReference<FieldReference>()?.takeIf { field ->
                instruction.opcode == Opcode.IPUT_OBJECT && field.definingClass == item.type &&
                    (instruction as TwoRegisterInstruction).registerA == use.register &&
                    Use(use.index, instruction.registerB) in receivers
            }
        }.distinctBy { it.toString() }.singleOrPatchException("$PATCH: active content store")
    }.distinctBy { it.toString() }
    val content = contentFields.singleOrPatchException("$PATCH: common active content field")
    if (item.fields.none { it.name == content.name && it.type == content.type &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }) {
        throw PatchException("$PATCH: accessible active content field")
    }
    val returns = wrapperBody.indices.filter { wrapperBody[it].opcode == Opcode.RETURN_VOID }
    if (returns.isEmpty() || wrapper.implementation!!.tryBlocks.isNotEmpty()) {
        throw PatchException("$PATCH: wrapper capture requires unprotected void returns")
    }
    wrapper.requireLocals(PATCH, 2)
    wrapper.requireParameterIntact(PATCH, 0, returns)
    wrapper.requireThisIntact(PATCH, returns)
    val capturedRaw = MutableField(ImmutableField(wrapperType, RAW_FIELD, model.type,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, null))
    return SuggestedTargets(media, kind, suggestedKind, kickstartKind, suggestedSlot, kickstartSlot, rawType,
        content, wrapper, capturedRaw)
}

/** Server cards only. Raw type checks refuse the vendor's generic SUGGESTED_USERS fallback. */
@Suppress("unused")
val hideSuggestedUsersPatch = bytecodePatch(
    name = PATCH,
    description = "Removes verified server cards suggesting accounts to follow. Ordinary posts, reposts and unknown card types stay.",
    default = true,
) {
    category("Feed")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    dependsOn(feedPageFilterPatch)
    compatibleWith(*AppCompatibilities.threads())
    execute {
        requireStatusMethod("hideSuggestedUsers")
        val targets = suggestedTargets()
        val owner = targets.media.definingClass
        val media = targets.media
        val kind = targets.kind
        val suggestedKind = targets.suggestedKind
        val kickstartKind = targets.kickstartKind
        val suggestedSlot = targets.suggestedSlot
        val kickstartSlot = targets.kickstartSlot
        val rawType = targets.rawType
        val content = targets.content
        val capturedRaw = targets.capturedRaw
        val wrapperType = targets.wrapper.definingClass
        mutableClassDefBy(wrapperType).instanceFields.add(capturedRaw)
        targets.wrapper.body().indices.filter { targets.wrapper.body()[it].opcode == Opcode.RETURN_VOID }
            .reversed().forEach { at -> targets.wrapper.addInstructionsAtControlFlowLabel(at, """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                iput-object v1, v0, $capturedRaw
            """) }
        writeStub(FEED_ADS, "isSuggestedUserItem", 5, """
            instance-of v0, p0, $owner
            if-eqz v0, :none
            check-cast p0, $owner
            invoke-virtual { p0 }, $media
            move-result-object v0
            if-nez v0, :none
            invoke-virtual { p0 }, $kind
            move-result-object v0
            sget-object v1, $suggestedKind
            if-eq v0, v1, :suggested
            sget-object v1, $kickstartKind
            if-ne v0, v1, :none
            iget-object v0, p0, $kickstartSlot
            const-string v1, "$KICKSTART_USERS"
            goto :card
            :suggested
            iget-object v0, p0, $suggestedSlot
            const-string v1, "$SUGGESTED_USERS"
            :card
            if-eqz v0, :none
            iget-object v2, p0, $content
            instance-of v3, v2, $wrapperType
            if-eqz v3, :none
            check-cast v2, $wrapperType
            iget-object v2, v2, $capturedRaw
            if-ne v0, v2, :none
            iget-object v0, v0, $rawType
            invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """)
        enableStatus("hideSuggestedUsers")
    }
}
