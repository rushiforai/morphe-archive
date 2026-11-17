/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Keep self-destructing secret chat messages (#82): the self-destruct timer's two lists, handed over. */
class KeepSecretTimedFixtureTest {
    private fun shape(i: Instruction) = listOf(i.opcode, i.namedRegisters(), i.controlRef())

    @Test fun `each chat's due list goes over right after it's read, and the timer is otherwise unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveKeepSecretTimed()
            assertEquals("$name: ${plan.missing}", null, plan.missing)
            val run = plan.method!!
            val before = run.controlBody()
            // Read independently of the patch: where the deleting is, and each list it reads.
            val delete = before.indexOfFirst { it.controlRef() == TIMED_DELETE }
            assertTrue("$name: the timer deletes", delete > 0)
            val casts = before.indices.filter { before[it].opcode == Opcode.CHECK_CAST && before[it].controlRef() == "Ljava/util/ArrayList;" &&
                (before[it - 2].let { call -> call is ReferenceInstruction && (call.reference as? MethodReference)?.returnType == "Ljava/lang/Object;" }) }
            assertEquals("$name: two lists, the deleting's and the emptying's", 2, casts.size)
            assertTrue("$name: the deleting sits between them", casts[0] < delete && delete < casts[1])

            context.applyKeepSecretTimed(plan)

            val after = run.controlBody()
            val hooks = after.indices.filter { after[it].controlRef() == SECRET_TIMED_TASK }
            assertEquals("$name: one question per list", 2, hooks.size)
            val added = mutableSetOf<Int>()
            for (at in hooks) {
                val ask = after[at] as FiveRegisterInstruction
                assertEquals(name, Opcode.INVOKE_STATIC, after[at].opcode)
                assertEquals(name, 3, ask.registerCount)
                assertEquals("$name: the answer goes back into the list", Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
                assertEquals(name, ask.registerC, (after[at + 1] as OneRegisterInstruction).registerA)
                added += listOf(at, at + 1)
                // The list it asks with was cast right there, and its chat ID read right there too.
                val read = (at - 5 until at).map { after[it] }
                val cast = read.single { it.opcode == Opcode.CHECK_CAST }
                assertEquals(name, ask.registerC, (cast as OneRegisterInstruction).registerA)
                val chat = read.single { it.opcode == Opcode.MOVE_RESULT_WIDE }
                assertEquals("$name: the chat ID", ask.registerD, (chat as OneRegisterInstruction).registerA)
                assertEquals(name, ask.registerD + 1, ask.registerE)
                // Both read from the same sparse array at the same index.
                val calls = read.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { (it as FiveRegisterInstruction).let { c -> c.registerC to c.registerD } }
                assertEquals(name, 2, calls.size)
                assertEquals("$name: the same array and index", calls[0], calls[1])
            }
            val deleteAfter = after.indexOfFirst { it.controlRef() == TIMED_DELETE }
            assertTrue("$name: the deleting's list is asked first", hooks[0] < deleteAfter && deleteAfter < hooks[1])
            assertEquals("$name: the timer's own code stays", before.map(::shape), after.indices.filter { it !in added }.map { shape(after[it]) })

            val stub = context.tgMutableClassDefBy(KEEP_SECRET_TIMED).methods.single { it.origName == "secretDialog" }
            assertEquals(name, listOf(TIMED_IS_ENCRYPTED), stub.controlBody().mapNotNull { it.controlRef() })
        }
    }

    @Test fun `a moved timer leaves the switch out before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val known = context(build).resolveKeepSecretTimed()
            assertNotNull(build.name, known.method)
            val changes = linkedMapOf<String, (BytecodePatchContext) -> Unit>(
                "no timer runnable" to { context ->
                    context.tgMutableClassDefBy(known.method!!.definingClass).methods.removeAll { it.name == "run" }
                },
                "no checkDeletingTask" to { context ->
                    context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.origName == "checkDeletingTask" }
                },
                "no chat kind" to { context ->
                    context.tgMutableClassDefBy(TIMED_DIALOG_OBJECT).methods.removeAll { it.origName == "isEncryptedDialog" }
                },
            )
            for ((change, mutate) in changes) {
                val context = context(build)
                mutate(context)
                val plan = context.resolveKeepSecretTimed()
                assertNotNull("${build.name}: $change", plan.missing)
                assertEquals("${build.name}: $change", null, plan.method)
                val hooked = listOf(MESSAGES_CONTROLLER, known.method!!.definingClass).flatMap { type ->
                    context.tgMutableClassDefBy(type).methods.filter { m -> m.controlBody().any { it.controlRef()?.startsWith(KEEP_SECRET_TIMED) == true } }
                }
                assertEquals("${build.name}: $change hooks nothing", emptyList<Any>(), hooked)
            }
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val types = setOf(MESSAGES_CONTROLLER, TIMED_DIALOG_OBJECT)
        val telegram = FixtureDex.classes(build, types)
        assertEquals("${build.name}: every class the switch reads", types, telegram.keys)
        val controller = telegram.getValue(MESSAGES_CONTROLLER)
        val made = controller.methods.filter { it.origName == "checkDeletingTask" }
            .flatMap { it.implementation?.instructions?.toList() ?: emptyList() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .mapNotNull { ((it as ReferenceInstruction).reference as? TypeReference)?.type }.toSet() - controller.type
        val runnables = FixtureDex.classes(build, made).values.map(ImmutableClassDef::of)
        assertTrue("${build.name}: what checkDeletingTask builds", runnables.isNotEmpty())
        return PatchContexts.of(ExtensionDex.classes() + telegram.values + runnables)
    }
}
