/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.util.names.origParameterTypes
import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.channelbar.commerceReads
import app.morphe.patches.telegram.misc.commerce.COMMERCE
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.forward.FORWARDS
import app.morphe.patches.telegram.misc.forward.IS_PREMIUM
import app.morphe.patches.telegram.misc.forward.NAME_HIDE
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefBy

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
        "Lorg/telegram/messenger/SendMessagesHelper;", "Lorg/telegram/messenger/AccountInstance;", "Lorg/telegram/tgnet/TLRPC\$Dialog;", "Lorg/telegram/tgnet/TLRPC\$Chat;",
        "Lorg/telegram/messenger/LocaleController;", "Lorg/telegram/messenger/R\$string;",
        "Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/messenger/ImageLocation;", "Lorg/telegram/messenger/NotificationCenter;",
    )

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())
    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    internal fun hosts(build: File): List<ClassDef> = baseHosts(build).let { it + selectBetweenHosts(build, it) }.let { it + hideForMeHosts(build, it) }
        .let { it + sharedMediaSelectAllHosts(build, it) }

    private fun baseHosts(build: File): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { m ->
            val params = m.origParameterTypes
            params == listOf("Lorg/telegram/messenger/MessageObject;", list, list, list) && m.controlBody().any { it.controlRef() == FORWARD_LABEL } ||
                AccessFlags.STATIC.isSet(m.accessFlags) && params == listOf("I", "I", list, list) && m.origReturnType == "V" ||
                // 13.2's label helper also takes the icon and returns it boxed.
                AccessFlags.STATIC.isSet(m.accessFlags) && params == listOf("I", list, "I", list, "I") && m.origReturnType == "Ljava/lang/Integer;" ||
                m.origName == "getParentActivity" && params.isEmpty() || m.isSelectionCanCopy() || m.isStorySaveMenu() || m.isScreenshotSlice() ||
                m.controlBody().map { it.controlRef() }.let { IS_PREMIUM in it && FORWARDS in it && NAME_HIDE in it }
        }
        return (FixtureDex.classes(build, fixed).values + found).distinctBy { it.type }.map(ImmutableClassDef::of)
    }

    @Test fun `the menu gains its items as it returns and the extension answers its own numbers first`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
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

            val stub = { n: String -> context.tgMutableClassDefBy(MESSAGE_MENU).methods.single { it.origName == n }.controlBody() }
            // Build names on both sides: the site holds the build's own field references.
            assertTrue("$name: the selected message", stub("selected").any { (it as? ReferenceInstruction)?.reference?.toString() == site.selected.toString() })
            assertTrue("$name: the selected album", stub("grouped").any { (it as? ReferenceInstruction)?.reference?.toString() == site.group.toString() })
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
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_forward:I", stub("quickIcon").first().controlRef())

            // Quick forward: the chat list, a chat's rights and name, and Telegram's own forward with the sender left shown.
            // 13.2 has no short overload, so the full one gets what the short one passed it.
            val sendHelper = FORWARD_SEND
            val forwardTo = stub("forwardTo")
            val quick = forwardTo.single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            assertEquals("$name: Telegram's own forward into a chat", sendHelper, quick.controlRef())
            assertEquals((0..15).toList(), quick.namedRegisters())
            assertEquals("$name: caption kept, notify on, no schedule, repeat, topic or suggestion, no video start, no stars or monoforum",
                listOf(0L, 1L, 0L, 0L, 0L, -1L, 0L, 0L, 0L),
                forwardTo.filter { it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_WIDE_16 }.map { (it as WideLiteralInstruction).wideLiteral })
            // Fast forward: the same send with both flags read from the stub's own arguments (sender p4, caption p5).
            val tools = context.tgMutableClassDefBy(MESSAGE_MENU_TOOLS).methods.single { it.origName == "forwardWith" }
            val toolsBody = tools.controlBody()
            val fast = toolsBody.single { it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
            assertEquals("$name: Telegram's own forward with both flags", sendHelper, fast.controlRef())
            assertEquals((0..15).toList(), fast.namedRegisters())
            assertEquals("$name: twenty-two registers, the last argument in the last", 22, tools.implementation!!.registerCount)
            val flags = toolsBody.filter { it.opcode == Opcode.MOVE_FROM16 }.map { it as TwoRegisterInstruction }.map { it.registerA to it.registerB }
            assertEquals("$name: sender into the forward-from-my-name slot, caption into the hide-caption slot", listOf(4 to 20, 5 to 21), flags)
            assertEquals("$name: the full forward's defaults", listOf(1L, 0L, 0L, 0L, -1L, 0L, 0L, 0L),
                toolsBody.filter { it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_WIDE_16 }.map { (it as WideLiteralInstruction).wideLiteral })
            // Save video cover, Save album art and Clear from cache: Telegram's own calls, nothing else.
            fun tool(method: String) = context.tgMutableClassDefBy(MESSAGE_MENU_TOOLS).methods.single { it.origName == method }.controlBody().mapNotNull { it.controlRef() }
            val fileLoader = "Lorg/telegram/messenger/FileLoader;"
            assertTrue("$name: video test", tool("video").contains("Lorg/telegram/messenger/MessageObject;->isVideo()Z"))
            assertTrue("$name: music test", tool("music").contains("Lorg/telegram/messenger/MessageObject;->isMusic()Z"))
            assertTrue("$name: the cover's sizes", tool("thumbs").contains("Lorg/telegram/tgnet/TLRPC\$MessageMedia;->video_cover:Lorg/telegram/tgnet/TLRPC\$Photo;"))
            assertTrue("$name: the video's thumbnails", tool("thumbs").contains("Lorg/telegram/tgnet/TLRPC\$Document;->thumbs:Ljava/util/ArrayList;"))
            assertTrue("$name: Telegram's file for a size", tool("thumbFile").contains("$fileLoader->getPathToAttach(Lorg/telegram/tgnet/TLObject;Z)Ljava/io/File;"))
            assertTrue("$name: Telegram's own fetch", tool("thumbLoad").contains("$fileLoader->loadFile(Lorg/telegram/messenger/ImageLocation;Ljava/lang/Object;Ljava/lang/String;II)V"))
            assertTrue("$name: Telegram's file name", tool("attachName").contains("$fileLoader->getAttachFileName(Lorg/telegram/tgnet/TLObject;)Ljava/lang/String;"))
            assertTrue("$name: Telegram's own cancel", tool("cancelLoad").contains("$fileLoader->cancelLoadFile(Lorg/telegram/tgnet/TLRPC\$Document;)V"))
            assertTrue("$name: Telegram's folders", tool("directory").contains("$fileLoader->getDirectory(I)Ljava/io/File;"))
            assertTrue("$name: the cell is told", tool("refreshMedia").contains("Lorg/telegram/messenger/MessageObject;->checkMediaExistance()V"))
            assertTrue("$name: Save icon", tool("saveIcon").contains("Lorg/telegram/messenger/R\$drawable;->msg_download:I"))
            assertTrue("$name: Delete icon", tool("deleteIcon").contains("Lorg/telegram/messenger/R\$drawable;->msg_delete:I"))
            // Play's 13.2 inlined the getter, so there the stub reads its field.
            assertTrue("$name: Telegram's chat list", stub("dialogs").any { it.controlRef()?.endsWith("->getAllDialogs()Ljava/util/ArrayList;") == true ||
                it.opcode == Opcode.IGET_OBJECT && it.controlRef() == "Lorg/telegram/messenger/MessagesController;->allDialogs:Ljava/util/ArrayList;" })
            assertTrue("$name: a chat list entry's ID", stub("dialogId").any { it.controlRef() == "Lorg/telegram/tgnet/TLRPC\$Dialog;->id:J" })
            assertTrue("$name: your own ID", stub("selfId").any { it.controlRef()?.endsWith("->getClientUserId()J") == true })
            assertTrue("$name: secret chats refused", stub("secret").any { it.controlRef() == "Lorg/telegram/messenger/DialogObject;->isEncryptedDialog(J)Z" })
            assertTrue("$name: forums skipped", stub("reachable").any { it.controlRef()?.endsWith("->isForum(Lorg/telegram/tgnet/TLRPC\$Chat;)Z") == true })
            assertTrue("$name: the chat's own send rights", stub("reachable").any { it.controlRef()?.endsWith("->canSendMessages(Lorg/telegram/tgnet/TLRPC\$Chat;)Z") == true })
            assertTrue("$name: Saved Messages named by Telegram", stub("title").any { it.controlRef() == "Lorg/telegram/messenger/R\$string;->SavedMessages:I" })
            assertEquals("$name: the file provider Share uses", "Landroidx/core/content/FileProvider;", site.provider.substringBefore("->"))
            // 13.2 loads the joined authority as one string, which the stub passes the same way.
            val joined = site.authority == null
            assertEquals(if (joined) listOf(APPLICATION_ID, site.provider) else listOf(site.provider), stub("uri").filter { it.opcode == Opcode.INVOKE_STATIC }.map { it.controlRef() })
            if (!joined) {
                val share = site.choose.controlBody()
                assertTrue("$name: Telegram's Share loads ${site.authority}", share.any { it.controlString() == site.authority })
                assertEquals("$name: the stub's authority", site.authority, stub("uri").first().controlString())
            }
            assertTrue("$name: Telegram's downloaded copy", stub("photoFile").any { it.controlRef() == "Lorg/telegram/messenger/FileLoader;->getPathToMessage(Lorg/telegram/tgnet/TLRPC\$Message;)Ljava/io/File;" })
            assertTrue("$name: no photo behind the age filter", stub("photo").any { it.controlRef() == "Lorg/telegram/messenger/MessageObject;->isHiddenSensitive()Z" })
            assertTrue("$name: secret chats refused", stub("canSend").any { it.controlRef() == "Lorg/telegram/messenger/DialogObject;->isEncryptedDialog(J)Z" })
            assertTrue("$name: the chat's own send rights", stub("canSend").any { it.controlRef()?.endsWith("->canSendMessages(Lorg/telegram/tgnet/TLRPC\$Chat;)Z") == true })
            assertTrue("$name: paid media refused", stub("blocked").any { it.controlRef() == "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;" })
            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "messageMenuRepeat" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    /** Hide Premium, gifts and Stars asks before the Gram transfer's Send Gram, in the same builder. */
    @Test fun `the message menu and the Gram transfer Send Gram hook share the builder in either order`() {
        for (build in Fixtures.declaredBuilds()) for (commerceFirst in listOf(true, false)) {
            val context = PatchContexts.of(ExtensionDex.classes() + commerceReads(build, hosts(build)))
            val fill = context.resolveMessageMenu().fill
            val stock = ImmutableMethod.of(fill).controlBody()
            for (patch in if (commerceFirst) listOf(hideCommercePatch, messageMenuPatch) else listOf(messageMenuPatch, hideCommercePatch)) {
                val warnings = PatchLogCapture.warnings { patch.execute(context) }
                // Only the chat's classes are loaded, so Hide commerce reports its other places missing.
                if (patch == messageMenuPatch) assertEquals(emptyList<String>(), warnings)
                else assertTrue("${build.name}: $warnings", warnings.none { "commerceTransferSendGram" in it })
            }
            val after = fill.controlBody()
            assertEquals("${build.name}: both hooks and nothing else", stock.size + 3, after.size)
            assertEquals(1, after.count { it.controlRef() == "$COMMERCE->showTransferSendGram(Z)Z" })
            assertEquals("${build.name}: the menu's call still comes last", FILL, after[after.size - 2].controlRef())
            assertEquals(Opcode.RETURN_VOID, after.last().opcode)
            for (flag in listOf("messageMenuRepeat", "commerceTransferSendGram")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("${build.name}: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }
}
