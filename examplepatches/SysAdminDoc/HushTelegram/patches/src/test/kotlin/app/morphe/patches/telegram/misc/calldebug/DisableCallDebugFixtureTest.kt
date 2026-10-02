/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.calldebug

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** Only the kept call-debug owner enters the context. Audio/service methods aren't mutation targets. */
class DisableCallDebugFixtureTest {
    @Test
    fun `each declared build covers both RPCs and the deferred file upload while preserving cleanup`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val context = PatchContexts.of(ExtensionDex.classes() + owner)
            val hooks = context.resolveCallDebugHooks()
            assertEquals("${build.name}: complete call diagnostic coverage", CallDebugTarget.entries.toSet(), hooks.keys)
            val before = hooks.mapValues { ImmutableMethod.of(it.value.method) }
            val unchanged = owner.methods.filter { method -> hooks.values.none { it.method.sameSignature(method) } }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableCallDebugPatch.execute(context) })

            for ((target, hook) in hooks) {
                val original = before.getValue(target)
                val old = original.instructions()
                val after = hook.method.instructions()
                val invoke = if (target == CallDebugTarget.DEBUG) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                assertEquals("${build.name}: $target exact guard", listOf(invoke, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                    after.subList(hook.index, hook.index + 3).map { it.opcode })
                assertEquals("${build.name}: $target guard method", "$CALL_DEBUG->${HOOKS.getValue(target)}", after[hook.index].reference())
                assertEquals("${build.name}: $target keeps every original operation", old.map(::operation),
                    (after.take(hook.index) + after.drop(hook.index + 3)).map(::operation))
                val oldFlow = ControlFlow.of(original)
                val newFlow = ControlFlow.of(hook.method)
                fun moved(index: Int) = index + if (index >= hook.index) 3 else 0
                for (index in old.indices) {
                    assertEquals("${build.name}: $target keeps stock flow from $index",
                        oldFlow.normal[index].map { if (it == hook.index) hook.index else moved(it) }, newFlow.normal[moved(index)])
                }
                assertTrue("${build.name}: $target true reaches the original return", moved(hook.finish) in newFlow.normal[hook.index + 2])
                assertEquals(Opcode.RETURN_VOID, after[moved(hook.finish)].opcode)
                assertTrue("${build.name}: $target false reaches the original operation", hook.index + 3 in newFlow.normal[hook.index + 2])
                val guardedOperation = if (target == CallDebugTarget.FILE) hook.index + 3 else after.indexOfFirst { it.call()?.let { call ->
                    call.definingClass == "Lorg/telegram/tgnet/ConnectionsManager;" && call.name == "sendRequest"
                } == true }
                assertFalse("${build.name}: $target has no way to upload without reaching its guard",
                    guardedOperation in reachable(newFlow, 0, hook.index))
            }

            val debug = hooks.getValue(CallDebugTarget.DEBUG)
            val debugBody = debug.method.instructions()
            val debugFlow = ControlFlow.of(debug.method)
            val pendingRemove = debugBody.indexOfFirst { it.call()?.let { call ->
                call.definingClass == "Ljava/util/HashMap;" && call.name == "remove"
            } == true }
            assertTrue("${build.name}: pending data is removed before any diagnostic guard", pendingRemove in 0 until debug.index)
            assertFalse("${build.name}: cleanup dominates the guard", debug.index in reachable(debugFlow, 0, pendingRemove))
            val requestedBranch = debugBody.indices.single { debugBody[it].opcode == Opcode.IF_NEZ &&
                debugBody[it].namedRegisters() == listOf(debug.method.parameterRegisterNumber(1)) }
            assertEquals("${build.name}: need_debug true reaches the guard", debug.index,
                debugFlow.normal[requestedBranch].single { it != requestedBranch + 1 })
            assertEquals("${build.name}: need_debug false returns without reaching the guard", Opcode.RETURN_VOID,
                debugBody[debugFlow.normal[requestedBranch + 1].single()].opcode)
            val noDataBranch = pendingRemove + 3
            assertEquals(Opcode.IF_EQZ, debugBody[noDataBranch].opcode)
            assertEquals("${build.name}: absent pending data returns without counting", Opcode.RETURN_VOID,
                debugBody[debugFlow.normal[noDataBranch].single { it != noDataBranch + 1 }].opcode)

            val log = hooks.getValue(CallDebugTarget.LOG)
            val logBody = log.method.instructions()
            val logFlow = ControlFlow.of(log.method)
            val fileBranch = log.index - 2
            assertEquals(Opcode.IF_NEZ, logBody[fileBranch].opcode)
            assertEquals("${build.name}: null uploaded file returns before its guard", Opcode.RETURN_VOID, logBody[fileBranch + 1].opcode)
            assertTrue("${build.name}: nonnull file enters its guard", log.index in logFlow.normal[fileBranch])

            for (method in unchanged) {
                val after = context.mutableClassDefBy(VOIP_DEBUG).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: retains call state/preparation method $method", method.instructions().map(::operation), after.instructions().map(::operation))
            }
            val rpcs = FixtureDex.methodsWhere(build, { true }) { method ->
                method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() in setOf(SAVE_CALL_DEBUG, SAVE_CALL_LOG) }
            }
            assertEquals("${build.name}: every automatic call diagnostic RPC is covered", 2, rpcs.size)
            assertTrue("${build.name}: no other call diagnostic RPC owner", rpcs.all { it.definingClass == VOIP_DEBUG })
            for (flag in listOf("disableCallDebug") + CallDebugTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: $flag build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
        }
    }

    @Test
    fun `wrong response empty log path and compression failure keep their exits without upload guards`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            val response = owner.methods.single { method -> method.instructions().any {
                it.opcode == Opcode.INSTANCE_OF && it.reference() == "Lorg/telegram/tgnet/TLRPC\$TL_boolFalse;"
            } }
            val responseBody = response.instructions()
            val responseFlow = ControlFlow.of(response)
            val typeCheck = responseBody.indexOfFirst { it.opcode == Opcode.INSTANCE_OF }
            val wrongResponse = responseFlow.normal[typeCheck + 1].single { it != typeCheck + 2 }
            assertEquals("${build.name}: non-request response returns", Opcode.RETURN_VOID, responseBody[wrongResponse].opcode)
            val emptyCheck = responseBody.indexOfFirst { it.call()?.name == "isEmpty" }
            assertEquals("${build.name}: empty path returns", wrongResponse,
                responseFlow.normal[emptyCheck + 2].single { it != emptyCheck + 3 })
            val compression = owner.methods.single { method -> method.instructions().any { it.call()?.name == "gzip" } }
            val body = compression.instructions()
            val gzip = body.indexOfFirst { it.call()?.name == "gzip" }
            assertEquals("${build.name}: failed compression returns", Opcode.RETURN_VOID, body[gzip + 3].opcode)
            assertTrue("${build.name}: failure exit is the false compression branch", gzip + 3 in ControlFlow.of(compression).normal[gzip + 2])
            assertFalse(responseBody.any { it.reference()?.startsWith("$CALL_DEBUG->") == true })
            assertFalse(body.any { it.reference()?.startsWith("$CALL_DEBUG->") == true })
        }
    }

    @Test
    fun `changed diagnostic geometry refuses every target before any partial mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val owner = FixtureDex.classes(build, setOf(VOIP_DEBUG)).getValue(VOIP_DEBUG)
            for (changed in CallDebugTarget.entries) {
                val context = PatchContexts.of(ExtensionDex.classes() + owner)
                val hooks = context.resolveCallDebugHooks()
                val invalid = hooks.getValue(changed)
                invalid.method.replaceInstruction(if (changed == CallDebugTarget.FILE) invalid.finish else invalid.index - 2, "nop")
                val before = hooks.mapValues { it.value.method.instructions().map(::operation) }
                try {
                    disableCallDebugPatch.execute(context)
                    fail("${build.name}: changed $changed geometry was accepted")
                } catch (expected: PatchException) {
                    assertTrue(expected.message.orEmpty().contains("before editing"))
                }
                for ((target, hook) in hooks) assertEquals("${build.name}: $changed doesn't partly mutate $target",
                    before.getValue(target), hook.method.instructions().map(::operation))
                for (flag in listOf("disableCallDebug") + CallDebugTarget.entries.map { it.capability }) {
                    val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                    assertEquals("${build.name}: rejected geometry leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                }
            }
        }
    }

    private fun reachable(flow: ControlFlow, from: Int, blocked: Int): Set<Int> {
        val found = mutableSetOf<Int>()
        val pending = ArrayDeque<Int>()
        pending.add(from)
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (index == blocked || !found.add(index)) continue
            pending.addAll(flow.normal[index])
        }
        return found
    }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
    private companion object {
        val HOOKS = mapOf(
            CallDebugTarget.DEBUG to "skipCallDebugUpload(Z)Z",
            CallDebugTarget.FILE to "skipCallLogFileUpload()Z",
            CallDebugTarget.LOG to "skipCallLogUpload()Z",
        )
    }
}
