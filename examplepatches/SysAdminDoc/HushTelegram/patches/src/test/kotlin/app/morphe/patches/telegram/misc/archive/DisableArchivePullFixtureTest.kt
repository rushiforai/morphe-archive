/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.archive

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.util.names.origRef
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy

/** hasHiddenArchive, the archive row's sort, the chat list's menu, the stubs and the runtime. */
class DisableArchivePullFixtureTest {
    @Test fun `a hidden archive stays out of the list and the menu opens it`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val kept = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, ARCHIVE_HIDDEN, SELECTED_ACCOUNT, ARCHIVED_CHATS, ARCHIVE_ICON)
                .map { it.substringBefore("->") }.toSet()).values
            val chats = FixtureDex.classesWhere(build, { true }) { m -> m.handsMenuToAppBuild() }
            // 13.2 inlines hasHiddenArchive, so its callers come along.
            val readers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == ARCHIVE_HIDDEN } }
            val context = PatchContexts.of(ExtensionDex.classes() + (kept + chats + readers).distinctBy { it.type }.map(ImmutableClassDef::of))
            val sites = context.resolveDisableArchivePull()
            val hidden = sites.hidden?.let { ImmutableMethod.of(it).controlBody() }
            val inlined = sites.inlined.map { (method, at) -> Triple(method, at, ImmutableMethod.of(method).controlBody()) }
            assertTrue("$name: hasHiddenArchive itself, or both of 13.1.1's callers where it's inlined",
                hidden != null && inlined.isEmpty() || hidden == null && inlined.size == 2)
            val folder = ImmutableMethod.of(sites.folder).controlBody()
            val menu = ImmutableMethod.of(sites.menu).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { disableArchivePullPatch.execute(context) })

            // hasHiddenArchive answers no on a yes, and runs as before on a no.
            if (hidden != null) {
                val hiddenAfter = sites.hidden!!.controlBody()
                assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), hiddenAfter.take(5).map { it.opcode })
                assertEquals(KEEPS_OUT, hiddenAfter[0].controlRef())
                assertStock("$name hasHiddenArchive", hidden, hiddenAfter.drop(5))
            }

            // Inlined, a set hidden flag is cleared on a yes, and a clear one goes straight to Telegram's test.
            for ((method, at, before) in inlined) {
                val where = "$name ${method.definingClass}->${method.name} at $at"
                val after = method.controlBody()
                val flag = before[at].namedRegisters().single()
                assertEquals(where, ARCHIVE_HIDDEN, after[at].controlRef())
                assertEquals(where, listOf(Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.XOR_INT_LIT8), after.subList(at + 1, at + 5).map { it.opcode })
                assertEquals("$where: a clear flag skips the runtime", listOf(flag), after[at + 1].namedRegisters())
                assertEquals(where, KEEPS_OUT, after[at + 2].controlRef())
                assertEquals("$where: its answer", listOf(flag), after[at + 3].namedRegisters())
                assertEquals("$where: turned over into the flag", listOf(flag, flag), after[at + 4].namedRegisters())
                assertEquals("$where: by one", 1, (after[at + 4] as NarrowLiteralInstruction).narrowLiteral)
                val flow = ControlFlow.of(method)
                assertEquals("$where: to Telegram's own test", setOf(at + 2, at + 5), flow.normal[at + 1].toSet())
                assertTrue("$where: nothing else lands in the hook", after.indices.none { it !in at + 1..at + 3 && flow.normal[it].any { t -> t in at + 2..at + 4 } })
                assertStock("$where head", before.take(at + 1), after.take(at + 1))
                assertStock("$where tail", before.drop(at + 1), after.drop(at + 5))
            }

            // Only the archive's own row asks, and a yes files nothing.
            val dialog = sites.folder.parameterRegisterNumber(1)
            val folderAfter = sites.folder.controlBody()
            assertEquals(listOf(Opcode.INSTANCE_OF, Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                folderAfter.take(6).map { it.opcode })
            assertEquals(DIALOG_FOLDER, folderAfter[0].controlRef())
            assertEquals("$name: the dialog asks", listOf(0, dialog), folderAfter[0].namedRegisters())
            assertEquals(LEAVES_OUT, folderAfter[2].controlRef())
            assertStock("$name addDialogToItsFolder", folder, folderAfter.drop(6))

            // The menu and the chat list reach the extension just before the app build's entries.
            val at = sites.menuIndex
            val menuAfter = sites.menu.controlBody()
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC), menuAfter.subList(at, at + 3).map { it.opcode })
            val (copy, self) = menuAfter[at + 2].namedRegisters()
            assertEquals("$name: the menu", listOf(copy, sites.options), menuAfter[at].namedRegisters())
            assertEquals("$name: the chat list", listOf(self, sites.menu.localRegisterCount()), menuAfter[at + 1].namedRegisters())
            assertEquals(ARCHIVE_MENU, menuAfter[at + 2].controlRef())
            assertEquals("$name: the app build's entries follow", "$APPLICATION_LOADER->applicationLoaderInstance:$APPLICATION_LOADER", menuAfter[at + 3].controlRef())
            assertStock("$name menu head", menu.take(at), menuAfter.take(at))
            assertStock("$name menu tail", menu.drop(at), menuAfter.drop(at + 3))

            val stub = { n: String -> context.tgMutableClassDefBy(ARCHIVE_PULL).methods.single { it.origName == n }.controlBody() }
            assertEquals(ARCHIVE_HIDDEN, stub("hidden").first().controlRef())
            assertTrue("$name: the archive folder lookup", stub("archived").any { it.controlRef() == "${sites.lookup.definingClass}->${sites.lookup.name}(J)Ljava/lang/Object;" })
            val add = stub("add")
            assertTrue("$name: the Archived chats text and icon", listOf(ARCHIVED_CHATS, ARCHIVE_ICON).all { wanted -> add.any { it.controlRef() == wanted } })
            assertEquals("$name: the menu's own add", sites.add.toString(), add.single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            val open = stub("open")
            assertTrue("$name: a chat list for the archive", open.any { it.controlRef() == "${sites.chats}-><init>(Landroid/os/Bundle;)V" })
            assertEquals("$name: shown over this one", sites.present.toString(), open.last { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())

            val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "disableArchivePull" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun assertStock(what: String, before: List<Instruction>, after: List<Instruction>) {
        assertEquals("$what: length", before.size, after.size)
        for (i in before.indices) {
            assertEquals("$what: stock $i", listOf(kind(before[i].opcode), before[i].namedRegisters(), before[i].origRef()),
                listOf(kind(after[i].opcode), after[i].namedRegisters(), after[i].origRef()))
        }
    }

    /** A hook can push a branch past a plain goto's reach, and dexlib2 widens it. */
    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode
}
