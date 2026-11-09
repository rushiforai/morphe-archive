/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.hostsOf
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.chattypefolders.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.chattypefolders.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.chattypefolders.STORAGE
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterLiveness
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origSuperclass
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

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
            assertEquals(name, "reorderPinnedDialogs", pins.method.origName)
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

    @Test fun `the extension sees the server's pins right before the storage does`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHiddenChats()
            assertEquals(name, emptyList<String>(), plan.pinGaps)
            val pins = plan.serverPins!!
            val stock = pins.method.body().code()
            val at = pins.hookAt(pins.method)
            val handed = pins.method.body()[at + 2].namedRegisters()
            assertEquals(name, listOf(pins.ids, pins.folder), handed.drop(2))
            plan.apply()
            val body = pins.method.body()
            val hook = body[at]
            assertEquals(name, SERVER_PINS, hook.ref())
            assertEquals(name, Opcode.INVOKE_STATIC, hook.opcode)
            assertEquals(name, listOf(pins.controller, pins.folder, pins.ids), hook.namedRegisters())
            // The storage read, its result, this call, then Telegram's own on the same result: the storage's
            // queue, the unpin task built with the server's ids and the folder, and posted to that queue.
            assertEquals(name, "Lorg/telegram/messenger/BaseController;->getMessagesStorage()Lorg/telegram/messenger/MessagesStorage;", body[at - 2].ref())
            assertEquals(name, listOf(pins.controller), body[at - 2].namedRegisters())
            assertEquals(name, Opcode.MOVE_RESULT_OBJECT, body[at - 1].opcode)
            assertEquals(name, Opcode.IGET_OBJECT, body[at + 1].opcode)
            assertEquals(name, pins.task, body[at + 2].ref())
            assertTrue(name, body[at + 3].buildsUnpinTask(pins.task))
            assertEquals(name, handed, body[at + 3].namedRegisters())
            assertEquals(name, TelegramNames.of(context).asRead(POST_RUNNABLE), body[at + 4].ref())
            assertEquals(name, 1, context.tgMutableClassDefBy(pins.task).methods.count { m -> m.body().any { it.ref() == UNPIN_QUERY } })
            assertEquals("$name: Telegram's own code is unchanged around it", stock, body.filterIndexed { index, _ -> index != at }.code())
        }
    }

    @Test fun `both pin checks shrink only the chat list's own limit`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            // Every class that reads the folder limit, as on the phone: 13.2's config save reads it from a runnable of its own.
            val hosts = launchFolderHosts(build)
            val readers = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.controlRef() == FOLDER_PIN_LIMIT } }
                .filter { reader -> hosts.none { it.type == reader.type } }.distinctBy { it.type }.map(ImmutableClassDef::of)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts + readers)
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHiddenChats()
            assertEquals(name, emptyList<String>(), plan.pinGaps)
            assertEquals(name, 2, plan.pinLimits.size)
            val stock = plan.pinLimits.associateWith { it.body().code() }
            val shown = plan.pinLimits.flatMap { method -> method.body().mapNotNull { it.ref() }.filter { it in MAIN_PIN_LIMITS } }.toSet()
            assertEquals(name, MAIN_PIN_LIMITS, shown)
            plan.apply()
            for (method in plan.pinLimits) {
                val body = method.body()
                val hooks = body.indices.filter { body[it].ref() == PIN_ROOM }
                assertEquals("$name: ${method.name}", 2, hooks.size)
                for (hook in hooks) {
                    // The read, the call on what it read, and the answer back in the same register.
                    val read = body[hook - 1]
                    assertTrue("$name: ${read.ref()}", read.ref() in MAIN_PIN_LIMITS)
                    val limit = (read as TwoRegisterInstruction).registerA
                    assertEquals(name, Opcode.INVOKE_STATIC_RANGE, body[hook].opcode)
                    assertEquals(name, listOf(limit), body[hook].namedRegisters())
                    assertEquals(name, Opcode.MOVE_RESULT, body[hook + 1].opcode)
                    assertEquals(name, listOf(limit), body[hook + 1].namedRegisters())
                }
                // The folder tabs' and archive's limit is read straight, on to the shared comparison.
                val folder = body.indexOfFirst { it.ref() == FOLDER_PIN_LIMIT }
                assertTrue("$name: ${method.name}", body[folder + 1].ref() != PIN_ROOM)
                val added = hooks.flatMap { listOf(it, it + 1) }.toSet()
                assertEquals("$name: ${method.name} keeps Telegram's code", stock.getValue(method),
                    body.filterIndexed { index, _ -> index !in added }.code())
            }
        }
    }

    @Test fun `the share sheet reads a copy and quick share hands over its ids`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val plan = context.resolveHiddenPickers()
            assertEquals(name, emptyList<String>(), plan.gaps)
            val sheet = plan.shareSheet!!
            val quick = plan.quickShare!!
            val stock = listOf(sheet, quick).map { it.body().code() }
            plan.apply()

            val sheetBody = sheet.body().filter { it.opcode != Opcode.NOP }
            val hook = sheetBody.indexOfFirst { it.ref() == SHARE_SHEET_CHATS }
            val chats = (sheetBody[hook - 1] as OneRegisterInstruction).registerA
            // 13.1 calls getAllDialogs() and moves its result; 13.2 reads the field that call returned.
            if (sheetBody[hook - 1].opcode == Opcode.IGET_OBJECT) {
                assertEquals(name, ALL_DIALOGS_FIELD, sheetBody[hook - 1].ref())
            } else {
                assertEquals(name, GET_ALL_DIALOGS, sheetBody[hook - 2].ref())
                assertEquals(name, Opcode.MOVE_RESULT_OBJECT, sheetBody[hook - 1].opcode)
            }
            assertEquals(name, Opcode.INVOKE_STATIC_RANGE, sheetBody[hook].opcode)
            assertEquals(name, listOf(chats), sheetBody[hook].namedRegisters())
            assertEquals(name, Opcode.MOVE_RESULT_OBJECT, sheetBody[hook + 1].opcode)
            assertEquals(name, chats, (sheetBody[hook + 1] as OneRegisterInstruction).registerA)
            assertEquals("$name keeps the share sheet's code", stock[0],
                sheetBody.filterIndexed { index, _ -> index != hook && index != hook + 1 }.code())

            val quickBody = quick.body().filter { it.opcode != Opcode.NOP }
            val handed = quickBody.indexOfFirst { it.ref() == QUICK_SHARE_IDS }
            assertEquals(name, "Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z", quickBody[handed - 1].ref())
            assertEquals(name, quickBody[handed - 1].namedRegisters().first(), quickBody[handed].namedRegisters().single())
            assertEquals("$name keeps quick share's code", stock[1],
                quickBody.filterIndexed { index, _ -> index != handed }.code())
        }
    }

    @Test fun `a picker that changed only warns and stays as it was`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val found = context.resolveHiddenPickers()
            val sheet = found.shareSheet!!
            val read = sheet.allChatsRead()
            val past = sheet.allChatsReadEnd(read)
            val result = (sheet.controlBody()[past - 1] as OneRegisterInstruction).registerA
            // A second read of every chat: which one the sheet lists is no longer clear. 13.2 reads the field.
            val first = sheet.controlBody()[read]
            sheet.addInstructions(past, if (first.opcode == Opcode.IGET_OBJECT) {
                "iget-object v$result, v${(first as TwoRegisterInstruction).registerB}, $ALL_DIALOGS_FIELD"
            } else """
                invoke-virtual {v${first.namedRegisters().single()}}, $GET_ALL_DIALOGS
                move-result-object v$result
            """)
            val before = sheet.body().code()
            val plan = context.resolveHiddenPickers()
            assertEquals(name, 1, plan.gaps.size)
            assertNull(name, plan.shareSheet)
            assertTrue(name, plan.quickShare != null)
            plan.apply()
            assertEquals(name, before, sheet.body().code())
        }
    }

    @Test fun `a pin gap that changed only warns and hiding goes on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val found = context.resolveHiddenChats()
            // A second handover and a third limit read: which one to hook is no longer clear.
            val answer = found.serverPins!!.method
            val built = found.serverPins!!.hookAt(answer) + 2
            val handed = answer.body()[built].namedRegisters()
            val task = (answer.body()[built] as ReferenceInstruction).reference.toString()
            answer.addInstructions(built + 1, "invoke-direct {${handed.joinToString { "v$it" }}}, $task")
            val reader = found.pinLimits.first()
            val read = reader.mainPinLimitReads().first()
            val limit = reader.body()[read] as TwoRegisterInstruction
            reader.addInstructions(read, "iget v${limit.registerA}, v${limit.registerB}, ${reader.body()[read].ref()}")
            val before = listOf(answer, reader).map { it.body().code() }
            val plan = context.resolveHiddenChats()
            assertNull("$name: ${plan.missing}", plan.missing)
            assertEquals(name, 2, plan.pinGaps.size)
            assertNull(name, plan.serverPins)
            assertEquals(name, emptyList<MutableMethod>(), plan.pinLimits)
            plan.apply()
            assertEquals(name, before, listOf(answer, reader).map { it.body().code() })
            assertEquals(name, 1, context.sortDialogs().body().count { it.ref() == "$HIDDEN_CHATS->prune(Ljava/lang/Object;)V" })
        }
    }

    @Test fun `a pinned order that changed leaves the switch out and both methods as they were`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            val reorder = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "reorderPinnedDialogs" }
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
            // 13.2 loads the icon, a const now, between the id and the call, so the id is the load that fills the id operand.
            val id = listOf(plan.at - 4, plan.at - 5).map { made[it] }.first { it.namedRegisters() == listOf(made[plan.at - 3].namedRegisters()[1]) }
            assertEquals(0x6aL, (id as WideLiteralInstruction).wideLiteral)
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
            val hosts = (folderCounterHosts(build) + launchFolderHosts(build) + menuHosts(build) + allChatsPlaceHosts(build) + accountListHosts(build)).distinctBy { it.type }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) })
            val stubs = context.tgMutableClassDefBy(HIDDEN_CHATS).methods.associateBy { it.name }
            // In source names, as ref() reads the stub's call.
            val sort = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "sortDialogs" }.origString()
            // Each one whole: smali drops what it can't build, and the count shows it.
            val expected = mapOf(
                "controllerUser" to (6 to listOf(GET_USER_CONFIG, CLIENT_USER_ID)),
                "folders" to (3 to listOf(BY_FOLDER)),
                "selectedFilters" to (3 to listOf(SELECTED_FILTERS)),
                "filterDialogs" to (3 to listOf(FILTER_DIALOGS)),
                "forwardList" to (3 to listOf(DIALOGS_FORWARD)),
                "filterForward" to (3 to listOf(FILTER_FORWARD)),
                "dialogId" to (3 to listOf(DIALOG_ID)),
                "pinned" to (3 to listOf(DIALOG_PINNED)),
                "pinnedNum" to (3 to listOf(DIALOG_PIN_NUM)),
                "unpin" to (5 to listOf(DIALOG_PINNED, DIALOG_PIN_NUM)),
                "selectedAccount" to (2 to listOf(SELECTED_ACCOUNT)),
                "userId" to (5 to listOf(CLIENT_USER_ID)),
                "dialogs" to (5 to listOf(CONTROLLER_INSTANCE, GET_DIALOGS)),
                "peerName" to (5 to listOf(CONTROLLER_INSTANCE, PEER_NAME)),
                "resort" to (11 to listOf(CONTROLLER_INSTANCE, sort, NOTIFICATIONS_INSTANCE, DIALOGS_NEED_RELOAD, POST_NOTIFICATION)),
                "addMenuItem" to (4 to listOf(refs.addSubItem)),
                // The handler's field is cast to the chat list: 13.2 Play's merged handler keeps it as an Object.
                "selectedChats" to (8 to listOf(refs.listener, refs.selected.substringBefore("->"), refs.selected)),
                "recount" to (5 to listOf(STORAGE_INSTANCE, RECOUNT)),
                "onStorageThread" to (6 to listOf(STORAGE_INSTANCE, STORAGE_QUEUE, TelegramNames.of(context).asRead(POST_RUNNABLE))),
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
            // resetAllUnreadCounters(false): every folder, not only the ones leaving muted chats out.
            val recount = stubs.getValue("recount").body()
            val reset = recount.single { it.ref() == RECOUNT }
            val flag = recount[recount.indexOf(reset) - 1]
            assertEquals(name, Opcode.CONST_4, flag.opcode)
            assertEquals(name, 0, (flag as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(name, flag.namedRegisters().single(), reset.namedRegisters()[1])
            assertEquals(1L, statusOf(context, "hiddenChats"))
            assertEquals(1L, statusOf(context, "hiddenUnread"))
            assertEquals(1L, statusOf(context, "sortByDate"))
            assertEquals(1L, statusOf(context, "hiddenPasscode"))
            assertEquals(1L, statusOf(context, "adminChats"))
            assertEquals(1L, statusOf(context, "hiddenAccounts"))
            assertEquals(1L, statusOf(context, "launchFolder"))
            assertEquals(1, context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "sortDialogs" }.body()
                .count { it.ref() == "$HIDDEN_CHATS->prune(Ljava/lang/Object;)V" })
            assertEquals(1, context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "reorderPinnedDialogs" }.body()
                .count { it.ref() == PIN_ORDER })
            // The server's pins once in the whole app (13.2 answers them in a lambda), and each of the two pin checks' two limits.
            val serverPinCalls = hosts.filter { !it.origType.startsWith("Lapp/hushtelegram/") }
                .sumOf { cls -> context.tgMutableClassDefBy(cls).methods.sumOf { m -> m.body().count { it.ref() == SERVER_PINS } } }
            assertEquals(name, 1, serverPinCalls)
            assertEquals(name, 4, context.tgMutableClassDefBy(launchFolderList(build)).methods.sumOf { m -> m.body().count { it.ref() == PIN_ROOM } })
            // One skip in each unread count.
            assertEquals(name, mapOf("calcUnreadCounters" to 1, "updateFiltersReadCounter" to 1),
                context.tgMutableClassDefBy(STORAGE).methods.groupBy { it.origName }
                    .mapValues { (_, methods) -> methods.sumOf { m -> m.body().count { it.ref() == UNCOUNTED } } }.filterValues { it > 0 })
            // The long press item's three calls, each once in the whole app.
            for (hook in listOf(MENU_ITEM, MENU_SHOWN, MENU_CHOICE)) {
                val calls = hosts.filter { !it.origType.startsWith("Lapp/hushtelegram/") }
                    .sumOf { cls -> context.tgMutableClassDefBy(cls.type).methods.sumOf { m -> m.body().count { it.ref() == hook } } }
                assertEquals("$name: $hook", 1, calls)
            }
        }
    }

    @Test fun `the whole patch without a click handler still hides chats and only warns about the item`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val refs = menuContext(build).also { it.requireHiddenChatsRuntime() }.resolveHideMenu().refs!!
            // 13.2 merged every action bar's click handler into one class most screens make, so the other slices
            // bring it along; it's left out by its more-menu ids.
            val hosts = (folderCounterHosts(build) + menuHosts(build, clicks = false) + allChatsPlaceHosts(build) + accountListHosts(build))
                .distinctBy { it.type }.filterNot { cls -> cls.methods.any { m ->
                    m.returnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                        m.body().mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }.containsAll(listOf(0x6c, 0x6d, 0x6e, -1))
                } }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts).distinctBy { it.type })
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue("$name: ${warnings.single()}", "click handler is missing or ambiguous" in warnings.single() && "without Hide from chat list" in warnings.single())
            assertEquals(1L, statusOf(context, "hiddenChats"))
            assertEquals(1, context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "sortDialogs" }.body()
                .count { it.ref() == "$HIDDEN_CHATS->prune(Ljava/lang/Object;)V" })
            val stubs = context.tgMutableClassDefBy(HIDDEN_CHATS).methods.associateBy { it.name }
            assertTrue("$name: addMenuItem stays a stub", stubs.getValue("addMenuItem").body().none { it.ref() == refs.addSubItem })
            assertTrue("$name: selectedChats stays a stub", stubs.getValue("selectedChats").body().none { it.ref() == refs.selected })
            for (hook in listOf(MENU_ITEM, MENU_SHOWN, MENU_CHOICE)) {
                val calls = hosts.filter { !it.origType.startsWith("Lapp/hushtelegram/") }
                    .sumOf { cls -> context.tgMutableClassDefBy(cls.type).methods.sumOf { m -> m.body().count { it.ref() == hook } } }
                assertEquals("$name: $hook", 0, calls)
            }
        }
    }

    @Test fun `the unread counts ask about each chat right after reading its id`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + launchFolderHosts(build))
            context.requireHiddenChatsRuntime()
            val plan = context.resolveUnreadCounts()
            assertNull("$name: ${plan.missing}", plan.missing)
            assertEquals(name, listOf("calcUnreadCounters", "updateFiltersReadCounter"), plan.skips.map { it.method.origName })
            // controllerUser takes either as the BaseController it is.
            for (type in listOf(MESSAGES_CONTROLLER, STORAGE)) {
                assertEquals("$name: $type", "Lorg/telegram/messenger/BaseController;", context.tgMutableClassDefBy(type).origSuperclass)
            }
            val stock = plan.skips.map { it.method.body().code() }
            val landings = plan.skips.map { operands(it.method.body()[it.to]) }
            plan.apply()
            for ((i, skip) in plan.skips.withIndex()) {
                val where = "$name ${skip.method.name}"
                val body = skip.method.body()
                assertEquals("$where: three instructions", stock[i].size + UNCOUNTED_SIZE, body.code().size)
                // Right after the chat's id lands, the hook is handed the storage and that id.
                assertEquals(where, Opcode.MOVE_RESULT_WIDE, body[skip.at - 1].opcode)
                assertEquals(where, listOf(skip.chat), body[skip.at - 1].namedRegisters())
                assertEquals(where, listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_NEZ),
                    (skip.at until skip.at + UNCOUNTED_SIZE).map { body[it].opcode })
                assertEquals(where, UNCOUNTED, body[skip.at].ref())
                assertEquals(where, listOf(skip.storage, skip.chat, skip.chat + 1), body[skip.at].namedRegisters())
                assertEquals(where, listOf(skip.scratch), body[skip.at + 1].namedRegisters())
                assertEquals(where, listOf(skip.scratch), body[skip.at + 2].namedRegisters())
                // A no falls through to Telegram's next instruction, a yes lands where the plan says.
                val landing = if (skip.to < skip.at) skip.to else skip.to + UNCOUNTED_SIZE
                assertEquals(where, listOf(skip.at + UNCOUNTED_SIZE, landing).sorted(), ControlFlow.of(skip.method).normal[skip.at + 2].sorted())
                assertEquals(where, landings[i], operands(body[landing]))
                assertEquals("$where: Telegram's own code is unchanged around it", stock[i],
                    (body.take(skip.at) + body.drop(skip.at + UNCOUNTED_SIZE)).code())
                // The answer's register is Telegram's to write before it reads it, either way on.
                val liveness = RegisterLiveness.of(skip.method)
                for (next in listOf(skip.at + UNCOUNTED_SIZE, landing)) assertTrue("$where: v${skip.scratch} at $next", skip.scratch !in liveness.liveInto(next))
            }
            // calcUnreadCounters' yes is the walk's next row; updateFiltersReadCounter's is the way of a chat whose
            // count didn't change, so a hidden chat skips the read side and the new messages side alike.
            val (rows, reads) = plan.skips
            assertEquals(name, "Lorg/telegram/SQLite/SQLiteCursor;->next()Z", rows.method.body()[rows.to].ref())
            assertTrue(name, rows.to < rows.at)
            val read = reads.method.body()
            assertEquals(name, Opcode.IF_EQZ, read[reads.at + UNCOUNTED_SIZE].opcode)
            assertEquals(name, listOf(reads.method.localRegisterCount() + 3), read[reads.at + UNCOUNTED_SIZE].namedRegisters())
            assertTrue(name, read[reads.at + UNCOUNTED_SIZE + 2].ref().orEmpty().startsWith("$STORAGE->dialogsWithUnread:"))
            assertTrue(name, reads.to < reads.at)
            // Right after the same copy a changed chat starts with, where the count's test sends an unchanged one.
            val changed = read[reads.at - 3]
            val unchanged = read[reads.to - 1]
            assertEquals(name, changed.opcode to changed.namedRegisters(), unchanged.opcode to unchanged.namedRegisters())
            val flow = ControlFlow.of(reads.method)
            val value = (reads.to - 1 downTo 0).first { read[it].ref() == "Lorg/telegram/messenger/support/LongSparseIntArray;->valueAt(I)I" }
            assertTrue(name, (value + 1 until reads.to - 1).any { read[it].opcode == Opcode.IF_NEZ && reads.to - 1 in flow.normal[it] })
            val live = RegisterLiveness.of(reads.method).liveInto(reads.to)
            assertTrue("$name: $live", reads.chat !in live && reads.chat + 1 !in live)
        }
    }

    @Test fun `unread counts that changed stay as they were and only warn`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = (folderCounterHosts(build) + launchFolderHosts(build) + menuHosts(build)).distinctBy { it.type }
            val context = PatchContexts.of((ExtensionDex.classes() + hosts + allChatsPlaceHosts(build) + accountListHosts(build)).distinctBy { it.type })
            val storage = context.tgMutableClassDefBy(STORAGE)
            // A reworded query: which rows the walk reads is no longer clear.
            val calc = storage.methods.single { it.origName == "calcUnreadCounters" }
            val query = calc.body().indexOfFirst { it.opcode == Opcode.CONST_STRING && it.ref().orEmpty().startsWith("SELECT did, folder_id, unread_count") }
            calc.replaceInstruction(query, "const-string v${(calc.body()[query] as OneRegisterInstruction).registerA}, \"SELECT did FROM dialogs\"")
            val counts = listOf("calcUnreadCounters", "updateFiltersReadCounter")
            val before = counts.map { count -> storage.methods.single { it.origName == count }.body().code() }
            val warnings = PatchLogCapture.warnings { hideFolderCountersPatch.execute(context) }
            assertEquals("$name: $warnings", 1, warnings.size)
            assertTrue("$name: ${warnings.single()}", "the unread count's query is missing or ambiguous" in warnings.single() &&
                "Hidden chats go on with their unread counts" in warnings.single())
            assertEquals(1L, statusOf(context, "hiddenChats"))
            assertEquals(0L, statusOf(context, "hiddenUnread"))
            assertEquals(name, before, counts.map { count -> storage.methods.single { it.origName == count }.body().code() })
            assertTrue("$name: recount stays a stub", context.tgMutableClassDefBy(HIDDEN_CHATS).methods.single { it.origName == "recount" }.body()
                .none { it.ref() == RECOUNT })
            assertTrue("$name: onStorageThread stays a stub", context.tgMutableClassDefBy(HIDDEN_CHATS).methods.single { it.origName == "onStorageThread" }.body()
                .none { it.ref() == TelegramNames.of(context).asRead(POST_RUNNABLE) })
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
                .filter { it.origType != "Lorg/telegram/messenger/NotificationCenter;" })
            val plan = context.resolveHiddenChats()
            assertTrue("${build.name}: ${plan.missing}", plan.missing.orEmpty().contains("isn't reachable from the extension"))
        }
    }

    @Test fun `without the account count the switch is left out`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = launchFolderHosts(build).map { host ->
                if (host.origType != USER_CONFIG) host
                else ImmutableClassDef(host.type, host.accessFlags, host.superclass, host.interfaces, host.sourceFile,
                    host.annotations, host.fields.filter { it.origName != "Instance" }, host.methods)
            }
            val plan = PatchContexts.of(ExtensionDex.classes() + hosts).resolveHiddenChats()
            assertTrue("${build.name}: ${plan.missing}", plan.missing.orEmpty().contains("$ACCOUNT_SLOTS isn't reachable"))
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
        tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origName == "sortDialogs" }

    private fun menuContext(build: File) = PatchContexts.of((ExtensionDex.classes() + menuHosts(build)).distinctBy { it.type })

    private fun List<Instruction>.code() = filter { it.opcode != Opcode.NOP }.map(::operands)

    private fun BytecodePatchContext.createActionMode(list: String): MutableMethod =
        tgMutableClassDefBy(list).methods.single { it.isCreateActionMode() }

    private fun statusOf(context: BytecodePatchContext, flag: String) =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.body()[0] as WideLiteralInstruction).wideLiteral

    private fun operands(instruction: Instruction): List<Any?> = listOf(instruction.opcode, instruction.namedRegisters(), instruction.ref())

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.ref() = origRef()
}

private val MENU_HOSTS = mutableMapOf<String, List<ClassDef>>()

/** The chat list's hosts, the more menu's class and every (I)V handler that holds a chat list, as candidates for the click handler. */
internal fun menuHosts(build: File, clicks: Boolean = true): List<ClassDef> = MENU_HOSTS.hostsOf("${build.path} $clicks") {
    val list = launchFolderList(build)
    val create = FixtureDex.classes(build, setOf(list)).getValue(list).methods.single { it.isCreateActionMode() }
    // 13.2's R8 folded the String submenu add into the CharSequence one on the menu item's base.
    val adds = listOf("(IILjava/lang/String;)", "(IILjava/lang/CharSequence;)").map { shape ->
        create.controlBody().firstOrNull { it.opcode == Opcode.INVOKE_VIRTUAL && it.controlRef()?.contains(shape) == true }
    }
    val more = adds.filterNotNull().first().controlRef()!!.substringBefore("->")
    val handlers = if (!clicks) emptyList() else FixtureDex.classesWhere(build, { true }) { m ->
        m.origDefiningClass != list && m.origReturnType == "V" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
            m.controlBody().any { it.opcode == Opcode.IGET_OBJECT && it.controlRef()?.endsWith(":$list") == true }
    }
    launchFolderHosts(build) + handlers + FixtureDex.classes(build, setOf(more)).values
}

private fun Method.isCreateActionMode() = parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
    controlBody().any { it.controlRef() == "Lorg/telegram/messenger/R\$drawable;->msg_block:I" }
