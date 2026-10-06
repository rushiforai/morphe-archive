/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.api

import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableEncodedValue.Companion.toMutable
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** Registered credentials change two initialization literals and tag the native init version. Authentication stays intact. */
class UseRegisteredApiCredentialsFixtureTest {
    @Test
    fun `credential patch is optional and both input options remain optional`() {
        assertFalse(useRegisteredApiCredentialsPatch.default)
        assertEquals(setOf("apiId", "apiHash"), useRegisteredApiCredentialsPatch.options.keys)
        assertTrue(useRegisteredApiCredentialsPatch.options.values.all { !it.required && it.default == null })
    }

    @Test
    fun `patch options replace the ID and hash literals and tag only the native version on every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(hosts)
            val plan = context.resolveApiCredentials()
            val before = state(context, hosts)
            val oldInitializer = ImmutableMethod.of(plan.initializer)
            val oldConnection = ImmutableMethod.of(plan.connectionInitializer).instructions()
            withOptions(ID, HASH) { useRegisteredApiCredentialsPatch.execute(context) }
            val body = plan.initializer.instructions()
            assertEquals(ID.toLong(), (body[plan.id.index] as WideLiteralInstruction).wideLiteral)
            assertEquals(HASH, ((body[plan.hash.index] as ReferenceInstruction).reference as StringReference).string)
            assertEquals(oldInitializer.instructions().size, body.size)
            for (index in body.indices.filter { it !in setOf(plan.id.index, plan.hash.index) }) {
                assertEquals("${build.name}: unchanged instruction $index", operation(oldInitializer.instructions()[index]), operation(body[index]))
            }
            val after = state(context, hosts)
            assertEquals("${build.name}: every class other than BuildVars and ConnectionsManager stays intact",
                before - BUILD_VARS - CONNECTIONS, after - BUILD_VARS - CONNECTIONS)
            assertEquals("${build.name}: every other connection method stays intact",
                otherMethods(before, plan.connectionInitializer), otherMethods(after, plan.connectionInitializer))
            val connection = plan.connectionInitializer.instructions()
            val tag = connection[plan.nativeCall]
            assertEquals(Opcode.XOR_INT, tag.opcode)
            assertEquals(listOf(plan.versionRegister, plan.versionRegister, plan.apiRegister), tag.namedRegisters())
            val branch = connection[plan.nativeCall + 1]
            assertEquals(Opcode.IF_NEZ, branch.opcode)
            assertEquals(listOf(plan.versionRegister), branch.namedRegisters())
            assertEquals(connection.subList(plan.nativeCall + 1, plan.nativeCall + 4).sumOf { it.codeUnits },
                (branch as OffsetInstruction).codeOffset)
            val fallback = connection[plan.nativeCall + 2]
            assertEquals(Opcode.XOR_INT_LIT16, fallback.opcode)
            assertEquals(listOf(plan.versionRegister, plan.apiRegister), fallback.namedRegisters())
            assertEquals(128, (fallback as NarrowLiteralInstruction).narrowLiteral)
            val invert = connection[plan.nativeCall + 3]
            assertEquals(Opcode.XOR_INT_LIT8, invert.opcode)
            assertEquals(listOf(plan.versionRegister, plan.versionRegister), invert.namedRegisters())
            assertEquals(-1, (invert as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("native_init", connection[plan.nativeCall + 4].call()?.name)
            assertEquals(plan.versionRegister, connection[plan.nativeCall + 4].namedRegisters()[1])
            assertEquals("${build.name}: only the version tag is added", oldConnection.map(::operation),
                connection.filterIndexed { index, _ -> index !in plan.nativeCall until plan.nativeCall + 4 }.map(::operation))
            assertEquals("${build.name}: initializer branches stay intact", ControlFlow.of(oldInitializer).normal.toList(),
                ControlFlow.of(plan.initializer).normal.toList())
            assertEquals("${build.name}: initializer exception edges stay intact", ControlFlow.of(oldInitializer).exceptional.toList(),
                ControlFlow.of(plan.initializer).exceptional.toList())
            assertEquals(5, plan.readers.size)
            assertEquals(CONNECTIONS, plan.connectionInitializer.definingClass)
        }
    }

    @Test
    fun `missing native declaration or changed native modifiers refuse before edits`() {
        refusal { context, _ -> context.mutableClassDefBy(CONNECTIONS).methods.removeAll { it.name == "native_init" } }
        for (flag in listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.NATIVE)) refusal { context, _ ->
            val method = context.mutableClassDefBy(CONNECTIONS).methods.single { it.name == "native_init" }
            method.accessFlags = method.accessFlags and flag.value.inv()
        }
    }

    @Test
    fun `registered IDs that shared the old low bits receive distinct native versions`() {
        val versions = listOf(0, 1, 71129, 71159, 71179, Int.MAX_VALUE)
        val ids = listOf(1, 129, 127, 128, 255, 256, 257, 71129, 71159, 19077001, 19077129, Int.MAX_VALUE)
        for (build in Fixtures.declaredBuilds()) {
            val markers = versions.associateWith { mutableSetOf<Int>() }
            for (id in ids) {
                val versionsForId = mutableSetOf<Int>()
                val context = PatchContexts.of(hosts(build))
                val plan = context.resolveApiCredentials()
                val arguments = plan.connectionInitializer.instructions()[plan.nativeCall].namedRegisters()
                withOptions(id.toString(), HASH) { useRegisteredApiCredentialsPatch.execute(context) }
                val code = plan.connectionInitializer.instructions()
                val nativeCall = code.indices.single { code[it].call()?.name == "native_init" }
                for (version in versions) {
                    val registers = IntArray(plan.connectionInitializer.implementation!!.registerCount) { 0x13579 + it }
                    registers[arguments[1]] = version
                    registers[arguments[3]] = id
                    val before = registers.copyOf()
                    for (instruction in code.subList(plan.nativeCall, nativeCall)) {
                        val operands = instruction.namedRegisters()
                        if (instruction.opcode == Opcode.IF_NEZ) {
                            if (registers[operands[0]] != 0) break
                            continue
                        }
                        registers[operands[0]] = when (instruction.opcode) {
                            Opcode.XOR_INT -> registers[operands[1]] xor registers[operands[2]]
                            Opcode.XOR_INT_LIT8, Opcode.XOR_INT_LIT16 ->
                                registers[operands[1]] xor (instruction as NarrowLiteralInstruction).narrowLiteral
                            else -> error("Unexpected native marker instruction: ${instruction.opcode}")
                        }
                    }
                    val marker = registers[arguments[1]]
                    assertTrue("${build.name}: marker must differ from stock and uninitialized versions", marker != version && marker != 0)
                    assertEquals("${build.name}: only equal ID/version needs the negative fallback", id == version, marker < 0)
                    assertTrue("${build.name}: marker must differ from every released eight-bit tag",
                        (-128..-1).none { marker == (version xor it) })
                    assertTrue("${build.name}: API $id collided at version $version", markers.getValue(version).add(marker))
                    assertTrue("${build.name}: version $version collided for API $id", versionsForId.add(marker))
                    assertEquals("${build.name}: marker must retain every API ID bit", id,
                        if (marker < 0) version else version xor marker)
                    for (register in registers.indices.filter { it != arguments[1] }) {
                        assertEquals("${build.name}: native argument/register $register changed", before[register], registers[register])
                    }
                }
            }
        }
    }

    @Test
    fun `a changed native version argument or a second entry into native initialization refuses before edits`() {
        refusal { _, plan ->
            plan.connectionInitializer.addInstruction(plan.nativeCall, "const v${plan.versionRegister}, 0x1")
        }
        refusal { _, plan ->
            val method = plan.connectionInitializer
            method.addInstructionsWithLabels(plan.nativeCall - 1, "if-eqz v${plan.versionRegister}, :native",
                ExternalLabel("native", method.getInstruction<Instruction>(plan.nativeCall)))
        }
    }

    @Test
    fun `changed native parameter types return type and range length refuse before edits`() {
        for (mutation in listOf("parameter", "declaration", "return", "range")) refusal { context, plan ->
            val instruction = plan.connectionInitializer.instructions()[plan.nativeCall]
            val reference = instruction.call()!!
            val arguments = instruction.namedRegisters()
            val parameters = reference.parameterTypes.map(CharSequence::toString).toMutableList()
            if (mutation == "parameter" || mutation == "declaration") parameters[4] = "I"
            if (mutation == "declaration") {
                val owner = context.mutableClassDefBy(CONNECTIONS)
                val definition = owner.methods.single { it.name == "native_init" }
                val changed = definition.parameters.mapIndexed { index, parameter ->
                    if (index == 4) ImmutableMethodParameter("I", parameter.annotations, parameter.name) else parameter
                }
                owner.methods.remove(definition)
                owner.methods.add(ImmutableMethod(definition.definingClass, definition.name, changed, definition.returnType,
                    definition.accessFlags, definition.annotations, definition.hiddenApiRestrictions, definition.implementation).toMutable())
            }
            val result = if (mutation == "return") "I" else reference.returnType
            val end = arguments.last() - if (mutation == "range") 1 else 0
            plan.connectionInitializer.replaceInstruction(plan.nativeCall,
                "invoke-static/range {v${arguments.first()} .. v$end}, ${reference.definingClass}->${reference.name}(${parameters.joinToString("")})$result")
        }
    }

    @Test
    fun `a sole predecessor that jumps over the inserted marker refuses before edits`() {
        refusal { _, plan ->
            val method = plan.connectionInitializer
            method.addInstructionsWithLabels(plan.nativeCall, "goto :native",
                ExternalLabel("native", method.getInstruction<Instruction>(plan.nativeCall)))
        }
    }

    @Test
    fun `both absent options leave every fixture unchanged and need no host matches`() {
        withOptions(null, null) { useRegisteredApiCredentialsPatch.execute(PatchContexts.of(emptyList())) }
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(hosts)
            val before = state(context, hosts)
            withOptions(null, null) { useRegisteredApiCredentialsPatch.execute(context) }
            assertEquals(before, state(context, hosts))
        }
    }

    @Test
    fun `option validation refuses before class lookup and never echoes a supplied credential`() {
        assertNull(checkedApiCredentials(null, null))
        for ((id, hash) in listOf(null to HASH, ID to null, "" to HASH, "0" to HASH, "-1" to HASH,
            "01" to HASH, "2147483648" to HASH, "1.0" to HASH, ID to "", ID to HASH.dropLast(1),
            ID to HASH.plus("0"), ID to "z".repeat(32), ID to "secret-not-hex")) {
            withOptions(id, hash) {
                try {
                    useRegisteredApiCredentialsPatch.execute(PatchContexts.of(emptyList()))
                    fail("invalid patch options accepted")
                } catch (expected: PatchException) {
                    assertTrue(expected.message.orEmpty().contains("apiId") || expected.message.orEmpty().contains("apiHash"))
                    if (!hash.isNullOrEmpty()) assertFalse(expected.message.orEmpty().contains(hash))
                }
            }
        }
        assertEquals(Int.MAX_VALUE, checkedApiCredentials(Int.MAX_VALUE.toString(), HASH.uppercase())!!.id)
    }

    @Test
    fun `each missing field and changed field flag refuses before either literal changes`() {
        for (name in listOf("APP_ID", "APP_HASH")) {
            refusal { context, _ -> context.mutableClassDefBy(BUILD_VARS).fields.removeAll { it.name == name } }
            for (flag in listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)) refusal { context, _ ->
                val field = context.mutableClassDefBy(BUILD_VARS).fields.single { it.name == name }
                field.accessFlags = if (flag == AccessFlags.FINAL) field.accessFlags or flag.value
                    else field.accessFlags and flag.value.inv()
            }
        }
        refusal { context, _ -> context.mutableClassDefBy(BUILD_VARS).accessFlags = 0 }
    }

    @Test
    fun `encoded nondefault credentials refuse before initialization literals change`() {
        for (name in listOf("APP_ID", "APP_HASH")) refusal { context, _ ->
            val field = context.mutableClassDefBy(BUILD_VARS).fields.single { it.name == name }
            field.initialValue = (if (name == "APP_ID") ImmutableIntEncodedValue(7) else ImmutableStringEncodedValue(HASH)).toMutable()
        }
    }

    @Test
    fun `initializer literal drift and missing field writes refuse before any credential edit`() {
        for (name in listOf("APP_ID", "APP_HASH")) {
            refusal { _, plan ->
                val literal = if (name == "APP_ID") plan.id else plan.hash
                plan.initializer.replaceInstruction(literal.index, "nop")
            }
            refusal { _, plan ->
                val literal = if (name == "APP_ID") plan.id else plan.hash
                plan.initializer.replaceInstruction(literal.index + 1, "nop")
            }
        }
        refusal { _, plan -> plan.initializer.replaceInstruction(plan.id.index, "const/4 v${plan.id.register}, 0x0") }
        refusal { _, plan -> plan.initializer.replaceInstruction(plan.hash.index,
            "const-string v${plan.hash.register}, \"invalid hash\"") }
        refusal { context, plan ->
            context.mutableClassDefBy(BUILD_VARS).methods.add(ImmutableMethod(BUILD_VARS, "duplicateInitialization",
                plan.initializer.parameters, "V", plan.initializer.accessFlags, plan.initializer.annotations,
                plan.initializer.hiddenApiRestrictions, plan.initializer.implementation).toMutable())
        }
    }

    @Test
    fun `every removed reader refuses before credentials change`() {
        for (reader in 0 until 7) refusal { _, plan ->
            val accesses = plan.readers.flatMap { method -> method.instructions().mapIndexedNotNull { index, instruction ->
                instruction.field()?.takeIf { it.isCredential() }?.let { method to index }
            } }
            assertEquals(7, accesses.size)
            (accesses[reader].first as MutableMethod).replaceInstruction(accesses[reader].second, "nop")
        }
    }

    @Test
    fun `each reader with the wrong static field opcode refuses before credentials change`() {
        for (reader in 0 until 7) refusal { _, plan ->
            val accesses = plan.readers.flatMap { method -> method.instructions().mapIndexedNotNull { index, instruction ->
                instruction.field()?.takeIf { it.isCredential() }?.let { method to index }
            } }
            val (method, index) = accesses[reader]
            val instruction = method.instructions()[index]
            val wrongOpcode = if (instruction.opcode == Opcode.SGET) "sget-object" else "sget"
            (method as MutableMethod).replaceInstruction(index,
                "$wrongOpcode v${instruction.namedRegisters().single()}, ${instruction.field()}")
        }
    }

    @Test
    fun `support email identity reads refuse when the appendix stops using the API ID`() {
        for (reader in 0..1) refusal { _, plan ->
            val appendices = plan.readers.filter { it.definingClass != CONNECTIONS &&
                it.instructions().none { instruction -> instruction.field()?.let { field ->
                    field.isCredential() && field.name == "APP_HASH"
                } == true }
            }.sortedBy { it.definingClass + it.name }
            assertEquals("both support email readers must be present", 2, appendices.size)
            val method = appendices[reader] as MutableMethod
            val read = method.instructions().indices.single { method.instructions()[it].field()?.isCredential() == true }
            val source = method.instructions()[read].namedRegisters().single()
            val index = method.instructions().indices.first { index ->
                method.instructions()[index].call()?.let { it.definingClass == "Ljava/lang/StringBuilder;" &&
                    it.name == "append" && it.parameterTypes == listOf("I") } == true &&
                    method.instructions()[index].namedRegisters().getOrNull(1) == source && index > read
            }
            val instruction = method.instructions()[index]
            method.replaceInstruction(index,
                "invoke-virtual {v${instruction.namedRegisters()[0]}, v${(source + 1) % method.implementation!!.registerCount}}, ${instruction.call()}")
        }
    }

    @Test
    fun `each authentication field binding refuses if it targets another request object`() {
        for (request in listOf("Lorg/telegram/tgnet/TLRPC\$TL_auth_sendCode;",
            "Lorg/telegram/tgnet/tl/TL_account\$initPasskeyLogin;")) {
            for (field in listOf("api_id", "api_hash")) refusal { _, plan ->
                val method = plan.readers.single { reader -> reader.instructions().any { it.field()?.definingClass == request } } as MutableMethod
                val index = method.instructions().indices.single { method.instructions()[it].field()?.let {
                    it.definingClass == request && it.name == field
                } == true }
                val instruction = method.instructions()[index]
                val registers = instruction.namedRegisters()
                val alternate = (registers[1] + 1) % method.implementation!!.registerCount
                method.replaceInstruction(index, "${instruction.opcode.name} v${registers[0]}, v$alternate, ${instruction.field()}")
            }
        }
    }

    @Test
    fun `overwriting the API ID before Java or native initialization refuses before edits`() {
        refusal { context, _ ->
            val constructor = context.mutableClassDefBy(CONNECTIONS).methods.single { it.name == "<init>" && it.parameterTypes == listOf("I") }
            val index = constructor.instructions().indices.single { constructor.instructions()[it].call()?.let {
                it.definingClass == CONNECTIONS && it.name == "init"
            } == true }
            constructor.addInstruction(index, "const v${constructor.instructions()[index].namedRegisters()[3]}, 0x1")
        }
        refusal { _, plan ->
            val method = plan.connectionInitializer as MutableMethod
            val index = method.instructions().indices.single { method.instructions()[it].call()?.name == "native_init" }
            method.addInstruction(index, "const v${method.instructions()[index].namedRegisters()[3]}, 0x1")
        }
    }

    @Test
    fun `unrecognized additional readers and writes refuse before either credential edit`() {
        refusal { _, plan -> plan.initializer.addInstruction(plan.id.index, "sget v4, $BUILD_VARS->APP_ID:I") }
        refusal { _, plan -> plan.initializer.addInstruction(plan.id.index + 2, "sput v${plan.id.register}, $BUILD_VARS->APP_ID:I") }
    }

    private fun refusal(change: (BytecodePatchContext, ApiCredentialsPlan) -> Unit) {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(hosts)
            val plan = context.resolveApiCredentials()
            change(context, plan)
            val before = state(context, hosts)
            withOptions(ID, HASH) {
                try {
                    useRegisteredApiCredentialsPatch.execute(context)
                    fail("${build.name}: incompatible identity accepted")
                } catch (expected: PatchException) {
                    assertFalse(expected.message.orEmpty().contains(HASH))
                }
            }
            assertEquals("${build.name}: refusal leaves every method and field unchanged", before, state(context, hosts))
        }
    }

    @Suppress("UNCHECKED_CAST")
    private fun otherMethods(state: Map<String, List<Any?>>, method: Method) =
        (state.getValue(CONNECTIONS)[2] as List<List<Any?>>).filterNot { it[0] == method.name && it[1] == method.parameterTypes }

    private fun withOptions(id: String?, hash: String?, action: () -> Unit) {
        useRegisteredApiCredentialsPatch.options["apiId"] = id
        useRegisteredApiCredentialsPatch.options["apiHash"] = hash
        try { action() } finally { useRegisteredApiCredentialsPatch.options.values.forEach { it.reset() } }
    }
    private fun state(context: BytecodePatchContext, hosts: List<ClassDef>) = hosts.associate { host ->
        val current = context.mutableClassDefBy(host.type)
        host.type to listOf(current.accessFlags, current.fields.map { listOf(it.name, it.type, it.accessFlags, it.initialValue) },
            current.methods.map { method ->
                val flow = method.implementation?.takeIf { method.instructions().isNotEmpty() }?.let { ControlFlow.of(method) }
                listOf(method.name, method.parameterTypes, method.returnType, method.accessFlags,
                    method.implementation?.registerCount, method.instructions().map(::operation), flow?.normal?.toList(),
                    flow?.exceptional?.toList(), method.implementation?.tryBlocks?.map { block ->
                        listOf(block.startCodeAddress, block.codeUnitCount, block.exceptionHandlers.map {
                            it.exceptionType to it.handlerCodeAddress
                        })
                    })
            })
    }
    private fun hosts(build: File) = HOSTS[build.absolutePath]?.get() ?: run {
        val selected = FixtureDex.classesWhere(build,
            { dex -> dex.fieldSection.any { it.isCredential() } },
            { method -> method.instructions().any { it.field()?.isCredential() == true } }).associateBy { it.type }.toMutableMap()
        selected.putAll(FixtureDex.classes(build, setOf(BUILD_VARS, CONNECTIONS, "Lorg/telegram/messenger/PasskeysController;")))
        selected.values.toList().also { HOSTS[build.absolutePath] = SoftReference(it) }
    }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun FieldReference.isCredential() = definingClass == BUILD_VARS && name in setOf("APP_ID", "APP_HASH")
    private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction): List<Any?> {
        val reference = (instruction as? ReferenceInstruction)?.reference
        return listOf(instruction.opcode, instruction.namedRegisters(),
            if (reference is StringReference) reference.string.hashCode() else reference?.toString(),
            (instruction as? WideLiteralInstruction)?.wideLiteral)
    }
    private companion object {
        const val ID = "12345678"
        const val HASH = "0123456789abcdef0123456789abcdef"
        val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
    }
}
