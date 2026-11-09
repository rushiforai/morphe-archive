/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

/** Both pinned builds' dialog classes, which the date order's two stubs read. */
class ChatSortFixtureTest {
    private fun hosts(build: File) = (ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type }

    @Test fun `the date order reads a chat's last message date and tells the archive row apart`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(hosts(build))
            context.requireChatSortRuntime()
            context.writeChatSortStubs()
            val classDef = context.tgMutableClassDefBy(CHAT_SORT)
            fun body(method: String) = classDef.methods.single { it.origName == method }.implementation!!.instructions.toList()

            val date = body("lastDate")
            assertEquals("$name: cast, read, return", listOf(Opcode.CHECK_CAST, Opcode.IGET, Opcode.RETURN), date.map { it.opcode })
            assertEquals("$name: the dialog's last_message_date", DIALOG_LAST_DATE, (date[1] as ReferenceInstruction).reference.origString())

            val folder = body("isFolder")
            assertEquals("$name: type test, return", listOf(Opcode.INSTANCE_OF, Opcode.RETURN), folder.map { it.opcode })
            assertEquals("$name: the archive's row", ARCHIVE_ROW, (folder[0] as ReferenceInstruction).reference.origString())
            assertTrue("$name: no other stub changed", context.tgMutableClassDefBy(CHAT_SORT).methods.count { it.origName in setOf("lastDate", "isFolder") } == 2)
        }
    }
}
