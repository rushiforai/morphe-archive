/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.deleted

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.restrictions.BANNED_OFFER
import app.morphe.patches.telegram.misc.restrictions.applyBannedChannelAlert
import app.morphe.patches.telegram.misc.restrictions.bannedAlertHosts
import app.morphe.patches.telegram.misc.restrictions.cantOpenAlert
import app.morphe.patches.telegram.misc.restrictions.resolveBannedChannelAlert
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val REMOVED_CHAT_OBJECT = "Lorg/telegram/messenger/ChatObject;"
private const val REMOVED_TL_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private val REMOVED_CHAT_TYPES = setOf(REMOVED_TL_CHAT, "Lorg/telegram/tgnet/TLRPC\$TL_chatForbidden;",
    "Lorg/telegram/tgnet/TLRPC\$TL_channelForbidden;", "Lorg/telegram/tgnet/TLRPC\$TL_chatEmpty;")
private val REMOVED_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/**
 * What Keep chats you're removed from (#71) needs from [build] besides MessagesController and
 * ChatObject: the chat classes the stubs read, the chat list's two loads and the chat screen's
 * alert. A test that runs Keep deleted messages and expects nothing to warn about adds these.
 */
internal fun removedHosts(build: File): List<ClassDef> = REMOVED_HOSTS.hostsOf(build.path) {
    val chats = FixtureDex.classes(build, REMOVED_CHAT_TYPES)
    assertEquals("${build.name}: the chat classes", REMOVED_CHAT_TYPES, chats.keys)
    // Read independently of the patch: every run() that reads a dialogs answer's list and asks whether you're in a chat.
    val lists = FixtureDex.classesWhere(build, { true }) { m ->
        m.name == "run" && m.parameterTypes.isEmpty() && m.controlBody().let { body ->
            body.any { it.controlRef() == REMOVED_DIALOGS } && body.any { it.controlRef() == REMOVED_IS_NOT_IN_CHAT }
        }
    }.map(ImmutableClassDef::of)
    (chats.values.map(ImmutableClassDef::of) + lists + bannedAlertHosts(build)).distinctBy { it.type }
}

/** Breaks the check the alert's showing gets, which the hook skips past for a kept chat. */
internal fun BytecodePatchContext.breakRemovedAlertCheck() {
    val alert = cantOpenAlert()
    val body = alert.alert.controlBody()
    val show = (alert.ok + 1 until body.size).first { body[it].isShowDialog() }
    assertEquals(Opcode.IF_NEZ, body[show + 2].opcode)
    alert.alert.replaceInstruction(show + 2, "nop")
}

private fun Instruction.isShowDialog(): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && ref.returnType == "Landroid/app/Dialog;" &&
        ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Dialog;")
}

/** Keep chats you're removed from (#71): where Telegram deletes a chat that no longer has you, and where it drops one. */
class KeepRemovedFixtureTest {
    private fun shape(i: Instruction): List<Any?> {
        val opcode = if (i.opcode == Opcode.GOTO_16 || i.opcode == Opcode.GOTO_32) Opcode.GOTO else i.opcode
        return listOf(opcode, i.namedRegisters(), i.controlRef())
    }

    private fun Instruction.buildRef() = (this as? ReferenceInstruction)?.reference?.toString()

    private fun refs(method: Method) = method.controlBody().mapNotNull { it.controlRef() }

    @Test fun `each place asks the extension first and Telegram's own code follows unchanged in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveKeepRemovedChats()
            assertEquals("$name: ${plan.missing}", null, plan.missing)
            val forwarder = plan.forwarder!!
            val updates = plan.updates!!
            val alert = plan.alert!!
            val delete = plan.delete!!

            // Read independently of the patch.
            assertEquals("$name: the forwarder only hands on to the whole delete", listOf(REMOVED_DELETE_DIALOG), refs(forwarder))
            assertEquals("$name: deleteDialog(did, onlyHistory, revoke)", listOf("I", "J", "Z"), forwarder.parameterTypes.map(CharSequence::toString))
            val updatesBefore = ImmutableMethod.of(updates).controlBody()
            val deletes = updatesBefore.indices.filter { updatesBefore[it].buildRef() == forwarder.toString() }
            assertEquals("$name: the update loop's two deletes", deletes, plan.deletes)
            val updateRefs = refs(updates)
            assertTrue("$name: a channel update and a group update", "Lorg/telegram/tgnet/tl/TL_update\$TL_updateChannel;" in updateRefs &&
                "Lorg/telegram/tgnet/tl/TL_update\$TL_updateChat;" in updateRefs)
            val listsBefore = plan.lists.map { ImmutableMethod.of(it).controlBody() }
            val loads = removedHosts(build).filter { c -> c.methods.any { m -> m.name == "run" && m.parameterTypes.isEmpty() &&
                refs(m).let { REMOVED_DIALOGS in it && REMOVED_IS_NOT_IN_CHAT in it } } }.map { it.type }.toSet()
            assertEquals("$name: the chat list's two loads", 2, loads.size)
            assertEquals("$name: the chat list's two loads", loads, plan.lists.map { it.definingClass }.toSet())
            assertEquals("$name: two and four checks", listOf(2, 4), plan.checks.map { it.size }.sorted())
            val alertBefore = ImmutableMethod.of(alert.alert).controlBody()
            val show = (alert.ok + 1 until alertBefore.size).first { alertBefore[it].isShowDialog() }
            assertEquals("$name: the showing is checked", listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IF_NEZ),
                listOf(alertBefore[show + 1].opcode, alertBefore[show + 2].opcode))
            val stockFlow = ControlFlow.of(ImmutableMethod.of(alert.alert))
            val kept = stockFlow.normal[show + 2].single { it != show + 3 }
            assertEquals("$name: a kept chat goes on where a shown alert does", kept, plan.kept)
            val deleteBefore = ImmutableMethod.of(delete).controlBody()
            assertEquals("$name: the whole delete", "deleteDialog", delete.origName)
            assertEquals(name, 7, delete.origParameterTypes.size)

            context.applyKeepRemovedChats(plan)

            // The update loop: each delete is the extension's, with the same registers, and nothing else moved.
            val updatesAfter = updates.controlBody()
            assertEquals(name, updatesBefore.size, updatesAfter.size)
            for (i in updatesBefore.indices) {
                if (i in deletes) {
                    assertEquals("$name: $i", listOf(Opcode.INVOKE_STATIC, updatesBefore[i].namedRegisters(), REMOVED_REMOVING), shape(updatesAfter[i]))
                } else {
                    assertEquals("$name: stock $i", shape(updatesBefore[i]), shape(updatesAfter[i]))
                }
            }

            // The chat list: each not-in-chat check is the extension's, the result read as before.
            plan.lists.forEachIndexed { which, list ->
                val before = listsBefore[which]
                val after = list.controlBody()
                assertEquals(name, before.size, after.size)
                val checks = before.indices.filter { before[it].controlRef() == REMOVED_IS_NOT_IN_CHAT }
                assertEquals(name, checks, plan.checks[which])
                for (i in before.indices) {
                    if (i in checks) {
                        assertEquals("$name: $i", listOf(Opcode.INVOKE_STATIC, before[i].namedRegisters(), REMOVED_NOT_IN_CHAT), shape(after[i]))
                        assertEquals(name, Opcode.MOVE_RESULT, after[i + 1].opcode)
                    } else {
                        assertEquals("$name: stock $i", shape(before[i]), shape(after[i]))
                    }
                }
            }

            // The alert: four instructions right after OK, whose branch lands where a shown alert goes on.
            val alertAfter = alert.alert.controlBody()
            assertEquals(name, alertBefore.size + 4, alertAfter.size)
            val free = alertAfter[alert.ok + 1].namedRegisters().first()
            assertEquals("$name: the chat screen", listOf(Opcode.MOVE_OBJECT_FROM16, listOf(free, alert.alert.localRegisterCount()), null),
                shape(alertAfter[alert.ok + 1]))
            assertEquals(name, listOf(Opcode.INVOKE_STATIC, listOf(free), REMOVED_CANT_OPEN), shape(alertAfter[alert.ok + 2]))
            assertEquals(name, listOf(Opcode.MOVE_RESULT, listOf(free), null), shape(alertAfter[alert.ok + 3]))
            assertEquals(name, listOf(Opcode.IF_NEZ, listOf(free), null), shape(alertAfter[alert.ok + 4]))
            assertTrue("$name: a call can name it", free < 16)
            assertNotEquals("$name: the builder stays put", alert.builder, free)
            assertEquals("$name: skips to where a shown alert goes on", listOf(alert.ok + 5, kept + 4),
                ControlFlow.of(alert.alert).normal[alert.ok + 4].sorted())
            for (i in 0..alert.ok) assertEquals("$name: stock $i", shape(alertBefore[i]), shape(alertAfter[i]))
            for (i in alert.ok + 1 until alertBefore.size) assertEquals("$name: stock $i", shape(alertBefore[i]), shape(alertAfter[i + 4]))

            // The whole delete: told first, with the chat, first and onlyHistory.
            val deleteAfter = delete.controlBody()
            val did = delete.localRegisterCount() + 1
            assertEquals(name, listOf(Opcode.INVOKE_STATIC_RANGE, listOf(did, did + 1, did + 2, did + 3), REMOVED_DELETING), shape(deleteAfter[0]))
            assertEquals("$name: the delete's own code", deleteBefore.map(::shape), deleteAfter.drop(1).map(::shape))

            // The stubs.
            val stub = { n: String -> context.tgMutableClassDefBy(KEEP_REMOVED).methods.single { it.origName == n } }
            assertTrue("$name: chat asks the controller", REMOVED_GET_CHAT in refs(stub("chat")))
            assertEquals("$name: chatState reads each kind", REMOVED_CHAT_TYPES, stub("chatState").controlBody()
                .filter { it.opcode == Opcode.INSTANCE_OF }.mapNotNull { it.controlRef() }.toSet())
            assertEquals("$name: chatState reads each flag", listOf("kicked:Z", "left:Z", "deactivated:Z", "migrated_to:Lorg/telegram/tgnet/TLRPC\$InputChannel;"),
                stub("chatState").controlBody().filter { it.opcode == Opcode.IGET_BOOLEAN || it.opcode == Opcode.IGET_OBJECT }
                    .map { it.controlRef()!!.substringAfter("->") })
            assertEquals("$name: chatId", listOf("$REMOVED_TL_CHAT->id:J"), stub("chatId").controlBody().filter { it.opcode == Opcode.IGET_WIDE }.map { it.controlRef() })
            assertTrue("$name: stockNotInChat is Telegram's", REMOVED_IS_NOT_IN_CHAT in refs(stub("stockNotInChat")))
            assertEquals("$name: stockDelete calls the forwarder", listOf(forwarder.toString()),
                stub("stockDelete").controlBody().filter { it.opcode == Opcode.INVOKE_VIRTUAL }.map { it.buildRef() })
            assertEquals("$name: screenChat reads the screen's chat", listOf(alert.chat.toString()),
                stub("screenChat").controlBody().filter { it.opcode == Opcode.IGET_OBJECT }.map { it.buildRef() })
        }
    }

    @Test fun `Open on the web and the kept chat's skip both go in, whichever comes first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            for (webFirst in listOf(true, false)) {
                val context = context(build)
                if (webFirst) context.applyBannedChannelAlert(context.resolveBannedChannelAlert())
                val plan = context.resolveKeepRemovedChats()
                assertEquals("$name ($webFirst): ${plan.missing}", null, plan.missing)
                val alert = plan.alert!!
                val before = ImmutableMethod.of(alert.alert).controlBody()
                context.applyKeepRemovedChats(plan)
                if (!webFirst) context.applyBannedChannelAlert(context.resolveBannedChannelAlert())

                val after = alert.alert.controlBody()
                val offer = after.indices.single { after[it].controlRef() == BANNED_OFFER }
                val skip = after.indices.single { after[it].controlRef() == REMOVED_CANT_OPEN }
                // Each goes in right after OK, so whichever patched second sits first.
                assertEquals("$name ($webFirst)", if (webFirst) alert.ok + 2 else alert.ok + 4, skip)
                assertEquals("$name ($webFirst)", if (webFirst) alert.ok + 6 else alert.ok + 2, offer)
                assertEquals("$name ($webFirst): what each added", before.size + if (webFirst) 4 else 6, after.size)
                val target = ControlFlow.of(alert.alert).normal[skip + 2].single { it != skip + 3 }
                assertEquals("$name ($webFirst): the skip lands where a shown alert goes on", shape(before[plan.kept]), shape(after[target]))
                assertTrue("$name ($webFirst): past the showing", (skip until target).any { after[it].isShowDialog() })
            }
        }
    }

    @Test fun `a moved place leaves the switch out before any edit`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val known = context(build).resolveKeepRemovedChats()
            assertEquals("$name: ${known.missing}", null, known.missing)
            val forwarder = known.forwarder.toString()
            val updatesName = known.updates!!.name
            val touched = (listOf(MESSAGES_CONTROLLER, known.alert!!.screen) + known.lists.map { it.definingClass }).toSet()
            val changes = linkedMapOf<String, Pair<String, (BytecodePatchContext) -> Unit>>(
                "no forwarder" to ("deleteDialog(did, onlyHistory, revoke) is missing" to { context ->
                    context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.toString() == forwarder }
                }),
                "a third delete in the update loop" to ("in 3 places, not two" to { context ->
                    val updates = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == updatesName && it.controlBody().any { i -> i.buildRef() == forwarder } }
                    val at = updates.controlBody().indexOfFirst { it.buildRef() == forwarder }
                    val call = updates.controlBody()[at] as FiveRegisterInstruction
                    val registers = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).joinToString { "v$it" }
                    updates.addInstructions(at, "invoke-virtual {$registers}, $forwarder")
                }),
                "a moved chat list check" to ("not two and four" to { context ->
                    val list = known.lists.first()
                    val method = context.tgMutableClassDefBy(list.definingClass).methods.single { it.name == "run" && it.parameterTypes.isEmpty() }
                    val at = method.controlBody().indexOfFirst { it.controlRef() == REMOVED_IS_NOT_IN_CHAT }
                    val chat = (method.controlBody()[at] as FiveRegisterInstruction).registerC
                    method.replaceInstruction(at, "invoke-static {v$chat}, $REMOVED_CHAT_OBJECT->isChannel($REMOVED_TL_CHAT)Z")
                }),
                "an unchecked alert" to ("isn't checked right after" to { context -> context.breakRemovedAlertCheck() }),
                "no whole delete" to ("MessagesController.deleteDialog is missing" to { context ->
                    context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.removeAll { it.origName == "deleteDialog" && it.origParameterTypes.size == 7 }
                }),
            )
            for ((change, expected) in changes) {
                val (why, mutate) = expected
                val context = context(build)
                mutate(context)
                val plan = context.resolveKeepRemovedChats()
                assertNotNull("$name: $change", plan.missing)
                assertTrue("$name: $change: ${plan.missing}", why in plan.missing!!)
                assertEquals("$name: $change", null, plan.forwarder)
                val hooked = touched.flatMap { type ->
                    context.tgMutableClassDefBy(type).methods.filter { m -> m.controlBody().any { it.controlRef()?.startsWith(KEEP_REMOVED) == true } }
                }
                assertEquals("$name: $change hooks nothing", emptyList<Any>(), hooked)
            }

            // A second run finds every place already taken and goes no further.
            val twice = context(build)
            twice.applyKeepRemovedChats(twice.resolveKeepRemovedChats())
            assertNotNull("$name: hooked twice", twice.resolveKeepRemovedChats().missing)
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val types = setOf(MESSAGES_CONTROLLER, REMOVED_CHAT_OBJECT)
        val telegram = FixtureDex.classes(build, types)
        assertEquals("${build.name}: every class the switch reads", types, telegram.keys)
        return PatchContexts.of((ExtensionDex.classes() + telegram.values + removedHosts(build)).distinctBy { it.type })
    }
}
