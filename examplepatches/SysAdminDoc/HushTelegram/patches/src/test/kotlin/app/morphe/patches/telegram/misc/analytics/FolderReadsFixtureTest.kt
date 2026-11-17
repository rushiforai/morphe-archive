/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.analytics

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.loadsInt
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File
import java.util.concurrent.ConcurrentHashMap

private const val MARK_ALL_READ = "Lorg/telegram/messenger/R\$string;->MarkAllAsRead:I"
private const val MARK_READ_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_markread:I"
private val FOLDER_READS_HOST_CACHE = ConcurrentHashMap<String, List<ClassDef>>()

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * The slice Send read receipts in a folder tab's menu needs from [build] (#65): every class that loads
 * the Mark all as read label, and the menu class Telegram adds it with. A test that runs Disable
 * analytics and expects nothing to warn about adds these, or the patch says Ghost mode goes on
 * without the item.
 */
internal fun folderReadsHosts(build: File): List<ClassDef> = FOLDER_READS_HOST_CACHE.hostsOf(build.path) {
    val labels = FixtureDex.classesWhere(build, { true }) { method ->
        method.code().any { it.loadsInt() && it.origRef() == MARK_ALL_READ }
    }
    // The class whose adder takes the item right after the mark-as-read icon loads.
    val options = labels.flatMap { it.methods }.flatMap { method ->
        val code = method.code()
        code.indices.filter { it > 0 && code[it - 1].loadsInt() && code[it - 1].origRef() == MARK_READ_ICON &&
            code[it].opcode == Opcode.INVOKE_VIRTUAL }.mapNotNull { code[it].call()?.definingClass }
    }.toSet()
    (labels + FixtureDex.classes(build, options).values).distinctBy { it.type }
}

/** Send read receipts right under Mark all as read in a folder tab's long-press menu (#65). */
class FolderReadsFixtureTest {
    private val tabMenu = "$FOLDER_READS->tabMenu(Ljava/lang/Object;)V"

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), origRef())

    @Test fun `the menu asks the extension right after Mark all as read and the stub adds with Telegram's own adder`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + folderReadsHosts(build))
            val site = context.resolveFolderReads()
            val before = ImmutableMethod.of(site.menu).controlBody()
            val add = before[site.at - 1]
            assertEquals("$name: the add right before is Mark all as read's", MARK_READ_ICON, before[site.at - 2].origRef())
            assertEquals("$name: the menu is the adder's first register", site.options, add.namedRegisters()[0])
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { context.installFolderReads(site) })

            val after = site.menu.controlBody()
            assertEquals("$name: one instruction", before.size + 1, after.size)
            assertEquals(tabMenu, after[site.at].controlRef())
            assertEquals("$name: the menu", listOf(site.options), after[site.at].namedRegisters())
            for (i in before.indices) assertEquals("$name: stock menu $i", before[i].shape(), after[if (i < site.at) i else i + 1].shape())

            val stub = context.tgMutableClassDefBy(FOLDER_READS).methods.single { it.origName == "addItem" }.controlBody()
            assertEquals("$name: Telegram's own adder", site.adder.toString(),
                stub.single { it.opcode == Opcode.INVOKE_VIRTUAL }.call().toString())
            assertEquals("$name: the menu's class", site.adder.definingClass,
                (stub.single { it.opcode == Opcode.CHECK_CAST } as ReferenceInstruction).reference.toString())
        }
    }

    /** Disable analytics puts the item in with nothing to warn about, once. */
    @Test fun `the whole patch adds the item once`() {
        for (build in Fixtures.declaredBuilds()) {
            val metrics = FixtureDex.classesWhere(build, { true }) { method ->
                method.code().any { it.opcode == Opcode.NEW_INSTANCE && it.origRef() == REPORT_READ_METRICS }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + (metrics + ghostModeHosts(build) + readsMenuHosts(build) +
                folderReadsHosts(build)).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { disableAnalyticsPatch.execute(context) }
            assertEquals(build.name, emptyList<String>(), warnings.filter { "folder tab" in it })
            val calls = folderReadsHosts(build).flatMap { context.tgMutableClassDefBy(it.type).methods }
                .flatMap { it.controlBody() }.count { it.controlRef() == tabMenu }
            assertEquals(build.name, 1, calls)
        }
    }
}
