/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
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
import app.morphe.patches.telegram.misc.time.messageTimePatch
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
            // The label rides the shared time hook, which patches first, without Message times with seconds.
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
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
            assertEquals("$name: ${plan.editsMissing}", null, plan.editsMissing)
            assertEquals("$name: both edit updates", listOf(USER_EDIT, CHANNEL_EDIT), plan.edits.map { it.type })
            assertEquals("$name: eight instructions per branch and three per edit", updatesBefore.size + 16 + 6, updates.size)
            val editStarts = mutableListOf<Int>()
            for (edit in plan.edits) {
                val start = updates.indices.single { i ->
                    updates[i].controlRef() == "$KEEP_EDITS->edited(Ljava/lang/Object;Ljava/lang/Object;)V" &&
                        updates[i - 2].namedRegisters() == listOf(edit.scratch, edit.message)
                } - 2
                editStarts += start
                assertEquals("$name: ${edit.type} instructions", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC_RANGE),
                    (start until start + 3).map { updates[it].opcode })
                assertEquals("the controller is this, in the register after", listOf(edit.scratch + 1, plan.updates.localRegisterCount()),
                    updates[start + 1].namedRegisters())
                assertEquals(listOf(edit.scratch, edit.scratch + 1), updates[start + 2].namedRegisters())
                // Read independently: the hook follows the read of the edit's new message, right after its cast.
                assertEquals("$name: ${edit.type}", Opcode.IGET_OBJECT, updates[start - 1].opcode)
                assertEquals("${edit.type}->message:Lorg/telegram/tgnet/TLRPC\$Message;", updates[start - 1].controlRef())
                assertEquals(edit.message, updates[start - 1].namedRegisters().first())
                assertEquals(edit.type, updates[start - 2].controlRef())
                val flow = ControlFlow.of(plan.updates)
                assertTrue("$name: ${edit.type} only the read leads into the hook", flow.normal.indices.none { from ->
                    from != start - 1 && start in flow.normal[from]
                })
            }
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
            val loopHooks = starts.associateWith { 8 } + editStarts.associateWith { 3 }
            assertEquals("$name: the loop's own code is unchanged", updatesBefore,
                updates.indices.filter { i -> loopHooks.none { (start, size) -> i >= start && i < start + size } }.map { shape(updates[it]) })

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
            val red = plan.red!!
            assertEquals("$name: ${plan.redMissing}", null, plan.redMissing)
            val returns = measureBefore.indices.filter { measureBefore[it][0] == Opcode.RETURN_VOID }
            assertEquals("$name: every return of the measuring paints", returns, red.returns.map { it.index })
            assertEquals("$name: one instruction, and five in front of each return", measureBefore.size + 1 + 5 * returns.size, measure.size)
            assertEquals("$KEEP_DELETED->measuring(Ljava/lang/Object;)V", measure[0].controlRef())
            assertEquals(listOf(plan.measuredMessage), measure[0].namedRegisters())
            // Read independently: the one CharSequence field of the bubble the measuring writes.
            val field = measureBefore.filter { it[0] == Opcode.IPUT_OBJECT }.map { it[2] as String }
                .filter { it.startsWith("${plan.measure.definingClass}->") && it.endsWith(":Ljava/lang/CharSequence;") }.distinct()
            assertEquals("$name: the time text", listOf(red.field), field)
            val paints = measure.indices.filter { measure[it].controlRef() == PAINTED }
            assertEquals("$name: one paint per return", returns.size, paints.size)
            val self = plan.measure.localRegisterCount()
            val inserted = mutableListOf(0)
            for ((call, at) in paints.zip(red.returns.sortedBy { it.index })) {
                val start = call - 2
                inserted += start
                assertEquals("$name: paint at ${at.index}", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                    Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT, Opcode.RETURN_VOID), (start..start + 5).map { measure[it].opcode })
                assertEquals("this, copied low", listOf(at.bubble, self), measure[start].namedRegisters())
                assertEquals(listOf(at.text, at.bubble), measure[start + 1].namedRegisters())
                assertEquals(red.field, measure[start + 1].controlRef())
                assertEquals(listOf(at.text), measure[call].namedRegisters())
                assertEquals(listOf(at.text, at.bubble), measure[start + 4].namedRegisters())
                assertEquals(red.field, measure[start + 4].controlRef())
                assertTrue("$name: v0 to v15", at.bubble <= 15 && at.text <= 15 && at.bubble != at.text)
            }
            val sizes = inserted.associateWith { if (it == 0) 1 else 5 }
            assertEquals("$name: the time measuring is unchanged", measureBefore,
                measure.indices.filter { i -> sizes.none { (start, size) -> i >= start && i < start + size } }.map { shape(measure[it]) })
            val flow = ControlFlow.of(plan.measure)
            for (start in inserted.drop(1)) {
                assertTrue("$name: whatever reached the return reaches the paint", flow.normal.indices.none { from ->
                    from !in start..start + 5 && start + 5 in flow.normal[from]
                })
            }
            assertTrue("$name: its times still go through the extension", measure.any { it.controlRef() == MESSAGE_TIME_SHOWN })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepDeleted" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
            val painted = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "redDeletedLabel" }.controlBody()
            assertEquals(1L, (painted.first() as WideLiteralInstruction).wideLiteral)
            val history = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepEditHistory" }.controlBody()
            assertEquals(1L, (history.first() as WideLiteralInstruction).wideLiteral)
            val timed = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepTimedMedia" }.controlBody()
            assertEquals("$name: the timed media switch shows", 1L, (timed.first() as WideLiteralInstruction).wideLiteral)
            // Message times with seconds wasn't picked, so its switch stays hidden (#49).
            val seconds = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "messageSeconds" }.controlBody()
            assertEquals("$name: no seconds switch without its patch", 0L, (seconds.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `an edit read that moved leaves the edit history out and keeps the rest`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
            val known = context.resolveKeepDeleted()
            // The channel edit's cast goes, so its message read no longer follows it.
            val cast = known.edits.single { it.type == CHANNEL_EDIT }.insertAt - 2
            assertEquals(CHANNEL_EDIT, known.updates.controlBody()[cast].controlRef())
            known.updates.replaceInstruction(cast, "nop")
            val before = known.updates.controlBody().map(::shape)
            val warnings = PatchLogCapture.warnings { keepDeletedPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "isn't cast right before its message is read" in warnings.single() && "without Keep edit history" in warnings.single())
            val updates = known.updates.controlBody()
            assertEquals("$name: only the deletion hooks", before.size + 16, updates.size)
            assertTrue("$name: no edit hook at all", updates.none { it.controlRef()?.startsWith(KEEP_EDITS) == true })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
            assertEquals(1L, (status.single { it.name == "keepDeleted" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
            assertEquals(0L, (status.single { it.name == "keepEditHistory" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a moved timed media place leaves that switch out and keeps the rest`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
            context.mutableClassDefBy(MESSAGES_STORAGE).methods.removeAll { it.name == "emptyMessagesMedia" }
            val warnings = PatchLogCapture.warnings { keepDeletedPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "emptyMessagesMedia" in warnings.single() && "without Keep view-once and timed media" in warnings.single())
            val played = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "markMessageContentAsRead" }
            assertTrue("$name: no timed media hook", played.controlBody().none { it.controlRef()?.startsWith(KEEP_TIMED_MEDIA) == true })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
            assertEquals(1L, (status.single { it.name == "keepDeleted" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
            assertEquals(1L, (status.single { it.name == "keepEditHistory" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
            assertEquals(0L, (status.single { it.name == "keepTimedMedia" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a time text that can't be found leaves the label in the time's own color and keeps the rest`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
            val known = context.resolveKeepDeleted()
            val field = known.red!!.field
            // Built in a local instead of the field, so the measuring writes no time text of its own.
            known.measure.controlBody().indices.filter { known.measure.controlBody()[it].let { i -> i.opcode == Opcode.IPUT_OBJECT && i.controlRef() == field } }
                .forEach { known.measure.replaceInstruction(it, "nop") }
            val before = known.measure.controlBody().map(::shape)
            val warnings = PatchLogCapture.warnings { keepDeletedPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "no longer keeps its time text in one field" in warnings.single() && "own color" in warnings.single())
            val measure = known.measure.controlBody()
            assertEquals("$name: only the measuring call", before.size + 1, measure.size)
            assertTrue(measure.none { it.controlRef() == PAINTED })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
            assertEquals(1L, (status.single { it.name == "keepDeleted" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
            assertEquals(0L, (status.single { it.name == "redDeletedLabel" }.controlBody().first() as WideLiteralInstruction).wideLiteral)
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
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
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
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
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
            val known = context(build).let { messageTimePatch.execute(it); it.resolveKeepDeleted().layout }
            for ((change, mutate) in changes) {
                val context = context(build)
                assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageTimePatch.execute(context) })
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
        val dialog = FixtureDex.classes(build, setOf(TIMED_DIALOG_OBJECT))
        assertEquals("${build.name}: the chat kinds", setOf(TIMED_DIALOG_OBJECT), dialog.keys)
        // The bubble and time hosts, plus the chat that opens and expires timed media.
        val hosts = FixtureDex.classesWhere(build, { true }) { m ->
            m.definingClass == FAST_DATE_FORMAT || m.controlBody().any { it.controlRef().let { ref ->
                ref == EDITED_MESSAGE || ref == TIMED_OPENED || ref == TIMED_SHOW_ONCE
            } }
        }.filter { it.type !in telegram.keys && it.type !in sparse.keys && it.type != TIMED_DIALOG_OBJECT }
            .distinctBy { it.type }.map(ImmutableClassDef::of)
        return PatchContexts.of(ExtensionDex.classes() + telegram.values + sparse.values + dialog.values + hosts)
    }

    /** Read independently of the patch: the cleanup's first parameter, as the fixture declares it. */
    private fun sparseType(build: File) = FixtureDex.classes(build, setOf(NOTIFICATIONS)).getValue(NOTIFICATIONS).methods
        .single { it.name == NOTIFICATION_CLEANUP }.parameterTypes[0].toString()
}
