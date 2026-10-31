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
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

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
            assertEquals("$name: the played mark and the emptying are Telegram's own", listOf(MESSAGES_CONTROLLER, STORAGE_TYPE),
                plan.sites.drop(2).map { it.method.definingClass })
            assertTrue("$name: the opening and the expiry live in the chat", plan.sites.take(2).all { it.method.definingClass !in setOf(MESSAGES_CONTROLLER, STORAGE_TYPE) })
            val before = plan.sites.associate { it.what to body(it.method).map(::shape) }

            context.applyKeepTimedMedia(plan)

            for (site in plan.sites) {
                val method = site.method
                val after = body(method)
                val stored = site.what == "stored media emptying"
                val returns = if (method.returnType == "V") listOf(Opcode.RETURN_VOID) else listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT)
                val ask = if (stored) listOf(Opcode.INVOKE_STATIC_RANGE) else listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC)
                val hook = ask + listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ) + returns
                assertEquals("$name ${site.what}: the hook comes first", hook, after.take(hook.size).map { it.opcode })
                assertEquals("$name ${site.what}: then the stock code, unchanged", before.getValue(site.what), after.drop(hook.size).map(::shape))

                val call = after[ask.size - 1]
                assertEquals("$name ${site.what}", if (stored) TIMED_KEEP_STORED else TIMED_HOLD, call.controlRef())
                if (stored) {
                    assertEquals("$name: it's handed the chat", listOf(method.parameterRegisterNumber(0), method.parameterRegisterNumber(0) + 1),
                        call.namedRegisters())
                } else {
                    val message = method.parameterTypes.indexOfFirst { it.toString() == MESSAGE_OBJECT }
                    assertEquals("$name ${site.what}: it's handed the message", listOf(0, method.parameterRegisterNumber(message)),
                        after[0].namedRegisters())
                }
                val branch = method.implementation!!.instructions.toList()[ask.size + 1] as BuilderOffsetInstruction
                assertEquals("$name ${site.what}: no answer goes on to the stock code", hook.size, branch.target.location.index)
            }

            val stubs = context.mutableClassDefBy(KEEP_TIMED_MEDIA).methods.associate { it.name to it.controlBody().mapNotNull { i -> i.controlRef() } }
            assertTrue("$name: ${stubs["receivedTimedMedia"]}", stubs.getValue("receivedTimedMedia").containsAll(
                listOf("$MESSAGE_OBJECT->isOut()Z", "$MESSAGE_OBJECT->isSecretMedia()Z")))
            assertTrue("$name: ${stubs["secretChat"]}", stubs.getValue("secretChat").containsAll(
                listOf("$MESSAGE_OBJECT->getDialogId()J", "$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z")))
            assertEquals("$name", listOf("$TIMED_DIALOG_OBJECT->isEncryptedDialog(J)Z"), stubs.getValue("secretDialog"))
        }
    }

    @Test fun `a moved or doubled place leaves the switch out before any edit`() {
        val changes = linkedMapOf<String, (BytecodePatchContext, KeepTimedMediaPlan) -> Unit>(
            "no stored media emptying" to { context, _ ->
                context.mutableClassDefBy(STORAGE_TYPE).methods.removeAll { it.name == "emptyMessagesMedia" }
            },
            "no chat kind" to { context, _ ->
                context.mutableClassDefBy(TIMED_DIALOG_OBJECT).methods.removeAll { it.name == "isEncryptedDialog" }
            },
            "two openings" to { context, known ->
                val opening = known.sites.first().method
                val owner = context.mutableClassDefBy(opening.definingClass)
                val copy = owner.methods.single { it.toString() == opening.toString() }
                owner.methods.add(ImmutableMethod(owner.type, "openAgain", copy.parameters, copy.returnType, copy.accessFlags, copy.annotations,
                    copy.hiddenApiRestrictions, copy.implementation).toMutable())
            },
            "no played mark" to { context, _ ->
                context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.name == "markMessageContentAsRead" }
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
                val hooked = listOf(MESSAGES_CONTROLLER, STORAGE_TYPE, known.sites.first().method.definingClass).flatMap { type ->
                    context.mutableClassDefBy(type).methods.filter { m -> m.controlBody().any { it.controlRef()?.startsWith(KEEP_TIMED_MEDIA) == true } }
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
            m.controlBody().any { it.controlRef().let { ref -> ref == TIMED_OPENED || ref == TIMED_SHOW_ONCE } }
        }.filter { it.type !in types }.distinctBy { it.type }.map(ImmutableClassDef::of)
        return PatchContexts.of(ExtensionDex.classes() + telegram.values + hosts)
    }
}
