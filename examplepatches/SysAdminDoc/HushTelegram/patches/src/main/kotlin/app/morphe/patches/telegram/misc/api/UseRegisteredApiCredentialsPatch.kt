/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.iface.value.NullEncodedValue

private const val PATCH = "Use registered Telegram API credentials"
internal const val BUILD_VARS = "Lorg/telegram/messenger/BuildVars;"
internal const val CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;"
private const val STRING = "Ljava/lang/String;"
private const val PASSKEYS = "Lorg/telegram/messenger/PasskeysController;"
private const val UNKNOWN = -1

/** Own registered application identity, configured while patching, before native initialization. */
@Suppress("unused")
val useRegisteredApiCredentialsPatch = bytecodePatch(
    name = PATCH,
    description = "Uses the API ID and hash registered for your application at my.telegram.org. " +
        "Supply both patch options. Leaving both unset keeps the original credentials.",
    default = false,
) {
    category("Fixes")
    compatibleWith(*AppCompatibilities.telegram())
    val apiId by stringOption(
        key = "apiId", default = null, title = "Registered API ID",
        description = "The positive application ID from your Telegram API development tools.", required = false,
    )
    val apiHash by stringOption(
        key = "apiHash", default = null, title = "Registered API hash",
        description = "The 32 hexadecimal characters paired with that API ID. Keep this value in local patch inputs.",
        required = false,
    )
    execute { applyRegisteredApiCredentials(apiId, apiHash) }
}

internal class ApiCredentials(val id: Int, val hash: String)
internal data class ApiLiteral(val index: Int, val register: Int)
internal data class ApiCredentialsPlan(
    val initializer: MutableMethod, val id: ApiLiteral, val hash: ApiLiteral,
    val readers: List<Method>, val connectionInitializer: MutableMethod,
    val nativeCall: Int, val versionRegister: Int,
)

/** Error messages name an option, never echo either supplied credential. */
internal fun checkedApiCredentials(id: String?, hash: String?): ApiCredentials? {
    if (id == null && hash == null) return null
    if (id == null || hash == null) throw PatchException("$PATCH: supply both apiId and apiHash.")
    val number = id.takeIf { it.matches(Regex("[1-9][0-9]*")) }?.toIntOrNull()
        ?: throw PatchException("$PATCH: apiId must be a positive 32-bit decimal integer.")
    if (!hash.matches(Regex("[0-9a-fA-F]{32}"))) {
        throw PatchException("$PATCH: apiHash must contain exactly 32 hexadecimal characters.")
    }
    return ApiCredentials(number, hash)
}

internal fun BytecodePatchContext.applyRegisteredApiCredentials(id: String?, hash: String?) {
    val credentials = checkedApiCredentials(id, hash) ?: return
    val plan = resolveApiCredentials()
    plan.initializer.replaceInstruction(plan.id.index, "const v${plan.id.register}, ${credentials.id}")
    plan.initializer.replaceInstruction(plan.hash.index, "const-string v${plan.hash.register}, \"${credentials.hash}\"")
    // Telegram resends initConnection only when this native version differs from the one it last saved,
    // so an in-place update from the stock identity would keep announcing the old API ID.
    plan.connectionInitializer.addInstruction(plan.nativeCall,
        "xor-int/lit8 v${plan.versionRegister}, v${plan.versionRegister}, ${nativeVersionTag(credentials.id)}")
}

/** Negative, so the tagged version never equals a stock build version; it also changes with the API ID. */
internal fun nativeVersionTag(id: Int) = -1 - id % 128

/** All writers, authentication readers and native identity arguments are proved before either edit. */
internal fun BytecodePatchContext.resolveApiCredentials(): ApiCredentialsPlan {
    val types = linkedSetOf(BUILD_VARS, CONNECTIONS, PASSKEYS)
    classDefForEach { owner ->
        if (owner.methods.any { method -> method.instructions().any { instruction ->
            instruction.credentialField() != null || instruction.call()?.let {
                it.definingClass == CONNECTIONS && it.name == "native_init"
            } == true
        } }) types += owner.type
    }
    val classes = types.map(::mutableClassDefBy)
    val build = classes.single { it.type == BUILD_VARS }
    requireShape(AccessFlags.PUBLIC.isSet(build.accessFlags), "credential owner is inaccessible")
    for ((name, type) in listOf("APP_ID" to "I", "APP_HASH" to STRING)) {
        val field = build.fields.filter { it.name == name }.unique("$name field")
        val initial = field.initialValue
        val defaultValue = initial == null || if (name == "APP_ID")
            (initial as? IntEncodedValue)?.value == 0 else initial is NullEncodedValue
        requireShape(field.type == type && AccessFlags.PUBLIC.isSet(field.accessFlags) &&
            AccessFlags.STATIC.isSet(field.accessFlags) && !AccessFlags.FINAL.isSet(field.accessFlags) &&
            defaultValue, "$name is not an initialized mutable static field")
    }
    val initializer = build.methods.filter { it.name == "<clinit>" && it.parameterTypes.isEmpty() &&
        it.returnType == "V" && AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.unique("credential initializer")
    val methods = classes.flatMap { it.methods.toList() }
    val accesses = methods.flatMap { method -> method.instructions().mapIndexedNotNull { index, instruction ->
        instruction.credentialField()?.let { ApiAccess(method, index, instruction, it) }
    } }
    val writes = accesses.filter { it.instruction.opcode in setOf(Opcode.SPUT, Opcode.SPUT_OBJECT) }
    requireShape(writes.size == 2 && writes.all { it.method === initializer } &&
        writes.map { it.field.name }.toSet() == setOf("APP_ID", "APP_HASH"), "credential writes are not confined to initialization")
    requireShape(accesses.all { access -> access.field.type == (if (access.field.name == "APP_ID") "I" else STRING) &&
        access.instruction.opcode in (if (access.field.name == "APP_ID") setOf(Opcode.SGET, Opcode.SPUT)
            else setOf(Opcode.SGET_OBJECT, Opcode.SPUT_OBJECT))
    }, "a credential access lost its field type or static opcode")

    val origins = mutableMapOf<Method, ApiOrigins>()
    fun origin(method: Method, at: Int, register: Int) = origins.getOrPut(method) { ApiOrigins(method) }.at(at, register)
    val instructions = initializer.instructions()
    fun literal(name: String): ApiLiteral {
        val writer = writes.single { it.field.name == name }
        val at = writer.index - 1
        val producer = instructions.getOrNull(at)
        val register = writer.instruction.namedRegisters().singleOrNull()
        requireShape(producer != null && register != null && producer.namedRegisters() == listOf(register) &&
            origin(initializer, writer.index, register) == setOf(at), "$name has no sole literal definition")
        requireShape(if (name == "APP_ID") producer is NarrowLiteralInstruction &&
            producer.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16) &&
            producer.narrowLiteral > 0 else producer!!.opcode in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO) &&
            producer.string()?.matches(Regex("[0-9a-fA-F]{32}")) == true, "$name initializer is not a valid literal")
        requireShape(instructions.getOrNull(writer.index + 1)?.let { next -> next.opcode.setsRegister() &&
            next.namedRegisters().firstOrNull() == register && !next.opcode.name.startsWith("move") } == true,
            "$name literal register is reused after its field write")
        return ApiLiteral(at, register!!)
    }
    val id = literal("APP_ID")
    val hash = literal("APP_HASH")
    val reads = accesses.filter { it !in writes }
    requireShape(reads.count { it.field.name == "APP_ID" } == 5 && reads.count { it.field.name == "APP_HASH" } == 2,
        "credential reader inventory changed")
    val authentication = reads.filter { it.field.name == "APP_HASH" }.map { it.method }.distinct()
    val requestTypes = linkedSetOf<String>()
    for (method in authentication) {
        val body = method.instructions()
        val methodReads = reads.filter { it.method === method }
        requireShape(methodReads.size == 2 && methodReads.map { it.field.name }.toSet() == setOf("APP_ID", "APP_HASH"),
            "authentication no longer reads a paired identity")
        val stores = methodReads.map { read ->
            val fieldName = if (read.field.name == "APP_ID") "api_id" else "api_hash"
            val store = body.indices.filter { index -> body[index].field()?.let { field ->
                field.name == fieldName && field.type == read.field.type && body[index].opcode ==
                    if (fieldName == "api_id") Opcode.IPUT else Opcode.IPUT_OBJECT
            } == true && body[index].namedRegisters().firstOrNull()?.let { register ->
                origin(method, index, register) == setOf(read.index)
            } == true }.unique("authentication $fieldName binding")
            store to origin(method, store, body[store].namedRegisters()[1])
        }
        val allocation = stores.first().second.singleOrNull()
        requireShape(allocation != null && allocation >= 0 && stores.all { it.second == setOf(allocation) } &&
            body[allocation].opcode == Opcode.NEW_INSTANCE, "authentication pair targets different request objects")
        val request = ((body[allocation!!] as? ReferenceInstruction)?.reference as? TypeReference)?.type
        requireShape(request in setOf("Lorg/telegram/tgnet/TLRPC\$TL_auth_sendCode;",
            "Lorg/telegram/tgnet/tl/TL_account\$initPasskeyLogin;") &&
            stores.all { body[it.first].field()?.definingClass == request }, "authentication request type changed")
        requireShape(requestTypes.add(request!!), "authentication request binding is ambiguous")
    }
    requireShape(requestTypes.size == 2, "phone or passkey authentication binding is missing")

    val connection = classes.single { it.type == CONNECTIONS }
    val constructor = connection.methods.filter { it.name == "<init>" && it.hasShape(listOf("I"), "V") }
        .unique("connection constructor")
    val connectionRead = reads.filter { it.method === constructor && it.field.name == "APP_ID" }.unique("native API ID source")
    val javaInit = connection.methods.filter { it.name == "init" && it.parameterTypes.take(3) == listOf("I", "I", "I") &&
        it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.unique("connection initializer")
    val call = constructor.instructions().indices.filter { constructor.instructions()[it].call()?.same(javaInit) == true }
        .unique("connection initializer call")
    val arguments = constructor.instructions()[call].namedRegisters()
    requireShape(arguments.size >= 4 && origin(constructor, call, arguments[3]) == setOf(connectionRead.index),
        "native connection setup no longer receives the registered API ID")
    val nativeSites = methods.flatMap { method -> method.instructions().mapIndexedNotNull { index, instruction ->
        instruction.call()?.takeIf { it.definingClass == CONNECTIONS && it.name == "native_init" }?.let { method to index }
    } }.unique("native connection initialization")
    requireShape(nativeSites.first === javaInit, "native initialization bypasses the verified bridge")
    val nativeCall = javaInit.instructions()[nativeSites.second]
    val nativeArguments = nativeCall.namedRegisters()
    val parameter = javaInit.implementation!!.registerCount - javaInit.parameterWords() + 3
    requireShape(nativeCall.opcode == Opcode.INVOKE_STATIC_RANGE && nativeArguments.size >= 4 &&
        nativeCall.call()?.parameterTypes?.take(4) == listOf("I", "I", "I", "I") &&
        origin(javaInit, nativeSites.second, nativeArguments[3]) == setOf(parameterToken(parameter)),
        "native initialization no longer receives the intact API ID parameter")
    val versionRegister = nativeArguments[1]
    requireShape(versionRegister <= 0xff && origin(javaInit, nativeSites.second, versionRegister) ==
        setOf(parameterToken(parameter - 2)), "native initialization no longer receives the intact build version parameter")
    val initFlow = ControlFlow.of(javaInit)
    requireShape(javaInit.instructions().indices.filter { nativeSites.second in initFlow.normal[it] ||
        nativeSites.second in initFlow.exceptional[it] } == listOf(nativeSites.second - 1),
        "native initialization is reachable from more than its preceding instruction")
    for (read in reads.filter { it.method !in authentication && it.method !== constructor }) {
        val body = read.method.instructions()
        requireShape(read.field.name == "APP_ID" && body.indices.count { index ->
            body[index].call()?.let { it.definingClass == "Ljava/lang/StringBuilder;" && it.name == "append" &&
                it.hasShape(listOf("I"), "Ljava/lang/StringBuilder;") } == true &&
                body[index].namedRegisters().getOrNull(1)?.let { origin(read.method, index, it) == setOf(read.index) } == true
        } == 1, "an API ID read has an unrecognized use")
    }
    return ApiCredentialsPlan(initializer, id, hash, reads.map { it.method }.distinct(), javaInit, nativeSites.second, versionRegister)
}

private data class ApiAccess(val method: Method, val index: Int, val instruction: Instruction, val field: FieldReference)

/** Reaching definitions on every normal and caught-exception path; moves preserve the source identity. */
private class ApiOrigins(method: Method) {
    private val body = method.instructions()
    private val flow = ControlFlow.of(method)
    private val states = arrayOfNulls<Array<Set<Int>>>(body.size)
    init {
        val registers = method.implementation!!.registerCount
        val parameters = registers - method.parameterWords()
        states[0] = Array(registers) { register -> setOf(if (register >= parameters) parameterToken(register) else UNKNOWN) }
        val pending = java.util.ArrayDeque<Int>().apply { add(0) }
        fun merge(target: Int, values: Array<Set<Int>>) {
            val previous = states[target]
            val next = Array(registers) { register -> previous?.get(register).orEmpty() + values[register] }
            if (previous == null || !next.contentEquals(previous)) { states[target] = next; pending.add(target) }
        }
        while (pending.isNotEmpty()) {
            val at = pending.removeFirst()
            val before = states[at]!!
            val after = before.copyOf()
            val instruction = body[at]
            if (instruction.opcode.setsRegister()) {
                val operands = instruction.namedRegisters()
                val destination = operands.firstOrNull()
                if (destination != null && destination in after.indices) {
                    after[destination] = if (instruction.opcode.name.startsWith("move") &&
                        !instruction.opcode.name.startsWith("move-result") && operands.size == 2)
                        before[operands[1]] else setOf(at)
                    if (instruction.opcode.setsWideRegister() && destination + 1 in after.indices) after[destination + 1] = after[destination]
                }
            }
            flow.normal[at].forEach { merge(it, after) }
            flow.exceptional[at].forEach { merge(it, before) }
        }
    }
    fun at(index: Int, register: Int): Set<Int> = states.getOrNull(index)?.getOrNull(register).orEmpty()
}

private fun parameterToken(register: Int) = -register - 2
private fun Method.parameterWords() = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
    if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Instruction.credentialField() = field()?.takeIf { it.definingClass == BUILD_VARS && it.name in setOf("APP_ID", "APP_HASH") }
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
private fun MethodReference.hasShape(parameters: List<String>, result: String) = parameterTypes.map(CharSequence::toString) == parameters && returnType == result
private fun MethodReference.same(other: MethodReference) = definingClass == other.definingClass && name == other.name &&
    parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString) && returnType == other.returnType
private fun requireShape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason; refuses changed client identity before editing")
}
private fun <T> List<T>.unique(what: String): T { requireShape(size == 1, "$what has $size matches"); return single() }
