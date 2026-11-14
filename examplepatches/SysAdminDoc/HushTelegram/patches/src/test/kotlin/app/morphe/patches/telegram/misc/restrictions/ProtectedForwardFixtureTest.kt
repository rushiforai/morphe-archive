/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.patches.telegram.misc.messagemenu.copyCall
import app.morphe.util.namedRegisters
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Telegram's forward hands its messages to the extension first, and the video send the stub calls is the right one. */
class ProtectedForwardFixtureTest {
    private val helper = "Lorg/telegram/messenger/SendMessagesHelper;"

    @Test fun `every forward asks the extension which messages Telegram still forwards in every declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = FixtureDex.classes(build, setOf("Lorg/telegram/messenger/MessagesController;") + FORWARD_HOSTS).values
            val storyOwners = FixtureDex.classesWhere(build, { true }) { it.isStoryCheck() }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts + storyOwners + bannedAlertHosts(build) +
                forwardGateOwners(build)).distinctBy { it.type })
            val forwardName = FORWARD_SEND.substringAfter("->")
            fun forward() = context.tgMutableClassDefBy(helper).methods.single { "${it.origName}${it.origDescriptor}" == forwardName }
            val before = ImmutableMethod.of(forward()).implementation!!.instructions.toList()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { bypassChannelRestrictionsPatch.execute(context) })

            val method = forward()
            val body = method.implementation!!.instructions.toList()
            val list = method.localRegisterCount() + 1
            assertEquals("$name: the list", listOf(Opcode.MOVE_OBJECT_FROM16, listOf(0, list)), listOf(body[0].opcode, body[0].namedRegisters()))
            assertEquals("$name: the chat", listOf(Opcode.MOVE_WIDE_FROM16, listOf(1, list + 1)), listOf(body[1].opcode, body[1].namedRegisters()))
            assertEquals("$name: asks the extension", HELD, body[2].origRef())
            assertEquals(listOf(0, 1, 2), body[2].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, body[3].opcode)
            assertEquals("$name: nothing left answers sent", listOf(Opcode.IF_NEZ, Opcode.CONST_4, Opcode.RETURN), body.subList(4, 7).map { it.opcode })
            assertEquals("$name: the rest goes on as the list", listOf(Opcode.MOVE_OBJECT_16, listOf(list, 0)), listOf(body[7].opcode, body[7].namedRegisters()))
            assertEquals("$name: then Telegram's own forward", before.map { it.opcode }, body.drop(8).map { it.opcode })

            // The video stub fills the chat, the path, the caption and the sound flag where the send reads them.
            val site = context.resolveProtectedForward()
            val video = site.video.method
            assertTrue("$name: the video send is static", AccessFlags.STATIC.isSet(video.accessFlags))
            val (smali, registers) = copyCall(site.video, 5, VIDEO_ACCOUNT)
            assertEquals("$name: registers", 28 + 5, registers)
            for (line in listOf(
                "move-wide/from16 v3, p1",
                "move-object/from16 v11, p4",
                "move-object/from16 v12, p3",
                "invoke-static/range {p0 .. p0}, Lorg/telegram/messenger/AccountInstance;->getInstance(I)Lorg/telegram/messenger/AccountInstance;\nmove-result-object v15",
                "const/16 v25, 0x1",
                "const/16 v26, 0x0",
                "const-wide/16 v5, 0x0",
            )) assertTrue("$name: $line in\n$smali", smali.contains(line))
            val params = video.origParameterTypes
            assertEquals("$name: the path is the string the send checks first", "Ljava/lang/String;", params[8])
            val translated = TelegramNames.of(context).translate(smali, context)
            assertTrue("$name: calls the build's own video send",
                translated.contains("->${video.name}(${video.parameterTypes.joinToString("")})V"))

            fun calls(stub: String) = context.tgMutableClassDefBy(PROTECTED_FORWARD).methods.single { it.origName == stub }
                .implementation!!.instructions.mapNotNull { it.origRef() }
            assertTrue("$name: load starts the document's download",
                "Lorg/telegram/messenger/FileLoader;->loadFile(Lorg/telegram/tgnet/TLRPC\$Document;Ljava/lang/Object;II)V" in calls("load"))
            assertTrue("$name: restricted asks the chat", "Lorg/telegram/messenger/MessagesController;->isPeerNoForwards(J)Z" in calls("restricted"))
            assertTrue("$name: secret asks Telegram", "Lorg/telegram/messenger/DialogObject;->isEncryptedDialog(J)Z" in calls("secret"))
            for ((stub, send) in listOf("sendText" to site.text, "sendPhoto" to site.photo, "sendVideo" to site.video, "sendFile" to site.document)) {
                assertTrue("$name: $stub sends", calls(stub).any { it.startsWith("$helper->${send.method.origName}(") })
            }
        }
    }
}
