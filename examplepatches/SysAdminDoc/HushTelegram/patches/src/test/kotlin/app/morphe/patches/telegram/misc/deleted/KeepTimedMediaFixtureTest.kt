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
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private const val STORAGE_TYPE = "Lorg/telegram/messenger/MessagesStorage;"

/** Keep view-once and timed media: the four places it asks, and the stubs it writes. */
class KeepTimedMediaFixtureTest {
    private fun shape(i: Instruction): List<Any?> {
        val opcode = if (i.opcode == Opcode.GOTO_16 || i.opcode == Opcode.GOTO_32) Opcode.GOTO else i.opcode
        return listOf(opcode, i.namedRegisters(), i.controlRef())
    }

    private fun body(method: MutableMethod) =
        method.controlBody().filter { it.opcode != Opcode.NOP }

    @Test fun `each place asks first with the message or chat and the stock code follows unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveKeepTimedMedia()
            assertEquals("$name: ${plan.missing}", null, plan.missing)
            assertEquals("$name: the four places", listOf("timed media opening", "view-once expiry", "played mark", "stored media emptying"),
                plan.sites.map { it.what })
            assertEquals("$name: the played mark is Telegram's own", MESSAGES_CONTROLLER, plan.sites[2].method.origDefiningClass)
            assertTrue("$name: the opening and the expiry live in the chat", plan.sites.take(2).all { it.method.origDefiningClass !in setOf(MESSAGES_CONTROLLER, STORAGE_TYPE) })
            // 13.2 inlines emptyMessagesMedia; what it posted is a merged runnable holding the storage.
            val emptying = plan.sites[3].method
            val runnable = context.tgMutableClassDefBy(emptying.definingClass)
            assertEquals("$name: the emptying is the runnable's run()", "run", emptying.name)
            assertTrue("$name: the runnable holds the storage", context.tgMutableClassDefBy(STORAGE_TYPE).type in runnable.fields.map { it.type })
            val stockArm = armStart(emptying)
            val stockFirst = emptying.implementation!!.instructions.toList()[stockArm].opcode
            val before = plan.sites.associate { it.what to body(it.method).map(::shape) }

            context.applyKeepTimedMedia(plan)

            val arm = armStart(emptying)
            val code = emptying.implementation!!.instructions.toList()
            val hookCode = code.subList(arm, arm + EMPTYING_HOOK.size)
            assertEquals("$name: the switch lands on the question", EMPTYING_HOOK, hookCode.map { it.opcode })
            assertEquals("$name: where the arm used to start", stockArm, arm)
            assertEquals("$name: then the arm's own code", stockFirst, code[arm + EMPTYING_HOOK.size].opcode)
            val holder = hookCode[0].namedRegisters()
            assertEquals("$name: the runnable itself", emptying.implementation!!.registerCount - 1, holder[1])
            assertEquals("$name: is what's read", holder[0], hookCode[1].namedRegisters()[1])
            assertEquals("$name: the chat ID it holds", "${runnable.type}->${runnable.fields.single { it.type == "J" }.name}:J",
                hookCode[1].controlRef())
            val pair = hookCode[1].namedRegisters()[0]
            assertEquals("$name: is what's asked", listOf(pair, pair + 1), hookCode[2].namedRegisters())
            assertEquals("$name: the emptying asks keepStored", TIMED_KEEP_STORED, hookCode[2].controlRef())
            assertEquals("$name: no answer goes on to the arm", arm + EMPTYING_HOOK.size,
                (hookCode[4] as BuilderOffsetInstruction).target.location.index)
            assertEquals("$name: the rest of run() is unchanged", before.getValue("stored media emptying"),
                code.filterIndexed { i, _ -> i !in arm until arm + EMPTYING_HOOK.size }.filter { it.opcode != Opcode.NOP }.map(::shape))

            for (site in plan.sites.take(3)) {
                val method = site.method
                val after = body(method)
                val returns = if (method.origReturnType == "V") listOf(Opcode.RETURN_VOID) else listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT)
                val ask = listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC)
                val hook = ask + listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ) + returns
                assertEquals("$name ${site.what}: the hook comes first", hook, after.take(hook.size).map { it.opcode })
                assertEquals("$name ${site.what}: then the stock code, unchanged", before.getValue(site.what), after.drop(hook.size).map(::shape))

                assertEquals("$name ${site.what}", TIMED_HOLD, after[ask.size - 1].controlRef())
                val message = method.origParameterTypes.indexOf(MESSAGE_OBJECT)
                assertEquals("$name ${site.what}: it's handed the message", listOf(0, method.parameterRegisterNumber(message)),
                    after[0].namedRegisters())
                val branch = method.implementation!!.instructions.toList()[ask.size + 1] as BuilderOffsetInstruction
                assertEquals("$name ${site.what}: no answer goes on to the stock code", hook.size, branch.target.location.index)
            }

            val stubs = context.tgMutableClassDefBy(KEEP_TIMED_MEDIA).methods.associate { it.name to it.controlBody().mapNotNull { i -> i.controlRef() } }
            assertTrue("$name: ${stubs["receivedTimedMedia"]}", stubs.getValue("receivedTimedMedia").containsAll(
                listOf("$MESSAGE_OBJECT->isOut()Z", "$MESSAGE_OBJECT->isSecretMedia()Z")))
            assertTrue("$name: ${stubs["secretChat"]}", stubs.getValue("secretChat").containsAll(
                listOf("$MESSAGE_OBJECT->getDialogId()J", "$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z")))
            assertEquals("$name", listOf("$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z"), stubs.getValue("secretDialog"))
        }
    }

    @Test fun `a moved or doubled place leaves the switch out before any edit`() {
        val changes = linkedMapOf<String, (BytecodePatchContext, KeepTimedMediaPlan) -> Unit>(
            "no stored media emptying" to { context, known ->
                context.tgMutableClassDefBy(known.sites.last().method.definingClass).methods.removeAll { it.name == "run" }
            },
            "a runnable holding two longs" to { context, known ->
                val runnable = context.tgMutableClassDefBy(known.sites.last().method.definingClass)
                val chat = runnable.fields.single { it.type == "J" }
                runnable.fields.add(ImmutableField(runnable.type, "hushSecondLong", "J", chat.accessFlags, null, null, null).toMutable())
            },
            "no chat kind" to { context, _ ->
                context.tgMutableClassDefBy(TIMED_DIALOG_OBJECT).methods.removeAll { it.origName == "isEncryptedDialog" }
            },
            "two openings" to { context, known ->
                val opening = known.sites.first().method
                val owner = context.tgMutableClassDefBy(opening.definingClass)
                val copy = owner.methods.single { it.toString() == opening.toString() }
                owner.methods.add(ImmutableMethod(owner.type, "openAgain", copy.parameters, copy.returnType, copy.accessFlags, copy.annotations,
                    copy.hiddenApiRestrictions, copy.implementation).toMutable())
            },
            "no played mark" to { context, _ ->
                context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.origName == "markMessageContentAsRead" }
            },
        )
        for (build in Fixtures.declaredBuilds()) {
            val known = context(build).resolveKeepTimedMedia()
            for ((change, mutate) in changes) {
                val context = context(build)
                mutate(context, known)
                val plan = context.resolveKeepTimedMedia()
                assertNotNull("${build.name}: $change", plan.missing)
                assertTrue("${build.name}: $change leaves nothing to hook", plan.sites.isEmpty())
                val hooked = listOf(MESSAGES_CONTROLLER, STORAGE_TYPE, known.sites.first().method.definingClass,
                    known.sites.last().method.definingClass).flatMap { type ->
                    context.tgMutableClassDefBy(type).methods.filter { m -> m.controlBody().any { it.controlRef()?.startsWith(KEEP_TIMED_MEDIA) == true } }
                }
                assertEquals("${build.name}: $change hooks nothing", emptyList<Any>(), hooked)
            }
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val types = setOf(MESSAGES_CONTROLLER, STORAGE_TYPE, MESSAGE_OBJECT, TIMED_DIALOG_OBJECT)
        val telegram = FixtureDex.classes(build, types)
        assertEquals("${build.name}: every class the switch reads", types, telegram.keys)
        val hosts = FixtureDex.classesWhere(build, { true }) { m ->
            m.controlBody().any { it.controlRef().let { ref -> ref == TIMED_OPENED || ref in TIMED_SHOW_ONCE_CALLS } || it.controlString() == TIMED_EMPTY_QUERY }
        }.filter { it.origType !in types }.distinctBy { it.type }.map(ImmutableClassDef::of)
        return PatchContexts.of(ExtensionDex.classes() + telegram.values + hosts)
    }

    /** Where run()'s switch sends the emptying: its last arm at or above the query, read independently of the patch. */
    private fun armStart(run: MutableMethod): Int {
        val code = run.implementation!!.instructions.toList()
        val query = code.indexOfFirst { it.controlString() == TIMED_EMPTY_QUERY }
        val switch = code.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
        return ControlFlow.of(run).normal[switch].filter { it in switch + 1..query }.max()
    }

    private companion object {
        val EMPTYING_HOOK = listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_WIDE, Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.RETURN_VOID)
    }
}
