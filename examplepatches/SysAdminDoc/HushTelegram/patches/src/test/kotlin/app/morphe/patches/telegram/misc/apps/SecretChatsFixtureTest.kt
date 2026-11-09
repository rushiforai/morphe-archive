/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** Disable secret chats on the pinned builds: the check sits at the top of the one update entry and stock follows whole. */
class SecretChatsFixtureTest {
    private fun contextFor(build: java.io.File) = PatchContexts.of(
        (ExtensionDex.classes() + FixtureDex.classes(build, setOf(SECRET_HELPER)).values).distinctBy { it.type })

    private fun entry(context: app.morphe.patcher.patch.BytecodePatchContext) =
        context.tgMutableClassDefBy(SECRET_HELPER).methods.single { it.origName == "processUpdateEncryption" }

    @Test fun `the check goes in front of the secret chat update and the stock body follows unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = contextFor(build)
            val before = entry(context).implementation!!.instructions.map { it.opcode }
            val site = context.resolveSecretChats()
            site.apply()
            val after = entry(context).implementation!!.instructions.filter { it.opcode != Opcode.NOP }
            val refs = after.map { it.origRef() }
            assertEquals("$where: iget of the chat first", Opcode.IGET_OBJECT, after[0].opcode)
            assertEquals("$where: instance-of", Opcode.INSTANCE_OF, after[1].opcode)
            assertTrue("$where: asks the extension", refs.contains(SECRET_REFUSE))
            assertEquals("$where: returns when told to ignore", Opcode.RETURN_VOID, after[6].opcode)
            assertEquals("$where: stock body whole below the check", before.filter { it != Opcode.NOP }, after.drop(6 + 1).map { it.opcode })
        }
    }

    @Test fun `the whole patch lights the secret chats row on both builds`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + popularAppsOwners(build) + myChatsSearchHosts(build) +
                nameFoldHosts(build) + newChatsHosts(build) + FixtureDex.classes(build, setOf(SECRET_HELPER)).values).distinctBy { it.type })
            hidePopularAppsPatch.execute(context)
            val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "disableSecretChats" }.implementation!!.instructions.toList()
            assertEquals("$where: on", 1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
            assertNotNull(where, entry(context))
            assertTrue("$where: hooked", entry(context).implementation!!.instructions.any {
                it.origRef() == SECRET_REFUSE })
        }
    }
}
