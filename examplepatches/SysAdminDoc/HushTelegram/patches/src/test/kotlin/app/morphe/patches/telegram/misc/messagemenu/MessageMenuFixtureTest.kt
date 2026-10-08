/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.forward.FORWARDS
import app.morphe.patches.telegram.misc.forward.IS_PREMIUM
import app.morphe.patches.telegram.misc.forward.NAME_HIDE
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** The menu builder's return, the choice handler's entry, the forward the stubs send with, and the runtime. */
class MessageMenuFixtureTest {
    private val list = "Ljava/util/ArrayList;"
    private val fixed = setOf(
        "Lorg/telegram/messenger/MessageObject;", "Lorg/telegram/messenger/MessageObject\$GroupedMessages;",
        "Lorg/telegram/tgnet/TLRPC\$Message;", "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;", "Lorg/telegram/tgnet/TLRPC\$MessageMedia;",
        "Lorg/telegram/tgnet/TLRPC\$Photo;", "Lorg/telegram/tgnet/TLRPC\$PhotoSize;", "Lorg/telegram/tgnet/TLRPC\$Document;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;", "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;",
        "Lorg/telegram/messenger/MessagesController;", "Lorg/telegram/messenger/ChatObject;", "Lorg/telegram/messenger/UserObject;",
        "Lorg/telegram/messenger/DialogObject;", "Lorg/telegram/messenger/UserConfig;", "Lorg/telegram/messenger/R\$drawable;",
        "Lorg/telegram/messenger/FileLoader;", "Lorg/telegram/messenger/ApplicationLoader;", "Landroidx/core/content/FileProvider;",
    )

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString())
    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    @Test fun `the menu gains its items as it returns and the extension answers its own numbers first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val found = FixtureDex.classesWhere(build, { true }) { m ->
                val params = m.parameterTypes.map(CharSequence::toString)
                params == listOf("Lorg/telegram/messenger/MessageObject;", list, list, list) && m.controlBody().any { it.controlRef() == FORWARD_LABEL } ||
                    AccessFlags.STATIC.isSet(m.accessFlags) && params == listOf("I", "I", list, list) && m.returnType == "V" ||
                    m.name == "getParentActivity" && params.isEmpty() ||
                    m.controlBody().map { it.controlRef() }.let { IS_PREMIUM in it && FORWARDS in it && NAME_HIDE in it }
            }
            val hosts = (FixtureDex.classes(build, fixed).values + found).distinctBy { it.type }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveMessageMenu()
            assertEquals("$name: Forward is option 2", 2, site.forwardOption)
            assertEquals("$name: articles are type 36", 36, site.article)
            val oldFill = ImmutableMethod.of(site.fill)
            val oldChoose = ImmutableMethod.of(site.choose)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            // The builder: the call sits where its one return was, and every branch to that return lands on the call.
            val before = oldFill.controlBody()
            val after = site.fill.controlBody()
            val end = before.size - 1
            val top = site.fill.implementation!!.registerCount
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[end].opcode)
            assertEquals(FILL, after[end].controlRef())
            assertEquals("$name: the chat and the four arguments", (top - 5 until top).toList(), after[end].namedRegisters())
            assertEquals(Opcode.RETURN_VOID, after[end + 1].opcode)
            for (i in 0 until end) assertEquals("$name: stock $i", before[i].shape(), after[i].shape())
            val oldFlow = ControlFlow.of(oldFill)
            val newFlow = ControlFlow.of(site.fill)
            val into = { flow: ControlFlow, at: Int -> flow.normal.indices.filter { at in flow.normal[it] } }
            assertEquals("$name: the branches land on the call", into(oldFlow, end), into(newFlow, end))
            assertEquals("$name: the return follows the call", listOf(end), into(newFlow, end + 1))

            // The choice handler: the call first, Telegram's own code after it. The padding nop
            // before its switch tables comes and goes with the call's length, so it isn't compared.
            val stock = oldChoose.controlBody().filter { it.opcode != Opcode.NOP }
            val chosen = site.choose.controlBody().filter { it.opcode != Opcode.NOP }
            val chooseTop = site.choose.implementation!!.registerCount
            assertEquals(stock.size + 1, chosen.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, chosen[0].opcode)
            assertEquals(CHOSEN, chosen[0].controlRef())
            assertEquals("$name: the chat and the number", listOf(chooseTop - 2, chooseTop - 1), chosen[0].namedRegisters())
            for (i in stock.indices) assertEquals("$name: stock choice $i", stock[i].shape(), chosen[i + 1].shape())

            val stub = { n: String -> context.mutableClassDefBy(MESSAGE_MENU).methods.single { it.name == n }.controlBody() }
            assertTrue("$name: the selected message", stub("selected").any { it.controlRef() == site.selected.toString() })
            assertTrue("$name: the selected album", stub("grouped").any { it.controlRef() == site.group.toString() })
            val send = stub("send").single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            assertEquals("$name: Telegram's forward into the open chat", signature(site.forward), send.controlRef())
            assertEquals((0..7).toList(), send.namedRegisters())
            assertEquals("$name: sender hidden", 1, (stub("send")[3] as NarrowLiteralInstruction).narrowLiteral)
            assertTrue("$name: forward sends through the helper", site.forward.controlBody().any { it.controlRef() == FORWARD_SEND })
            assertTrue("$name: the chat's activity", stub("activity").any { it.controlRef()?.contains("->getParentActivity()Landroid/app/Activity;") == true })
            assertEquals(2, (stub("forwardOption").first() as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(36, (stub("article").first() as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_retry:I", stub("repeatIcon").first().controlRef())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_copy:I", stub("copyIcon").first().controlRef())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_info:I", stub("detailsIcon").first().controlRef())
            assertEquals("$name: the file provider Share uses", "Landroidx/core/content/FileProvider;", site.provider.substringBefore("->"))
            assertEquals(listOf(APPLICATION_ID, site.provider), stub("uri").filter { it.opcode == Opcode.INVOKE_STATIC }.map { it.controlRef() })
            assertTrue("$name: Telegram's downloaded copy", stub("photoFile").any { it.controlRef() == "Lorg/telegram/messenger/FileLoader;->getPathToMessage(Lorg/telegram/tgnet/TLRPC\$Message;)Ljava/io/File;" })
            assertTrue("$name: no photo behind the age filter", stub("photo").any { it.controlRef() == "Lorg/telegram/messenger/MessageObject;->isHiddenSensitive()Z" })
            assertTrue("$name: secret chats refused", stub("canSend").any { it.controlRef() == "Lorg/telegram/messenger/DialogObject;->isEncryptedDialog(J)Z" })
            assertTrue("$name: the chat's own send rights", stub("canSend").any { it.controlRef()?.endsWith("->canSendMessages(Lorg/telegram/tgnet/TLRPC\$Chat;)Z") == true })
            assertTrue("$name: paid media refused", stub("blocked").any { it.controlRef() == "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;" })
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }
}
