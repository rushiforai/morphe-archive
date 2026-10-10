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
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.time.EDITED_MESSAGE
import app.morphe.patches.telegram.misc.time.FAST_DATE_FORMAT
import app.morphe.patches.telegram.misc.time.MESSAGE_TIME_SHOWN
import app.morphe.patches.telegram.misc.time.messageSecondsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

private const val OBJECT = "Ljava/lang/Object;"
private const val MESSAGES_STORAGE = "Lorg/telegram/messenger/MessagesStorage;"

/** The update loop, the push deletion, the bubble's time measuring and the runtime. */
class KeepDeletedFixtureTest {
    private fun shape(i: Instruction): List<Any?> {
        val opcode = if (i.opcode == Opcode.GOTO_16 || i.opcode == Opcode.GOTO_32) Opcode.GOTO else i.opcode
        return listOf(opcode, i.namedRegisters(), i.controlRef())
    }

    /** [after] with the [size] instructions at each of [starts] taken out. */
    private fun without(after: List<Instruction>, starts: List<Int>, size: Int): List<List<Any?>> =
        after.indices.filter { i -> starts.none { i >= it && i < it + size } }.map { shape(after[it]) }

    @Test fun `each deletion is asked about first and the stock code follows unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            // The label rides the time hook of Message times with seconds, which patches first.
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageSecondsPatch.execute(context) })
            val plan = context.resolveKeepDeleted()
            assertEquals("$name: the cleanup's sparse array is the one the update loop fills", sparseType(build),
                context.requireNotificationCleanup(plan.updates))

            val updatesBefore = plan.updates.controlBody().map(::shape)
            val pushBefore = plan.push.controlBody().map(::shape)
            val measureBefore = plan.measure.controlBody().map(::shape)
            assertEquals("$name: two collections of deleted IDs", 2, plan.branches.size)
            assertEquals("$name: the user branch comes first", listOf("userUpdate", "channelUpdate"), plan.branches.sortedBy { it.insertAt }.map { it.hook })
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { keepDeletedPatch.execute(context) })

            // The update loop: the same eight instructions in front of each branch's work.
            val updates = plan.updates.controlBody()
            val group = listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT,
                Opcode.IF_EQZ, Opcode.MOVE_OBJECT_FROM16, Opcode.GOTO_32, Opcode.NOP)
            assertEquals("$name: eight instructions per branch", updatesBefore.size + 16, updates.size)
            val starts = mutableListOf<Int>()
            for (branch in plan.branches) {
                val call = updates.indices.single { updates[it].controlRef() == "$KEEP_DELETED->${branch.hook}(Ljava/lang/Object;Ljava/lang/Object;)Z" }
                val start = call - 2
                starts += start
                assertEquals("$name: ${branch.hook} instructions", group, (start until start + 8).map { updates[it].opcode })
                assertEquals(listOf(branch.scratch, branch.update), updates[start].namedRegisters())
                assertEquals("the controller is this, in the register after", listOf(branch.scratch + 1, plan.updates.localRegisterCount()), updates[start + 1].namedRegisters())
                assertEquals(listOf(branch.scratch, branch.scratch + 1), updates[call].namedRegisters())
                assertEquals(listOf(branch.scratch), updates[start + 3].namedRegisters())
                assertEquals(listOf(branch.source, branch.dest), updates[start + 5].namedRegisters())
                val flow = ControlFlow.of(plan.updates)
                assertEquals("$name: ${branch.hook} no answer runs the stock code", listOf(start + 5, start + 7), flow.normal[start + 4].sorted())
                val carryOn = flow.normal[start + 6].single()
                assertEquals("$name: ${branch.hook} an answer carries on with the loop's own trailing moves",
                    updatesBefore[branch.tailStart], shape(updates[carryOn]))
            }
            assertEquals("$name: the loop's own code is unchanged", updatesBefore, without(updates, starts, 8))

            // The push deletion answers first and returns when the extension took it over.
            val push = plan.push.controlBody()
            assertEquals("$name: five instructions", pushBefore.size + 5, push.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP), push.take(5).map { it.opcode })
            assertEquals("$KEEP_DELETED->push(Ljava/lang/Object;JLjava/util/ArrayList;J)Z", push[0].controlRef())
            val first = plan.push.localRegisterCount()
            assertEquals("$name: this and the three parameters, in a range", (first..first + 5).toList(), push[0].namedRegisters())
            assertEquals(listOf(plan.pushResult), push[1].namedRegisters())
            assertEquals("$name: no answer runs the stock deletion", listOf(3, 4), ControlFlow.of(plan.push).normal[2].sorted())
            assertEquals("$name: the push deletion is unchanged", pushBefore, without(push, listOf(0), 5))

            // The bubble's time measuring is told the message first, and still formats through the time hook.
            val measure = plan.measure.controlBody()
            assertEquals("$name: one instruction", measureBefore.size + 1, measure.size)
            assertEquals("$KEEP_DELETED->measuring(Ljava/lang/Object;)V", measure[0].controlRef())
            assertEquals(listOf(plan.measuredMessage), measure[0].namedRegisters())
            assertEquals("$name: the time measuring is unchanged", measureBefore, without(measure, listOf(0), 1))
            assertTrue("$name: its times still go through the extension", measure.any { it.controlRef() == MESSAGE_TIME_SHOWN })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepDeleted" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed notification cleanup or sparse array refuses before any edit`() {
        val changes = linkedMapOf<String, (BytecodePatchContext, String) -> Unit>(
            "missing cleanup" to { context, _ ->
                context.mutableClassDefBy(NOTIFICATIONS).methods.removeAll { it.name == NOTIFICATION_CLEANUP }
            },
            "static cleanup" to { context, _ ->
                val cleanup = context.mutableClassDefBy(NOTIFICATIONS).methods.single { it.name == NOTIFICATION_CLEANUP }
                cleanup.accessFlags = cleanup.accessFlags or AccessFlags.STATIC.value
            },
            "no put" to { context, sparse ->
                context.mutableClassDefBy(sparse).methods.removeAll { it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") && it.returnType == "V" }
            },
            "two puts" to { context, sparse ->
                val owner = context.mutableClassDefBy(sparse)
                val put = owner.methods.single { it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") && it.returnType == "V" }
                owner.methods.add(ImmutableMethod(sparse, "putAgain", put.parameters, put.returnType, put.accessFlags, put.annotations,
                    put.hiddenApiRestrictions, put.implementation).toMutable())
            },
            "no empty constructor" to { context, sparse ->
                context.mutableClassDefBy(sparse).methods.removeAll { it.name == "<init>" && it.parameterTypes.isEmpty() }
            },
            "update loop uses another put" to { context, sparse ->
                val owner = context.mutableClassDefBy(sparse)
                val put = owner.methods.single { it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT, "J") && it.returnType == "V" }
                owner.methods.remove(put)
                owner.methods.add(ImmutableMethod(sparse, "renamedPut", put.parameters, put.returnType, put.accessFlags, put.annotations,
                    put.hiddenApiRestrictions, put.implementation).toMutable())
            },
        )
        for (build in Fixtures.declaredBuilds()) for ((change, mutate) in changes) {
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageSecondsPatch.execute(context) })
            mutate(context, sparseType(build))
            val before = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.associate { it.toString() to it.controlBody().map(::shape) }
            val failure = assertThrows("${build.name}: $change", PatchException::class.java) { keepDeletedPatch.execute(context) }
            assertTrue("${build.name}: $change refuses for the cleanup: ${failure.message}",
                failure.message.orEmpty().let { "notification cleanup" in it || "sparse array" in it })
            assertEquals("${build.name}: $change leaves the controller as it was", before,
                context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.associate { it.toString() to it.controlBody().map(::shape) })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepDeleted" }.controlBody()
            assertEquals(0L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a bubble on screen is drawn again through its own layout, which the patch leaves alone`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageSecondsPatch.execute(context) })
            val plan = context.resolveKeepDeleted()
            val layout = plan.layout
            assertEquals("$name: the bubble's own layout", plan.measure.definingClass, layout.definingClass)
            assertEquals("$name: it's handed the message and its album", listOf(MESSAGE_OBJECT, GROUPED_MESSAGES),
                layout.parameterTypes.take(2).map(CharSequence::toString))

            // Read independently: the bubble's one method that reads the mark, before it measures the time, and clears it.
            val bubble = context.mutableClassDefBy(layout.definingClass)
            val readers = bubble.methods.filter { m -> m.controlBody().any { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == FORCE_UPDATE } }
            assertEquals("$name: one method reads the mark", listOf(layout.name), readers.map { it.name })
            val body = layout.controlBody()
            val read = body.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == FORCE_UPDATE }
            val measured = "${plan.measure.definingClass}->${plan.measure.name}($MESSAGE_OBJECT)V"
            assertTrue("$name: the mark is read before the time is measured", read in 0 until body.indexOfFirst { it.controlRef() == measured })
            assertTrue("$name: and cleared", body.any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == FORCE_UPDATE })

            // Telegram's own storage posts the event with the replaced message's chat, then the messages.
            val replace = context.mutableClassDefBy(MESSAGES_STORAGE).methods.single { m ->
                m.name.startsWith(REPLACE_IF_EXISTS) && m.controlBody().any { it.controlRef() == REPLACE_MESSAGES }
            }.controlBody()
            val event = replace.indexOfFirst { it.controlRef() == REPLACE_MESSAGES }
            val chat = replace.indexOfFirst { it.controlRef() == "$MESSAGE_OBJECT->getDialogId()J" }
            val post = replace.indexOfFirst { it.controlRef() == POST_NOTIFICATION }
            assertTrue("$name: event $event, chat $chat, post $post", event in 0 until chat && chat < post)

            val before = layout.controlBody().map(::shape)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { keepDeletedPatch.execute(context) })
            assertEquals("$name: the layout isn't edited", before, layout.controlBody().map(::shape))
        }
    }

    @Test fun `a moved redraw refuses before any edit`() {
        val changes = linkedMapOf<String, (BytecodePatchContext, Method) -> Unit>(
            "storage no longer posts the replacement" to { context, _ ->
                context.mutableClassDefBy(MESSAGES_STORAGE).methods.removeAll { it.name.startsWith(REPLACE_IF_EXISTS) }
            },
            "the bubble has no layout for a marked message" to { context, layout ->
                context.mutableClassDefBy(layout.definingClass).methods.removeAll {
                    it.name == layout.name && it.parameterTypes.map(CharSequence::toString) == layout.parameterTypes.map(CharSequence::toString)
                }
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            val known = context(build).let { messageSecondsPatch.execute(it); it.resolveKeepDeleted().layout }
            for ((change, mutate) in changes) {
                val context = context(build)
                assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageSecondsPatch.execute(context) })
                mutate(context, known)
                val before = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.associate { it.toString() to it.controlBody().map(::shape) }
                val failure = assertThrows("${build.name}: $change", PatchException::class.java) { keepDeletedPatch.execute(context) }
                assertTrue("${build.name}: $change refuses for the redraw: ${failure.message}",
                    failure.message.orEmpty().let { "replaced" in it || "fresh layout" in it })
                assertEquals("${build.name}: $change leaves the controller as it was", before,
                    context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.associate { it.toString() to it.controlBody().map(::shape) })
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepDeleted" }.controlBody()
                assertEquals(0L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val telegram = FixtureDex.classes(build, KEEP_DELETED_TYPES)
        assertEquals("${build.name}: every class the extension reads", KEEP_DELETED_TYPES, telegram.keys)
        val sparse = FixtureDex.classes(build, setOf(sparseType(build)))
        assertEquals("${build.name}: the renamed sparse array", setOf(sparseType(build)), sparse.keys)
        val hosts = FixtureDex.classesWhere(build, { true }) { m ->
            m.definingClass == FAST_DATE_FORMAT || m.controlBody().any { it.controlRef() == EDITED_MESSAGE }
        }.map(ImmutableClassDef::of)
        return PatchContexts.of(ExtensionDex.classes() + telegram.values + sparse.values + hosts)
    }

    /** Read independently of the patch: the cleanup's first parameter, as the fixture declares it. */
    private fun sparseType(build: File) = FixtureDex.classes(build, setOf(NOTIFICATIONS)).getValue(NOTIFICATIONS).methods
        .single { it.name == NOTIFICATION_CLEANUP }.parameterTypes[0].toString()
}
