/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.developeroptions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.originalName
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val OVERRIDE_PARAMETER = "$EXTENSION_PACKAGE/misc/OverrideExchange\$Parameter;"
private const val USER = "Lcom/instagram/common/session/UserSession;"
private const val CALLBACK = "Lcom/facebook/mobileconfig/MobileConfigUpdateOverridesTableCallback;"
private const val PARAM_CTOR = "(IILjava/lang/String;Ljava/lang/String;IJ)V"
private val RECORD_ARGS = listOf("Ljava/lang/String;", "Ljava/lang/String;") + List(7) { "I" } + List(3) { "Z" }

internal data class OverrideReader(
    val singleton: String, val sessionFactory: String, val managerField: String, val modelField: String,
    val model: String, val fileResolver: String, val schemaGetter: String, val schemaList: String,
    val entry: String, val config: String, val index: String, val configName: String, val name: String,
    val type: String, val nativeId: String,
)

/** Follow the diagnostics' session manager and its native callback's file resolver, never a path. */
internal fun BytecodePatchContext.findOverrideReader(editor: OverrideEditor): OverrideReader {
    val diagnostic = mutableListOf<Method>()
    classDefForEach { clazz ->
        if (clazz.originalName() == "MobileConfigRolloutDiagFragment") clazz.methods.filterTo(diagnostic) {
            it.name == "onCreate" && it.parameterTypes.map(Any::toString) == listOf("Landroid/os/Bundle;") &&
                "null cannot be cast to non-null type com.instagram.quickexperiment.impl.QuickExperimentManagerImpl" in it.text()
        }
    }
    val diagnosticMethod = diagnostic.one("signed-in override diagnostics")
    val code = diagnosticMethod.implementation!!.instructions.toList()
    val (factoryIndex, factory) = code.mapIndexedNotNull { i, instruction ->
        instruction.method()?.takeIf { instruction.opcode == Opcode.INVOKE_VIRTUAL &&
            it.parameterTypes.map(Any::toString) == listOf(USER) && it.returnType.startsWith("L") }?.let { i to it }
    }.one("session override manager factory")
    publicMethod(factory)
    val receiver = code[factoryIndex].arguments().firstOrNull() ?: readerRefuse("unreadable session factory receiver")
    val singletonIndex = (0 until factoryIndex).lastOrNull { (code[it] as? OneRegisterInstruction)?.registerA == receiver && code[it].opcode.setsRegister() }
        ?: readerRefuse("session factory receiver has no origin")
    val singleton = (code[singletonIndex].takeIf { it.opcode == Opcode.SGET_OBJECT } as? ReferenceInstruction)?.reference as? FieldReference
        ?: readerRefuse("session factory receiver isn't the native singleton")
    if (singleton.type != factory.definingClass || singleton.definingClass != factory.definingClass) readerRefuse("session factory singleton belongs to another owner")
    publicField(singleton, true)
    val result = code.getOrNull(factoryIndex + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
        ?: readerRefuse("session manager result isn't retained")
    val path = sessionFieldPath(diagnosticMethod, code, factoryIndex + 2, result.registerA, factory.returnType)
    val model = path.last().type
    val owner = readerClass(model)
    val file = owner.methods.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map(Any::toString) == listOf(model) &&
        it.returnType == "Ljava/io/File;" && it.text().containsAll(listOf("mobileconfig", "mc_overrides.json")) &&
        it.implementation?.instructions?.any { instruction -> instruction.method()?.let {
            it.name == "getDataDirPath" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
        } == true } == true }.one("native override file resolver")
    publicMethod(file)
    val callbacks = mutableListOf<Method>()
    classDefForEach { clazz ->
        if (CALLBACK in clazz.interfaces) clazz.methods.filterTo(callbacks) { it.name == "onOverridesFileUpdated" &&
            it.parameterTypes.isEmpty() && it.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC && instruction.method()?.toString() == file.toString()
            } == true }
    }
    callbacks.one("native override file callback")
    val schema = owner.methods.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.isEmpty() &&
        it.returnType.startsWith("L") && it.text().containsAll(listOf("MobileConfigIdNameMappingLoader",
            "failed to parse and get namedParamsMapList, name is null")) }.one("typed override schema getter")
    publicMethod(schema)
    val listOwner = readerClass(schema.returnType)
    val list = listOwner.fields.filter { it.type == "Ljava/util/List;" && AccessFlags.FINAL.isSet(it.accessFlags) &&
        !AccessFlags.STATIC.isSet(it.accessFlags) }.one("schema parameter list")
    publicField(list, false)
    val constructor = schema.implementation!!.instructions.mapNotNull { it.method() }.filter {
        it.name == "<init>" && it.parameterTypes.map(Any::toString) == RECORD_ARGS && it.returnType == "V"
    }.distinctBy(Any::toString).one("typed schema record constructor")
    publicMethod(constructor)
    val entry = readerClass(constructor.definingClass)
    val fields = constructorFields(entry, constructor)
    val nativeId = entry.methods.filter { it.parameterTypes.isEmpty() && it.returnType == "J" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .one("encoded schema parameter ID")
    publicMethod(nativeId)
    val firstInteger = nativeId.implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { it.type == "I" } }?.firstOrNull()
    if (firstInteger?.toString() != fields[6].toString()) readerRefuse("encoded parameter type doesn't match its constructor role")
    for ((name, index) in listOf(0 to 8, 1 to 2)) {
        entry.methods.filter { it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" && "_" in it.text() &&
            it.implementation?.instructions?.mapNotNull { instruction -> (instruction as? ReferenceInstruction)?.reference?.toString() }
                ?.containsAll(listOf(fields[name].toString(), fields[index].toString())) == true }
            .one("schema name/index role")
    }
    readerStubs()
    val projection = readerClass(OVERRIDE_PARAMETER).methods.filter { it.name == "<init>" &&
        it.parameterTypes.map(Any::toString) == listOf("I", "I", "Ljava/lang/String;", "Ljava/lang/String;", "I", "J") && it.returnType == "V" }
        .one("extension schema projection constructor")
    publicMethod(projection)
    if (editor.getter.substringBefore("->") != "Lcom/instagram/base/activity/IgFragmentActivity;") readerRefuse("unsupported native activity session accessor")
    return OverrideReader(singleton.toString(), factory.toString(), path[0].toString(), path[1].toString(), model,
        file.toString(), schema.toString(), list.toString(), entry.type, fields[8].toString(), fields[2].toString(),
        fields[0].toString(), fields[1].toString(), fields[6].toString(), nativeId.toString())
}

/** A throwing sibling branch doesn't overwrite registers on the successful branch. Join conservatively. */
private fun BytecodePatchContext.sessionFieldPath(method: Method, code: List<Instruction>, start: Int, result: Int,
                                                 manager: String): List<FieldReference> {
    if (method.implementation!!.tryBlocks.isNotEmpty()) readerRefuse("session manager diagnostics has unsupported exception edges")
    val addresses = IntArray(code.size + 1)
    code.forEachIndexed { i, instruction -> addresses[i + 1] = addresses[i] + instruction.codeUnits }
    fun target(i: Int, offset: Int) = addresses.indexOf(addresses[i] + offset).takeIf { it in code.indices }
        ?: readerRefuse("session manager branch has an invalid target")
    val states = mutableMapOf<Int, Map<Int, List<FieldReference>>>()
    val pending = ArrayDeque<Int>()
    fun enqueue(index: Int, incoming: Map<Int, List<FieldReference>>) {
        if (index !in code.indices) return
        if (index < start) readerRefuse("session manager branch returns before its factory result")
        val previous = states[index]
        val joined = previous?.filter { (register, origin) -> incoming[register] == origin } ?: incoming.toMap()
        if (previous == null || previous != joined) { states[index] = joined; pending.add(index) }
    }
    enqueue(start, mapOf(result to emptyList()))
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        val instruction = code[index]
        val origins = states.getValue(index).toMutableMap()
        val move = instruction as? TwoRegisterInstruction
        when {
            instruction.opcode == Opcode.CHECK_CAST -> {
                val origin = origins[(instruction as OneRegisterInstruction).registerA]
                if (origin != null && ((instruction as ReferenceInstruction).reference as? TypeReference)?.type !=
                    (origin.lastOrNull()?.type ?: manager)) readerRefuse("manager cast changes its object type")
            }
            move != null && instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) -> {
                val origin = origins[move.registerB]
                origins.remove(move.registerA)
                if (origin != null) origins[move.registerA] = origin
            }
            move != null && instruction.opcode == Opcode.IGET_OBJECT -> {
                val origin = origins[move.registerB]
                origins.remove(move.registerA)
                if (origin != null && origin.size < 2) {
                    val field = ((instruction as ReferenceInstruction).reference as? FieldReference) ?: readerRefuse("unreadable manager field")
                    if (field.definingClass != (origin.lastOrNull()?.type ?: manager)) readerRefuse("manager field belongs to another object")
                    publicField(field, false)
                    origins[move.registerA] = origin + field
                }
            }
            instruction.opcode.setsRegister() -> {
                val register = (instruction as OneRegisterInstruction).registerA
                origins.remove(register)
                if (instruction.opcode.setsWideRegister()) origins.remove(register + 1)
            }
        }
        when (instruction.opcode) {
            Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_WIDE, Opcode.THROW -> Unit
            Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> enqueue(target(index, (instruction as OffsetInstruction).codeOffset), origins)
            Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH -> {
                val payload = code[target(index, (instruction as OffsetInstruction).codeOffset)] as? SwitchPayload ?: readerRefuse("unreadable manager switch")
                payload.switchElements.forEach { enqueue(target(index, it.offset), origins) }
                enqueue(index + 1, origins)
            }
            else -> {
                if (instruction is OffsetInstruction) enqueue(target(index, instruction.codeOffset), origins)
                enqueue(index + 1, origins)
            }
        }
    }
    val paths = states.mapNotNull { (index, origins) ->
        val instruction = code[index]
        val get = instruction.takeIf { it.opcode == Opcode.IGET_OBJECT } as? TwoRegisterInstruction ?: return@mapNotNull null
        val origin = origins[get.registerB]?.takeIf { it.size == 1 } ?: return@mapNotNull null
        origin + ((instruction as ReferenceInstruction).reference as FieldReference)
    }
    return paths.distinctBy { it.map(Any::toString) }.one("session manager field path")
}

/** A record's documented argument roles must still be direct, distinct public instance fields. */
private fun BytecodePatchContext.constructorFields(owner: ClassDef, reference: MethodReference): List<FieldReference> {
    val constructor = owner.methods.filter { it.toString() == reference.toString() }.one("record constructor body")
    val implementation = constructor.implementation ?: readerRefuse("record constructor has no body")
    val code = implementation.instructions.toList()
    val self = implementation.registerCount - 13
    if (code.size != 14 || code.first().opcode != Opcode.INVOKE_DIRECT ||
        code.first().method()?.toString() != "Ljava/lang/Object;-><init>()V" || code.first().arguments() != listOf(self) ||
        code.last().opcode != Opcode.RETURN_VOID) readerRefuse("schema constructor doesn't retain direct parameter roles")
    val assigned = mutableMapOf<Int, FieldReference>()
    for (instruction in code.drop(1).dropLast(1)) {
        val put = instruction as? TwoRegisterInstruction ?: readerRefuse("unreadable schema constructor assignment")
        val slot = put.registerA - self - 1
        if (slot !in RECORD_ARGS.indices || put.registerB != self) readerRefuse("schema constructor assigns another object/value")
        val expected = when (RECORD_ARGS[slot]) { "I" -> Opcode.IPUT; "Z" -> Opcode.IPUT_BOOLEAN; else -> Opcode.IPUT_OBJECT }
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: readerRefuse("schema constructor has no field reference")
        if (instruction.opcode != expected || field.type != RECORD_ARGS[slot] || field.definingClass != owner.type ||
            assigned.put(slot, field) != null) readerRefuse("schema constructor role is duplicated or changed")
        publicField(field, false)
    }
    if (assigned.size != 12 || assigned.values.map(Any::toString).distinct().size != 12) readerRefuse("schema constructor fields aren't distinct")
    return RECORD_ARGS.indices.map { assigned.getValue(it) }
}

/** Puts in the reader bodies [prepareOverrideReader] assembled. */
internal fun BytecodePatchContext.fillOverrideReader(reader: OverrideReader, editor: OverrideEditor) =
    putStubs(prepareOverrideReader(reader, editor))

/** All four replacements are assembled before any stub changes. None invokes a writer or reload. */
internal fun BytecodePatchContext.prepareOverrideReader(reader: OverrideReader, editor: OverrideEditor): PreparedStubs {
    val bodies = listOf(
        6 to """
            instance-of v0, p0, Lcom/instagram/mainactivity/InstagramMainActivity;
            if-nez v0, :session
            instance-of v0, p0, Lcom/instagram/modal/ModalActivity;
            if-eqz v0, :unavailable
            :session
            check-cast p0, Lcom/instagram/base/activity/IgFragmentActivity;
            invoke-virtual { p0 }, ${editor.getter}
            move-result-object v0
            instance-of v1, v0, $USER
            if-eqz v1, :unavailable
            check-cast v0, $USER
            sget-object v1, ${reader.singleton}
            if-eqz v1, :unavailable
            invoke-virtual { v1, v0 }, ${reader.sessionFactory}
            move-result-object v1
            if-eqz v1, :unavailable
            iget-object v1, v1, ${reader.managerField}
            if-eqz v1, :unavailable
            iget-object v0, v1, ${reader.modelField}
            return-object v0
            :unavailable
            const/4 v0, 0x0
            return-object v0
        """,
        2 to """
            check-cast p0, ${reader.model}
            invoke-static { p0 }, ${reader.fileResolver}
            move-result-object v0
            return-object v0
        """,
        2 to """
            check-cast p0, ${reader.model}
            invoke-virtual { p0 }, ${reader.schemaGetter}
            move-result-object v0
            if-eqz v0, :unavailable
            iget-object v0, v0, ${reader.schemaList}
            return-object v0
            :unavailable
            const/4 v0, 0x0
            return-object v0
        """,
        9 to """
            check-cast p0, ${reader.entry}
            new-instance v0, $OVERRIDE_PARAMETER
            iget v1, p0, ${reader.config}
            iget v2, p0, ${reader.index}
            iget-object v3, p0, ${reader.configName}
            iget-object v4, p0, ${reader.name}
            iget v5, p0, ${reader.type}
            invoke-virtual { p0 }, ${reader.nativeId}
            move-result-wide v6
            invoke-direct/range { v0 .. v7 }, $OVERRIDE_PARAMETER-><init>$PARAM_CTOR
            return-object v0
        """,
    )
    return prepareStubs(readerStubs(), bodies.map { (registers, body) -> registers to body.trimIndent() }, ::readerRefuse)
}

private fun BytecodePatchContext.readerStubs() = listOf(
    "getOverrideStoreNative" to "Ljava/lang/Object;", "getOverrideFileNative" to "Ljava/io/File;",
    "getOverrideSchemaNative" to "Ljava/util/List;", "getOverrideParameterNative" to OVERRIDE_PARAMETER,
).map { (name, result) -> readerClass(OVERRIDE_BRIDGE).methods.filter { it.name == name &&
    it.parameterTypes.map(Any::toString) == listOf("Ljava/lang/Object;") && it.returnType == result && AccessFlags.STATIC.isSet(it.accessFlags) }
    .one("extension $name bridge") }
private fun BytecodePatchContext.readerClass(type: String) = runCatching { classDefBy(type) }.getOrNull() ?: readerRefuse("missing native reader class")
private fun BytecodePatchContext.publicMethod(reference: MethodReference) {
    val owner = readerClass(reference.definingClass)
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || owner.methods.none { it.toString() == reference.toString() && AccessFlags.PUBLIC.isSet(it.accessFlags) })
        readerRefuse("native reader method isn't public")
}
private fun BytecodePatchContext.publicField(reference: FieldReference, static: Boolean) {
    val owner = readerClass(reference.definingClass)
    if (!AccessFlags.PUBLIC.isSet(owner.accessFlags) || owner.fields.none { it.toString() == reference.toString() &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static }) readerRefuse("native reader field isn't public")
}
private fun Method.text() = implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()
private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.arguments(): List<Int> = when (this) {
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> readerRefuse("unreadable native reader call arguments")
}
private fun <T> List<T>.one(part: String): T = singleOrNull() ?: readerRefuse("expected one $part, found $size")
private fun readerRefuse(detail: String): Nothing = throw PatchException("Open developer options: $detail")
