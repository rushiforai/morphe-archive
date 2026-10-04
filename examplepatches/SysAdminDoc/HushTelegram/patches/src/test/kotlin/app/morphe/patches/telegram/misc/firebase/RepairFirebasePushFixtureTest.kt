/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterKinds
import app.morphe.util.registerReads
import app.morphe.util.namedRegisters
import com.android.apksig.ApkVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.security.MessageDigest

/** Independent signer and request census, with complete pre-mutation refusal snapshots. */
class RepairFirebasePushFixtureTest {
    @Test
    fun `header seed is the actual official fixture signer rather than a guessed fingerprint`() {
        val seed = ExtensionDex.classes().single { it.type == FIREBASE_PUSH }.fields.single {
            it.name == "OFFICIAL_CERTIFICATE_SHA1"
        }.initialValue as StringEncodedValue
        for (build in Fixtures.declaredBuilds()) {
            val signature = ApkVerifier.Builder(build).build().verify()
            assertTrue("${build.name}: fixture signature verifies", signature.isVerified)
            val certificates = signature.signerCertificates
            assertEquals("${build.name}: one official signer", 1, certificates.size)
            val encoded = certificates.single().encoded
            assertEquals("${build.name}: independently pinned SHA-256",
                "49c1522548ebacd46ce322b6fd47f6092bb745d0f88082145caf35e14dcc38e1", digest("SHA-256", encoded))
            assertEquals("${build.name}: header is the verified SHA-1", digest("SHA-1", encoded).uppercase(), seed.value)
        }
    }

    @Test
    fun `one certificate sink covers every retained create and token request and preserves all other operations`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val original = hosts.flatMap { it.methods.toList() }
                .single { method -> "X-Android-Cert" in method.strings() }
            val before = original.instructions()
            val at = before.indexOfFirst { it.string() == "X-Android-Cert" } + 1
            val registers = before[at].namedRegisters()
            assertEquals("${build.name}: public shared connection header path", listOf("Ljava/net/URL;", "Ljava/lang/String;"),
                original.parameterTypes.map(CharSequence::toString))
            assertEquals("${build.name}: native lookup stays in the method", 2,
                before.count { it.reference() == "Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;" })
            val census = FixtureDex.methodsWhere(build, { true }) { method -> method.instructions().any {
                it.call()?.signature() == original.signature()
            } }
            assertEquals("${build.name}: every Firebase header caller is retained", 2, census.size)
            assertEquals("${build.name}: no deletion request survives R8", 0, census.count { "DELETE" in it.strings() })
            assertEquals("${build.name}: one rotation request", 1, census.count { "/authTokens:generate" in it.strings() })
            assertEquals("${build.name}: one creation request", 1, census.count {
                "/installations" in it.strings() && "x-goog-fis-android-iid-migration-auth" in it.strings()
            })
            repairFirebasePushPatch.execute(context)
            val patched = context.mutableClassDefBy(original.definingClass).methods.single { it.signature() == original.signature() }
            val after = patched.instructions()
            assertEquals(before.size + 2, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[at].opcode)
            assertEquals(CERTIFICATE_HOOK, after[at].reference())
            assertEquals(listOf(registers[0], registers[2]), after[at].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
            assertEquals(listOf(registers[2]), after[at + 1].namedRegisters())
            assertEquals("${build.name}: only the header value is wrapped", before.map(::operation),
                (after.take(at) + after.drop(at + 2)).map(::operation))
            assertEquals(original.implementation!!.registerCount, patched.implementation!!.registerCount)
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(patched)
            fun moved(index: Int) = index + if (index >= at) 2 else 0
            fun destination(index: Int) = if (index == at) at else moved(index)
            for (index in before.indices) {
                assertEquals("${build.name}: stock normal successors at $index",
                    oldFlow.normal[index].map(::destination), newFlow.normal[moved(index)])
                assertEquals("${build.name}: stock exceptional successors at $index",
                    oldFlow.exceptional[index].map(::destination), newFlow.exceptional[moved(index)])
            }
            for (owner in hosts) for (method in owner.methods) {
                if (method.signature() == original.signature()) continue
                assertEquals("${build.name}: untouched ${method.signature()}", snapshot(method),
                    snapshot(context.mutableClassDefBy(owner.type).methods.single { it.signature() == method.signature() }))
            }
            assertFlag(context, "repairFirebasePush", true)
            assertFlag(context, "firebaseCertificateHeader", true)
            assertFlag(context, "firebaseLocalStatus", true)
        }
    }

    @Test
    fun `local status installs real readers that return only presence and aggregate counts`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            repairFirebasePushPatch.execute(context)
            for ((owner, reader, fields) in listOf(
                Triple(SHARED_CONFIG, TOKEN_READER, setOf("sync", "configLoaded", "pushString")),
                Triple(USER_CONFIG, ACCOUNT_READER, setOf("Instance", "sync", "configLoaded", "currentUser", "registeredForPush")),
            )) {
                val method = context.mutableClassDefBy(owner).methods.single { it.name == reader }
                assertEquals("${build.name}: primitive evidence only", "I", method.returnType)
                assertTrue(method.parameterTypes.isEmpty())
                assertTrue(AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
                assertTrue("${build.name}: $reader is a real native reader", method.instructions().size > 2)
                assertEquals(fields, method.instructions().mapNotNull { it.field()?.name }.toSet())
                val kinds = RegisterKinds.of(method)
                for ((index, instruction) in method.instructions().withIndex()) {
                    val state = kinds.at(index)
                    if (state != null) for ((register, use) in method.registerReads(instruction)) {
                        assertTrue("${build.name}: $reader instruction $index reads v$register as $use", use.fits(state, register))
                    }
                    assertTrue("${build.name}: reader must not write native memory", !instruction.opcode.name.startsWith("iput") &&
                        !instruction.opcode.name.startsWith("sput") && !instruction.opcode.name.startsWith("aput"))
                    instruction.call()?.let { call -> assertEquals("only a presence check can call a method",
                        "Ljava/lang/String;->isEmpty()Z", call.signature()) }
                }
                val stubName = if (owner == SHARED_CONFIG) "nativeTokenPresence" else "nativeAccountCounts"
                val stub = context.mutableClassDefBy(FIREBASE_PUSH).methods.single { it.name == stubName }
                assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.RETURN), stub.instructions().map { it.opcode })
                assertEquals("$owner->$reader()I", stub.instructions()[0].reference())
            }
            assertFlag(context, "firebaseLocalStatus", true)
        }
    }

    @Test
    fun `native readers handle every account state and missing data without exposing identity or making requests`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            repairFirebasePushPatch.execute(context)
            val token = ReadOnlyProbe(context.mutableClassDefBy(SHARED_CONFIG).methods.single { it.name == TOKEN_READER })
            for (value in listOf(null, "", "synthetic-token-canary-391883", " ")) {
                assertEquals(if (value == null) -1 else if (value.isEmpty()) 0 else 1,
                    token.run(mapOf("sync" to Any(), "configLoaded" to 1, "pushString" to value)))
                assertEquals(-1, token.run(mapOf("sync" to Any(), "configLoaded" to 0, "pushString" to value)))
            }
            assertEquals(-1, token.run(mapOf("sync" to null)))
            val accounts = ReadOnlyProbe(context.mutableClassDefBy(USER_CONFIG).methods.single { it.name == ACCOUNT_READER })
            for (mask in 0 until 256) {
                var active = 0
                var acknowledged = 0
                val slots = Array(4) { slot ->
                    val signedIn = mask and (1 shl (slot * 2)) != 0
                    val registered = mask and (2 shl (slot * 2)) != 0
                    if (signedIn) active++
                    if (signedIn && registered) acknowledged++
                    mapOf("sync" to Any(), "configLoaded" to 1, "registeredForPush" to if (registered) 1 else 0,
                        "currentUser" to if (signedIn) mapOf("id" to 918337771L, "apiHash" to "synthetic-identity-canary") else null)
                }
                assertEquals("${build.name}: all aggregate states $mask", active or (acknowledged shl 8),
                    accounts.run(mapOf("Instance" to slots)))
            }
            val ready = mapOf("sync" to Any(), "configLoaded" to 1, "currentUser" to null, "registeredForPush" to 1)
            for (slot in 0 until 4) for (missing in listOf(null, ready + ("configLoaded" to 0), ready + ("sync" to null))) {
                val slots = Array<Map<String, Any?>?>(4) { ready }
                slots[slot] = missing
                assertEquals(-1, accounts.run(mapOf("Instance" to slots)))
            }
            for (slots in listOf(null, emptyArray<Any>(), arrayOf(ready), Array(5) { ready })) {
                assertEquals(-1, accounts.run(mapOf("Instance" to slots)))
            }
        }
    }

    @Test
    fun `missing fields changed local readers and bridge collisions refuse before any edit`() {
        val fields = listOf(SHARED_CONFIG to "sync", SHARED_CONFIG to "configLoaded", SHARED_CONFIG to "pushString",
            USER_CONFIG to "Instance", USER_CONFIG to "sync", USER_CONFIG to "configLoaded", USER_CONFIG to "currentUser",
            USER_CONFIG to "registeredForPush", USER_CONFIG to "MAX_ACCOUNT_COUNT")
        val mutations = linkedMapOf<String, (BytecodePatchContext) -> Unit>()
        for ((owner, name) in fields) {
            mutations["missing $owner $name"] = { it.mutableClassDefBy(owner).fields.removeAll { field -> field.name == name } }
            mutations["wrong access $owner $name"] = { it.mutableClassDefBy(owner).fields.single { field -> field.name == name }.accessFlags = 0 }
            mutations["wrong type $owner $name"] = { context ->
                val host = context.mutableClassDefBy(owner)
                val field = host.fields.single { it.name == name }
                host.fields.remove(field)
                host.fields.add(ImmutableField(owner, name, if (field.type == "I") "J" else "I", field.accessFlags,
                    field.initialValue, field.annotations, field.hiddenApiRestrictions).toMutable())
            }
        }
        for ((name, instruction) in listOf("isConfigLoaded" to "const/4 v0, 0x0", "isClientActivated" to "const/4 v0, 0x0",
            "<clinit>" to "const/4 v0, 0x3", "loadConfig" to "const/4 v0, 0x0")) {
            mutations["changed $name"] = { it.mutableClassDefBy(USER_CONFIG).methods.single { method -> method.name == name }
                .replaceInstruction(0, instruction) }
        }
        mutations["changed token preference"] = { context ->
            val method = context.mutableClassDefBy(SHARED_CONFIG).methods.single { it.name == "loadConfig" }
            val at = method.instructions().indexOfFirst { it.string() == "pushString2" }
            method.replaceInstruction(at, "const-string v2, \"unrelatedPreference\"")
        }
        for (name in listOf("isConfigLoaded", "isClientActivated")) {
            mutations["missing $name getter"] = { it.mutableClassDefBy(USER_CONFIG).methods.removeAll { method -> method.name == name } }
            mutations["ambiguous $name getter"] = { context ->
                val owner = context.mutableClassDefBy(USER_CONFIG)
                val method = owner.methods.single { it.name == name }
                owner.methods.add(ImmutableMethod(USER_CONFIG, name, method.parameters, "I", method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        for ((owner, bridge) in listOf(SHARED_CONFIG to TOKEN_READER, USER_CONFIG to ACCOUNT_READER)) {
            mutations["existing $bridge"] = { context ->
                val method = context.mutableClassDefBy(owner).methods.first { it.parameterTypes.isEmpty() }
                context.mutableClassDefBy(owner).methods.add(ImmutableMethod(owner, bridge, method.parameters, "I",
                    method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        for (name in listOf("nativeTokenPresence", "nativeAccountCounts")) {
            mutations["invalid $name fallback"] = { context ->
                context.mutableClassDefBy(FIREBASE_PUSH).methods.single { it.name == name }.replaceInstruction(0, "const/4 v0, 0x0")
            }
            mutations["ambiguous $name fallback"] = { context ->
                val owner = context.mutableClassDefBy(FIREBASE_PUSH)
                val method = owner.methods.single { it.name == name }
                owner.methods.add(ImmutableMethod(FIREBASE_PUSH, name, method.parameters, "Z", method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        for (build in Fixtures.declaredBuilds()) {
            val nativeHosts = hosts(build)
            for ((name, mutate) in mutations) {
                val context = PatchContexts.of(ExtensionDex.classes() + nativeHosts)
                mutate(context)
                val before = snapshot(context)
                assertThrows("${build.name}: $name", PatchException::class.java) { repairFirebasePushPatch.execute(context) }
                assertEquals("${build.name}: $name preserves all code and build facts", before, snapshot(context))
                assertFlag(context, "repairFirebasePush", false)
                assertFlag(context, "firebaseCertificateHeader", false)
                assertFlag(context, "firebaseLocalStatus", false)
            }
            for (owner in listOf(SHARED_CONFIG, USER_CONFIG)) {
                val context = PatchContexts.of(ExtensionDex.classes() + nativeHosts.filter { it.type != owner })
                val before = snapshot(context)
                assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(context) }
                assertEquals(before, snapshot(context))
            }
        }
    }

    @Test
    fun `missing local capability refuses without inserting even the unrelated certificate hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "firebaseLocalStatus" }
            val before = snapshot(context)
            assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(context) }
            assertEquals(before, snapshot(context))
        }
    }

    @Test
    fun `changed header sink URL factory or request anchors refuse before modifying any code or status`() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("key", "sink", "value", "return", "url", "create", "token", "bypass", "apiKey", "apiValue", "apiConnection", "apiBypass")) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val header = context.resolveFirebaseHeader()
            val method = header.method
            when (change) {
                "key" -> method.replaceInstruction(header.index - 1, "const-string v0, \"X-Unrelated-Cert\"")
                "sink" -> method.replaceInstruction(header.index, "invoke-virtual {v10, v3, v0}, " +
                    "Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V")
                "value" -> method.replaceInstruction(header.index, "invoke-virtual {v10, v0, v2}, " +
                    "Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V")
                "return" -> method.replaceInstruction(header.index + 3, "return-object v3")
                "url" -> {
                    val factory = context.mutableClassDefBy(method.definingClass).methods.single {
                        "https://firebaseinstallations.googleapis.com/v1/" in it.strings()
                    }
                    factory.replaceInstruction(0, "const-string v0, \"https://unrelated.invalid/\"")
                }
                "create", "token" -> {
                    val request = header.requests.getValue(if (change == "create") FirebaseRequest.CREATE else FirebaseRequest.TOKEN)
                    val mutable = context.mutableClassDefBy(request.definingClass).methods.single { it.signature() == request.signature() }
                    val anchor = if (change == "create") "x-goog-fis-android-iid-migration-auth" else "/authTokens:generate"
                    val index = mutable.instructions().indexOfFirst { it.string() == anchor }
                    mutable.replaceInstruction(index, "const-string v${mutable.instructions()[index].namedRegisters().single()}, \"changed-request\"")
                }
                "bypass" -> {
                    // A direct entry edge past the literal must be refused, even though all strings still match.
                    method.addInstructionsWithLabels(0, "goto/32 :bypass_certificate_key",
                        ExternalLabel("bypass_certificate_key", method.getInstruction(header.index)))
                }
                "apiKey" -> {
                    val register = method.instructions()[header.index + 1].namedRegisters().single()
                    method.replaceInstruction(header.index + 1, "const-string v$register, \"x-unrelated-key\"")
                }
                "apiValue", "apiConnection" -> {
                    val index = header.index + 2
                    val instruction = method.instructions()[index]
                    val registers = instruction.namedRegisters().toMutableList()
                    if (change == "apiValue") registers[2] = registers[1] else registers[0] = registers[1]
                    method.replaceInstruction(index, "invoke-virtual {${registers.joinToString { "v$it" }}}, ${instruction.call()}")
                }
                "apiBypass" -> method.addInstructionsWithLabels(0, "goto/32 :bypass_api_key",
                    ExternalLabel("bypass_api_key", method.getInstruction(header.index + 2)))
            }
            val before = snapshot(context)
            val failure = assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(context) }
            assertTrue("${build.name}: $change refuses before editing", failure.message.orEmpty().contains("before editing"))
            assertEquals("${build.name}: $change keeps all bytecode and build facts", before, snapshot(context))
            assertFlag(context, "repairFirebasePush", false)
            assertFlag(context, "firebaseCertificateHeader", false)
            assertFlag(context, "firebaseLocalStatus", false)
        }
    }

    @Test
    fun `ambiguous header owners and an inaccessible runtime hook refuse without partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val client = hosts.single { it.methods.any { method -> "X-Android-Cert" in method.strings() } }
            val duplicate = ImmutableClassDef("Ltest/OtherFirebaseClient;", client.accessFlags, client.superclass,
                client.interfaces, client.sourceFile, client.annotations, client.fields, client.methods.map { method ->
                    ImmutableMethod("Ltest/OtherFirebaseClient;", method.name, method.parameters, method.returnType,
                        method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation)
                })
            val ambiguous = PatchContexts.of(ExtensionDex.classes() + hosts + duplicate)
            val before = snapshot(ambiguous)
            assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(ambiguous) }
            assertEquals(before, snapshot(ambiguous))
            val inaccessible = PatchContexts.of(ExtensionDex.classes() + hosts)
            val hook = inaccessible.mutableClassDefBy(FIREBASE_PUSH).methods.single { it.name == "certificateHeader" }
            hook.accessFlags = hook.accessFlags and AccessFlags.PUBLIC.value.inv()
            val badShape = snapshot(inaccessible)
            assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(inaccessible) }
            assertEquals(badShape, snapshot(inaccessible))
        }
    }

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { dex ->
        dex.stringSection.any { it in setOf("X-Android-Cert", "/authTokens:generate") }
    }) { method -> method.strings().any { it in setOf("X-Android-Cert", "/authTokens:generate") } } +
        FixtureDex.classes(build, setOf(SHARED_CONFIG, USER_CONFIG)).values
    private fun snapshot(context: BytecodePatchContext): Map<String, List<String>> {
        val result = linkedMapOf<String, List<String>>()
        context.classDefForEach { result[it.type] = snapshot(context.mutableClassDefBy(it.type)) }
        return result
    }
    private fun snapshot(owner: ClassDef) = listOf(owner.accessFlags.toString()) + owner.fields.sortedBy { it.name }
        .map { "${it.name}|${it.type}|${it.accessFlags}|${it.initialValue}" } + owner.methods.sortedBy { it.signature() }.map(::snapshot)
    private fun snapshot(method: Method): String {
        val flow = method.implementation?.let { ControlFlow.of(method) }
        return listOf(method.signature(), method.accessFlags, method.implementation?.registerCount,
            method.instructions().map(::operation), flow?.normal?.toList(), flow?.exceptional?.toList()).joinToString("|")
    }
    private fun operation(instruction: Instruction) = listOf(instruction.opcode.name, instruction.reference(),
        instruction.namedRegisters(), (instruction as? NarrowLiteralInstruction)?.narrowLiteral).joinToString("|")
    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
        assertEquals(Opcode.CONST_4, body[0].opcode)
        assertEquals(if (enabled) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }
    private fun digest(algorithm: String, bytes: ByteArray) = MessageDigest.getInstance(algorithm).digest(bytes)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Method.strings() = instructions().mapNotNull { it.string() }.toSet()
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference
    private fun MethodReference.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    /** Executes the generated readers against synthetic memory; every write or other call is refused. */
    private inner class ReadOnlyProbe(method: Method) {
        private val body = method.implementation!!.instructions.toList()
        private val registers = method.implementation!!.registerCount
        private val addresses = body.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        private val atAddress = addresses.withIndex().associate { it.value to it.index }

        fun run(statics: Map<String, Any?>): Int {
            val values = arrayOfNulls<Any>(registers)
            val locks = mutableListOf<Any>()
            var result = 0
            var index = 0
            var steps = 0
            fun value(register: Int) = values[register]
            fun number(register: Int) = value(register) as Int
            fun zero(register: Int) = value(register) == null || value(register) == 0
            while (true) {
                check(++steps <= 200) { "read-only reader did not terminate" }
                val instruction = body[index]
                val one = instruction as? OneRegisterInstruction
                val two = instruction as? TwoRegisterInstruction
                val three = instruction as? ThreeRegisterInstruction
                var branch = false
                when (instruction.opcode) {
                    Opcode.CONST_4 -> values[one!!.registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral
                    Opcode.SGET_OBJECT, Opcode.SGET_BOOLEAN -> values[one!!.registerA] = statics[instruction.field()!!.name]
                    Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN -> {
                        val objectFields = value(two!!.registerB) as Map<*, *>
                        values[two.registerA] = objectFields[instruction.field()!!.name]
                    }
                    Opcode.ARRAY_LENGTH -> values[two!!.registerA] = (value(two.registerB) as Array<*>).size
                    Opcode.AGET_OBJECT -> values[three!!.registerA] = (value(three.registerB) as Array<*>)[number(three.registerC)]
                    Opcode.MONITOR_ENTER -> locks.add(value(one!!.registerA)!!)
                    Opcode.MONITOR_EXIT -> check(locks.removeAt(locks.lastIndex) === value(one!!.registerA)) { "unbalanced native reader lock" }
                    Opcode.INVOKE_VIRTUAL -> {
                        check(instruction.call()!!.signature() == "Ljava/lang/String;->isEmpty()Z") { "native reader attempted another call" }
                        result = if ((value(instruction.namedRegisters().single()) as String).isEmpty()) 1 else 0
                    }
                    Opcode.MOVE_RESULT -> values[one!!.registerA] = result
                    Opcode.ADD_INT_LIT8, Opcode.XOR_INT_LIT8, Opcode.SHL_INT_LIT8 -> {
                        val number = number(two!!.registerB)
                        val literal = (instruction as NarrowLiteralInstruction).narrowLiteral
                        values[two.registerA] = when (instruction.opcode) {
                            Opcode.ADD_INT_LIT8 -> number + literal
                            Opcode.XOR_INT_LIT8 -> number xor literal
                            else -> number shl literal
                        }
                    }
                    Opcode.OR_INT -> values[three!!.registerA] = number(three.registerB) or number(three.registerC)
                    Opcode.IF_EQZ -> branch = zero(one!!.registerA)
                    Opcode.IF_NE -> branch = number(two!!.registerA) != number(two.registerB)
                    Opcode.IF_GE -> branch = number(two!!.registerA) >= number(two.registerB)
                    Opcode.GOTO -> branch = true
                    Opcode.RETURN -> {
                        check(locks.isEmpty()) { "native reader returned while holding a lock" }
                        return number(one!!.registerA)
                    }
                    else -> error("read-only probe refuses ${instruction.opcode}")
                }
                index = if (branch) atAddress.getValue(addresses[index] + (instruction as OffsetInstruction).codeOffset) else index + 1
            }
        }
    }
}
