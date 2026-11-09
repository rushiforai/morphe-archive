/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

/** Both pinned builds' MessagesController and Chat, which the Administrators stub reads. */
class AdminChatsFixtureTest {
    private fun hosts(build: File) = (ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type }

    @Test fun `the administrators stub asks Telegram for the chat and reads creator and admin rights`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            context.requireAdminChatsRuntime()
            context.writeAdminChatsStubs()
            val classDef = context.tgMutableClassDefBy(ADMIN_CHATS)
            val body = classDef.methods.single { it.origName == "isAdmin" }.implementation!!.instructions
                .filter { it.opcode != Opcode.NOP }.toList()
            val refs = body.filterIsInstance<ReferenceInstruction>().map { it.reference.origString() }
            assertEquals(
                "$name: cast, valueOf, getChat, creator, admin rights",
                listOf(MESSAGES_CONTROLLER, "Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;", GET_CHAT, CHAT_CREATOR, CHAT_ADMIN_RIGHTS),
                refs.take(5),
            )
            assertEquals("$name: ends in the two answers", listOf(Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN), body.takeLast(4).map { it.opcode })
        }
    }
}
