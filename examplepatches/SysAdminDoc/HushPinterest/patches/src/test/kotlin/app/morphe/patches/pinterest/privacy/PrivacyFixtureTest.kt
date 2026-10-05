/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.value.ArrayEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction23x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.value.ImmutableArrayEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/** Real API annotations, Rx factories, startup scheduler and outgoing framework calls in both APKs. */
class PrivacyFixtureTest {
    @Test
    fun `each declared original APK gets all privacy hooks without warnings and keeps core URL calls`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val services = classes.flatMap { it.methods }.filter { it.telemetryPath() != null }
            assertEquals(build.name, TELEMETRY_PATHS, services.mapNotNull { it.telemetryPath() }.toSet())
            val coreUrlCalls = classes.filterNot { it.type.startsWith("Lcom/appsflyer/") }.flatMap { owner ->
                owner.methods.filter { method -> method.implementation?.instructions?.any {
                    it.callReference()?.identity() == URL_CALL
                } == true }.map { it.identity() }
            }
            assertTrue("${build.name}: no core networking stand-ins to preserve", coreUrlCalls.isNotEmpty())
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val before = dexSnapshot(context, ExtensionDex.classes() + classes)
            analyticsPreflightPatch.execute(context)
            assertArrayEquals("${build.name}: preflight changed the DEX", before, dexSnapshot(context, ExtensionDex.classes() + classes))
            val warnings = PatchLogCapture.warnings {
                disableAnalyticsPatch.execute(context)
                stripLinkTrackingPatch.execute(context)
            }
            assertEquals(build.name, emptyList<String>(), warnings)
            for (flag in listOf("disableAnalytics", "analyticsTasks", "analyticsUploads", "stripLinkTracking", "linkTracking")) {
                assertFlag(context, flag)
            }
            // Original API calls remain solely inside the new wrappers' inactive branch.
            val wrappers = context.mutableClassDefBy(ANALYTICS).methods.filter { it.name.startsWith("hushUpload") }
            assertEquals(build.name, services.size, wrappers.size)
            for (wrapper in wrappers) {
                val instructions = wrapper.implementation!!.instructions.toList()
                assertEquals("${build.name}: ${wrapper.name} gate", "$ANALYTICS->blockUpload()Z",
                    instructions.first().callReference()?.identity())
                assertEquals(1, instructions.count { it.callReference()?.identity() in services.map { api -> api.identity() } })
                assertTrue(instructions.any { it.opcode == Opcode.IF_EQZ })
                assertTrue(instructions.count { it.opcode == Opcode.RETURN_OBJECT } >= 2)
            }
            val originalCalls = services.map { it.identity() }.toSet()
            for (owner in classes) for (method in context.mutableClassDefBy(owner.type).methods) {
                assertFalse("${build.name}: an unguarded telemetry call remains in ${method.identity()}",
                    method.implementation?.instructions?.any { it.callReference()?.identity() in originalCalls } == true)
            }
            for (identity in coreUrlCalls) {
                val owner = context.mutableClassDefBy(identity.substringBefore("->"))
                val method = owner.methods.single { it.identity() == identity }
                assertTrue("${build.name}: core networking changed in $identity", method.implementation!!.instructions.any {
                    it.callReference()?.identity() == URL_CALL
                })
            }
            for (owner in classes.filter { it.type.startsWith("Lcom/appsflyer/") }) {
                for (method in context.mutableClassDefBy(owner.type).methods) {
                    assertFalse("${build.name}: AppsFlyer still opens a URL in ${method.identity()}",
                        method.implementation?.instructions?.any { it.callReference()?.identity() == URL_CALL } == true)
                }
            }
        }
    }

    @Test
    fun `inaccessible telemetry owners and uncallable runtime hooks reject without retaining DEX edits`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val extension = ExtensionDex.classes()
            val telemetry = classes.first { owner -> owner.methods.any { it.telemetryPath() != null } }
            val analytics = extension.single { it.type == ANALYTICS }
            val cases = linkedMapOf(
                "nonpublic telemetry interface" to extension + classes.map { owner -> if (owner.type != telemetry.type) owner else
                    copyClass(owner, owner.methods, owner.accessFlags and AccessFlags.PUBLIC.value.inv()) },
                "nonpublic hook owner" to classes + extension.map { owner -> if (owner.type != ANALYTICS) owner else
                    copyClass(owner, owner.methods, owner.accessFlags and AccessFlags.PUBLIC.value.inv()) },
                "interface hook owner" to classes + extension.map { owner -> if (owner.type != ANALYTICS) owner else
                    copyClass(owner, owner.methods, owner.accessFlags or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value) },
            )
            for (name in listOf("blockUpload", "blockTask", "openConnection")) {
                val hook = analytics.methods.single { it.name == name }
                val implementation = hook.implementation!!
                fun body(frame: Int, vararg instructions: Instruction) = copyMethod(hook,
                    implementation = ImmutableMethodImplementation(frame, instructions.toList(), emptyList(), emptyList()))
                val invalidHooks = linkedMapOf(
                    "empty body" to copyMethod(hook, implementation = ImmutableMethodImplementation(
                        implementation.registerCount, emptyList(), emptyList(), emptyList())),
                    "no registers" to copyMethod(hook, implementation = ImmutableMethodImplementation(
                        0, implementation.instructions, implementation.tryBlocks, implementation.debugItems)),
                    "private" to copyMethod(hook, accessFlags = (hook.accessFlags and AccessFlags.PUBLIC.value.inv()) or AccessFlags.PRIVATE.value),
                    "instance" to copyMethod(hook, accessFlags = hook.accessFlags and AccessFlags.STATIC.value.inv()),
                    "abstract" to copyMethod(hook, accessFlags = hook.accessFlags or AccessFlags.ABSTRACT.value),
                    "native" to copyMethod(hook, accessFlags = hook.accessFlags or AccessFlags.NATIVE.value),
                    "void return" to body(1, ImmutableInstruction10x(Opcode.RETURN_VOID)),
                    "wrong return kind" to body(1, ImmutableInstruction11x(
                        if (hook.returnType == "Z") Opcode.RETURN_OBJECT else Opcode.RETURN, 0)),
                    "truncated original frame" to copyMethod(hook, implementation = ImmutableMethodImplementation(
                        1, implementation.instructions, implementation.tryBlocks, implementation.debugItems)),
                )
                if (name == "blockUpload") {
                    val result = ImmutableInstruction11x(Opcode.RETURN, 0)
                    val task = analytics.methods.single { it.name == "blockTask" }
                    val wide = ImmutableMethodReference("Ljava/lang/Long;", "reverse", listOf("J"), "J")
                    invalidHooks.putAll(mapOf(
                        "one-register operand outside frame" to body(1, ImmutableInstruction11n(Opcode.CONST_4, 1, 0), result),
                        "two-register source outside frame" to body(1, ImmutableInstruction12x(Opcode.MOVE, 0, 1), result),
                        "three-register operand outside frame" to body(1, ImmutableInstruction23x(Opcode.ADD_INT, 0, 0, 1), result),
                        "wide destination outside frame" to body(1, ImmutableInstruction21s(Opcode.CONST_WIDE_16, 0, 0), result),
                        "wide source outside frame" to body(1, ImmutableInstruction12x(Opcode.LONG_TO_INT, 0, 0), result),
                        "invoke count mismatch" to body(1, ImmutableInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, task), result),
                        "invoke operand outside frame" to body(1, ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0, task), result),
                        "invoke receiver count mismatch" to body(1, ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, task), result),
                        "invoke range count mismatch" to body(1, ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 0, task), result),
                        "invoke range outside frame" to body(1, ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 1, 1, task), result),
                        "invoke wide range count mismatch" to body(1, ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 1, wide), result),
                        "invoke broken wide pair" to body(3, ImmutableInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 2, 0, 0, 0, wide), result),
                    ))
                }
                for ((reason, invalid) in invalidHooks) {
                    cases["$name $reason"] = classes + extension.map { owner -> if (owner.type != ANALYTICS) owner else
                        copyClass(owner, owner.methods.map { if (it.identity() == hook.identity()) invalid else it }) }
                }
            }
            for ((reason, input) in cases) {
                for (patch in listOf(analyticsPreflightPatch, disableAnalyticsPatch)) {
                    val context = PatchContexts.of(input)
                    val before = dexSnapshot(context, input)
                    assertThrows("${build.name}: $reason", PatchException::class.java) { patch.execute(context) }
                    assertArrayEquals("${build.name}: $reason left retained edits", before, dexSnapshot(context, input))
                }
            }
        }
    }

    @Test
    fun `missing late endpoints transport scheduler registers or status leave the complete DEX unchanged`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val extension = ExtensionDex.classes()
        val tags = classes.single { it.fields.any { field -> field.name == "TAG_APPSFLYER_INIT" } }
        val schedulerOwner = classes.single { owner -> owner.fields.any { it.type == "Ljava/lang/Runnable;" } &&
            owner.instanceFields.any { it.type == tags.type } }
        val scheduler = schedulerOwner.methods.single { it.returnType == "V" && it.parameterTypes.isEmpty() &&
            !it.name.startsWith('<') && it.implementation?.instructions?.any {
                it.callReference()?.let { ref -> ref.definingClass == "Ljava/util/Map;" && ref.name == "put" } == true
            } == true }
        val endpoint = classes.flatMap { it.methods }.first { it.telemetryPath() == "track/" }
        val cases = linkedMapOf(
            "missing endpoint" to classes.map { owner -> if (owner.type != endpoint.definingClass) owner else
                copyClass(owner, owner.methods.filterNot { it.identity() == endpoint.identity() }) },
            "missing AppsFlyer transport" to classes.filterNot { it.type.startsWith("Lcom/appsflyer/") },
            "missing task enum" to classes.filterNot { it.type == tags.type },
            "missing scheduler" to classes.filterNot { it.type == schedulerOwner.type },
            "scheduler without locals" to classes.map { owner -> if (owner.type != schedulerOwner.type) owner else
                copyClass(owner, owner.methods.map { method -> if (method.identity() != scheduler.identity()) method else
                    ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType,
                        method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                        ImmutableMethodImplementation(1, method.implementation!!.instructions,
                            method.implementation!!.tryBlocks, method.implementation!!.debugItems)) }) },
        ).mapValues { extension + it.value }.toMutableMap()
        cases["missing final status stub"] = classes + extension.map { owner -> if (owner.type != SETTINGS_STATUS) owner else
            copyClass(owner, owner.methods.filterNot { it.name == "disableAnalytics" }) }
        cases["missing runtime transport hook"] = classes + extension.map { owner -> if (owner.type != ANALYTICS) owner else
            copyClass(owner, owner.methods.filterNot { it.name == "openConnection" }) }
        val caller = classes.flatMap { it.methods }.first { method -> method.implementation?.instructions?.any {
            it.callReference()?.identity() == endpoint.identity() } == true }
        val instructions = caller.implementation!!.instructions.toList()
        val index = instructions.indexOfFirst { it.callReference()?.identity() == endpoint.identity() }
        val call = instructions[index]
        val invalid = if (call is RegisterRangeInstruction) {
            ImmutableInstruction3rc(call.opcode, call.startRegister, 0, call.callReference()!!)
        } else ImmutableInstruction35c(call.opcode, 0, 0, 0, 0, 0, 0, call.callReference()!!)
        val badCaller = ImmutableMethod(caller.definingClass, caller.name, caller.parameters, caller.returnType,
            caller.accessFlags, caller.annotations, caller.hiddenApiRestrictions, ImmutableMethodImplementation(
                caller.implementation!!.registerCount, instructions.mapIndexed { at, instruction -> if (at == index) invalid else instruction },
                caller.implementation!!.tryBlocks, caller.implementation!!.debugItems))
        cases["wrong call register count"] = extension + classes.map { owner -> if (owner.type != caller.definingClass) owner else
            copyClass(owner, owner.methods.map { if (it.identity() == caller.identity()) badCaller else it }) }
        for ((reason, input) in cases) {
            for (patch in listOf(analyticsPreflightPatch, disableAnalyticsPatch)) {
                val context = PatchContexts.of(input)
                val before = dexSnapshot(context, input)
                assertThrows("$reason: $patch", PatchException::class.java) { patch.execute(context) }
                assertArrayEquals("$reason left retained edits", before, dexSnapshot(context, input))
            }
        }
    }

    @Test
    fun `cached erased coroutine responses still validate every generic signature in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val valid = classes.flatMap { it.methods }.first { it.telemetryPath() != null && it.returnType == "Ljava/lang/Object;" }
            val validSignature = signature(valid)
            assertTrue(build.name, validSignature.contains("Lkotlin/Unit;"))
            // A fixture can have only one erased coroutine endpoint. Clone its real contract so
            // the second method shares the cache key while declaring a different response type.
            val bad = genericMethod(valid, valid.name + "Invalid", validSignature.replace("Lkotlin/Unit;", "Ljava/lang/String;"))
            val misleading = genericMethod(valid, valid.name + "Misleading",
                "<T:Lcom/pinterest/api/adapter/coroutine/NetworkResponse<Lkotlin/Unit;>;>" + signature(bad))
            for (invalid in listOf(bad, misleading)) {
                for (order in listOf(listOf(valid, invalid), listOf(invalid, valid))) {
                    val before = dexSnapshot(context, ExtensionDex.classes() + classes)
                    val failure = assertThrows(PatchException::class.java) { context.completedResponseFactories(order) }
                    assertTrue(failure.message, failure.message.orEmpty().contains(invalid.identity()))
                    assertArrayEquals(before, dexSnapshot(context, ExtensionDex.classes() + classes))
                }
            }
            val bounded = genericMethod(valid, valid.name + "Bounded", "<T:Ljava/lang/Object;>" + validSignature)
            val completed = context.completedResponseFactories(listOf(valid, bounded))
            assertEquals(completed[valid.identity()], completed[bounded.identity()])
            val log = classes.flatMap { it.methods }.first { it.telemetryPath() == "log/" }
            val malformed = genericMethod(log, log.name + "Invalid", "()${log.returnType.removeSuffix(";")}<TT;>;")
            val logSignature = signature(log)
            val payload = logSignature.substringAfterLast("${log.returnType.removeSuffix(";")}<").substringBefore('>')
            val misleadingLog = genericMethod(log, log.name + "Misleading",
                "<T:${log.returnType.removeSuffix(";")}<$payload>;>" + logSignature.replace(payload, "TT;"))
            for (invalid in listOf(malformed, misleadingLog)) {
                for (order in listOf(listOf(log, invalid), listOf(invalid, log))) {
                    val before = dexSnapshot(context, ExtensionDex.classes() + classes)
                    val failure = assertThrows(PatchException::class.java) { context.completedResponseFactories(order) }
                    assertTrue(failure.message, failure.message.orEmpty().contains(invalid.identity()))
                    assertArrayEquals(before, dexSnapshot(context, ExtensionDex.classes() + classes))
                }
            }
        }
    }

    private fun dexSnapshot(context: BytecodePatchContext, classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.forEach { pool.internClass(context.mutableClassDefBy(it.type)) }
        val store = MemoryDataStore()
        try {
            pool.writeTo(store)
            return store.data
        } finally {
            store.close()
        }
    }

    private fun copyClass(owner: ClassDef, methods: Iterable<Method>, accessFlags: Int = owner.accessFlags) = ImmutableClassDef(owner.type, accessFlags,
        owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods)

    private fun copyMethod(method: Method, accessFlags: Int = method.accessFlags, implementation: MethodImplementation? = method.implementation) =
        ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, accessFlags,
            method.annotations, method.hiddenApiRestrictions, implementation)

    private fun signature(method: Method): String = (method.annotations.first { it.type == "Ldalvik/annotation/Signature;" }
        .elements.first { it.name == "value" }.value as ArrayEncodedValue).value.joinToString("") {
        (it as StringEncodedValue).value }

    private fun genericMethod(method: Method, name: String, signature: String): Method {
        val original = method.annotations.first { it.type == "Ldalvik/annotation/Signature;" }
        val annotation = ImmutableAnnotation(original.visibility, original.type, listOf(ImmutableAnnotationElement("value",
            ImmutableArrayEncodedValue(listOf(ImmutableStringEncodedValue(signature))))))
        return ImmutableMethod(method.definingClass, name, method.parameters, method.returnType, method.accessFlags,
            (method.annotations.filterNot { it.type == original.type } + annotation).toSet(), method.hiddenApiRestrictions, method.implementation)
    }

    private fun read(build: File): List<ClassDef> {
        val selected = linkedMapOf<String, ClassDef>()
        val wanted = mutableSetOf("Lkotlin/Unit;", "Lcom/google/firebase/messaging/FirebaseMessagingService;")
        val returns = mutableSetOf<String>()
        val serviceCalls = mutableSetOf<String>()
        var tagType = ""
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                val services = owner.methods.filter { it.telemetryPath() != null }
                if (services.isNotEmpty()) {
                    selected[owner.type] = ImmutableClassDef.of(owner)
                    for (service in services) {
                        if (service.returnType != "Ljava/lang/Object;") returns += service.returnType
                        wanted += service.returnType
                        serviceCalls += service.identity()
                        val signature = service.annotations.firstOrNull { it.type == "Ldalvik/annotation/Signature;" }
                            ?.elements?.firstOrNull { it.name == "value" }?.value as? ArrayEncodedValue
                        val text = signature?.value?.joinToString("") { (it as? StringEncodedValue)?.value.orEmpty() }.orEmpty()
                        wanted += Regex("L[^;<>()]+;").findAll(text).map { it.value }
                    }
                }
                if (owner.superclass == "Ljava/lang/Enum;" && owner.fields.any { it.name == "TAG_APPSFLYER_INIT" }) {
                    tagType = owner.type
                    selected[owner.type] = ImmutableClassDef.of(owner)
                }
                if (owner.superclass == "Lcom/pinterest/api/adapter/coroutine/NetworkResponse;" ||
                    owner.methods.any { method -> method.implementation?.instructions?.any { instruction ->
                        val call = instruction.callReference()?.identity()
                        call == URL_CALL || call in OUTGOING_LINK_CALLS
                    } == true }) selected[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        FixtureDex.forEach(build) { dex ->
            for (owner in dex.classes) {
                if (owner.type in wanted || owner.superclass in returns ||
                    (owner.fields.any { it.type == "Ljava/lang/Runnable;" } && owner.fields.any { it.type == tagType }) ||
                    owner.methods.any { method -> method.implementation?.instructions?.any {
                        it.callReference()?.identity() in serviceCalls
                    } == true }) selected[owner.type] = ImmutableClassDef.of(owner)
            }
        }
        return selected.values.toList()
    }

    private fun assertFlag(context: BytecodePatchContext, name: String) {
        val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
            .implementation!!.instructions.first()
        assertEquals(Opcode.CONST_4, first.opcode)
        assertEquals("$name coverage", 1, (first as NarrowLiteralInstruction).narrowLiteral)
    }

    private companion object {
        const val URL_CALL = "Ljava/net/URL;->openConnection()Ljava/net/URLConnection;"
    }
}
