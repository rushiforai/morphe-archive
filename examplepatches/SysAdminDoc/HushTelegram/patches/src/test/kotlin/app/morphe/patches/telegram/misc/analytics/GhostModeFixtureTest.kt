/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.hostsOf
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.NATIVE_SEND_REQUEST
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_GATE_SIZE
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_INTERNAL
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.resolveSendRequestGate
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private val GHOST_MODE_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * The classes Ghost mode's gate needs from [build]: its ConnectionsManager. A test that runs Disable
 * analytics over a build's classes and expects nothing to warn about adds these, or the patch says it
 * goes on without Ghost mode.
 */
internal fun ghostModeHosts(build: File): List<ClassDef> = GHOST_MODE_HOST_CACHE.hostsOf(build.path) {
    FixtureDex.classes(build, setOf(CONNECTIONS_MANAGER)).values.toList()
}

/**
 * Ghost mode on each declared build: every request leaves through ConnectionsManager's one private
 * send, nothing else in the app calls the native send, and the gate at its top asks the extension
 * with the request and returns before anything is written out. A build that has moved any of that
 * keeps the rest of Disable analytics and leaves the send alone.
 */
class GhostModeFixtureTest {
    @Test
    fun `every request Ghost mode keeps back is a class each declared build still has under that name`() {
        val named = ExtensionDex.classes().single { it.origType == GHOST_MODE }.methods.flatMap { it.instructions() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .filter { it.startsWith("org.telegram.tgnet.") }
            .map { "L" + it.replace('.', '/') + ";" }.toSet()
        assertEquals("the extension's request names", 20, named.size)
        for (build in Fixtures.declaredBuilds()) {
            assertEquals("${build.name}: every named request", named, FixtureDex.classes(build, named).keys)
        }
    }

    @Test
    fun `each declared build builds the online status request with a boolean offline field`() {
        val status = "Lorg/telegram/tgnet/tl/TL_account\$updateStatus;"
        for (build in Fixtures.declaredBuilds()) {
            val request = FixtureDex.classes(build, setOf(status)).getValue(status)
            assertEquals("${build.name}: offline", listOf("offline:Z"),
                request.fields.filter { it.origName == "offline" }.map { "${it.name}:${it.type}" })
            assertTrue("${build.name}: public", AccessFlags.PUBLIC.isSet(request.fields.single { it.origName == "offline" }.accessFlags))
            assertTrue("${build.name}: built with no arguments", request.methods.any {
                it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
            })
            // Ghost mode turns a view count request's increment off in place.
            val views = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getMessagesViews;"
            val increment = FixtureDex.classes(build, setOf(views)).getValue(views).fields.filter { it.origName == "increment" }
            assertEquals("${build.name}: increment", listOf("increment:Z"), increment.map { "${it.name}:${it.type}" })
            assertTrue("${build.name}: increment public", AccessFlags.PUBLIC.isSet(increment.single().accessFlags))
            // The typing requests are TLRPC classes under the names the extension holds back.
            assertEquals(setOf("Lorg/telegram/tgnet/TLRPC\$TL_messages_setTyping;", "Lorg/telegram/tgnet/TLRPC\$TL_messages_setEncryptedTyping;"),
                FixtureDex.classes(build, setOf("Lorg/telegram/tgnet/TLRPC\$TL_messages_setTyping;",
                    "Lorg/telegram/tgnet/TLRPC\$TL_messages_setEncryptedTyping;")).keys)
        }
    }

    @Test
    fun `each declared build sends every request through the one gated method`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val senders = FixtureDex.classesWhere(build, { true }) { method -> method.calls(NATIVE_SEND_REQUEST) }
                .flatMap { owner -> owner.methods.filter { it.calls(NATIVE_SEND_REQUEST) } }
                .map { "${it.definingClass}->${it.name}" }
            assertEquals("$where: what calls the native send", listOf("$CONNECTIONS_MANAGER->$SEND_REQUEST_INTERNAL"), senders)

            val original = send(ghostModeHosts(build))
            val context = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
            val gate = context.resolveSendRequestGate(GHOST_MODE_DROP)
            assertNull("$where: ${gate.missing}", gate.missing)
            assertEquals("$where: resolving alone edits nothing", original.operations(), send(context).operations())
            gate.apply(GHOST_MODE_DROP)
            assertGhostGate(where, original, send(context))
        }
    }

    @Test
    fun `the whole patch gates the send and claims Ghost mode`() {
        for (build in Fixtures.declaredBuilds()) {
            val metricsClass = FixtureDex.classesWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.origString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + metricsClass + ghostModeHosts(build) + readsMenuHosts(build))
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            // This slice leaves the Premium reports out, so those say so; Ghost mode doesn't.
            assertTrue(warnings.toString(), warnings.none { "Ghost mode" in it })
            assertGates(build.name, send(ghostModeHosts(build)), send(context), ACCOUNT_GUARD_DROP, GHOST_MODE_DROP)
            assertFlag(context, "receiveOnly", true)
            assertFlag(context, "powerOff", true)
            assertFlag(context, "ghostMode", true)
            assertFlag(context, "disableAnalytics", true)
            // A read Ghost mode held goes out later through Telegram's own send, with its callback (#69).
            val held = context.tgMutableClassDefBy(GHOST_MODE).methods.single { it.origName == "sendRequest" }.instructions()
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.origString() }
            assertEquals(build.name, listOf("$CONNECTIONS_MANAGER->getInstance(I)$CONNECTIONS_MANAGER",
                "$CONNECTIONS_MANAGER->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;I)I"), held)
            // And one chat's held read goes from that chat's menu at the top: one call where the menu is built, one where it's chosen.
            val calls = readsMenuHosts(build).flatMap { context.tgMutableClassDefBy(it.type).methods }.flatMap { it.instructions() }
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.origString() }
            assertEquals(build.name, listOf(1, 1), listOf("headerMenu(Ljava/lang/Object;)V", "headerClick(Ljava/lang/Object;I)Z")
                .map { hook -> calls.count { it == "$READS_MENU->$hook" } })
        }
    }

    @Test
    fun `a build whose send has moved keeps it stock and says why`() {
        val build = Fixtures.declaredBuilds().first()
        val manager = ghostModeHosts(build).single()
        val stock = send(listOf(manager))
        val bypass = bypassClass()
        val cases = mapOf<String, (BytecodePatchContext) -> Unit>(
            "ConnectionsManager has 2 request sends, not one" to {},
            "ConnectionsManager's request send changed shape" to {},
            "Lfixture/Bypass;->sendRaw sends requests past the gate" to {},
            "something jumps back to the start of ConnectionsManager's request send" to { context ->
                val method = send(context)
                method.addInstructionsWithLabels(1, "if-eqz p1, :hush_top", ExternalLabel("hush_top", method.getInstruction(0)))
            },
            "ConnectionsManager's request send no longer writes the request out and sends it" to { context ->
                val method = send(context)
                method.replaceInstruction(method.instructions().indexOfFirst { it.reference() == NATIVE_SEND_REQUEST }, "nop")
            },
        )
        for ((why, change) in cases) {
            val classes = when (why) {
                "ConnectionsManager has 2 request sends, not one" -> listOf(withMethods(manager, manager.methods +
                    copy(stock, parameters = stock.parameters.drop(1))))
                "ConnectionsManager's request send changed shape" -> listOf(withMethods(manager, manager.methods.map {
                    if (it.origName == SEND_REQUEST_INTERNAL) copy(it, accessFlags = it.accessFlags or AccessFlags.STATIC.value) else it
                }))
                "Lfixture/Bypass;->sendRaw sends requests past the gate" -> listOf(manager, bypass)
                else -> listOf(manager)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            change(context)
            val before = context.tgMutableClassDefBy(CONNECTIONS_MANAGER).methods.map { it.operations() }
            assertEquals(why, why, context.resolveSendRequestGate(GHOST_MODE_DROP).missing)
            assertEquals("$why: nothing edited", before, context.tgMutableClassDefBy(CONNECTIONS_MANAGER).methods.map { it.operations() })
        }
        assertEquals("ConnectionsManager is missing",
            PatchContexts.of(ExtensionDex.classes()).resolveSendRequestGate(GHOST_MODE_DROP).missing)
    }

    @Test
    fun `no Ghost mode runtime or status stub refuses before the send is touched`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = send(ghostModeHosts(build))
            val withoutRuntime = PatchContexts.of(ExtensionDex.classes().filter { it.origType != GHOST_MODE } + ghostModeHosts(build))
            val runtime = refusal(withoutRuntime)
            assertTrue(runtime, runtime.contains("GhostMode") && runtime.contains("before editing"))
            assertEquals(stock.operations(), send(withoutRuntime).operations())
            assertFlag(withoutRuntime, "ghostMode", false)
            assertFlag(withoutRuntime, "disableAnalytics", false)

            val withoutStub = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
            withoutStub.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "ghostMode" }
            val stub = refusal(withoutStub)
            assertTrue(stub, stub.contains("no boolean method ghostMode()"))
            assertEquals(stock.operations(), send(withoutStub).operations())
        }
    }

    private fun refusal(context: BytecodePatchContext): String = try {
        disableAnalyticsPatch.execute(context)
        fail("accepted")
        ""
    } catch (expected: PatchException) {
        expected.message.orEmpty()
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, expected: Boolean) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals(name, if (expected) 1 else 0, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun bypassClass(): ClassDef {
        val type = "Lfixture/Bypass;"
        val method = MutableMethod(ImmutableMethod(type, "sendRaw", emptyList(), "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(9, emptyList(), null, null)))
            .apply { addInstructionsWithLabels(0, "invoke-static/range {v0 .. v8}, $NATIVE_SEND_REQUEST\nreturn-void") }
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))
    }

    private fun send(classes: List<ClassDef>): Method =
        classes.single { it.origType == CONNECTIONS_MANAGER }.methods.single { it.origName == SEND_REQUEST_INTERNAL }
    private fun send(context: BytecodePatchContext): MutableMethod =
        context.tgMutableClassDefBy(CONNECTIONS_MANAGER).methods.single { it.origName == SEND_REQUEST_INTERNAL }
    private fun copy(method: Method, parameters: List<com.android.tools.smali.dexlib2.iface.MethodParameter> = method.parameters,
                     accessFlags: Int = method.accessFlags) = ImmutableMethod(method.definingClass, method.name, parameters,
        method.returnType, accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation)
    private fun withMethods(owner: ClassDef, methods: Iterable<Method>) = ImmutableClassDef(owner.type, owner.accessFlags,
        owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods)
    private fun Method.calls(reference: String) = instructions().any { it.reference() == reference }
    private fun Method.operations() = instructions().filter { it.opcode != Opcode.NOP }.map(::operation)
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = origRef()
    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.reference(), instruction.namedRegisters(),
        (instruction as? WideLiteralInstruction)?.wideLiteral)

    internal companion object {
        /**
         * [patched] opens with the gate: the request and its callback (p1, p2) go to the extension, a false answer
         * falls to the stock first instruction and a true one returns. Below it the stock body is
         * whole, nothing branches back into the gate, and no register was added.
         */
        fun assertGhostGate(where: String, original: Method, patched: Method) = assertGates(where, original, patched, GHOST_MODE_DROP)

        /** The gates for [hooks] in the order they ask: each hands over what its shape takes, and a false answer falls to the next. */
        fun assertGates(where: String, original: Method, patched: Method, vararg hooks: String) {
            val before = original.implementation!!.instructions.toList()
            val after = patched.implementation!!.instructions.toList()
            val size = hooks.size * SEND_REQUEST_GATE_SIZE
            val p0 = patched.implementation!!.registerCount - patched.numberOfParameterRegisters
            val flow = ControlFlow.of(patched)
            hooks.forEachIndexed { number, hook ->
                val at = number * SEND_REQUEST_GATE_SIZE
                val call = after[at]
                assertEquals("$where: gate $number asks first", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                assertEquals("$where: asks $hook", hook, (call as ReferenceInstruction).reference.origString())
                val three = hook.contains("Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;")
                assertEquals("$where: hands it what it takes", listOf(if (three) p0 else p0 + 1, if (three) 3 else 2),
                    listOf((call as RegisterRangeInstruction).startRegister, call.registerCount))
                assertEquals("$where: the gate", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                    after.subList(at + 1, at + 4).map { it.opcode })
                assertEquals("$where: answer and test share v0", listOf(listOf(0), listOf(0)), after.subList(at + 1, at + 3).map { it.namedRegisters() })
                assertEquals("$where: false goes on, true returns", setOf(at + 3, at + SEND_REQUEST_GATE_SIZE), flow.normal[at + 2].toSet())
            }
            for (index in size until after.size) {
                assertTrue("$where: $index branches into the gates",
                    (flow.normal[index] + flow.exceptional[index]).none { it < size })
            }
            fun stock(list: List<Instruction>) = list.filter { it.opcode != Opcode.NOP }.map { instruction ->
                listOf(instruction.opcode, instruction.origRef(), instruction.namedRegisters())
            }
            assertEquals("$where: the stock send is whole", stock(before), stock(after.drop(size)))
            assertEquals("$where: no register added", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        }
    }
}
