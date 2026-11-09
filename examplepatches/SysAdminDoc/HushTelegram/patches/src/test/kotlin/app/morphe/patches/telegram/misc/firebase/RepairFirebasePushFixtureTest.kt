/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterKinds
import app.morphe.util.RegisterLiveness
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
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
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
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private const val ANSWER_CALLBACK = "lambda\$registerForPush\$"
private val ANSWER_PARAMETERS = listOf("I", "Ljava/lang/String;", "Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/TLRPC\$TL_error;")
private const val SEND_REQUEST = "Lorg/telegram/tgnet/ConnectionsManager;->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I"
private const val TOKEN_TYPE = "Lorg/telegram/tgnet/tl/TL_account\$registerDevice;->token_type:I"

/** The account.registerDevice answer, not registerForPush's no-argument lambda that clears its in-flight flag. */
private fun Method.isAnswerCallback() =
    origName.startsWith(ANSWER_CALLBACK) && parameterTypes.map(CharSequence::toString) == ANSWER_PARAMETERS && returnType == "V"

/** registerForPush itself, which sends the account.registerDevice request. */
private fun Method.isPushRequest() =
    origName == "registerForPush" && parameterTypes.map(CharSequence::toString) == listOf("I", "Ljava/lang/String;") && returnType == "V"

private val DELEGATE_PARAMETERS = listOf("Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/TLRPC\$TL_error;")
/** The merged delegate's constructor: the controller, push type, token, then the case number. */
private val DELEGATE_INIT = listOf("Ljava/lang/Object;", "I", "Ljava/lang/Object;", "I")
private const val BOOL_TRUE = "Lorg/telegram/tgnet/TLRPC\$TL_boolTrue;"

/** A RequestDelegate's answer method, where 13.2's R8 merged registerForPush's answer in as one case. */
private fun Method.isDelegateRun() = name == "run" && parameterTypes.map(CharSequence::toString) == DELEGATE_PARAMETERS && returnType == "V"

/** Independent signer and request census, with complete pre-mutation refusal snapshots. */
class RepairFirebasePushFixtureTest {
    @Test
    fun `header seed is the actual official fixture signer rather than a guessed fingerprint`() {
        val seed = ExtensionDex.classes().single { it.origType == FIREBASE_PUSH }.fields.single {
            it.origName == "OFFICIAL_CERTIFICATE_SHA1"
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
            val patched = context.tgMutableClassDefBy(original.definingClass).methods.single { it.signature() == original.signature() }
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
            val delegate = pushDelegate(build)?.first
            for (owner in hosts) for (method in owner.methods) {
                if (method.signature() == original.signature() || method.isAnswerCallback() || method.isPushRequest() ||
                    owner.type == delegate && method.isDelegateRun()) continue
                assertEquals("${build.name}: untouched ${method.signature()}", snapshot(method),
                    snapshot(context.tgMutableClassDefBy(owner.type).methods.single { it.signature() == method.signature() }))
            }
            assertFlag(context, "repairFirebasePush", true)
            assertFlag(context, "firebaseCertificateHeader", true)
            assertFlag(context, "firebaseLocalStatus", true)
        }
    }

    @Test
    fun `push answer hook reads its controller push type response and error ahead of the stock boolTrue test and changes nothing else`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val controller = hosts.single { it.origType == PUSH_CONTROLLER }
            val delegate = pushDelegate(build)
            if (delegate != null) {
                assertMergedAnswerHook(build, hosts, context, delegate.first, delegate.second)
                continue
            }
            assertEquals("${build.name}: the answer and the in-flight reset share the name", 2,
                controller.methods.count { it.origName.startsWith(ANSWER_CALLBACK) })
            val original = controller.methods.single { it.isAnswerCallback() }
            assertTrue("${build.name}: instance callback", !AccessFlags.STATIC.isSet(original.accessFlags))
            val registers = original.implementation!!.registerCount
            val before = original.instructions()
            assertEquals(Opcode.INSTANCE_OF, before[0].opcode)
            assertEquals("Lorg/telegram/tgnet/TLRPC\$TL_boolTrue;", before[0].reference())
            assertEquals("${build.name}: stock test reads the response", registers - 2, (before[0] as TwoRegisterInstruction).registerB)
            assertEquals("${build.name}: one accepted-registration write", 1, before.count {
                it.opcode == Opcode.IPUT_BOOLEAN && it.field()?.origName == "registeredForPush"
            })
            repairFirebasePushPatch.execute(context)
            val patched = context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.signature() == original.signature() }
            val after = patched.instructions()
            assertEquals(before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode)
            assertEquals(ANSWER_HOOK, after[0].reference())
            assertEquals("${build.name}: this, then the push type, response and error parameters",
                listOf(registers - 5, registers - 4, registers - 2, registers - 1), after[0].namedRegisters())
            assertEquals("${build.name}: every stock instruction follows unchanged", before.map(::operation), after.drop(1).map(::operation))
            assertEquals(registers, patched.implementation!!.registerCount)
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(patched)
            assertEquals(listOf(1), newFlow.normal[0])
            fun destination(index: Int) = if (index == 0) 0 else index + 1
            for (index in before.indices) {
                assertEquals("${build.name}: stock normal successors at $index",
                    oldFlow.normal[index].map(::destination), newFlow.normal[index + 1])
                assertEquals("${build.name}: stock exceptional successors at $index",
                    oldFlow.exceptional[index].map(::destination), newFlow.exceptional[index + 1])
            }
            for (method in controller.methods) {
                if (method.signature() == original.signature() || method.isPushRequest()) continue
                assertEquals("${build.name}: untouched ${method.signature()}", snapshot(method),
                    snapshot(context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.signature() == method.signature() }))
            }
            val hook = context.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == "registerDeviceAnswer" }
            assertEquals(ANSWER_HOOK, "${hook.definingClass}->${hook.name}(${hook.parameterTypes.joinToString("")})${hook.returnType}")
            assertFlag(context, "repairFirebasePush", true)
        }
    }

    @Test
    fun `push request hook reads its controller and push type just ahead of the one registerDevice request and changes nothing else`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val original = hosts.single { it.origType == PUSH_CONTROLLER }.methods.single { it.isPushRequest() }
            assertTrue("${build.name}: instance method", !AccessFlags.STATIC.isSet(original.accessFlags))
            val registers = original.implementation!!.registerCount
            val before = original.instructions()
            assertEquals("${build.name}: one request", 1, before.count { it.reference() == SEND_REQUEST })
            val at = before.indexOfFirst { it.reference() == SEND_REQUEST }
            // Parameters fill the last registers: this, push type, token.
            assertEquals("${build.name}: the request carries the push type parameter", listOf(registers - 2),
                before.filter { it.reference() == TOKEN_TYPE }.map { (it as TwoRegisterInstruction).registerA })
            repairFirebasePushPatch.execute(context)
            val patched = context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.signature() == original.signature() }
            val after = patched.instructions()
            assertEquals(before.size + 1, after.size)
            // A range, since this and the push type sit past every local and may be out of a plain invoke's reach.
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
            assertEquals(SENT_HOOK, after[at].reference())
            assertEquals("${build.name}: this and the push type parameter", listOf(registers - 3, registers - 2), after[at].namedRegisters())
            assertEquals("${build.name}: the request follows at once", SEND_REQUEST, after[at + 1].reference())
            assertEquals("${build.name}: every stock instruction is unchanged", before.map(::operation),
                (after.take(at) + after.drop(at + 1)).map(::operation))
            assertEquals(registers, patched.implementation!!.registerCount)
            val oldFlow = ControlFlow.of(original)
            val newFlow = ControlFlow.of(patched)
            assertEquals(listOf(at + 1), newFlow.normal[at])
            fun moved(index: Int) = index + if (index >= at) 1 else 0
            fun destination(index: Int) = if (index == at) at else moved(index)
            for (index in before.indices) {
                assertEquals("${build.name}: stock normal successors at $index",
                    oldFlow.normal[index].map(::destination), newFlow.normal[moved(index)])
                assertEquals("${build.name}: stock exceptional successors at $index",
                    oldFlow.exceptional[index].map(::destination), newFlow.exceptional[moved(index)])
            }
            val hook = context.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == "registerDeviceSent" }
            assertEquals(SENT_HOOK, "${hook.definingClass}->${hook.name}(${hook.parameterTypes.joinToString("")})${hook.returnType}")
            assertFlag(context, "repairFirebasePush", true)
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
                val method = context.tgMutableClassDefBy(owner).methods.single { it.origName == reader }
                assertEquals("${build.name}: primitive evidence only", "I", method.returnType)
                assertTrue(method.parameterTypes.isEmpty())
                assertTrue(AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
                assertTrue("${build.name}: $reader is a real native reader", method.instructions().size > 2)
                assertEquals(fields, method.instructions().mapNotNull { it.field()?.origName }.toSet())
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
                val stub = context.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == stubName }
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
            val token = ReadOnlyProbe(context.tgMutableClassDefBy(SHARED_CONFIG).methods.single { it.origName == TOKEN_READER })
            for (value in listOf(null, "", "synthetic-token-canary-391883", " ")) {
                assertEquals(if (value == null) -1 else if (value.isEmpty()) 0 else 1,
                    token.run(mapOf("sync" to Any(), "configLoaded" to 1, "pushString" to value)))
                assertEquals(-1, token.run(mapOf("sync" to Any(), "configLoaded" to 0, "pushString" to value)))
            }
            assertEquals(-1, token.run(mapOf("sync" to null)))
            val accounts = ReadOnlyProbe(context.tgMutableClassDefBy(USER_CONFIG).methods.single { it.origName == ACCOUNT_READER })
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
            mutations["missing $owner $name"] = { it.tgMutableClassDefBy(owner).fields.removeAll { field -> field.origName == name } }
            mutations["wrong access $owner $name"] = { it.tgMutableClassDefBy(owner).fields.single { field -> field.origName == name }.accessFlags = 0 }
            mutations["wrong type $owner $name"] = { context ->
                val host = context.tgMutableClassDefBy(owner)
                val field = host.fields.single { it.origName == name }
                host.fields.remove(field)
                host.fields.add(ImmutableField(owner, name, if (field.origType == "I") "J" else "I", field.accessFlags,
                    field.initialValue, field.annotations, field.hiddenApiRestrictions).toMutable())
            }
        }
        for ((name, instruction) in listOf("isConfigLoaded" to "const/4 v0, 0x0", "isClientActivated" to "const/4 v0, 0x0",
            "<clinit>" to "const/4 v0, 0x3", "loadConfig" to "const/4 v0, 0x0")) {
            mutations["changed $name"] = { it.tgMutableClassDefBy(USER_CONFIG).methods.single { method -> method.origName == name }
                .replaceInstruction(0, instruction) }
        }
        // With isConfigLoaded inlined (13.2), loadConfig's one readiness write is what ties configLoaded to a load.
        for (owner in listOf(SHARED_CONFIG, USER_CONFIG)) {
            mutations["$owner loadConfig no longer marks readiness"] = { context ->
                val method = context.tgMutableClassDefBy(owner).methods.single { it.origName == "loadConfig" }
                method.replaceInstruction(method.instructions().indexOfLast { it.field()?.origName == "configLoaded" }, "nop")
            }
        }
        mutations["changed token preference"] = { context ->
            val method = context.tgMutableClassDefBy(SHARED_CONFIG).methods.single { it.origName == "loadConfig" }
            val at = method.instructions().indexOfFirst { it.string() == "pushString2" }
            method.replaceInstruction(at, "const-string v2, \"unrelatedPreference\"")
        }
        for (name in listOf("isConfigLoaded", "isClientActivated")) {
            mutations["missing $name getter"] = { it.tgMutableClassDefBy(USER_CONFIG).methods.removeAll { method -> method.origName == name } }
            mutations["ambiguous $name getter"] = { context ->
                val owner = context.tgMutableClassDefBy(USER_CONFIG)
                val method = owner.methods.single { it.origName == name }
                owner.methods.add(ImmutableMethod(USER_CONFIG, name, method.parameters, "I", method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        for ((owner, bridge) in listOf(SHARED_CONFIG to TOKEN_READER, USER_CONFIG to ACCOUNT_READER)) {
            mutations["existing $bridge"] = { context ->
                val method = context.tgMutableClassDefBy(owner).methods.first { it.parameterTypes.isEmpty() }
                context.tgMutableClassDefBy(owner).methods.add(ImmutableMethod(owner, bridge, method.parameters, "I",
                    method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        for (name in listOf("nativeTokenPresence", "nativeAccountCounts")) {
            mutations["invalid $name fallback"] = { context ->
                context.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == name }.replaceInstruction(0, "const/4 v0, 0x0")
            }
            mutations["ambiguous $name fallback"] = { context ->
                val owner = context.tgMutableClassDefBy(FIREBASE_PUSH)
                val method = owner.methods.single { it.origName == name }
                owner.methods.add(ImmutableMethod(FIREBASE_PUSH, name, method.parameters, "Z", method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
            }
        }
        fun request(context: BytecodePatchContext) =
            context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.isPushRequest() }
        mutations["missing push request method"] = { context ->
            context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.removeAll { it.isPushRequest() }
        }
        mutations["static push request method"] = { context ->
            val method = request(context)
            method.accessFlags = method.accessFlags or AccessFlags.STATIC.value
        }
        mutations["second push request"] = { context ->
            val method = request(context)
            val at = method.instructions().indexOfFirst { it.reference() == SEND_REQUEST }
            method.addInstructionsWithLabels(at, "invoke-virtual {${method.instructions()[at].namedRegisters().joinToString { "v$it" }}}, $SEND_REQUEST")
        }
        mutations["push request no longer carries its push type"] = { context ->
            val method = request(context)
            method.replaceInstruction(method.instructions().indexOfFirst { it.reference() == TOKEN_TYPE }, "nop")
        }
        // Each is written over before the request, so the hook would read something else there. const/16
        // reaches a register past v15, where registerForPush's this and push type may sit.
        for ((what, parameter) in listOf("controller" to 3, "push type" to 2)) {
            mutations["push request $what written over"] = { context ->
                val method = request(context)
                method.addInstructionsWithLabels(0, "const/16 v${method.implementation!!.registerCount - parameter}, 0x0")
            }
        }
        for ((what, name) in listOf("answer" to "registerDeviceAnswer", "request" to "registerDeviceSent")) {
            mutations["missing push $what hook"] = { context ->
                context.tgMutableClassDefBy(FIREBASE_PUSH).methods.removeAll { it.origName == name }
            }
            mutations["private push $what hook"] = { context ->
                val hook = context.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == name }
                hook.accessFlags = (hook.accessFlags and AccessFlags.PUBLIC.value.inv()) or AccessFlags.PRIVATE.value
            }
            // An extension whose hook doesn't take the controller can't say which account asked.
            mutations["push $what hook without its controller"] = { context ->
                val owner = context.tgMutableClassDefBy(FIREBASE_PUSH)
                val hook = owner.methods.single { it.origName == name }
                owner.methods.remove(hook)
                owner.methods.add(ImmutableMethod(FIREBASE_PUSH, name, hook.parameters.drop(1), hook.returnType, hook.accessFlags,
                    hook.annotations, hook.hiddenApiRestrictions, hook.implementation).toMutable())
            }
        }
        // The hooks ask the controller who's signed in by these two names.
        mutations["missing user id reader"] = { context ->
            context.tgMutableClassDefBy(USER_CONFIG).methods.removeAll { it.origName == "getClientUserId" }
        }
        mutations["hidden account reader"] = { context ->
            val reader = context.tgMutableClassDefBy(BASE_CONTROLLER).methods.single { it.origName == "getUserConfig" }
            reader.accessFlags = (reader.accessFlags and AccessFlags.PUBLIC.value.inv()) or AccessFlags.PROTECTED.value
        }
        for (build in Fixtures.declaredBuilds()) {
            val nativeHosts = hosts(build)
            // 13.2's R8 folded MAX_ACCOUNT_COUNT away and inlined isConfigLoaded, so a build without them
            // has nothing of theirs to change. "changed <clinit>" and the readiness writes above stand in.
            val user = nativeHosts.single { it.origType == USER_CONFIG }
            val absent = setOf("MAX_ACCOUNT_COUNT", "isConfigLoaded").filter { member ->
                user.fields.none { it.origName == member } && user.methods.none { it.origName == member }
            }
            val delegate = pushDelegate(build)
            for ((name, mutate) in mutations + answerMutations(delegate?.first)) {
                if (name.split(' ').any { it in absent }) continue
                val context = PatchContexts.of(ExtensionDex.classes() + nativeHosts)
                mutate(context)
                val before = snapshot(context)
                assertThrows("${build.name}: $name", PatchException::class.java) { repairFirebasePushPatch.execute(context) }
                assertEquals("${build.name}: $name preserves all code and build facts", before, snapshot(context))
                assertFlag(context, "repairFirebasePush", false)
                assertFlag(context, "firebaseCertificateHeader", false)
                assertFlag(context, "firebaseLocalStatus", false)
            }
            for (owner in listOfNotNull(SHARED_CONFIG, USER_CONFIG, PUSH_CONTROLLER, BASE_CONTROLLER, delegate?.first)) {
                val context = PatchContexts.of(ExtensionDex.classes() + nativeHosts.filter { it.origType != owner })
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
            context.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "firebaseLocalStatus" }
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
                    val factory = context.tgMutableClassDefBy(method.definingClass).methods.single {
                        "https://firebaseinstallations.googleapis.com/v1/" in it.strings()
                    }
                    factory.replaceInstruction(0, "const-string v0, \"https://unrelated.invalid/\"")
                }
                "create", "token" -> {
                    val request = header.requests.getValue(if (change == "create") FirebaseRequest.CREATE else FirebaseRequest.TOKEN)
                    val mutable = context.tgMutableClassDefBy(request.definingClass).methods.single { it.signature() == request.signature() }
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
            val hook = inaccessible.tgMutableClassDefBy(FIREBASE_PUSH).methods.single { it.origName == "certificateHeader" }
            hook.accessFlags = hook.accessFlags and AccessFlags.PUBLIC.value.inv()
            val badShape = snapshot(inaccessible)
            assertThrows(PatchException::class.java) { repairFirebasePushPatch.execute(inaccessible) }
            assertEquals(badShape, snapshot(inaccessible))
        }
    }

    /**
     * 13.2: the answer is one case of a RequestDelegate R8 merged, picked by the number registerForPush
     * builds it with. The hook leads that case and passes the controller and push type the delegate
     * keeps, with run's own response and error, before the case writes over the error's register.
     */
    private fun assertMergedAnswerHook(build: File, hosts: List<ClassDef>, context: BytecodePatchContext, type: String, case: Int) {
        assertEquals("${build.name}: no answer lambda left on the controller", 0,
            hosts.single { it.origType == PUSH_CONTROLLER }.methods.count { it.origName.startsWith(ANSWER_CALLBACK) })
        val owner = hosts.single { it.type == type }
        val init = owner.methods.single { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == DELEGATE_INIT }
        val self = init.implementation!!.registerCount - 5
        fun kept(parameter: Int) = init.instructions().single {
            it.opcode in setOf(Opcode.IPUT, Opcode.IPUT_OBJECT) && it.namedRegisters() == listOf(self + parameter, self)
        }.reference()
        val original = owner.methods.single { it.isDelegateRun() }
        assertTrue("${build.name}: instance answer", !AccessFlags.STATIC.isSet(original.accessFlags))
        val registers = original.implementation!!.registerCount
        val before = original.instructions()
        assertEquals(Opcode.IGET, before[0].opcode)
        assertEquals("${build.name}: run switches on the case number first", kept(4), before[0].reference())
        assertEquals(Opcode.PACKED_SWITCH, before[1].opcode)
        val address = before.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val payload = before[address.indexOf(address[1] + (before[1] as OffsetInstruction).codeOffset)] as SwitchPayload
        val start = address.indexOf(address[1] + payload.switchElements.single { it.key == case }.offset)
        val oldFlow = ControlFlow.of(original)
        assertEquals("${build.name}: only the switch enters the case", listOf(1), before.indices.filter { start in oldFlow.normal[it] })
        val test = (start until before.size).first { before[it].opcode == Opcode.INSTANCE_OF }
        assertEquals("${build.name}: the case tests the answer for boolTrue first", BOOL_TRUE, before[test].reference())
        assertEquals("${build.name}: stock test reads the response", registers - 2, (before[test] as TwoRegisterInstruction).registerB)
        assertEquals("${build.name}: one accepted-registration write", 1, before.count {
            it.opcode == Opcode.IPUT_BOOLEAN && it.field()?.origName == "registeredForPush"
        })
        repairFirebasePushPatch.execute(context)
        val patched = context.tgMutableClassDefBy(type).methods.single { it.signature() == original.signature() }
        val after = patched.instructions()
        // An insert can add or drop the nop that aligns the switch table, so positions leave nops out.
        val stock = before.indices.filter { before[it].opcode != Opcode.NOP }
        val now = after.indices.filter { after[it].opcode != Opcode.NOP }
        val hook = stock.indexOf(start)
        assertEquals(stock.size + 3, now.size)
        val (load, read, call) = now.subList(hook, hook + 3).map { after[it] }
        assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.IGET, Opcode.INVOKE_STATIC), listOf(load.opcode, read.opcode, call.opcode))
        val controller = load.namedRegisters()[0]
        val pushType = read.namedRegisters()[0]
        assertEquals("${build.name}: the delegate's controller", kept(1), load.reference())
        assertEquals(listOf(controller, registers - 3), load.namedRegisters())
        assertEquals("${build.name}: the delegate's push type", kept(2), read.reference())
        assertEquals(listOf(pushType, registers - 3), read.namedRegisters())
        assertEquals(ANSWER_HOOK, call.reference())
        assertEquals("${build.name}: controller, push type, then the response and error parameters",
            listOf(controller, pushType, registers - 2, registers - 1), call.namedRegisters())
        // The two it borrows are ones the case writes before it reads them.
        val live = RegisterLiveness.of(original).liveInto(start)
        assertTrue("${build.name}: v$controller and v$pushType are free at the case start",
            controller != pushType && listOf(controller, pushType).none { it in live || it >= registers - 3 })
        assertEquals("${build.name}: every stock instruction follows unchanged", stock.map { operation(before[it]) },
            (now.take(hook) + now.drop(hook + 3)).map { operation(after[it]) })
        assertEquals(registers, patched.implementation!!.registerCount)
        val newFlow = ControlFlow.of(patched)
        fun moved(index: Int) = stock.indexOf(index).let { now[if (it >= hook) it + 3 else it] }
        fun destination(index: Int) = if (index == start) now[hook] else moved(index)
        assertEquals(listOf(now[hook + 1]), newFlow.normal[now[hook]])
        assertEquals(listOf(now[hook + 2]), newFlow.normal[now[hook + 1]])
        assertEquals(listOf(now[hook + 3]), newFlow.normal[now[hook + 2]])
        for (index in stock) {
            assertEquals("${build.name}: stock normal successors at $index",
                oldFlow.normal[index].map(::destination), newFlow.normal[moved(index)])
            assertEquals("${build.name}: stock exceptional successors at $index",
                oldFlow.exceptional[index].map(::destination), newFlow.exceptional[moved(index)])
        }
        for (method in owner.methods) {
            if (method.isDelegateRun()) continue
            assertEquals("${build.name}: untouched ${method.signature()}", snapshot(method),
                snapshot(context.tgMutableClassDefBy(type).methods.single { it.signature() == method.signature() }))
        }
        for (method in hosts.single { it.origType == PUSH_CONTROLLER }.methods) {
            if (method.isPushRequest()) continue
            assertEquals("${build.name}: untouched ${method.signature()}", snapshot(method),
                snapshot(context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.signature() == method.signature() }))
        }
        assertFlag(context, "repairFirebasePush", true)
    }

    /**
     * The answer's refusals, made on the controller's lambda through 13.1 and on the merged delegate's
     * run in 13.2 ([delegate] names it). There the boolTrue test leads the answer's case, not run.
     */
    private fun answerMutations(delegate: String?): Map<String, (BytecodePatchContext) -> Unit> {
        val owner = delegate ?: PUSH_CONTROLLER
        fun Method.isAnswer() = if (delegate == null) isAnswerCallback() else isDelegateRun()
        fun callback(context: BytecodePatchContext) = context.tgMutableClassDefBy(owner).methods.single { it.isAnswer() }
        fun test(method: Method) = if (delegate == null) 0 else method.instructions().indexOfFirst { it.reference() == BOOL_TRUE }
        val mutations = linkedMapOf<String, (BytecodePatchContext) -> Unit>()
        mutations["missing push answer callback"] = { context ->
            context.tgMutableClassDefBy(owner).methods.removeAll { it.isAnswer() }
        }
        mutations["ambiguous push answer callback"] = { context ->
            if (delegate == null) {
                val method = callback(context)
                context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.add(ImmutableMethod(PUSH_CONTROLLER, "${ANSWER_CALLBACK}9999",
                    method.parameters, method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                    method.implementation).toMutable())
            } else {
                // A second delegate made for the one request.
                val request = context.tgMutableClassDefBy(PUSH_CONTROLLER).methods.single { it.isPushRequest() }
                val made = request.instructions().indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.reference() == delegate }
                request.addInstructionsWithLabels(made, "new-instance v${request.instructions()[made].namedRegisters()[0]}, $delegate")
            }
        }
        mutations["changed push answer parameters"] = { context ->
            val method = callback(context)
            val host = context.tgMutableClassDefBy(owner)
            host.methods.remove(method)
            val parameters = if (delegate == null) method.parameters.take(3) + method.parameters.take(1)
                else method.parameters.take(1) + method.parameters.take(1)
            host.methods.add(ImmutableMethod(owner, method.name, parameters, method.returnType, method.accessFlags,
                method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable())
        }
        mutations["static push answer callback"] = { context ->
            val method = callback(context)
            method.accessFlags = method.accessFlags or AccessFlags.STATIC.value
        }
        mutations["push answer tests another type first"] = { context ->
            val method = callback(context)
            val at = test(method)
            val test = method.instructions()[at] as TwoRegisterInstruction
            method.replaceInstruction(at, "instance-of v${test.registerA}, v${test.registerB}, Lorg/telegram/tgnet/TLRPC\$TL_boolFalse;")
        }
        mutations["push answer tests another register first"] = { context ->
            val method = callback(context)
            val at = test(method)
            val test = method.instructions()[at] as TwoRegisterInstruction
            method.replaceInstruction(at, "instance-of v${test.registerA}, v${method.implementation!!.registerCount - 1}, $BOOL_TRUE")
        }
        mutations["push answer no longer records the registration"] = { context ->
            val method = callback(context)
            method.replaceInstruction(method.instructions().indexOfFirst { it.field()?.origName == "registeredForPush" }, "nop")
        }
        return mutations
    }

    /**
     * 13.2's registerForPush builds a merged RequestDelegate for its answer: that class and the case
     * number it passes last. Null on a build whose controller still owns its answer lambda.
     */
    private fun pushDelegate(build: File): Pair<String, Int>? {
        val controller = pushController(build)
        if (controller.methods.any { it.origName.startsWith(ANSWER_CALLBACK) }) return null
        val body = controller.methods.single { it.isPushRequest() }.instructions()
        val send = body.indexOfFirst { it.reference() == SEND_REQUEST }
        val delegate = body[send].namedRegisters()[2]
        val made = (0 until send).last { body[it].opcode == Opcode.NEW_INSTANCE && body[it].namedRegisters() == listOf(delegate) }
        val built = (made until send).single { body[it].opcode == Opcode.INVOKE_DIRECT && body[it].namedRegisters()[0] == delegate }
        val selector = body[built].namedRegisters().last()
        val case = (made until built).last { body[it].namedRegisters().firstOrNull() == selector }
        return (body[made] as ReferenceInstruction).reference.toString() to (body[case] as NarrowLiteralInstruction).narrowLiteral
    }

    private fun hosts(build: File): List<ClassDef> = FixtureDex.classesWhere(build, { dex ->
        dex.stringSection.any { it in setOf("X-Android-Cert", "/authTokens:generate") }
    }) { method -> method.strings().any { it in setOf("X-Android-Cert", "/authTokens:generate") } } +
        FixtureDex.classes(build, setOf(SHARED_CONFIG, USER_CONFIG, BASE_CONTROLLER)).values + pushController(build) +
        listOfNotNull(pushDelegate(build)?.first).flatMap { FixtureDex.classes(build, setOf(it)).values }

    /**
     * MessagesController cut down to every method the patch's name filters can match there, so the
     * whole-context snapshots stay cheap without hiding a second candidate callback or request.
     */
    private fun pushController(build: File): ClassDef {
        val owner = FixtureDex.classes(build, setOf(PUSH_CONTROLLER)).getValue(PUSH_CONTROLLER)
        return ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.filter { it.origName.startsWith(ANSWER_CALLBACK) || it.origName == "registerForPush" })
    }
    private fun snapshot(context: BytecodePatchContext): Map<String, List<String>> {
        val result = linkedMapOf<String, List<String>>()
        context.classDefForEach { result[it.type] = snapshot(context.tgMutableClassDefBy(it.type)) }
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
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(Opcode.CONST_4, body[0].opcode)
        assertEquals(if (enabled) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }
    private fun digest(algorithm: String, bytes: ByteArray) = MessageDigest.getInstance(algorithm).digest(bytes)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Method.strings() = instructions().mapNotNull { it.string() }.toSet()
    private fun Instruction.reference() = origRef()
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
                    Opcode.SGET_OBJECT, Opcode.SGET_BOOLEAN -> values[one!!.registerA] = statics[instruction.field()!!.origName]
                    Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN -> {
                        val objectFields = value(two!!.registerB) as Map<*, *>
                        values[two.registerA] = objectFields[instruction.field()!!.origName]
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
