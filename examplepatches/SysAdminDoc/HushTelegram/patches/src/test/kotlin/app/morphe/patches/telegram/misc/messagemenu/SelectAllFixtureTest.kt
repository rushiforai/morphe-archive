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
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** Select all in a chat's bar and in shared media's, and the stubs that reach them, on the pinned builds. */
class SelectAllFixtureTest {
    private val showing = "$SELECT_ALL->showing(Ljava/lang/Object;Z)V"

    @Test fun `shared media's bar shows Select all from the start of its toggle and the chat's bar gets the icon`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val sites = context.resolveSharedMediaSelectAll()
            assertEquals("$name: ${sites.missing}", null, sites.missing)

            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { messageMenuPatch.execute(context) })

            val layout = context.tgMutableClassDefBy(layoutOf(hosts).type)
            val hooked = layout.methods.filter { m -> m.controlBody().any { it.controlRef() == showing } }
            assertEquals("$name: one toggle", 1, hooked.size)
            val toggle = hooked.single()
            val body = toggle.controlBody().filter { it.opcode != Opcode.NOP }
            val self = toggle.implementation!!.registerCount - 2
            assertEquals(Opcode.INVOKE_STATIC_RANGE, body[0].opcode)
            assertEquals("$name: the layout and the flag", listOf(self, self + 1), body[0].namedRegisters())
            assertEquals("$name: then Telegram's own compare", Opcode.IGET_BOOLEAN, body[1].opcode)
            assertEquals("$name: the flag the stub reads", body[1].controlRef(), stub(context, "actionMode").single { it.opcode == Opcode.IGET_BOOLEAN }.controlRef())

            val add = stub(context, "addButton").filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            assertTrue("$name: the context", add[0].controlRef()!!.endsWith("->getContext()Landroid/content/Context;"))
            assertTrue("$name: the bar's item factory ${add[1].controlRef()}", add[1].controlRef()!!.contains("(Landroid/content/Context;IILjava/lang/String;)L") &&
                add[1].controlRef()!!.startsWith(layout.type))
            assertEquals("$name: layout, context, id, icon, label", listOf(1, 0, 2, 3, 4), add[1].namedRegisters())
            val pick = stub(context, "pick").single { it.opcode == Opcode.INVOKE_VIRTUAL }
            assertTrue("$name: the row tap ${pick.controlRef()}", pick.controlRef()!!.endsWith("(ILandroid/view/View;Lorg/telegram/messenger/MessageObject;I)V"))
            assertEquals("$name: layout, no index, no view, message, tab", listOf(2, 0, 1, 3, 4), pick.namedRegisters())
            assertEquals("$name: the selection", "[Landroid/util/SparseArray;", stub(context, "selected").single { it.opcode == Opcode.IGET_OBJECT }.controlField()!!.type)
            val closest = layout.methods.single { it.origName == "getClosestTab" }.controlBody()
            assertEquals("$name: the pages getClosestTab reads", closest.first { it.opcode == Opcode.IGET_OBJECT }.controlRef(),
                stub(context, "pages").single { it.opcode == Opcode.IGET_OBJECT }.controlRef())
            assertTrue("$name: the tab getter", stub(context, "tab").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef()!!.endsWith("->getClosestTab()I"))
            val messages = stub(context, "tabMessages")
            assertTrue("$name: a tab's list", messages.single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef()!!.endsWith("()Ljava/util/ArrayList;"))
            assertTrue("$name: bounds checked", messages.any { it.opcode == Opcode.ARRAY_LENGTH } && messages.any { it.opcode == Opcode.IF_LTZ })
            val notify = stub(context, "notifyList")
            assertEquals("Landroidx/recyclerview/widget/RecyclerView;", notify.first { it.opcode == Opcode.INSTANCE_OF }.controlRef())
            assertTrue("$name: the adapter", notify.filter { it.opcode == Opcode.INVOKE_VIRTUAL }.let { calls ->
                calls.size == 2 && calls[0].controlRef()!!.contains("->getAdapter()") && calls[1].controlRef()!!.endsWith("()V") })
            assertEquals("Lorg/telegram/messenger/MessageObject;->getId()I", stub(context, "messageId").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals("Lorg/telegram/messenger/R\$drawable;->abc_ic_menu_selectall_mtrl_alpha:I", stub(context, "icon").first().controlRef())
            assertEquals("$name: chats", 1L, flag(context, "selectAll"))
            assertEquals("$name: shared media", 1L, flag(context, "sharedMediaSelectAll"))
        }
    }

    @Test fun `a changed shared media leaves its Select all out and the chat's stays`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = MessageMenuFixtureTest().hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            context.tgMutableClassDefBy(layoutOf(hosts).type).methods.removeIf { it.origName == "getSelectedTab" }
            val warnings = PatchLogCapture.warnings { messageMenuPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "goes on without Select all in shared media" in warnings.single())
            assertTrue("$name: no hook", hosts.none { c -> context.tgMutableClassDefBy(c.type).methods.any { m -> m.controlBody().any { it.controlRef() == showing } } })
            assertTrue("$name: the shared media flag stays off", flag(context, "sharedMediaSelectAll") != 1L)
            assertEquals("$name: chats", 1L, flag(context, "selectAll"))
            assertEquals("Lorg/telegram/messenger/R\$drawable;->abc_ic_menu_selectall_mtrl_alpha:I", stub(context, "icon").first().controlRef())
        }
    }

    private fun layoutOf(hosts: List<ClassDef>) = hosts.single { c -> c.methods.any { it.origName == "getClosestTab" } && c.methods.any { it.origName == "getSelectedTab" } }

    private fun stub(context: app.morphe.patcher.patch.BytecodePatchContext, n: String) =
        context.tgMutableClassDefBy(SELECT_ALL).methods.single { it.origName == n }.controlBody()

    private fun flag(context: app.morphe.patcher.patch.BytecodePatchContext, n: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == n }.controlBody().first() as? WideLiteralInstruction)?.wideLiteral
}

/**
 * The classes Select all needs in shared media: the layout, the element classes of its arrays (the
 * pages and each tab's messages), and RecyclerView with the adapter base its getter returns.
 */
internal fun sharedMediaSelectAllHosts(build: File, base: List<ClassDef>): List<ClassDef> = FixtureDex.namedBy(build) {
    val recycler = "Landroidx/recyclerview/widget/RecyclerView;"
    val layouts = FixtureDex.classesWhere(build, { true }) { m -> m.origName == "getClosestTab" && m.parameterTypes.isEmpty() }
    val elements = layouts.flatMap { it.fields }.map { it.type }.filter { it.startsWith("[L") }.map { it.removePrefix("[") }.toSet()
    val views = FixtureDex.classes(build, setOf(recycler)).values
    val adapters = views.flatMap { it.methods }.filter { it.origName == "getAdapter" && it.parameterTypes.isEmpty() }.map { it.returnType }.toSet()
    val more = FixtureDex.classes(build, elements + adapters).values
    (layouts + views + more).filter { found -> base.none { it.origType == found.origType } }.distinctBy { it.origType }.map(ImmutableClassDef::of)
}
