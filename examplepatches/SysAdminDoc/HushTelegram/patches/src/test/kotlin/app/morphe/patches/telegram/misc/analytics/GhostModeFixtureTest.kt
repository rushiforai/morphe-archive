/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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

private val GHOST_MODE_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * The classes Ghost mode's gate needs from [build]: its ConnectionsManager. A test that runs Disable
 * analytics over a build's classes and expects nothing to warn about adds these, or the patch says it
 * goes on without Ghost mode.
 */
internal fun ghostModeHosts(build: File): List<ClassDef> = GHOST_MODE_HOST_CACHE.getOrPut(build.path) {
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
        val named = ExtensionDex.classes().single { it.type == GHOST_MODE }.methods.flatMap { it.instructions() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .filter { it.startsWith("org.telegram.tgnet.") }
            .map { "L" + it.replace('.', '/') + ";" }.toSet()
        assertEquals("the extension's request names", 12, named.size)
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
                request.fields.filter { it.name == "offline" }.map { "${it.name}:${it.type}" })
            assertTrue("${build.name}: public", AccessFlags.PUBLIC.isSet(request.fields.single { it.name == "offline" }.accessFlags))
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
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + metricsClass + ghostModeHosts(build))
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            // This slice leaves the Premium reports out, so those say so; Ghost mode doesn't.
            assertTrue(warnings.toString(), warnings.none { "Ghost mode" in it })
            assertGhostGate(build.name, send(ghostModeHosts(build)), send(context))
            assertFlag(context, "ghostMode", true)
            assertFlag(context, "disableAnalytics", true)
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
                    if (it.name == SEND_REQUEST_INTERNAL) copy(it, accessFlags = it.accessFlags or AccessFlags.STATIC.value) else it
                }))
                "Lfixture/Bypass;->sendRaw sends requests past the gate" -> listOf(manager, bypass)
                else -> listOf(manager)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            change(context)
            val before = context.mutableClassDefBy(CONNECTIONS_MANAGER).methods.map { it.operations() }
            assertEquals(why, why, context.resolveSendRequestGate(GHOST_MODE_DROP).missing)
            assertEquals("$why: nothing edited", before, context.mutableClassDefBy(CONNECTIONS_MANAGER).methods.map { it.operations() })
        }
        assertEquals("ConnectionsManager is missing",
            PatchContexts.of(ExtensionDex.classes()).resolveSendRequestGate(GHOST_MODE_DROP).missing)
    }

    @Test
    fun `no Ghost mode runtime or status stub refuses before the send is touched`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = send(ghostModeHosts(build))
            val withoutRuntime = PatchContexts.of(ExtensionDex.classes().filter { it.type != GHOST_MODE } + ghostModeHosts(build))
            val runtime = refusal(withoutRuntime)
            assertTrue(runtime, runtime.contains("GhostMode") && runtime.contains("before editing"))
            assertEquals(stock.operations(), send(withoutRuntime).operations())
            assertFlag(withoutRuntime, "ghostMode", false)
            assertFlag(withoutRuntime, "disableAnalytics", false)

            val withoutStub = PatchContexts.of(ExtensionDex.classes() + ghostModeHosts(build))
            withoutStub.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "ghostMode" }
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
        val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
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
        classes.single { it.type == CONNECTIONS_MANAGER }.methods.single { it.name == SEND_REQUEST_INTERNAL }
    private fun send(context: BytecodePatchContext): MutableMethod =
        context.mutableClassDefBy(CONNECTIONS_MANAGER).methods.single { it.name == SEND_REQUEST_INTERNAL }
    private fun copy(method: Method, parameters: List<com.android.tools.smali.dexlib2.iface.MethodParameter> = method.parameters,
                     accessFlags: Int = method.accessFlags) = ImmutableMethod(method.definingClass, method.name, parameters,
        method.returnType, accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation)
    private fun withMethods(owner: ClassDef, methods: Iterable<Method>) = ImmutableClassDef(owner.type, owner.accessFlags,
        owner.superclass, owner.interfaces, owner.sourceFile, owner.annotations, owner.fields, methods)
    private fun Method.calls(reference: String) = instructions().any { it.reference() == reference }
    private fun Method.operations() = instructions().filter { it.opcode != Opcode.NOP }.map(::operation)
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.reference(), instruction.namedRegisters(),
        (instruction as? WideLiteralInstruction)?.wideLiteral)

    internal companion object {
        /**
         * [patched] opens with the gate: the request and its callback (p1, p2) go to the extension, a false answer
         * falls to the stock first instruction and a true one returns. Below it the stock body is
         * whole, nothing branches back into the gate, and no register was added.
         */
        fun assertGhostGate(where: String, original: Method, patched: Method) {
            val before = original.implementation!!.instructions.toList()
            val after = patched.implementation!!.instructions.toList()
            val call = after[0]
            assertEquals("$where: asks first", Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals("$where: asks Ghost mode", GHOST_MODE_DROP, (call as ReferenceInstruction).reference.toString())
            val p1 = patched.implementation!!.registerCount - patched.numberOfParameterRegisters + 1
            assertEquals("$where: hands it the request and its callback", listOf(p1, 2),
                listOf((call as RegisterRangeInstruction).startRegister, call.registerCount))
            assertEquals("$where: the gate", listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), after.subList(1, 4).map { it.opcode })
            assertEquals("$where: answer and test share v0", listOf(listOf(0), listOf(0)), after.subList(1, 3).map { it.namedRegisters() })
            val flow = ControlFlow.of(patched)
            assertEquals("$where: false sends, true returns", setOf(3, SEND_REQUEST_GATE_SIZE), flow.normal[2].toSet())
            for (index in SEND_REQUEST_GATE_SIZE until after.size) {
                assertTrue("$where: $index branches into the gate",
                    (flow.normal[index] + flow.exceptional[index]).none { it < SEND_REQUEST_GATE_SIZE })
            }
            fun stock(list: List<Instruction>) = list.filter { it.opcode != Opcode.NOP }.map { instruction ->
                listOf(instruction.opcode, (instruction as? ReferenceInstruction)?.reference?.toString(), instruction.namedRegisters())
            }
            assertEquals("$where: the stock send is whole", stock(before), stock(after.drop(SEND_REQUEST_GATE_SIZE)))
            assertEquals("$where: no register added", original.implementation!!.registerCount, patched.implementation!!.registerCount)
        }
    }
}
