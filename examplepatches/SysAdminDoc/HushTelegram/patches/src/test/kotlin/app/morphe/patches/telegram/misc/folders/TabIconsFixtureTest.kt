/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_ALWAYS
import app.morphe.patches.telegram.misc.chattypefolders.LOCAL_FLAGS
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/** The folder tab icons: where the strip makes a tab, and where a tab takes a new title. */
class TabIconsFixtureTest {
    @Test fun `each tab's title takes its icon and the title check reads it without`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of((ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type })
            context.requireLaunchFolderRuntime()
            context.requireTabIconsRuntime()
            val strip = context.resolveLaunchFolder().refs!!.tabs.substringBefore("->")
            val plan = context.resolveTabIcons(strip)
            assertNull("$name: ${plan.missing}", plan.missing)
            val edited = plan.edits.map { it.method }.distinct()
            val stock = edited.associateWith { method -> method.body().map(::operands) }
            context.writeTabIconsStubs(plan)
            plan.apply()

            // Right before each tab is made, its title goes through the extension with the tab's id.
            var made = 0
            for (method in context.tgMutableClassDefBy(strip).methods) {
                val body = method.body()
                body.forEachIndexed { at, instruction ->
                    if (instruction.opcode != Opcode.INVOKE_DIRECT || instruction.ref()?.startsWith("${plan.tab}-><init>($strip") != true) return@forEachIndexed
                    val (_, _, id, title) = instruction.namedRegisters()
                    val call = body.subList(0, at).indexOfLast { it.ref() == TAB_TITLE }
                    assertTrue("$name: the title goes in right before the tab", at - call in 2..3)
                    assertEquals(listOf(title, id), body[call].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT_OBJECT, body[call + 1].opcode)
                    assertEquals(listOf(title), body[call + 1].namedRegisters())
                    made++
                }
            }
            assertTrue("$name: no tab is made", made > 0)

            // A new title: the check against the old one reads it plain, and the stored one gets its icon back.
            var retitled = 0
            for (method in context.tgMutableClassDefBy(plan.tab!!).methods) {
                val body = method.body()
                val store = body.indexOfFirst { it.ref() == TAB_RETITLE }
                if (store < 0) continue
                retitled++
                val title = body[store].namedRegisters().first()
                assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IPUT_OBJECT), listOf(body[store + 1].opcode, body[store + 2].opcode))
                assertEquals(title, body[store + 2].namedRegisters().first())
                assertTrue("$name: ${body[store + 2].ref()}", body[store + 2].ref()!!.endsWith(":Ljava/lang/CharSequence;"))
                val plain = body.indexOfFirst { it.ref() == TAB_PLAIN }
                assertTrue("$name: the title check reads the title plain", plain in 0 until store)
                assertEquals(Opcode.MOVE_RESULT_OBJECT, body[plain + 1].opcode)
                assertEquals(TEXT_EQUALS, body[plain + 2].ref())
                assertTrue(body[plain].namedRegisters().single() in body[plain + 2].namedRegisters())
            }
            assertTrue("$name: no tab takes a new title", retitled > 0)
            for (method in edited) {
                assertEquals("$name: Telegram's own code is unchanged around it", stock.getValue(method), withoutIcons(method.body()))
            }

            // The stubs read the tab's id and the folder's own fields.
            val stubs = context.tgMutableClassDefBy(TAB_ICONS).methods.associateBy { it.name }
            assertEquals(plan.id, stubs.getValue("tabPosition").body().single { it.opcode == Opcode.IGET }.ref())
            assertTrue(LOCAL_FLAGS in stubs.getValue("folderFlags").body().map { it.ref() })
            assertTrue(LOCAL_ALWAYS in stubs.getValue("folderPicks").body().map { it.ref() })
        }
    }

    @Test fun `the rehearsal leaves Telegram as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of((ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type })
            context.requireLaunchFolderRuntime()
            val strip = context.resolveLaunchFolder().refs!!.tabs.substringBefore("->")
            val methods = (context.tgMutableClassDefBy(strip).methods + context.tgMutableClassDefBy(context.resolveTabIcons(strip).tab!!).methods)
            val before = methods.map { method -> method.body().map(::operands) }
            context.resolveTabIcons(strip)
            assertEquals(build.name, before, methods.map { method -> method.body().map(::operands) })
        }
    }

    @Test fun `without the tab class only the icons are left out`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val probe = PatchContexts.of((ExtensionDex.classes() + launchFolderHosts(build)).distinctBy { it.type })
            probe.requireLaunchFolderRuntime()
            val strip = probe.resolveLaunchFolder().refs!!.tabs.substringBefore("->")
            val tab = probe.resolveTabIcons(strip).tab!!
            val hosts = (folderCounterHosts(build) + menuHosts(build) + allChatsPlaceHosts(build) + accountListHosts(build))
                .distinctBy { it.type }.filterNot { it.type == tab }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "the folder tab class is missing" in warnings.single() && "without folder tab icons" in warnings.single())
            assertEquals(0L, statusOf(context, "tabIcons"))
            assertEquals(1L, statusOf(context, "fitTabs"))
            assertTrue(name, context.tgMutableClassDefBy(strip).methods.none { m -> m.body().any { it.ref() == TAB_TITLE } })
        }
    }

    private fun statusOf(context: app.morphe.patcher.patch.BytecodePatchContext, flag: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.body()[0] as WideLiteralInstruction).wideLiteral

    /** The body without the extension's calls and what they put back. */
    private fun withoutIcons(body: List<Instruction>): List<List<Any?>> {
        val skip = mutableSetOf<Int>()
        body.forEachIndexed { at, instruction ->
            if (instruction.ref() !in listOf(TAB_TITLE, TAB_RETITLE, TAB_PLAIN)) return@forEachIndexed
            skip += at
            skip += at + 1
            if (instruction.ref() == TAB_TITLE && body[at + 2].opcode == Opcode.CHECK_CAST) skip += at + 2
        }
        return body.filterIndexed { at, _ -> at !in skip }.map(::operands)
    }

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref())
}

private const val TEXT_EQUALS = "Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z"

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun Instruction.ref() = origRef()
