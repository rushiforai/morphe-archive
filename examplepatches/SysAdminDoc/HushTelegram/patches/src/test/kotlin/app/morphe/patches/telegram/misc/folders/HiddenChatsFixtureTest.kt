/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Both pinned builds' chat sort, which hands its full lists to the extension before it drops empty folders. */
class HiddenChatsFixtureTest {
    @Test fun `the sort hands the controller over once, right before the empty folder walk`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHiddenChats()
            assertNull("$name: ${plan.missing}", plan.missing)
            val method = plan.sort!!
            val stock = method.body().map(::operands)
            val stockEntries = ControlFlow.of(method).normal.withIndex().count { (_, next) -> plan.at in next }
            plan.apply()
            val body = method.body()
            assertEquals("$name: the call is one instruction", stock.size + HIDDEN_CHATS_SIZE, body.size)
            val hook = body[plan.at]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.opcode)
            assertEquals("$HIDDEN_CHATS->prune(Ljava/lang/Object;)V", hook.ref())
            assertEquals(listOf(plan.controller), hook.namedRegisters())
            // Then the walk's start and its head: dialogsByFolder read off the same register and its size asked.
            val head = body[plan.at + 2]
            assertEquals(BY_FOLDER, head.ref())
            assertEquals(plan.controller, (head as TwoRegisterInstruction).registerB)
            assertEquals("Landroid/util/SparseArray;->size()I", body[plan.at + 3].ref())
            assertEquals("$name: Telegram's own code is unchanged around it", stock,
                (body.take(plan.at) + body.drop(plan.at + 1)).map(::operands))
            // The real sort jumps onto the walk's start past the forward list's own entry. That jump lands on the call.
            assertTrue("$name: the start is a jump target", stockEntries >= 2)
            val entries = ControlFlow.of(method).normal.withIndex().count { (_, next) -> plan.at in next }
            assertEquals("$name: every way into the walk runs the call", stockEntries, entries)
            assertEquals("$name: nothing jumps past the call to the start", 1,
                ControlFlow.of(method).normal.withIndex().count { (_, next) -> plan.at + 1 in next })
        }
    }

    @Test fun `the pinned order swaps its folder's chats for the extension's right after reading them`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHiddenChats()
            assertNull("$name: ${plan.missing}", plan.missing)
            val pins = plan.pins!!
            assertEquals(name, "reorderPinnedDialogs", pins.method.name)
            val stock = pins.method.body().map(::operands)
            val read = stock[pins.at - 2]
            plan.apply()
            val body = pins.method.body()
            assertEquals("$name: three instructions", stock.size + PIN_ORDER_SIZE, body.size)
            // The read, handed the controller and the folder, then the swap on its result.
            assertEquals(read, operands(body[pins.at - 2]))
            assertEquals(GET_DIALOGS, body[pins.at - 2].ref())
            assertEquals(listOf(pins.controller, pins.folder), body[pins.at - 2].namedRegisters())
            assertEquals(Opcode.INVOKE_STATIC, body[pins.at].opcode)
            assertEquals(PIN_ORDER, body[pins.at].ref())
            assertEquals(listOf(pins.controller, pins.folder, pins.list), body[pins.at].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT_OBJECT, body[pins.at + 1].opcode)
            assertEquals(listOf(pins.list), body[pins.at + 1].namedRegisters())
            assertEquals(Opcode.CHECK_CAST, body[pins.at + 2].opcode)
            assertEquals("Ljava/util/ArrayList;", body[pins.at + 2].ref())
            assertEquals("$name: Telegram's own code is unchanged around it", stock,
                (body.take(pins.at) + body.drop(pins.at + PIN_ORDER_SIZE)).map(::operands))
            // What comes next reads the swapped list: Telegram's emptiness check.
            assertEquals("Ljava/util/ArrayList;->isEmpty()Z", body[pins.at + 3].ref())
            assertEquals(listOf(pins.list), body[pins.at + 3].namedRegisters())
        }
    }

    @Test fun `a pinned order that changed leaves the switch out and both methods as they were`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            val reorder = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "reorderPinnedDialogs" }
            val read = reorder.body().indexOfFirst { it.ref() == GET_DIALOGS }
            // A second read of the folder's chats: which one the server's order comes from is no longer clear.
            val (self, folder) = reorder.body()[read].namedRegisters()
            reorder.addInstructions(read + 2, "invoke-virtual {v$self, v$folder}, $GET_DIALOGS")
            val before = reorder.body().map(::operands)
            val sortBefore = context.sortDialogs().body().map(::operands)
            val plan = context.resolveHiddenChats()
            assertTrue("${build.name}: ${plan.missing}", plan.missing.orEmpty().contains("no longer reads one folder's chats"))
            plan.apply()
            assertEquals(build.name, before, reorder.body().map(::operands))
            assertEquals(build.name, sortBefore, context.sortDialogs().body().map(::operands))
        }
    }

    @Test fun `the long press menu gets the item after Block, a visibility check and the first look at a tap`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = menuContext(build)
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHideMenu()
            assertNull("$name: ${plan.missing}", plan.missing)
            val create = plan.create!!
            val counters = plan.counters!!
            val click = plan.click!!
            val refs = plan.refs!!
            val stock = listOf(create, counters, click).map { method -> method.body().code() }
            plan.apply()

            // createActionMode: the call right after Block's sub item is stored, handed the chat list and the more menu.
            val made = create.body()
            assertEquals("$name: one instruction", stock[0].size + 1, made.code().size)
            assertEquals(Opcode.INVOKE_STATIC, made[plan.at].opcode)
            assertEquals(MENU_ITEM, made[plan.at].ref())
            assertEquals(listOf(plan.list, plan.more), made[plan.at].namedRegisters())
            assertEquals(Opcode.IPUT_OBJECT, made[plan.at - 1].opcode)
            assertEquals(refs.addSubItem, made[plan.at - 3].ref())
            assertEquals(plan.more, made[plan.at - 3].namedRegisters()[0])
            assertEquals(0x6aL, (made[plan.at - 4] as WideLiteralInstruction).wideLiteral)
            assertEquals("$name: createActionMode is unchanged around it", stock[0], (made.take(plan.at) + made.drop(plan.at + 1)).code())
            assertEquals("$name: the call is createActionMode's", 1, made.count { it.ref() == MENU_ITEM })

            // updateCounters: first thing, handed the chat list in its own register.
            val checked = counters.body()
            assertEquals(Opcode.INVOKE_STATIC_RANGE, checked[0].opcode)
            assertEquals(MENU_SHOWN, checked[0].ref())
            assertEquals(listOf(counters.localRegisterCount()), checked[0].namedRegisters())
            assertEquals(name, stock[1], checked.drop(1).code())
            assertTrue("$name: createActionMode asks updateCounters", made.any { it.ref() == counters.toString() })

            // The click handler: the extension's answer replaces the id before Telegram reads it.
            val tapped = click.body()
            val self = click.localRegisterCount()
            assertEquals(Opcode.INVOKE_STATIC_RANGE, tapped[0].opcode)
            assertEquals(MENU_CHOICE, tapped[0].ref())
            assertEquals(listOf(self, self + 1), tapped[0].namedRegisters())
            assertEquals(Opcode.MOVE_RESULT, tapped[1].opcode)
            assertEquals(listOf(self + 1), tapped[1].namedRegisters())
            assertEquals(name, stock[2], tapped.drop(2).code())
            assertTrue("$name: the handler reads the selection", tapped.any { it.ref() == refs.selected })
            assertTrue("$name: the handler reads its chat list", tapped.any { it.ref() == refs.listener })
            assertTrue("$name: ${refs.selected}", refs.selected.endsWith(":Ljava/util/ArrayList;"))
        }
    }

    @Test fun `a long press menu that changed leaves the item out and the menu as it was`() {
        class Case(val name: String, val reason: String, val hosts: (File) -> List<ClassDef>, val edit: (BytecodePatchContext, String) -> Unit)
        val cases = listOf(
            Case("Block's id changed", "Block item changed", { build -> menuHosts(build) }) { context, list ->
                val create = context.createActionMode(list)
                val id = create.body().indexOfFirst { it.opcode in setOf(Opcode.CONST_16, Opcode.CONST_4) && (it as WideLiteralInstruction).wideLiteral == 0x6aL }
                val register = create.body()[id].namedRegisters().single()
                create.replaceInstruction(id, "const/16 v$register, 0x6b")
            },
            Case("no click handler", "click handler is missing or ambiguous", { build -> menuHosts(build, clicks = false) }) { _, _ -> },
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val list = launchFolderList(build)
            val context = PatchContexts.of((ExtensionDex.classes() + case.hosts(build)).distinctBy { it.type })
            context.requireHiddenChatsRuntime()
            case.edit(context, list)
            val before = context.createActionMode(list).body().map(::operands)
            val plan = context.resolveHideMenu()
            assertTrue("$where: ${plan.missing}", plan.missing.orEmpty().contains(case.reason))
            assertNull(where, plan.create)
            plan.apply()
            assertEquals("$where: nothing is edited", before, context.createActionMode(list).body().map(::operands))
        }
    }

    @Test fun `the whole patch fills every stub and turns the switch on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val refs = menuContext(build).also { it.requireHiddenChatsRuntime() }.resolveHideMenu().refs!!
            val hosts = (folderCounterHosts(build) + launchFolderHosts(build) + menuHosts(build)).distinctBy { it.type }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })
            val stubs = context.mutableClassDefBy(HIDDEN_CHATS).methods.associateBy { it.name }
            val sort = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "sortDialogs" }.toString()
            // Each one whole: smali drops what it can't build, and the count shows it.
            val expected = mapOf(
                "controllerUser" to (6 to listOf(GET_USER_CONFIG, CLIENT_USER_ID)),
                "folders" to (3 to listOf(BY_FOLDER)),
                "selectedFilters" to (3 to listOf(SELECTED_FILTERS)),
                "filterDialogs" to (3 to listOf(FILTER_DIALOGS)),
                "dialogId" to (3 to listOf(DIALOG_ID)),
                "pinned" to (3 to listOf(DIALOG_PINNED)),
                "pinnedNum" to (3 to listOf(DIALOG_PIN_NUM)),
                "selectedAccount" to (2 to listOf(SELECTED_ACCOUNT)),
                "userId" to (5 to listOf(CLIENT_USER_ID)),
                "dialogs" to (5 to listOf(CONTROLLER_INSTANCE, GET_DIALOGS)),
                "peerName" to (5 to listOf(CONTROLLER_INSTANCE, PEER_NAME)),
                "resort" to (11 to listOf(CONTROLLER_INSTANCE, sort, NOTIFICATIONS_INSTANCE, DIALOGS_NEED_RELOAD, POST_NOTIFICATION)),
                "addMenuItem" to (4 to listOf(refs.addSubItem)),
                "selectedChats" to (7 to listOf(refs.listener, refs.selected)),
            )
            for ((stub, want) in expected) {
                val body = stubs.getValue(stub).body()
                assertEquals("$name: $stub", want.first, body.size)
                val calls = body.mapNotNull { it.ref() }
                for (reference in want.second) assertTrue("$name: $stub reaches $reference", reference in calls)
            }
            // sortDialogs(null): the argument is a zero.
            val resort = stubs.getValue("resort").body()
            val call = resort.single { it.ref() == sort }
            assertEquals(Opcode.CONST_4, resort[resort.indexOf(call) - 1].opcode)
            assertEquals(1L, statusOf(context, "hiddenChats"))
            assertEquals(1L, statusOf(context, "launchFolder"))
            assertEquals(1, context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "sortDialogs" }.body()
                .count { it.ref() == "$HIDDEN_CHATS->prune(Ljava/lang/Object;)V" })
            assertEquals(1, context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "reorderPinnedDialogs" }.body()
                .count { it.ref() == PIN_ORDER })
            // The long press item's three calls, each once in the whole app.
            for (hook in listOf(MENU_ITEM, MENU_SHOWN, MENU_CHOICE)) {
                val calls = hosts.filter { !it.type.startsWith("Lapp/hushtelegram/") }
                    .sumOf { cls -> context.mutableClassDefBy(cls.type).methods.sumOf { m -> m.body().count { it.ref() == hook } } }
                assertEquals("$name: $hook", 1, calls)
            }
        }
    }

    @Test fun `the whole patch without a click handler still hides chats and only warns about the item`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val refs = menuContext(build).also { it.requireHiddenChatsRuntime() }.resolveHideMenu().refs!!
            val hosts = (folderCounterHosts(build) + menuHosts(build, clicks = false)).distinctBy { it.type }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue("$name: ${warnings.single()}", "click handler is missing or ambiguous" in warnings.single() && "without Hide from chat list" in warnings.single())
            assertEquals(1L, statusOf(context, "hiddenChats"))
            assertEquals(1, context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "sortDialogs" }.body()
                .count { it.ref() == "$HIDDEN_CHATS->prune(Ljava/lang/Object;)V" })
            val stubs = context.mutableClassDefBy(HIDDEN_CHATS).methods.associateBy { it.name }
            assertTrue("$name: addMenuItem stays a stub", stubs.getValue("addMenuItem").body().none { it.ref() == refs.addSubItem })
            assertTrue("$name: selectedChats stays a stub", stubs.getValue("selectedChats").body().none { it.ref() == refs.selected })
            for (hook in listOf(MENU_ITEM, MENU_SHOWN, MENU_CHOICE)) {
                val calls = hosts.filter { !it.type.startsWith("Lapp/hushtelegram/") }
                    .sumOf { cls -> context.mutableClassDefBy(cls.type).methods.sumOf { m -> m.body().count { it.ref() == hook } } }
                assertEquals("$name: $hook", 0, calls)
            }
        }
    }

    @Test fun `a sort that changed leaves the switch out and the method as it was`() {
        class Case(val name: String, val reason: String, val edit: (MutableMethod) -> Unit)
        val cases = listOf(
            Case("no empty folder drop", "no longer drops empty folders") { sort ->
                sort.removeInstruction(sort.body().indexOfFirst { it.ref() == "Landroid/util/SparseArray;->remove(I)V" })
            },
            Case("the walk's start written twice", "the empty folder walk's start changed") { sort ->
                val head = headOf(sort)
                sort.addInstructions(head, "nop")
            },
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val where = "${build.name} ${case.name}"
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            val sort = context.sortDialogs()
            case.edit(sort)
            val before = sort.body().map(::operands)
            val plan = context.resolveHiddenChats()
            assertTrue("$where: ${plan.missing}", plan.missing.orEmpty().contains(case.reason))
            assertNull(where, plan.sort)
            plan.apply()
            assertEquals("$where: nothing is edited", before, context.sortDialogs().body().map(::operands))
        }
    }

    @Test fun `without the notification centre the switch is left out`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build)
                .filter { it.type != "Lorg/telegram/messenger/NotificationCenter;" })
            val plan = context.resolveHiddenChats()
            assertTrue("${build.name}: ${plan.missing}", plan.missing.orEmpty().contains("isn't reachable from the extension"))
        }
    }

    /** The empty folder walk's head: the read of dialogsByFolder that a goto after its remove jumps back to. */
    private fun headOf(sort: Method): Int {
        val body = sort.body()
        val remove = body.indexOfFirst { it.ref() == "Landroid/util/SparseArray;->remove(I)V" }
        val back = (remove + 1 until body.size).first { body[it].opcode == Opcode.GOTO || body[it].opcode == Opcode.GOTO_16 }
        return ControlFlow.of(sort).normal[back].single()
    }

    private fun BytecodePatchContext.sortDialogs(): MutableMethod =
        mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "sortDialogs" }

    private fun menuContext(build: File) = PatchContexts.of((ExtensionDex.classes() + menuHosts(build)).distinctBy { it.type })

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }.map(::operands)

    private fun BytecodePatchContext.createActionMode(list: String): MutableMethod =
        mutableClassDefBy(list).methods.single { it.isCreateActionMode() }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.body()[0] as WideLiteralInstruction).wideLiteral

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref())

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
}

private val MENU_HOSTS = mutableMapOf<String, List<ClassDef>>()

/** The chat list's hosts, the more menu's class and every (I)V handler that holds a chat list, as candidates for the click handler. */
internal fun menuHosts(build: File, clicks: Boolean = true): List<ClassDef> = MENU_HOSTS.getOrPut("${build.path} $clicks") {
    val list = launchFolderList(build)
    val create = FixtureDex.classes(build, setOf(list)).getValue(list).methods.single { it.isCreateActionMode() }
    val more = create.controlBody().first { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.contains("(IILjava/lang/String;)") == true }
        .controlRef()!!.substringBefore("->")
    val handlers = if (!clicks) emptyList() else FixtureDex.classesWhere(build, { true }) { m ->
        m.definingClass != list && m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            m.controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlRef()?.endsWith(":$list") == true }
    }
    launchFolderHosts(build) + handlers + FixtureDex.classes(build, setOf(more)).values
}

private fun Method.isCreateActionMode() = parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
    controlBody().any { it.controlRef() == "Lorg/telegram/messenger/R\$drawable;->msg_block:I" }
