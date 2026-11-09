/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origInterfaces
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType

/** The copy and paste hooks of Strip link tracking, on the real pinned web and Play builds. */
class LinkCopyPasteFixtureTest {
    @Test fun `copy and both paste editors get one hook each and stock code stays behind it`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + copyPasteHosts(build))
            val sites = context.resolveCopyPaste()
            assertEquals("${build.name}: the message box and caption editors", 2, sites.pastes.size)
            val copyBefore = sites.copy.controlBody().map { it.opcode to it.controlRef() }
            val pasteBefore = sites.pastes.map { site -> site.controlBody().map { it.opcode to it.controlRef() } }
            sites.insert()
            val copyAfter = sites.copy.controlBody().filter { it.opcode != Opcode.NOP }.map { it.opcode to it.controlRef() }
            assertEquals(Opcode.INVOKE_STATIC to COPIED_LINK, copyAfter[0])
            assertEquals(Opcode.MOVE_RESULT_OBJECT, copyAfter[1].first)
            assertEquals("${build.name}: copy keeps its stock body", copyBefore.filter { it.first != Opcode.NOP }, copyAfter.drop(2))
            sites.pastes.forEachIndexed { at, site ->
                val after = site.controlBody().filter { it.opcode != Opcode.NOP }.map { it.opcode to it.controlRef() }
                assertEquals(Opcode.INVOKE_STATIC to WATCH_PASTE, after[0])
                assertEquals("${build.name}: paste editor $at keeps its stock body",
                    pasteBefore[at].filter { it.first != Opcode.NOP }, after.drop(1))
            }
        }
    }
}

/** Telegram's clipboard copy and both paste editors, with their Telegram ancestors. */
internal fun copyPasteHosts(build: File): List<ClassDef> {
    val found = FixtureDex.classesWhere(build, { true }) { method: Method ->
        method.origName == "onTextContextMenuItem" ||
            (method.origDefiningClass == "Lorg/telegram/messenger/AndroidUtilities;" && method.origName == "addToClipboard")
    }.associateByTo(linkedMapOf()) { it.origType }
    while (true) {
        val ancestors = found.values.flatMap { listOfNotNull(it.origSuperclass) + it.origInterfaces }
            .filter { it.startsWith("Lorg/telegram/") && it !in found }.toSet()
        if (ancestors.isEmpty()) break
        val more = FixtureDex.classes(build, ancestors)
        assertEquals("${build.name}: declared Telegram ancestor classes", ancestors, more.keys)
        found.putAll(more)
    }
    assertTrue(found.containsKey("Lorg/telegram/messenger/AndroidUtilities;"))
    return found.values.map(ImmutableClassDef::of)
}
